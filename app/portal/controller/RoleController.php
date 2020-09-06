<?php
//角色管理

namespace app\portal\controller;
use cmf\controller\HomeBaseController;
use app\portal\model\EntstuRoleModel;

class RoleController extends HomeBaseController
{
    public $userinfo = array();
    
    //角色管理
    public function role_list(){
        $param = $this->request->param();
        //判断是企业还是学校
        $this->userinfo = empty(session('Ent_user'))?session('Stu_user'):session('Ent_user');
        $where['type'] = $this->userinfo['user_info']['type'];
        if(!empty($param['keyword'])){
            $where['name'] = ['LIKE',"%".$param['keyword']."%"];
        }
        $res = Db::name('entstu_role')->where($where)->select()->toArray();
        $this->assign('res',$res);
    }
    // 角色添加
    public function role_add(){
        $param = $this->request->param();
        $usertype = $this->userinfo['user_info']['type'];
        $param['type'] = $usertype;
        $role = new EntstuRoleModel();
        $role->addrole($param);
    }
    // 角色编辑
    public function role_edit(){
        $param = $this->request->param();
        $role = new EntstuRoleModel();
        $role->editrole($param);
    }
    // 角色删除
    public function role_dele(){
        $param = $this->request->param();
        $role = new EntstuRoleModel();
        $role->deletrole($param['id']);
    }
    // 角色授权
    public function role_addr(){
        if($this->request->ispost()){
            //修改
            $param = $this->request->param();
            $role = new EntstuRoleModel();
            if($param['type'] == '1'){
                //添加
                unset($param['type']);
                $role->add_roleaddr($param);
            }else{
                //删除
                unset($param['type']);
                $role->del_roleaddr($param);
            }
        }else{
            //传递
            $where['type'] = $this->userinfo['user_info']['type'];
            $accres = Db::name('entstu_access')->where($where)->select()->toArray();
            echo json_encode($accres);
        }
    }
    
}
