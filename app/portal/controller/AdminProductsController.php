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

use cmf\controller\AdminBaseController;
use app\portal\model\PortalPostModel;
use app\portal\service\PostService;
use app\portal\model\PortalCategoryModel;
use think\Db;
use app\admin\model\ThemeModel;

class AdminProductsController extends AdminBaseController
{
    /**
     * 文章列表
     * @adminMenu(
     *     'name'   => '文章管理',
     *     'parent' => 'portal/AdminIndex/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章列表',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $param = $this->request->param();
                $cid         = '4';                                                                          //分类ID
              $categoryId  = $this->request->param('category', 0, 'intval');
              /*获取-------------------------------------------------------------分类的信息*/
              $portalCategoryModel = new PortalCategoryModel();
              $currentCid          = getChildrenIds($cid);                                           //获取分类的子id
              array_push($currentCid,$cid);                                                                 //获取分类的子id
              $categoryTree        = $portalCategoryModel->adminCategoryTree($categoryId,$currentCid);      //获取分类的信息
              /*获取---------------------结束----------------------------------------分类的信息*/
              $postService          = new PostService();
              $result               = getChildrenIds($cid);
                  array_push($result,$cid);
              $result               = getChildPost($result);

              $data                 = $postService->adminArticleList($param,$result);
           $data->appends($param);


        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('status', isset($param['status']) ? $param['status'] : '0');
        $this->assign('articles', $data->items());
        $this->assign('category_tree', $categoryTree);
        $this->assign('category', $categoryId);
        $this->assign('page', $data->render());

