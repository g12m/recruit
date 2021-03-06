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
use app\portal\model\PortalPostModel;
use app\portal\service\PostService;
use app\portal\model\PortalCategoryModel;
use think\Db;
use app\admin\model\ThemeModel;

class AdminMsgController extends AdminBaseController
{
  public function index()
  {
    $where=array();
    $list = Db::name('msg')->where($where)->order("createtime DESC")->paginate(10);
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
      Db::name('msg')->where(['id'=>$params['id']])->delete();
    }elseif(isset($params['ids']))
    {
        Db::name('msg')->where(['id' => ['in', $params['ids']]])->delete();
    }
      return $this->success('删除成功!');
  }

  // 查看详情
      public function edit()
      {
         $id     = $this->request->param('id');
         $list   = Db::name('msg')->where(['id'=>$id])->find();
         $this->assign('info',$list);
         return $this->fetch();
      }


}
