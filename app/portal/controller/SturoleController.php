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
class   SturoleController extends UserBaseController
{    
    //学校角色详情
    public function index()
    {
        $param                 = $this->request->param();
        $address               =empty($param['title'])?'':$param['title'];
        $uid                   = 4;
        $where                 =[];
        if(!empty($address))
        {
            $where['a.address']=['like',"%$address%"];
        }
        $list                  = Db::name('stu_conference a')->where('a.uid',$uid)->where($where)->order('cre_time DESC')->paginate(9);
        $list->appends($param);
        $this->assign('page', $list->render());
        $this->assign('list', $list);
        $this->assign('title', $address);
        return $this->fetch();
    }
    //人员管理
    public function pindex()
    {
        $param                 = $this->request->param();
        $address               =empty($param['title'])?'':$param['title'];
        $uid                   = 4;
        $where                 =[];
        if(!empty($address))
        {
            $where['a.address']=['like',"%$address%"];
        }
        $list                  = Db::name('stu_conference a')->where('a.uid',$uid)->where($where)->order('cre_time DESC')->paginate(9);
        $list->appends($param);
        $this->assign('page', $list->render());
        $this->assign('list', $list);
        $this->assign('title', $address);
        return $this->fetch();
    }
    //添加会场
    public function add()
    {
       return $this->fetch();       
    }
     public function addpost()
    {
        $data     = $this->request->param();
        if(empty($data['address']) && empty($data['num']))
        {
            return  2;
        }
        $datas=[
            'address'   =>$data['address'],
            'num'       =>$data['num'],
            'uid'       =>4,
            'cre_time'  =>time()
        ];

       $res= Db::name('stu_conference')->insert($datas); 
       if($res)
        {
            return  1;
        }        
    }

    //会场详情
    public function article()
    {
        //会场与招聘会关联
        $id      = $this->request->param('id');
        $article = Db::name('stu_conference')->where('id',$id)->find(); 
        $zp=Db::name('stu_pz')->where('h_id',$id)->field('fair_id')->select()->toArray();
       
        $this->assign('article', $article);
        $this->assign('zp', $zp);
        return $this->fetch();
    }
    //删除会场
    public function delete()
    {
        //会场与招聘会关联
        $id      = $this->request->param('id');
        $num=Db::name('stu_pz')->where('h_id',$id)->count();
      
        if($num>=1)
        {
            return 2;
        }
         if($num==0){
            $article = Db::name('stu_conference')->where('id',$id)->delete(); 
                if($article)
                {
                return 1;
                }
        }
      
        
    }


}
