<?php
namespace app\comm\controller;
use cmf\controller\HomeBaseController;
use think\Db;
/**
 * 广告位api
 */
class PosterController extends HomeBaseController
{
  public function addClick()
  {
    $server=$this->request->server();
    $id=$this->request->param('id');
    $info=Db::name('poster_data')->where(['id'=>$id])->find();
    $data['ip']=get_client_ip(0, true);//修复ip获取
    $add=getCity($data['ip'])['data'];
    $data['address']=$add['region'].'-'.$add['city'];
    $data['data_id']=$id;
    $data['pid']=$info['pid'];
    $data['refer']=isset($server['HTTP_REFERER']) ? $server['HTTP_REFERER'] :'';
    $data['time']=time();
    Db::name('poster_click')->insert($data);
    Db::name('poster_data')->where(['id'=>$id])->setInc('clicks',1);
  }
}
