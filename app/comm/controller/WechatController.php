<?php
namespace app\comm\controller;
use vendor\weixin\Wechat;
use cmf\controller\HomeBaseController;
use think\Response;
/**
 * 微信
 */
class WechatController extends HomeBaseController
{

  function __construct()
  {
    parent::__construct();
    vendor('wechat/Wechat');
    $options=['appid'=>'wx0b8c59b90c5c1874','appsecret'=>'c271d11f397c1d497dd9248445a7d5d7','token'=>'jinmore'];
    $this->wechat=new Wechat($options);
  }
  public function index()
  {
    $type = $this->wechat->getRev()->getRevType();

      switch($type) {
      		case Wechat::MSGTYPE_TEXT:
          // 文本
      			$this->wechat->text("hello, I'm wechat")->reply();
      			exit;
      			break;
      		case Wechat::MSGTYPE_EVENT:
          	$this->wechat->text("扫我")->reply();
            $info=$this->wechat->getRev()->getRevData();
            file_put_contents('./log.txt',json_encode($info));
            exit;
           //事件
      			break;
  		    case Wechat::MSGTYPE_IMAGE:
          // 图片
      			break;
      		default:
      			$weObj->text("help info")->reply();
      }
  }
  // 生成二维码
  public function createQu()
  {
    header('Content-Type','image/jpg');
    // config('default_return_type','jpg');
    $ticket=$this->wechat->getQRCode('2018082700');
    $url=$this->wechat-> getQRUrl($ticket['ticket']);
    return "<img src=".$url.">";
  }
}



?>
