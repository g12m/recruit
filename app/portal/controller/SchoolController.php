<?php
namespace app\portal\controller;
use cmf\controller\HomeBaseController;
class SchoolController extends HomeBaseController
{
    public function index()
    {
        echo "学校首页";die();
        $keyword = $this->request->param('keyword');

        if (empty($keyword)) {
            $this -> error("关键词不能为空！请重新输入！");
        }

        $this -> assign("keyword", $keyword);
        return $this->fetch('/search');
    }
}
