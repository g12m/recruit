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
class   SchPositionController extends UserBaseController
{    
     public function __construct(){
        parent::__construct();
        $this->assign('daohang','3');
    }
    //学校职位管理
    public function index()
    {
        $param                 = $this->request->param();
        $where                 =[];
        $name                  = empty($param['name'])?'':$param['name'];
        $price_min             = empty($param['price_min'])?'':$param['price_min'];
        $status                = empty($param['status'])?'':$param['status'];
        $price_max             = empty($param['price_max'])?'':$param['price_max'];
          if(!empty($param['status']))
        {
            $where['a.status'] =$param['status'];
        }
          if(!empty($name))
        {
            $where['a.ent_name']  =['like',"%$name%"];
        }
         if(!empty($price_min) && !empty($price_max))
        {
            $where['a.dea_time'] =['between',[strtotime($price_min),strtotime($price_max)]];
        }
         if(!empty($price_min))
         {
            $where['a.dea_time']=['egt',strtotime($price_min)];
         }
         if(!empty($price_max))
         {
            $where['a.dea_time']=['elt',strtotime($price_max)];
         }
        $list                  = Db::name('entstu a')->where($where)->where('type',4)->paginate(10);
        // $list                  = Db::name('ent_position')->order('time DESC')->paginate(10);
        $list->appends($param);
        $this->assign('page', $list->render());
        $this->assign('list', $list);
        $this->assign('title', $name);
        $this->assign('price_min', $price_min);
        $this->assign('price_max', $price_max);
        $this->assign('status', $status);
        return $this->fetch();
    }
 
    //职位详情
    public function article()
    {
        //会场与招聘会关联
        $id                   = $this->request->param('id');
        $sch_id               = cmf_get_current_user_id();
        $info                 = Db::name('ent_position')->where(['uid'=>$id])->select()->toArray();
        $num                  = get_countsch($id);
        $article              = Db::name('stu_conference')->where('id',$id)->find(); 
        //查看状态
           $value = Db::name('stu_user')
           ->where('ent_id',$id)
           ->where(['sch_id'=>$sch_id])
           ->where('status',1)
           ->value('status');
        $this->assign('info', $info);
        $this->assign('id', $id);
        $this->assign('num', $num);
        $this->assign('value', $value);
        $this->assign('sch_id', $sch_id);
        return $this->fetch();
    }
    //发布职位
    public function release()
    {
         $id                   =  $this->request->param('id');
         $sch_id               =  $this->request->param('sch_id');
        //根据企业io，发布
         $data=[
            'ent_id'=>$id,
            'sch_id'=>$sch_id,
            'time'  =>time(),
            'status'=>1
         ];
         $status=Db::name('stu_user')->insert($data);
          if($status)
         {
           return 1;
         }
    }
    //撤回职位
    public function withdraw()
    {
        //会场与招聘会关联
        $id                     = $this->request->param('id');
        $sch_id                = $this->request->param('sch_id');
        $article                = Db::name('stu_user')->where('ent_id',$id)->where(['sch_id'=>$sch_id])->update(['status'=>2,'ctime'=>time()]); 
        if($article)
        {
           return  1;
        }
    }
}
