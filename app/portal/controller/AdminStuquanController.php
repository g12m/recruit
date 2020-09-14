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
use think\Validate;

class AdminStuquanController extends AdminBaseController
{
 public function index()
 {
   $where=array();
   $roles =  Db::name('entstu_access a')->where('type',2)->where($where)->paginate(9);
   // 获取分页显示
   $page = $roles->render();
   $this->assign('roles', $roles);
   $this->assign('page', $page);
   return $this->fetch();
 }

 // 删除
 public function roledelete()
 {
   $params=$this->request->param();
   if(isset($params['id']))
   {
     Db::name('entstu_role')->where(['id'=>$params['id']])->delete();
   }elseif(isset($params['ids']))
   {
       Db::name('message')->where(['id' => ['in', $params['ids']]])->delete();
   }
     return $this->success('删除成功!');
 }

 // 查看详情
     public function roleedit()
     {
        $id     = $this->request->param('id');
        $list   = Db::name('entstu_role')->where(['id'=>$id])->find();
        $this->assign('info',$list);
        return $this->fetch();
     }
     public function  add()
     {
       return $this->fetch();
     }
      public function  addpost()
     {
        $data=$this->request->param();
        
        $newdata=[
          'name'=>$data['name'],
          'type'=>2
        ];
        $res=Db::name('entstu_access')->insert($newdata);
        if($res)
        {
          $this->success('添加成功');
        }

     }
      public function  edit()
     {
       $id=$this->request->param('id');
         $res=Db::name('entstu_access')->where('id',$id)->find();
         $this->assign($res);
       return $this->fetch();
     }
      public function  editpost()
     {  
       $data=$this->request->param();
       $id=$this->request->param('id');

        $res=Db::name('entstu_access')->where('id',$id)->update(['name'=>$data['name']]);
            if($res)
        {
          $this->success('编辑成功');
        }
     }
     public function  delete()
     {  
       
       $id=$this->request->param('id');

        $res=Db::name('entstu_access')->where('id',$id)->delete();
            if($res)
        {
          $this->success('删除成功');
        }
     }





}


?>
