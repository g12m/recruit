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
class   ConferController extends HomeBaseController
{    
    //学校会场详情
    public function index()
    {
        $param                 = $this->request->param();
        $uid                   = 4;
        $list                  = Db::name('stu_conference')->where('uid',$uid)->order('cre_time DESC')->paginate(9);
        $list->appends($param);
        $this->assign('page', $list->render());
        $this->assign('list', $list);
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
        $data=[
            'address'   =>'A101',
            'num'       =>30,
            'uid'       =>4,
            'cre_time'  =>time()
        ];
       $res= Db::name('stu_conference')->insert($data); 
       if($res)
        {
            $this->success('添加会场成功');
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
        $article = Db::name('stu_conference')->where('id',$id)->delete(); 
        if($article)
        {
            $this->success('删除会场成功');
        }
        
    }


}
