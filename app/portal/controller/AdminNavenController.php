<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: kane <chengjin005@163.com> 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use cmf\controller\AdminBaseController;
use app\admin\model\NavModel;
use think\Db;

/**
 * Class NavController 导航类别管理控制器
 * @package app\admin\controller
 */
class AdminNavenController extends AdminBaseController
{
  public function index()
  {
      $list=Db::name('shoplist')->order("list_order DESC,id DESC")
                      ->paginate(10);
                      $page=$list->render();
         $this->assign('page', $page);
      $this->assign('list',$list);
      return $this->fetch();
  }
  public function add()
  {
      return $this->fetch();
  }
  public function addPost()
  {
      if ($this->request->isPost()) {
          $data= $this->request->param();
          //状态只能设置默认值。未发布、未置顶、未推荐

          $post = $data['post'];
          $post['create_time']=time();

          Db::name('shoplist')->insert($post);
          $this->success('添加成功!', url('AdminNaven/index'));
      }

  }
  public function delete()
  {

      $param = $this->request->param();
      if (isset($param['id'])) {
          $id = $this->request->param('id');
          $res = Db::name('shoplist')->where('id',$id)->delete();
          if($res){
              $this->success('删除成功');
          }else{
              $this->error('删除失败');
          }
//            return dump($id);
      }

      if(isset($param['ids'])) {
          $ids     = $this->request->param('ids/a');
          $res = Db::name('shoplist')->where(['id' => ['in', $ids]])->delete();
          if($res){
              $this->success('删除成功!');
          }else{
              $this->error('删除失败!');
          }
      }

  }
  public function edit()
  {
      $data= $this->request->param();


      $res=Db::name('shoplist')->where('id',$data['id'])->find();

      $this->assign('list',$res);

      return $this->fetch();
  }
  public function editPost()
  {
      if ($this->request->isPost()) {
          $data= $this->request->param();

          //状态只能设置默认值。未发布、未置顶、未推荐


          $post = $data['post'];


          $res=Db::name('shoplist')->where('id',$post['id'])->update($post);
          if($res)
          {
              $this->success('修改成功!', url('AdminNaven/index'));
          }
          else
          {
              $this->error('修改失败');
          }
      }

  }

  public function listOrder(){
  parent::listOrders(Db::name('shoplist'));
  $this->success('排序成功');
 }


}