        return $this->fetch();
    }

    /**
     * 添加文章
     * @adminMenu(
     *     'name'   => '添加文章',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加文章',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $themeModel        = new ThemeModel();
        $articleThemeFiles = $themeModel->getActionThemeFiles('portal/Article/index');
        $this->assign('article_theme_files', $articleThemeFiles);
        return $this->fetch();
    }

    /**
     * 添加文章提交
     * @adminMenu(
     *     'name'   => '添加文章提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加文章提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();

            //状态只能设置默认值。未发布、未置顶、未推荐
            $data['post']['post_status'] = 1;
            $data['post']['is_top'] = 0;
            $data['post']['recommended'] = 0;


            $post   = $data['post'];

            $result = $this->validate($post, 'AdminArticle');
            if ($result !== true) {
                $this->error($result);
            }

            $portalPostModel = new PortalPostModel();

            if (!empty($data['photo_names']) && !empty($data['photo_urls'])) {
                $data['post']['more']['photos'] = [];
                foreach ($data['photo_urls'] as $key => $url) {
                    $photoUrl = cmf_asset_relative_url($url);
                    array_push($data['post']['more']['photos'], ["url" => $photoUrl, "name" => $data['photo_names'][$key]]);
                }
            }

            if (!empty($data['file_names']) && !empty($data['file_urls'])) {
                $data['post']['more']['files'] = [];
                foreach ($data['file_urls'] as $key => $url) {
                    $fileUrl = cmf_asset_relative_url($url);
                    array_push($data['post']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
                }
            }
            // 自动提取摘要
            if(empty($data['post']['post_excerpt']) && !empty($data['post']['post_content'])){
              $excerpt=cmf_replace_content_file_url(htmlspecialchars_decode($data['post']['post_content']));
              $excerpt= strip_tags($excerpt);
              $data['post']['post_excerpt']=mb_substr($excerpt,0,200);
            }
            $portalPostModel->adminAddArticle($data['post'], $data['post']['categories']);
            $data['post']['id'] = $portalPostModel->id;

            /*  ------------- 推荐位入库  2018.8.9 号----------*/
            Db::name('position_data')->where(['article_id'=>$data['post']['id']])->delete();
            if(!empty($data['post']['recommend']))
            {
              foreach($data['post']['recommend'] as $v)
              {
                Db::name('position_data')->insert(['catid'=>$data['post']['categories'],'posid'=>$v,'article_id'=>$data['post']['id']]);
              }
            }
            /*------------------------------------------------------*/
            $hookParam          = [
                'is_add'  => true,
                'article' => $data['post']
            ];
            hook('portal_admin_after_save_article', $hookParam);


            $this->success('添加成功!', url('AdminProducts/index'));
        }

    }

    /**
     * 编辑文章
     * @adminMenu(
     *     'name'   => '编辑文章',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑文章',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $id = $this->request->param('id', 0, 'intval');

        $portalPostModel = new PortalPostModel();
        $post            = $portalPostModel->where('id', $id)->find();
        $postCategories  = $post->categories()->alias('a')->column('a.name', 'a.id');
        $postCategoryIds = implode(',', array_keys($postCategories));

        $themeModel        = new ThemeModel();
        $articleThemeFiles = $themeModel->getActionThemeFiles('portal/Article/index');
        // 获取当前栏目(顶级栏目)推荐位
        $top_catid=cmf_get_top_catid(key($postCategories));
        $posids=Db::name('position')->where(['catid'=>['in',[key($postCategories),$top_catid]]])->select();
        // 获取当前文章推荐位
        $currposid=Db::name('position_data')->where(['article_id'=>$id])->select()->toArray();
        $this->assign('article_theme_files', $articleThemeFiles);
        $this->assign('post', $post);
        $this->assign('post_categories', $postCategories);
        $this->assign('post_category_ids', $postCategoryIds);
        $this->assign('posids', $posids);
        $this->assign('currposid', array_column($currposid,'posid'));
        return $this->fetch();
    }

    /**
     * 编辑文章提交
     * @adminMenu(
     *     'name'   => '编辑文章提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑文章提交',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {

        if ($this->request->isPost()) {
            $data   = $this->request->param();

            //需要抹除发布、置顶、推荐的修改。
            unset($data['post']['post_status']);
            unset($data['post']['is_top']);
            unset($data['post']['recommended']);

            $post   = $data['post'];
            $result = $this->validate($post, 'AdminArticle');
            if ($result !== true) {
                $this->error($result);
            }

            $portalPostModel = new PortalPostModel();

            if (!empty($data['photo_names']) && !empty($data['photo_urls'])) {
                $data['post']['more']['photos'] = [];
                foreach ($data['photo_urls'] as $key => $url) {
                    $photoUrl = cmf_asset_relative_url($url);
                    array_push($data['post']['more']['photos'], ["url" => $photoUrl, "name" => $data['photo_names'][$key]]);
                }
            }

            if (!empty($data['file_names']) && !empty($data['file_urls'])) {
                $data['post']['more']['files'] = [];
                foreach ($data['file_urls'] as $key => $url) {
                    $fileUrl = cmf_asset_relative_url($url);
                    array_push($data['post']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
                }
            }

            // 自动提取摘要
            if(empty($data['post']['post_excerpt']) && !empty($data['post']['post_content'])){
              $excerpt=cmf_replace_content_file_url(htmlspecialchars_decode($data['post']['post_content']));
              $excerpt= strip_tags($excerpt);
              $data['post']['post_excerpt']=mb_substr($excerpt,0,200);
            }
            /*  ------------- 推荐位入库  2018.8.9 号----------*/
            // return dump($data['post']);
            Db::name('position_data')->where(['article_id'=>$data['post']['id']])->delete();
            if(!empty($data['post']['recommend']))
            {
              foreach($data['post']['recommend'] as $v)
              {
                Db::name('position_data')->insert(['catid'=>$data['post']['categories'],'posid'=>$v,'article_id'=>$data['post']['id']]);
              }
            }
            // 抹去推荐位
            unset($data['post']['recommend']);

            $portalPostModel->adminEditArticle($data['post'], $data['post']['categories']);

            $hookParam = [
                'is_add'  => false,
                'article' => $data['post']
            ];
            hook('portal_admin_after_save_article', $hookParam);

            $this->success('保存成功!',url('AdminProducts/index'));

        }
    }

    /**
     * 文章删除
     * @adminMenu(
     *     'name'   => '文章删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章删除',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $param           = $this->request->param();
        $portalPostModel = new PortalPostModel();

        if (isset($param['id'])) {
            $id           = $this->request->param('id', 0, 'intval');
            $result       = $portalPostModel->where(['id' => $id])->find();
            $data         = [
                'object_id'   => $result['id'],
                'create_time' => time(),
                'table_name'  => 'portal_post',
                'name'        => $result['post_title'],
                'user_id'=>cmf_get_current_admin_id()
            ];
            $resultPortal = $portalPostModel
                ->where(['id' => $id])
                ->update(['delete_time' => time()]);
            if ($resultPortal) {
                Db::name('portal_category_post')->where(['post_id'=>$id])->update(['status'=>0]);
                Db::name('portal_tag_post')->where(['post_id'=>$id])->update(['status'=>0]);

                Db::name('recycleBin')->insert($data);
            }
            // 删除推荐位中的推荐文章
            Db::name('position_data')->where(['article_id'=>$id])->delete();
            /*----------------------------------------------*/
            $this->success("删除成功！", '');

        }

        if (isset($param['ids'])) {
            $ids     = $this->request->param('ids/a');
            $recycle = $portalPostModel->where(['id' => ['in', $ids]])->select();
            $result  = $portalPostModel->where(['id' => ['in', $ids]])->update(['delete_time' => time()]);
            if ($result) {
                Db::name('portal_category_post')->where(['post_id' => ['in', $ids]])->update(['status'=>0]);
                Db::name('portal_tag_post')->where(['post_id' => ['in', $ids]])->update(['status'=>0]);
                foreach ($recycle as $value) {
                    $data = [
                        'object_id'   => $value['id'],
                        'create_time' => time(),
                        'table_name'  => 'portal_post',
                        'name'        => $value['post_title'],
                        'user_id'=>cmf_get_current_admin_id()
                    ];
                    Db::name('recycleBin')->insert($data);
                }
                // 删除推荐位中的推荐文章
                Db::name('position_data')->where(['article_id'=>['in',$ids]])->delete();
                /*----------------------------------------------*/
                $this->success("删除成功！", '');
            }
        }
    }

    /**
     * 文章发布
     * @adminMenu(
     *     'name'   => '文章发布',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章发布',
     *     'param'  => ''
     * )
     */
    public function publish()
    {
        $param           = $this->request->param();
        $portalPostModel = new PortalPostModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');

            $portalPostModel->where(['id' => ['in', $ids]])->update(['post_status' => 1, 'published_time' => time()]);

            $this->success("发布成功！", '');
        }

        if (isset($param['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');

            $portalPostModel->where(['id' => ['in', $ids]])->update(['post_status' => 0]);

            $this->success("取消发布成功！", '');
        }

    }

    /**
     * 文章置顶
     * @adminMenu(
     *     'name'   => '文章置顶',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章置顶',
     *     'param'  => ''
     * )
     */
    public function top()
    {
        $param           = $this->request->param();
        $portalPostModel = new PortalPostModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');

            $portalPostModel->where(['id' => ['in', $ids]])->update(['is_top' => 1]);

            $this->success("置顶成功！", '');

        }

        if (isset($_POST['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');

            $portalPostModel->where(['id' => ['in', $ids]])->update(['is_top' => 0]);

            $this->success("取消置顶成功！", '');
        }
    }

    /**
     * 文章推荐
     * @adminMenu(
     *     'name'   => '文章推荐',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章推荐',
     *     'param'  => ''
     * )
     */
    public function recommend()
    {
        $param           = $this->request->param();
        $portalPostModel = new PortalPostModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');

            $portalPostModel->where(['id' => ['in', $ids]])->update(['recommended' => 1]);

            $this->success("推荐成功！", '');

        }
        if (isset($param['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');

            $portalPostModel->where(['id' => ['in', $ids]])->update(['recommended' => 0]);

            $this->success("取消推荐成功！", '');

        }
    }

    /**
     * 文章排序
     * @adminMenu(
     *     'name'   => '文章排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('portal_post'));
        $this->success("排序更新成功！", '');

    }

    public function move()
    {

    }

    public function copy()
    {

    }

    // 2018.8.17  添加文章获取推荐位
    public function  getPosition()
    {
      $catid=$this->request->param('catid');
      config('default_return_type','JSON');
      //获取上级分类
      $top_catid=cmf_get_top_catid($catid);
      $posids=Db::name('position')->where(['catid'=>['in',[$catid,$top_catid]]])->select();
      return $posids;

    }


}
