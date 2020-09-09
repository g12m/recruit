<?php
//企业简历管理

namespace app\portal\controller;
use think\Db;
use cmf\controller\HomeBaseController;
use app\portal\model\StuResumeModel;
class SturesumeController extends HomeBaseController
{
    public function index()
    {
        $where = [];
        $request = '';
        $request = input('request.');
        if(!empty($request['title']))
        {
            $title = $request['title'];
            $where['title']=['like',"%$title%"];
        }
        if(!empty($request['title']))
        {
            $title = $request['title'];
            $where['title']=['like',"%$title%"];
        }
        if(!empty($request['datetime']) && !empty($request['datetime2']))
        {
            $where['time']=['between',[strtotime($request['datetime']),strtotime($request['datetime2'])]];
        }


        $pos = new StuResumeModel();
        $list = $pos->resu_list($where,$request);
        $page = $list->render();
        $this->assign('list',$list);
        $this->assign('page',$page);
        $this->assign('user_info',session('Ent_user'));
        return $this->fetch();
    }
}
