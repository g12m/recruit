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
use app\portal\service\PostService;
use think\Db;
class PageController extends HomeBaseController
{
    public function index()
    {
        $postService = new PostService();
        $pageId      = $this->request->param('id', 0, 'intval');
        $page        = $postService->publishedPage($pageId);

        if (empty($page)) {
            abort(404, ' 页面不存在!');
        }
        $category['id']=$page['category_id'];
        //将单页所属的category_id的最顶级id传到模板
        $top_catid = get_top_parent('portal_category',$category['id']);
        $this->assign('top_catid',$top_catid);

        //获取导航的parent_id
        $is_more = Db::name('nav_menu')->where('catid',$category['id'])->select();
        $num = count($is_more);
        if($num > 1){
            $where1['catid'] = $category['id'];
            $where1['parent_id'] = ['neq',0];
            $nav_cat_id = Db::name('nav_menu')->where($where1)->find();
            $this->assign('nav_cat_id',$nav_cat_id['parent_id']);
        }else{
            $nav_cat_id = Db::name('nav_menu')->where('catid',$category['id'])->find();
            $this->assign('nav_cat_id',$nav_cat_id['catid']);
        }

        $this->assign('category', $category);

        $this->assign('page', $page);

        $more = $page['more'];

        $tplName = empty($more['template']) ? 'page' : $more['template'];

        return $this->fetch("/$tplName");
    }

}
