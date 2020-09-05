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
use app\portal\service\ApiService;
use think\Db;
class IndexController extends HomeBaseController
{
    public function index()
    {
        $product=Db::name('product')->order('list_order DESC,creatime DESC')->select()->toArray();
        $this->assign('product', $product);
        $price=Db::name('price')->order('list_order DESC,creatime DESC')->select()->toArray();
        $this->assign('price', $price);

        return $this->fetch(':index');
    }
    public function indexen()
    {
      $navs=Db::name('shoplist')->order('list_order DESC,create_time DESC')->select()->toArray();
      $this->assign('navs', $navs);
        return $this->fetch(':eng/index');
    }
     public function indexfa()
    {
      $navs=Db::name('shoplist')->order('list_order DESC,create_time DESC')->select()->toArray();
      $this->assign('navs', $navs);
        return $this->fetch(':fa/index');
    }
    public function search()
    {
     $data=$this->request->param();
     if($this->request->isPost())
     {
       if(empty($data['title']))
       {
         $res='';
       }
       else {
         $res=Db::name('portal_post')
         ->where('post_title','like',"%{$data['title']}%")
         ->paginate()
         ->each(function($item,$key){
           $item['category_id'] = Db::name('portal_category_post')->where(['post_id'=>$item['id']])->value('category_id');
             return   $item;
           });
         $this->assign('res',$res);
       }

     }

     $this->assign("keywords", isset($data['title'])?$data['title']:'');
     return $this->fetch(':list_search');   //前台搜索页面
    }
    //英文版全局搜索
    public function searchen()
    {
     $data=$this->request->param();
     if($this->request->isPost())
     {
       if(empty($data['title']))
       {
         $res='';
       }
       else {
         $res=Db::name('portal_posten')
         ->where('post_title','like',"%{$data['title']}%")
         ->paginate()
         ->each(function($item,$key){
           $item['category_id'] = Db::name('portal_categoryen_post')->where(['post_id'=>$item['id']])->value('category_id');
             return   $item;
           });
         $this->assign('res',$res);
       }

     }

     $this->assign("keywords", isset($data['title'])?$data['title']:'');
     return $this->fetch(':eng/list_search');   //前台搜索页面
    }


    public function search_pro()
    {
      if ($this->request->isPost())
      {
        $where        = [];
        $title        = $this->request->param('title');
        $res=Db::name('portal_post p')
                 ->join('portal_category_post pc',"pc.post_id=p.id")  //用户收藏表
                 ->join('portal_category pte',"pte.id=pc.category_id")
                 ->where('pte.parent_id',3)        //父级分类为1的分类id
                 ->where('p.post_title','like',"%$title%")
                 ->field('p.*,pc.*,p.id as ids,pte.*,pte.id as cid')
                 ->select()
                 ->toArray();
      }
       $this->assign('res',$res);
       return $this->fetch(':list_search');
    }

    public function search_proen()
    {
      if ($this->request->isPost())
      {
        $where        = [];
        $title        = $this->request->param('title');
        $res=Db::name('portal_posten p')
                 ->join('portal_categoryen_post pc',"pc.post_id=p.id")  //用户收藏表
                 ->join('portal_categoryen pte',"pte.id=pc.category_id")
                 ->where('pte.parent_id',14)        //父级分类为1的分类id
                 ->where('p.post_title','like',"%$title%")
                 ->field('p.*,pc.*,p.id as ids,pte.*,pte.id as cid')
                 ->select()
                 ->toArray();

      }
       $this->assign('res',$res);
       return $this->fetch(':eng/list_search');
    }


}
