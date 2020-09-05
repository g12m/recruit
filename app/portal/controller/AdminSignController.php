<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use cmf\controller\AdminBaseController;
use think\Db;
use think\Validate;

class AdminSignController extends AdminBaseController
{
 public function index()
 {
   $where=array();
   $list = Db::name('sign')->where($where)->order("createtime DESC")->paginate(10);
   // 获取分页显示
   $page = $list->render();
   $this->assign('list', $list);
   $this->assign('page', $page);
   return $this->fetch();
 }
 // 删除
 public function delete()
 {
   $params=$this->request->param();
   if(isset($params['id']))
   {
     Db::name('sign')->where(['id'=>$params['id']])->delete();
   }elseif(isset($params['ids']))
   {
       Db::name('sign')->where(['id' => ['in', $params['ids']]])->delete();
   }
     return $this->success('删除成功!');
 }

 // 查看详情
     public function edit()
     {
        $id     = $this->request->param('id');
        $list   = Db::name('sign')->where(['id'=>$id])->find();
        $this->assign('info',$list);
        return $this->fetch();
     }

 public function getCode()
 {
   $validate = new Validate([
       'username' => 'require',
       'captcha'  => 'require',
   ]);

   $validate->message([
       'username.require' => '请输入手机号!',
       'captcha.require'  => '图片验证码不能为空',
   ]);

   $data = $this->request->param();
   if (!$validate->check($data)) {
       $this->error($validate->getError());
   }

   $captchaId = empty($data['captcha_id']) ? '' : $data['captcha_id'];
   if (!cmf_captcha_check($data['captcha'], $captchaId, false)) {
       $this->error('图片验证码错误!');
   }
   $registerCaptcha = session('register_captcha');
   session('register_captcha', $data['captcha']);
   if ($registerCaptcha == $data['captcha']) {
       cmf_captcha_check($data['captcha'], $captchaId, true);
       $this->error('请输入新图片验证码!');
   }
   $msg=cmf_get_option('sms_setting');
   $uid = $msg['sms_appid'];
   $passwd = $msg['sms_secret'];
   $yan=$msg['sms_sign'];
   $telphone =$data['username'];
   $code=rand('1000','9999');
   $message = "$yan ：$code";
   $message=urlencode(iconv('UTF-8', 'GB2312', $message));
   $gateway = "http://106818.com/WS/Send.aspx?CorpID={$uid}&Pwd={$passwd}&Mobile={$telphone}&Content={$message}&Cell=&SendTime=";
   $result = file_get_contents($gateway,false);
   if(0 == $result)
   {
     $content=[
       'createtime'=>time(),
       'username'=>$data['username']
     ];
     $res=Db::name('message')->insert($content);
     if($res)
     {
       $this->success("发送成功");
     }
     else {
       $this->error("发送失败");
     }
   }
   else
   {
     $this->error("发送失败, 错误提示代码:$result");
   }
 }



}


?>
