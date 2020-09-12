<?php
//招聘会管理

namespace app\portal\controller;
use think\Db;
use cmf\controller\HomeBaseController;
class EntmessController extends HomeBaseController
{
    public function __construct(){
        parent::__construct();
        $weidu = getweidu();
        $this->assign('weidu',$weidu);
        $this->assign('daohang','99');
    }
    public function index()
    {   
        $ent_id = getentstuid(cmf_get_current_user_id());
        $messres = Db::name('stu_mess')->where('to_id',$ent_id)->select()->toArray();
        $this->assign('messres',$messres);
        return $this->fetch();
    }
    public function desc(){
        $id = $this->request->param('id');
        $res = Db::name('stu_mess')->where('id',$id)->find();
        $this->setstatus($id);
        $this->assign('res',$res);
        return $this->fetch();
    }
    public function setstatus($id){
        Db::name('stu_mess')->where('id',$id)->setField('status',2);
    }
    
    
}
