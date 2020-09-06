<?php
//人员管理

namespace app\portal\controller;
use cmf\controller\HomeBaseController;
use app\portal\model\EntstuUserModel;

class EntstuuserController extends HomeBaseController
{
    public $userinfo = array();
    
    //人员管理
    public function user_list(){
        //判断是企业还是学校
        $param = $this->request->param();
        //判断是企业还是学校
        $this->userinfo = empty(session('Ent_user'))?session('Stu_user'):session('Ent_user');
        $where['type'] = $this->userinfo['user_info']['type'];
        if(!empty($param['keyword'])){
            $where['name'] = ['LIKE',"%".$param['keyword']."%"];
        }
        $res = Db::name('entstu_user')->where($where)->select()->toArray();
        $this->assign('res',$res);
    }
    // 人员添加
    public function user_add(){
        $param = $this->request->param();
        $usertype = $this->userinfo['user_info']['type'];
        $param['type'] = $usertype;
        $role = new EntstuUserModel();
        $role->adduser($param);
    }
    // 人员编辑
    public function user_edit(){
        $param = $this->request->param();
        $role = new EntstuUserModel();
        $role->edituser($param);
    }
    // 人员删除
    public function user_dele(){
        $param = $this->request->param();
        $role = new EntstuUserModel();
        $role->deletuser($param['id']);
    }
    
}
