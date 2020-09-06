<?php
namespace app\portal\controller;
use cmf\controller\HomeBaseController;
class EnterpriseController extends HomeBaseController
{
    public function index(){
        $userinfo = session('Ent_user');
        if(!$userinfo){
            $this->error('请先登录',url('portal/Adminuser/login'));
        }
    }
}
