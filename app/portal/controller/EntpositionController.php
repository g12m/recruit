<?php
//企业职位管理

namespace app\portal\controller;
use cmf\controller\HomeBaseController;
use app\portal\model\EntPositionModel;
class EntPositionController extends HomeBaseController
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

        $pos = new EntPositionModel();
        $list = $pos->pos_list($where,$request);
        $page = $list->render();
        $this->assign('list',$list);
        $this->assign('page',$page);
        // return $this->fetch();
        var_dump($list);
    }
    //添加职位
    public function addpos(){
        // if($this->request->ispost()){
            //添加
            $param = $this->request->param();
            $param['title'] = '产品经理';
            $param['type'] = 1;
            $param['time'] = time();
            $param['desc'] = '和客户沟通需求';
            $param['salary_min'] = 6000;
            $param['salary_max'] = 7000;
            $param['major'] = '计算机';
            $param['num'] = '10';
            $param['effective_time'] = 1598630400;
            $pos = new EntPositionModel();
            $pos->pos_add($param);
            // $this->redirect('index');
        // }else{
            //页面

            // return $this->fetch();
        // }
    }
    // 删除职位
    public function delpos(){
        $param = $this->request->param();
        $pos = new EntPositionModel();
        $pos->pos_del($param['id']);
        $this->redirect('index');
    }
    // 编辑职位
    public function editpos(){
        $pos = new EntPositionModel();
        $param = $this->request->param();
        if($this->request->ispost()){
            //添加
            $pos->pos_edit($param);
            $this->redirect('index');
        }else{
            //页面
            $res = $pos->getpos($param['id']);
            $this->assign('res',$res);
            // return $this->fetch();
        }
    }
    
}
