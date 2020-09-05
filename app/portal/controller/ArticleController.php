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
use app\portal\service\PostService;
use app\portal\model\PortalPostModel;
use think\Db;

class ArticleController extends HomeBaseController
{
    public function index()
    {

        $portalCategoryModel = new PortalCategoryModel();
        $postService         = new PostService();

        $articleId  = $this->request->param('id', 0, 'intval');
        $categoryId = $this->request->param('cid', 0, 'intval');
        //获取顶级类id并传到模板
        $top_catid = get_top_parent('portal_category',$categoryId);
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

        Db::name('portal_post')->where(['id' => $articleId])->setInc('post_hits');


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
            Db::name('portal_post')->where(['id' => $articleId])->setInc('post_like');

            $this->success("赞好啦！");
        } else {
            $this->error("您已赞过啦！");
        }
    }
    // 文章评论
    public function postMessage()
    {
        $param=$this->request->param();
        $rule=['name|姓名'=>'require','birthday|出生日期'=>'require','school|在校学校'=>'require','tel|电话'=>'require|number'];
        $result = $this->validate($param,$rule);
          if (true !== $result) {
              // 验证失败 输出错误信息
              $this->error($result);
          }

          // 写入数据库
          $info['name']=$param['name'];
          $info['sex']=$param['sex'];
          $info['tel']=$param['tel'];
          $info['year']=$param['year'];
          $info['school']=$param['school'];
          $info['birthday']=strtotime($param['birthday']);
          $info['createtime']=time();
          Db::name('message')->insert($info);
          $this->success('已成功提交');


    }


    // 在线留言
    public function postMsg()
    {
        $param=$this->request->param();
        $rule=['name|标题'=>'require','year|留言内容'=>'require'];
        $result = $this->validate($param,$rule);
          if (true !== $result) {
              // 验证失败 输出错误信息
              $this->error($result);
          }
          // 写入数据库
          $info['name']=$param['name'];
          $info['year']=$param['year'];
          $info['createtime']=time();
          Db::name('msg')->insert($info);
          $this->success('已成功提交');
    }
    // 在
    public function postSign()
    {
        $param=$this->request->param();
        $rule=['name|姓名'=>'require','year|年龄'=>'require','tel|电话'=>'require|number'];
        $result = $this->validate($param,$rule);
          if (true !== $result) {
              // 验证失败 输出错误信息
              $this->error($result);
          }
          // 写入数据库
          $info['name']=$param['name'];
          $info['year']=$param['year'];
          $info['tel']=$param['tel'];
        $info['catid']=$param['catid'];
          $info['createtime']=time();
          Db::name('sign')->insert($info);
          $this->success('已成功提交');


    }

}
