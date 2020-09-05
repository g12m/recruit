<?php
namespace app\gii\controller;
use cmf\controller\AdminBaseController;

/**
 * 模块生成
 */
class AdminIndexController extends AdminBaseController
{
 public function index()
 {
   return $this->fetch(":index");
 }
 //  模块生成
 public function add()
 {
   $param=$this->request->param();
   
 }
}




?>
