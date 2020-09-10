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

use cmf\controller\UserBaseController;
use app\portal\service\ApiService;
use think\Db;
class IndexController extends UserBaseController
{
    public function index()
    {
     
        $uid=cmf_get_current_user();
        if($uid['user_type']==3)
        { 
          header("location:scheduling");
        }
        else{
          header("location:portal/sturesume/index.html");
          //return $this->fetch(':index');
        }
      
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



}
