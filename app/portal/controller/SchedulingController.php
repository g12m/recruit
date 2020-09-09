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

use cmf\controller\UserBaseController;
use app\portal\model\PortalCategoryModel;
use think\Db;
class   SchedulingController extends UserBaseController
{    
    //学校排期管理
    public function index()
    {
        $param                 = $this->request->param();
        $where                 =[];
        if(!empty($param['status']))
        {
            $where['a.status']=$param['status'];
        }
        $list                  = Db::name('jobfair a')
        ->where($where)
        ->paginate(6)
         ->each(function($item,$key){
           $item['pos_ids'] = get_zhiwei_info($item['id']);
             return   $item;
           });
        ;
        $list->appends($param);
        $this->assign('page', $list->render());
        $this->assign('list', $list);
        
        return $this->fetch();
    }
    //招聘会与会场关联

     public function relation()
    {
        $data     = $this->request->param();
         $uid=cmf_get_current_user_id();
        $datas=[
            'h_id'   =>$data['h_id'],
            'fair_id'       =>$data['id'],
            'uid'       =>$uid,
            'time'  =>time(),
             'fair_time'=>$data['nid']
        ];
       $res= Db::name('stu_pz')->insert($datas); 
     
       Db::name('jobfair')->where('id',$data['id'])->update(['status'=>2]);
       if($res)
        {
            return 1;
        }        
    }

    //会场详情
    public function article()
    {
        //会场与招聘会关联
        $id      = $this->request->param('id');
         $uid=cmf_get_current_user_id();
        $article                  = Db::name('jobfair')
        ->where('id',$id)
        ->select()
         ->each(function($item,$key){
           $item['pos_ids'] = get_zhiwei_info($item['id']);
             return   $item;
           });
        ;
        $article=json_decode(json_encode($article),true);
      
        $this->assign('article', $article);
        //获取绑定的会场
          $confer = Db::name('stu_pz')->where(['fair_id'=>$id,'uid'=>$uid,'status'=>1])->find(); 
       
         $this->assign('confer', $confer);
        return $this->fetch();
    }
    //取消关联
    public function dis()
    {
        //会场与招聘会关联
        $id      = $this->request->param('fair_id');
         $des      = $this->request->param('value');
          $uid=cmf_get_current_user_id();
        $confer  = Db::name('stu_pz')->where('fair_id',$id)->where('uid',$uid)->update(['status'=>2,'de_mes'=>$des,'q_time'=>time()]);
        Db::name('jobfair')->where('id',$id)->update(['status'=>1]);
        if($confer)
        {
            return  1;
        }
        
    }
    public function ajax_guan()
    {
         $lid      = $this->request->param('lid');
        $alttime = Db::name('jobfair')->where('id',$lid)->field('alt_time')->find();
        $arr = json_decode($alttime['alt_time'],true);
        foreach($arr as $k=>$v){
            $arr[$k] = $v;
        }

          return $arr;
    }

    public function  ajax_hui()
    {
        $uid=cmf_get_current_user_id();
        $list   = Db::name('stu_conference a')->where('a.uid',$uid)->select()->toArray();
        return $list;
    }


}
