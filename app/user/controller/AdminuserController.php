<?php
//用户管理

namespace app\user\controller;
use cmf\controller\HomeBaseController;
use app\user\model\UserModel;
use app\portal\model\EntstuRoleModel;

class AdminuserController extends HomeBaseController
{
    public $userinfo = array();
    //用户登录
    public function login(){
       if($this->request->ispost()){
            //登录
            $param = $this->request->param();
            //查询用户
            $user = new UserModel();
            $this->userinfo = $user->getuser($param['username']);
            if($this->userinfo){
                if($this->userinfo['user_pass'] == cmf_password($param['password'])){
                    //登录成功
                    if($this->userinfo['user_type'] == '4'){
                        session('Ent_user',$this->userinfo);
                        session('Stu_user','');
                        $this->redirect(cmf_url('portal/sturesume/index'));
                    }elseif($this->userinfo['user_type'] == '3'){
                        session('Stu_user',$this->userinfo);
                        session('Ent_user','');
                        $this->redirect('school/index');
                    }else{
                        //异常用户类型
                    }
                }else{
                    //密码不正确

                }
            }else{
                //用户不存在
            }
       }else{
        //页面
        return $this->fetch();
       }
    }
    //注册选择页
    public function register_check(){
        return $this->fetch();
    }
    //企业注册
    public function register_ent(){
        $param = $this->request->param();
        $user = new UserModel();
        if($user->get_one($param['username'])){
            //用户名已注册
        }else{
            $param['type'] = 1;
        }
    }
    //学校注册
    public function register_stu(){
        $param = $this->request->param();
        $user = new UserModel();
        if($user->get_one($param['username'])){
            //用户名已注册
        }else{
            $param['type'] = 2;
        }
    }
    // 退出登录
    public function logout(){
        $param = $this->request->param();
        if($param['type'] == 1){
            session('Ent_user','');
        }else{
            session('Stu_user','');
        }
        $this->redirect('login');
    }
}
