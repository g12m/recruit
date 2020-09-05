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
        // $id                  = $this->request->param('id', 0, 'intval');
        // //获取顶级类id并传到模板
        // $top_catid = get_top_parent('portal_category',$id);
        // $this->assign('top_catid',$top_catid);
        // //获取导航的parent_id
        // $nav_cat_id = Db::name('nav_menu')->where('catid',$id)->find()['parent_id'];
        // $this->assign('nav_cat_id',$nav_cat_id);
        //
        // $portalCategoryModel = new PortalCategoryModel();
        //
        // $category = $portalCategoryModel->where('id', $id)->where('status', 1)->find();
        //
        // $this->assign('category', $category);
        //
        // $list=Db::name('picture')->order('list_order DESC,creatime DESC')->select()->toArray();
        // $msg=Db::name('msg')->order('list_order DESC,creatime DESC')->select()->toArray();
        // $mark=Db::name('mark')->order('list_order DESC,creatime DESC')->select()->toArray();
        //
        //
        //
        //
        //
        // $this->assign('mark', $mark);
        //
        // $this->assign('list', $list);
        // $this->assign('msg', $msg);
        $mess=Db::name('message')->order('createtime DESC')->select()->toArray();
      $this->assign('mess', $mess);
        return $this->fetch(':list_liu');
    }
    public function indexen()
    {
      $mess=Db::name('message')->order('createtime DESC')->select()->toArray();
    $this->assign('mess', $mess);
      return $this->fetch(':eng/list_liu');
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
