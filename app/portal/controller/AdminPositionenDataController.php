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
use app\admin\model\NavMenuModel;
use think\Db;
class AdminPositionenDataController extends AdminBaseController
{

  public function index()
  {
    $where=array();
    $param=$this->request->param();
    if($param['posid']){
      $where['posid']= $param['posid'];
    }
    $list = Db::name('positionen_data')
                        ->alias('a')
                        ->join('__POSITIONEN__ c','a.posid =c.id')
                        ->field('a.*,c.name')
                        ->where($where)
                        ->order("id DESC")
                        ->paginate(10);
    // 获取分页显示
    $page = $list->render();
    $this->assign('list', $list);
    $this->assign('page', $page);
    return $this->fetch();
  }
  // 排序
  public function listOrder()
  {
      $ids = $this->request->post("list_orders/a");
      if (!empty($ids)) {
          foreach ($ids as $key => $r) {
              $data['listorder'] = $r;
              Db::name('positionen_data')->where(['id' => $key])->update($data);
          }
          return $this->success('排序成功');

      }
  }
  // 删除
  public function delete()
  {
    $data=$this->request->param();
    if(isset($data['id']))
    {
      Db::name('positionen_data')->where(['id'=>$data['id']])->delete();
    }elseif($data['ids'])
    {
      Db::name('positionen_data')->where(['id' => ['in', $data['ids']]])->delete();
    }
    $this->success('已删除');
  }

}
