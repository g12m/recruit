<?php
// 开启直播创建群组，关闭直播解散群组
// 创建群组，获取群组列表，关闭一天前的群组
// 创建群组，加入用户，发送消息，管理员发送消息（或者监控聊天室）

namespace app\portal\controller;

use cmf\controller\HomeBaseController;
use app\portal\model\PortalTagModel;
use app\portal\model\ImModel;
use think\Db;
vendor('Tencent\TLSSigAPIv2');
use Tencent\TLSSigAPIv2;
class ImController extends HomeBaseController
{
    public function index(){
        return $this->fetch();
    }
    
    public function adduser(){
        $sdkappid = '1400421650';
        $key = 'cfbae2c64faf3b131132dfbb63808e7d4544fafb4a2b967db0252da95eb4de59';
        $identifier = 'wtz';
        $TLSSigAPIv2 = new TLSSigAPIv2($sdkappid,$key);
 
        $usersig = $TLSSigAPIv2->genSig($identifier);
        $random = mt_rand(100000,999999);
        $url = 'https://console.tim.qq.com/v4/group_open_http_svc/add_group_member?sdkappid='.$sdkappid.'&identifier='.$identifier.'&usersig='.$usersig.'&random='.$random.'&contenttype=json';
        $arr['GroupId'] = '15999839645346';
        $arr['MemberList'][0]['Member_Account'] = 'wtz';
        // $arr['MemberList'][1]['Member_Account'] = 'jared';
        $json = json_encode($arr);
        $im = new ImModel();
        $json = $im->send($url,$json);
        $res = json_decode($json,true);
        var_dump($res);
    }
    
}
