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
use app\admin\model\NavMenuenModel;
use think\Db;
class AdminPositionenController extends AdminBaseController
{

  public function index()
  {
    $where=array();
    $list = Db::name('positionen')
                        ->alias('a')
                        ->join('__PORTAL_CATEGORYEN__ c','a.catid =c.id')
                        ->field('a.*,c.name as cname')
                        ->where($where)
                        ->order("id DESC")
                        ->paginate(10);
    // 获取分页显示
    $page = $list->render();
    $this->assign('list', $list);
    $this->assign('page', $page);
    return $this->fetch();
  }
  // 添加推荐位
  public function add()
  {
    // $navMenuModel = new NavMenuenModel();
    // $navs = $navMenuModel->selectMyNavs();
    // dump($navs);
    $navs=Db::name('portal_categoryen')->select()->toArray();
    $this->assign('navs', $navs);
    return $this->fetch();
  }
  // 添加到数据库
  public function addPost()
  {
    $param=$this->request->param();

    $rule=['name|推荐位名称'=>'require','catid|栏目'=>'require|number','maxnum|保存条数'=>'require|number'];
    $result = $this->validate($param,$rule);
      if (true !== $result) {
          // 验证失败 输出错误信息
          $this->error($result);
      }
    Db::name('positionen')->insert($param);
    return $this->success('添加成功',url('AdminPositionen/index'));
  }
  // 编辑
  public function edit()
  {
    // $navMenuModel = new NavMenuModel();
    $navs=Db::name('portal_categoryen')->select()->toArray();
    //获得当前选择的分类
    $param=$this->request->param('id');
    $id=$this->request->param('catid');
    $post            = Db::name('portal_categoryen')->where('id', $id)->find();
    if($param)
    {
      $data=Db::name('positionen')->where(['id'=>$param])->find();
      // $navs = $navMenuModel->selectMyNavs();

    }else
    {
      return $this->error('参数错误');
    }
    $this->assign('navs', $navs);
    $this->assign('post', $post);
    $this->assign('info',$data);
    return $this->fetch();
  }
  // 保存编辑
  public function editPost()
  {
    $param=$this->request->param();
    $rule=['name|推荐位名称'=>'require','catid|栏目'=>'require|number','maxnum|保存条数'=>'require|number'];
    $result = $this->validate($param,$rule);
      if (true !== $result) {
          // 验证失败 输出错误信息
          $this->error($result);
      }
      // 写入数据库
      Db::name('positionen')->update($param);
      return $this->success('已修改',url('AdminPositionen/index'));
  }
  // 删除推荐位
  public function delete()
  {
    $id=$this->request->param('id');
    if($id)
    {

      $result=Db::name('positionen_data')->where(['posid'=>$id])->find();
      if($result){
        $this->error('当前分类下有信息,请先删除!');
      }
      Db::name('positionen')->where(['id'=>$id])->delete();
      $this->success('删除成功!');
    }

  }


}
