<?php

namespace app\portal\controller;

use cmf\controller\HomeBaseController;
use app\portal\model\PortalTagModel;
vendor('TencentCloud\vendor\autoload');
use TencentCloud\Common\Credential;
use TencentCloud\Common\Profile\ClientProfile;
use TencentCloud\Common\Profile\HttpProfile;
use TencentCloud\Common\Exception\TencentCloudSDKException;
use TencentCloud\Live\V20180801\LiveClient;
use TencentCloud\Live\V20180801\Models\DescribeLiveCertRequest;
class ZhiboschController extends HomeBaseController
{
    public function index(){
        $zphid = $this->request->param('id');
        $this->assign('id',$zphid);
        return $this->fetch();
    }
    // 获取推流地址
    public function getLiveStream()
    {
        $streamName = $this->request->param('name');
        // $time = time()+config('tencentcloud.invalid_time');
        // $key = config('tencentcloud.tx_push_api_key');
        $time = time()+600;
        $key = '03b07ca861665e01cbf6196ff4743975';
        $domain = '112608.livepush.myqcloud.com';
        $txTime = strtoupper(base_convert($time,10,16));

        $txSecret = md5($key.$streamName.$txTime);

        $extStr = '?'.http_build_query([
                'txSecret' => $txSecret,
                'txTime' => $txTime
            ]);

        // $url[0] = "rtmp://".config('tencentcloud.push_domain')."/live/";
        $url['obsurl'] = $this->getPlayStream($streamName,$time);
        $url['live1'] = "rtmp://".$domain."/live/";
        $url['live2'] = $streamName . (isset($extStr) ? $extStr : "");

        return $url;
    }
    // 获取播放地址
    public function getPlayStream($streamName,$time)
    {
        $key = '03b07ca861665e01cbf6196ff4743975';
        $domain = 'live.cdsln.club.livecdn.liveplay.myqcloud.com';
        $txTime = strtoupper(base_convert($time,10,16));

        $txSecret = md5($key.$streamName.$txTime);

        $extStr = '?'.http_build_query([
                'txSecret' => $txSecret,
                'txTime' => $txTime
            ]);
        $playFormat = 'hls';
        switch ($playFormat)
        {
            case 'flv':
                $playUrl = "http://".$domain."/live/".$streamName .'.flv'. (isset($extStr) ? $extStr : "");
                break;

            case 'hls':
                $playUrl = "http://".$domain."/live/".$streamName .'.m3u8'. (isset($extStr) ? $extStr : "");
                break;

            case 'rtmp':
            default:
                $playUrl = "rtmp://".$domain."/live/".$streamName . (isset($extStr) ? $extStr : "");
                break;
        }

        return $playUrl;
    }

}
