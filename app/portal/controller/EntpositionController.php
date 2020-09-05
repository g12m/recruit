<?php
//企业职位管理

namespace app\portal\controller;
use cmf\controller\HomeBaseController;
use app\portal\model\EntPositionModel;
class EnterpriseController extends HomeBaseController
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
        if($this->request->ispost()){
            //添加
            $param = $this->request->param();
            $pos = new EntPositionModel();
            $pos->pos_add($param);
            $this->redirect('index');
        }else{
            //页面

            // return $this->fetch();
        }
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
