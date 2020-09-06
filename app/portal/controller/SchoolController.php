<?php
namespace app\portal\controller;
use cmf\controller\HomeBaseController;
class SchoolController extends HomeBaseController
{
    public function index()
    {
        $userinfo = session('Stu_user');
        if(!$userinfo){
            $this->error('请先登录',url('portal/Adminuser/login'));
        }
    }
}
