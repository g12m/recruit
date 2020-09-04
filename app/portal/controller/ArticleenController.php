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
use app\portal\model\PortalCategoryenModel;
use app\portal\service\PostServiceen;
use app\portal\model\PortalPostenModel;
use think\Db;

class ArticleenController extends HomeBaseController
{
    public function index()
    {

        $portalCategoryModel = new PortalCategoryenModel();
        $postService         = new PostServiceen();

        $articleId  = $this->request->param('id', 0, 'intval');
        $categoryId = $this->request->param('cid', 0, 'intval');
        //获取顶级类id并传到模板
        $top_catid = get_top_parent('portal_categoryen',$categoryId);
        $this->assign('top_catid',$top_catid);
        //获取导航的parent_id
        $nav_cat_id = Db::name('nav_menu')->where('catid',$categoryId)->find()['parent_id'];
        $this->assign('nav_cat_id',$nav_cat_id);

        $article    = $postService->publishedArticle($articleId, $categoryId);

        if (empty($article)) {
            abort(404, '文章不存在!');
        }


        $prevArticle = $postService->publishedPrevArticle($articleId, $categoryId);
        $nextArticle = $postService->publishedNextArticle($articleId, $categoryId);

        $tplName = 'article';

        if (empty($categoryId)) {
            $categories = $article['categories'];

            if (count($categories) > 0) {
                $this->assign('category', $categories[0]);
            } else {
                abort(404, '文章未指定分类!');
            }

        } else {
            $category = $portalCategoryModel->where('id', $categoryId)->where('status', 1)->find();

            if (empty($category)) {
                abort(404, '文章不存在!');
            }

            $this->assign('category', $category);

            $tplName = empty($category["one_tpl"]) ? $tplName : $category["one_tpl"];
        }

        Db::name('portal_posten')->where(['id' => $articleId])->setInc('post_hits');


        hook('portal_before_assign_article', $article);

        $this->assign('article', $article);
        $this->assign('prev_article', $prevArticle);
        $this->assign('next_article', $nextArticle);

        $tplName = empty($article['more']['template']) ? $tplName : $article['more']['template'];

        return $this->fetch("/$tplName");
    }

    // 文章点赞
    public function doLike()
    {
        $this->checkUserLogin();
        $articleId = $this->request->param('id', 0, 'intval');


        $canLike = cmf_check_user_action("posts$articleId", 1);

        if ($canLike) {
            Db::name('portal_posten')->where(['id' => $articleId])->setInc('post_like');

            $this->success("赞好啦！");
        } else {
            $this->error("您已赞过啦！");
        }
    }
    // 文章评论
    public function postMessage()
    {
      // 判断是否登录

        $param=$this->request->param();
        $rule=['email|邮箱'=>'require|email','tel|电话'=>'require|number','message|留言'=>'require|length:6,200'];
        $result = $this->validate($param,$rule);
          if (true !== $result) {
              // 验证失败 输出错误信息
              $this->error($result);
          }
          // 写入数据库
          $info['email']=$param['email'];
          $info['tel']=$param['tel'];
          $info['message'] =remove_xss($param['message']);
          $info['createtime']=time();
          Db::name('message')->insert($info);
          $this->success('已成功提交');


    }

}
