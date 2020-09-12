<?php
// 1.切换主播
//     播放器地址不变，推流地址变
//     调用断流接口，再调用（新的）推流接口（sitename相同）
//     或者有混流接口
// appid:1300719817
// 密钥：
// 2.正在讲解
// iFRAME刷新局部
// WebSocket 服务器搭建
        // IM回调
        // appid:1400424102


namespace app\portal\controller;

use cmf\controller\HomeBaseController;
use app\portal\model\PortalTagModel;
use think\Db;
vendor('TencentCloud\vendor\autoload');
use TencentCloud\Common\Credential;
use TencentCloud\Common\Profile\ClientProfile;
use TencentCloud\Common\Profile\HttpProfile;
use TencentCloud\Common\Exception\TencentCloudSDKException;
use TencentCloud\Live\V20180801\LiveClient;
use TencentCloud\Live\V20180801\Models\DescribeLiveCertRequest;
use TencentCloud\Live\V20180801\Models\CreateCommonMixStreamRequest;

class ZhiboController extends HomeBaseController
{
    public function index(){
        $zphid = $this->request->param('id');
        //获取招聘会信息
        $zphres = Db::name('jobfair')->where('id',$zphid)->field('id,title')->find();
        //招聘会职位
        $posres = Db::name('fair_pos')->alias('fp')->join('ent_position ep','fp.pos_id=ep.id')->where('fp.fair_id',$zphid)->field('ep.id,ep.title,ep.type')->select()->toArray();
        //直播地址
        $url = 'http://live.cdsln.club/live/entzph'.$zphid.'.m3u8';
        $this->assign('zphres',$zphres);
        $this->assign('posres',$posres);
        $this->assign('id',$zphid);
        $this->assign('url',$url);
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
        $domain = 'livepush.cdsln.club.livepush.myqcloud.com';
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
    //创建混流
    public function create_live(){
        try {
            $cred = new Credential("$appid", "$key");
            $httpProfile = new HttpProfile();
            $httpProfile->setEndpoint("live.tencentcloudapi.com");
              
            $clientProfile = new ClientProfile();
            $clientProfile->setHttpProfile($httpProfile);
            $client = new LiveClient($cred, "", $clientProfile);
        
            $req = new CreateCommonMixStreamRequest();
            
            $params = array(
        
            );
            $req->fromJsonString(json_encode($params));
        
        
            $resp = $client->CreateCommonMixStream($req);
        
            print_r($resp->toJsonString());
        }
        catch(TencentCloudSDKException $e) {
            echo $e;
        }
    }
    // 添加到数据库
    public function addlive(){
        $param = $this->request->param();
        $fairid = $param['fairid'];
        $liveurl = $param['liveurl'];
        $fairid = 1;
        //查询招聘会信息
        $fairres = Db::name('jobfair')->alias('j')->join('fair_pos fp','j.id=fp.fair_id','LEFT')->field('j.title,fp.pos_id')->where('j.id',$fairid)->find();
        $data['fair_id'] = $fairid;
        $data['live_url'] = $liveurl;
        $data['title'] = $fairres['title'];
        $data['status'] = 1;
        $data['pos_id'] = $fairres['pos_id'];
        Db::name('live')->insert($data);
    }

}
