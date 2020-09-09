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

use cmf\controller\HomeBaseController;
use app\portal\model\PortalCategoryModel;
use think\Db;
use think\Validate;
class MsgController extends HomeBaseController
{
    public function index()
    {
       $id                  = $this->request->param('id', 0, 'intval');
       
        return $this->fetch();
    }
    public function kanban()
    {
      return $this->fetch();
     }

    public function dosubmit()
    {
      $validate = new Validate([
          'username' => 'require',
          'email'  =>'require',
          'message'  =>'require',
          'captcha'  => 'require',
      ]);

      $validate->message([
          'username.require' => '请输入标题!',
          'email.require'  =>'请输入邮箱',
          'message.require'  =>'请输入内容',
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
      $mes=[
        'username'=>$data['username'],
        'email'=>$data['email'],
        'message'=>$data['message'],
        'createtime'=>time()
      ];
      $res=Db::name('message')->insert($mes);
      if($res)
      {
        $this->success('提交成功');
      }
      else
      {
          $this->success('请重新提交');
      }
    }

}
