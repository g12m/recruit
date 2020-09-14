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
        $title               =empty($param['title'])?'':$param['title'];
        $uid                   = cmf_get_current_user_id();
        $where                 =[];
        if(!empty($title))
        {
            $where['a.name']=['like',"%$title%"];
        }
        $list                  = Db::name('entstu_role a')->where('a.uid',$uid)->where($where)->paginate(9);
        $list->appends($param);
          $this->assign('daohang','5');
        $this->assign('page', $list->render());
        $this->assign('list', $list);
        $this->assign('title', $title);
        return $this->fetch();
    }
    //人员管理
    public function pindex()
    {
         $this->assign('daohang','6');
        $param                 = $this->request->param();
        $address               = empty($param['title'])?'':$param['title'];
        $uid                   = cmf_get_current_user_id();
        $where                 = [];
        if(!empty($address))
        {
         $where['a.user_login']   = ['like',"%$address%"];
        }
        $list                  = Db::name('user a')->where('a.entstu_id',$uid)->where($where)->paginate(9);
        $list->appends($param);

        $this->assign('page', $list->render());
        $this->assign('list', $list);
        $this->assign('title', $address);
        return $this->fetch();
    }
    //添加角色
     public function addpost()
    {
        $data     = $this->request->param();
        if(empty($data['name']))
        {
            return  2;
        }
        $datas=[
            'name'   =>$data['name'],
            'type'   =>2,
            'uid'    =>cmf_get_current_user_id()
        ];

       $role_id= Db::name('entstu_role')->insert($datas); 
     
       if($role_id)
        {
            return  1;
        }        
    }
    //编辑角色
    public function  edit()
    {
        $rid     = $this->request->param('rid'); 
        $name    = Db::name('entstu_role')->where('id',$rid)->value('name'); 
        return  $name;
    }
    //编辑角色提交
      public function  editpost()
    {
        $rid     = $this->request->param('rid');
        $name     = $this->request->param('r_name');  
        $res    = Db::name('entstu_role')->where('id',$rid)->update(['name'=>$name]); 
       if($res)
       {
           return  1;
       }
    }

     //删除角色
    public function delete()
    {
        //会场与招聘会关联
        $id      = $this->request->param('r_id');
    
     
            $article = Db::name('entstu_role')->where('id',$id)->delete(); 
                if($article)
                {
                return 1;
                }
    }
    
    //添加人员
    public function addry()
    {
        $data                = $this->request->param(); 
        $uid                 = cmf_get_current_user_id();
        $newdata=[
            'user_login'=>$data['uname'],

                'user_nickname'   => '',
                'user_pass'       => cmf_password($data['upaw']),
                'last_login_ip'   => get_client_ip(0, true),
                'create_time'     => time(),
                'last_login_time' => time(),
                'user_status'     => 1,
                "user_type"       => 3,//3.学校，4.企业
                'entstu_id'         =>$uid
        ]; 
        $u_id=Db::name('user')->insertGetId($newdata);
        Db::name('entstu_roleuser')->insert(['admin_id'=>$u_id,'role_id'=>$data['urole']]);
        if($u_id)
        {
            return 1;
        }
    }

    //编辑人员
    public function editry()
    {
        $data                    = $this->request->param();
        $list                    = Db::name('user u')->join('entstu_roleuser e','u.id=e.admin_id')->where('u.id',$data['ry_id'])->field('u.user_login,e.role_id,u.user_pass')->find(); 
        return  $list;
    }
   //人员编辑提交
   public function editrypost()
    {
        $data                    = $this->request->param();
         $uid                 = cmf_get_current_user_id();
        $newdata=[
            'user_login'=>$data['bname'],
            'user_pass'       =>cmf_password($data['bpaw'])    
        ];
       $res= Db::name('user')->where('id',$data['ry_id'])->update($newdata); 
       Db::name('entstu_roleuser')->where('admin_id',$data['ry_id'])->update(['role_id'=>$data['urole_id']]);
       if($res)
       {
           return 1;
       }
    }
     //人员删除
   public function rydelete()
   {
      $data                    = $this->request->param();
      $res=Db::name('user')->where('id',$data['ryde_id'])->delete();
       Db::name('entstu_roleuser')->where('admin_id',$data['ry_id'])->delete();
       if($res)
       {
           return 1;
       }
   }
   //学校设置权限
   public function  szqx()
   {
        $data                    = $this->request->param();
        $newdata=[
            'role_id'=>$data['role_id'],
            'acc_id' =>$data['acc_id']
        ];
        $res=Db::name('entstu_accrole')->insert($newdata);
        if($res)
        {
            return 1;
        }
   }
   


}
