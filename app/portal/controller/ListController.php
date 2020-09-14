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
use app\portal\model\PortalCategoryModel;
use think\Db;
class ListController extends HomeBaseController
{
    public function index()
    {
        $id                  = $this->request->param('id', 0, 'intval');
        //获取顶级类id并传到模板
        $top_catid = get_top_parent('portal_category',$id);
        $this->assign('top_catid',$top_catid);
        //获取导航的parent_id
        $nav_cat_id = Db::name('nav_menu')->where('catid',$id)->find()['parent_id'];
        $this->assign('nav_cat_id',$nav_cat_id);

        $portalCategoryModel = new PortalCategoryModel();

        $category = $portalCategoryModel->where('id', $id)->where('status', 1)->find();

        $this->assign('category', $category);

        $list=Db::name('picture')->order('list_order DESC,creatime DESC')->select()->toArray();
      

        $mark=Db::name('mark')->order('list_order DESC,creatime DESC')->select()->toArray();

        $this->assign('mark', $mark);
      

        $this->assign('list', $list);

        $listTpl = empty($category['list_tpl']) ? 'list' : $category['list_tpl'];

        return $this->fetch('/' . $listTpl);
    }
       public function reg_success()
   {
        return $this->fetch(":/register_success");
   }
    //中文下载数量
    public function collection()
    {
        $id     = $this->request->param('id');
        Db::name('portal_post')->where('id',$id)->setInc('post_hits',1); //点击字段加一
        $pInfo  = Db::name('portal_post')->where('id',$id)->find();
        return $pInfo['post_hits'];
    }
    // 英文下载数量
    public function collectionen()
    {
        $id     = $this->request->param('id');
        Db::name('portal_posten')->where('id',$id)->setInc('post_hits',1); //点击字段加一
        $pInfo  = Db::name('portal_posten')->where('id',$id)->find();
        return $pInfo['post_hits'];
    }
       public function avatarUpload()
    {
        $file   = $this->request->file('file');
        $result = $file->validate([
            'ext'  => 'jpg,jpeg,png',
            'size' => 1024 * 1024
        ])->move('.' . DS . 'upload' . DS . 'avatar' . DS);

        if ($result) {
            $avatarSaveName = str_replace('//', '/', str_replace('\\', '/', $result->getSaveName()));
            $avatar         = 'avatar/' . $avatarSaveName;
            session('avatar', $avatar);

            return json_encode([
                'code' => 1,
                "msg"  => "上传成功",
                "data" => ['file' => $avatar],
                "url"  => ''
            ]);
        } else {
            return json_encode([
                'code' => 0,
                "msg"  => $file->getError(),
                "data" => "",
                "url"  => ''
            ]);
        }
    }

}
