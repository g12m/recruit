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
class   SchedulingController extends HomeBaseController
{    
    //学校排期管理
    public function index()
    {
        $param                 = $this->request->param();
        $where                 =[];
        
        $list                  = Db::name('jobfair')
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
        //$data     = $this->request->param();

        $data=[
            'h_id'   =>'["1"]',
            'fair_id'       =>2,
            'uid'       =>4,
            'time'  =>time(),
             'fair_time'=>["1598716800","1598889600"]
        ];
       $res= Db::name('stu_pz')->insert($data); 
       Db::name('jobfair')->where('id',$data['fair_id'])->update(['status'=>2]);
       if($res)
        {
            $this->success('关联成功');
        }        
    }

    //会场详情
    public function article()
    {
        //会场与招聘会关联
        $id      = $this->request->param('id');
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
          $confer = Db::name('stu_pz')->where('fair_id',$id)->find(); 
       
         $this->assign('confer', $confer);
        return $this->fetch();
    }
    //取消关联
    public function dis()
    {
        //会场与招聘会关联
        $id      = $this->request->param('id');
        $job     = Db::name('jobfair')->where('id',$id)->update(['status'=>1]);
        $confer  = Db::name('stu_pz')->where('fair_id',$id)->update(['status'=>2]);
        if($job)
        {
            $this->success('取消关联成功');
        }
        
    }


}
