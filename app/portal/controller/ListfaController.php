<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use cmf\controller\HomeBaseController;
use app\portal\model\PortalCategoryfaModel;
use think\Db;
class ListfaController extends HomeBaseController
{
    public function index()
    {
        $id                  = $this->request->param('id', 0, 'intval');
        //获取顶级类id并传到模板
        $top_catid = get_top_parent('portal_categoryfa',$id);
        $this->assign('top_catid',$top_catid);
        //获取导航的parent_id
        $nav_cat_id = Db::name('nav_menu')->where('catid',$id)->find()['parent_id'];
        $this->assign('nav_cat_id',$nav_cat_id);

        $portalCategoryModel = new PortalCategoryfaModel();

        $category = $portalCategoryModel->where('id', $id)->where('status', 1)->find();

        $this->assign('category', $category);

        $list=Db::name('picture')->order('list_order DESC,creatime DESC')->select()->toArray();

        $mark=Db::name('mark')->order('list_order DESC,creatime DESC')->select()->toArray();





        $this->assign('mark', $mark);

        $this->assign('list', $list);

        $listTpl = empty($category['list_tpl']) ? 'list' : $category['list_tpl'];
        return $this->fetch('/' . $listTpl);
    }

}
