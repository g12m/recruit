<?php
// 1.SDKAppid:1400421650   1400425877
// 密钥：cfbae2c64faf3b131132dfbb63808e7d4544fafb4a2b967db0252da95eb4de59
// 52ebe24fb348bced7af5d59f563b929fe89421df2d0b5ff9d7fde5d1ce01015e
// 开启直播创建群组，关闭直播解散群组
// 创建群组，获取群组列表，关闭一天前的群组
// 创建群组，加入用户，发送消息，管理员发送消息（或者监控聊天室）

namespace app\portal\controller;

use cmf\controller\HomeBaseController;
use app\portal\model\PortalTagModel;
use think\Db;
vendor('TencentCloud\vendor\autoload');

class ImController extends HomeBaseController
{
    public function index(){
        return $this->fetch();
    }
    public function create(){
        $sdkappid = '1400425877';
        $identifier = 'administrator';
        $usersig = 'eJwtzF0LgjAYBeD-suvQObdsQldB2IdCGUHgzWKzXsI55xhC9N8T9fI853C*6HYuA68sShEJMFpNGaTSDmqYWMgGNPTOCtfaZdDLjzAGJEojijElbJMkc6MGA1aNzhgjGONZHTSTcc4jFtNFe3iN-8O*zJ7vSHMSi4cZMlqcOn2HKuzkugqvZXHc1b7NL94-8sMW-f7E-jWo';
        $random = mt_rand(100000,999999);
        $url = 'https://console.tim.qq.com/v4/group_open_http_svc/create_group?sdkappid='.$sdkappid.'&identifier='.$identifier.'&usersig='.$usersig.'&random='.$random.'&contenttype=json';

        $arr = [
			'Owner_Account' => 'wtz', // 群主的 UserId（选填）
			'Type' => 'Public',  // 群组类型：Private/Public/ChatRoom/AVChatRoom/BChatRoom（必填）
			'Name' => '直播2', // 群名称（必填）
			'GroupId' => '1234656', // 用户自定义群组 ID（选填）
		];
    
	    $ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($arr));
        $json = curl_exec($ch);//string(70) "{"ActionStatus":"OK","ErrorCode":0,"ErrorInfo":"","GroupId":"1234656"}"
        var_dump($json);
        curl_close($ch);
    }
}
