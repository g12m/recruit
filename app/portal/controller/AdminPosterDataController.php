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
/*
*广告控制器
*/
class AdminPosterDataController extends AdminBaseController
{

  public function index()
  {
    $where=array();
    $param=$this->request->param();
    if(isset($param['pid']))
    $where['pid']=$param['pid'];
    $list = Db::name('poster_data')
                        ->alias('a')
                        ->join('__POSTER__ p','p.id=a.pid')
                        ->field('a.*,p.name')
                        ->where($where)
                        ->order("id desc")
                        ->paginate(10);
    // 获取分页显示
    $page = $list->render();
    $this->assign('list', $list);
    $this->assign('page', $page);
    return $this->fetch();
  }
  // 添加广告
  public function add()
  {
    $pid=$this->request->param('pid');
    $posters=Db::name('poster')->field('id,name')->select();
    $this->assign('pid',$pid);
    $this->assign('posters',$posters);
    return $this->fetch();
  }
  // 添加到数据库
  public function addPost()
  {
    $param=$this->request->param();
    $rule=['title|广告名称'=>'require','pid|所属版位'=>'require','starttime|上线时间'=>'require|date','endtime|下线时间'=>'require|date','img|图片'=>'require'];
    $result = $this->validate($param,$rule);
      if(!is_numeric($param['pid'])){
          $this->error('请选择广告版位');
      }
      if (true !== $result) {
          // 验证失败 输出错误信息
          $this->error($result);
      }
      $param['status']=1;// 状态 1  启用
      $param['createtime'] =time();
      $param['starttime']  =strtotime($param['starttime']);
      $param['endtime']    =strtotime($param['endtime']);
      Db::name('poster_data')->insert($param);
      // 广告数写进版位
      Db::name('poster')->where(['id'=>$param['pid']])->setInc('number','1');
      return $this->success('添加成功',url('AdminPosterData/index',array('pid'=>$param['pid'])));
  }
  // 编辑
  public function edit()
  {
    $id=$this->request->param('id');
    $posters=Db::name('poster')->field('id,name')->select();
    $info=Db::name('poster_data')->where(['id'=>$id])->find();
    $this->assign('info',$info);
    $this->assign('posters',$posters);
    return $this->fetch();
  }
  // 保存编辑
  public function editPost()
  {
    $param=$this->request->param();
    $rule=['title|广告名称'=>'require','pid|所属版位'=>'require','starttime|上线时间'=>'require|date','endtime|下线时间'=>'require|date','img|图片'=>'require'];
    $result = $this->validate($param,$rule);
      if(!is_numeric($param['pid'])){
          $this->error('请选择广告版位');
      }
      if (true !== $result) {
          // 验证失败 输出错误信息
          $this->error($result);
      }
      $param['starttime']  =strtotime($param['starttime']);
      $param['endtime']    =strtotime($param['endtime']);
      // 写入数据库
      Db::name('poster_data')->update($param);
      return $this->success('已修改',url('AdminPosterData/index',array('pid'=>$param['pid'])));
  }
  // 删除推荐位
  public function delete()
  {
    $params=$this->request->param();
    if(isset($params['id']))
    {
      Db::name('poster_data')->where(['id'=>$params['id']])->delete();
      // 广告数删除
      Db::name('poster')->where(['id'=>$params['pid']])->setDec('number','1');
    }elseif(isset($params['ids']))
    {
        Db::name('poster_data')->where(['id' => ['in', $params['ids']]])->delete();
        $num=count($params['ids']);
        Db::name('poster')->where(['id'=>$params['pid']])->setDec('number',$num);
    }
      return $this->success('删除成功!');
  }
  // 广告的状态修改
  public function start()
  {
    $id=$this->request->param('id');
    Db::name('poster_data')->where(['id'=>$id])->update(['status'=>1]);
    $this->success('启用成功');
  }
  public function stop()
  {
    $id=$this->request->param('id');
    Db::name('poster_data')->where(['id'=>$id])->update(['status'=>0]);
    $this->success('已停用');
  }
  // 排序
  public function listOrder()
  {
      $ids = $this->request->post("list_orders/a");
      if (!empty($ids)) {
          foreach ($ids as $key => $r) {
              $data['listorder'] = $r;
              Db::name('poster_data')->where(['id' => $key])->update($data);
          }
          return $this->success('排序成功');

      }
  }
  // 点击统计
  public function stat()
  {
    $where=array();
    $param=$this->request->param();
    $clicktime=isset($param['clicktime']) ? $param['clicktime'] : '';
    if($clicktime)
    {
      switch ($clicktime) {
        case 1: //今日
          $where['time']=['>=',strtotime(date('Y-m-d'))];
          break;
        case 2: //昨日
          $where['time']=[['<=',strtotime(date('Y-m-d'))],['>',strtotime(date('Y-m-d'))-3600*24]];
          break;
        case 3: //一周
          $where['time']=['>',strtotime(date('Y-m-d'))-3600*24*6];
          break;
        case 4: //一周
          $where['time']=['>',strtotime(date('Y-m-d'))-3600*24*30];
          break;
      }
    }
    $startTime = empty($param['start_time']) ? 0 : strtotime($param['start_time']);
    $endTime   = empty($param['end_time']) ? 0 : strtotime($param['end_time']);
    if (!empty($startTime) && !empty($endTime)) {
        $where['a.time'] = [['>= time', $startTime], ['<= time', $endTime]];
    } else {
        if (!empty($startTime)) {
            $where['a.time'] = ['>= time', $startTime];
        }
        if (!empty($endTime)) {
            $where['a.time'] = ['<= time', $endTime];
        }
    }
    $where['a.data_id']=$param['id'];
    $list = Db::name('poster_click')
                        ->alias('a')
                        ->join('__POSTER__ p','p.id=a.pid')
                        ->field('a.*,p.name')
                        ->where($where)
                        ->order("id desc")
                        ->paginate(10);
    // 获取分页显示
    $page = $list->render();
    $this->assign('list', $list);
    $this->assign('page', $page);
    $this->assign('pid',$param['pid']);
    $this->assign('id',$param['id']);
    $this->assign('clicktime',$clicktime);
    $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
    $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
    return $this->fetch();
  }
  // 统计删除
  public function statDelete()
  {
    $params=$this->request->param();
    if(isset($params['ids']))
    {
        Db::name('poster_click')->where(['id' => ['in', $params['ids']]])->delete();
    }
      return $this->success('删除成功!');
  }


}
