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
use think\Db;
/*
*广告位板块控制器
*/
class AdminPosterController extends AdminBaseController
{

  public function index()
  {
    $list = Db::name('poster')
                        ->alias('a')
                        ->order("id DESC")
                        ->paginate(10);
    // 获取分页显示
    $page = $list->render();
    $this->assign('list', $list);
    $this->assign('page', $page);
    return $this->fetch();
  }
  // 添加推荐位
  public function add()
  {
    return $this->fetch();
  }
  // 添加到数据库
  public function addPost()
  {
    $param=$this->request->param();
    $rule=['name|版位名称'    =>'require',
           'width|图片宽度'   =>'require|number',
           'height|图片宽度'  =>'require|number',
           'desc|描述'        =>'require'
         ];
    $result = $this->validate($param,$rule);
      if (true !== $result) {
          // 验证失败 输出错误信息
          $this->error($result);
      }

    Db::name('poster')->insert($param);
    return $this->success('添加成功',url('AdminPoster/index'));
  }
  // 编辑
  public function edit()
  {
    $param=$this->request->param('id');
    if($param)
    {
      $data=Db::name('poster')->where(['id'=>$param])->find();
    }else
    {
      return $this->error('参数错误');
    }
    $this->assign('info',$data);
    return $this->fetch();
  }
  // 保存编辑
  public function editPost()
  {
    $param=$this->request->param();
    $rule=[ 'name|版位名称'    =>'require',
            'width|图片宽度'   =>'require|number',
            'height|图片宽度'  =>'require|number',
            'desc|描述'        =>'require'
  ];
    $result = $this->validate($param,$rule);
      if (true !== $result) {
          // 验证失败 输出错误信息
          $this->error($result);
      }
      // 写入数据库
      Db::name('poster')->update($param);
      return $this->success('已修改',url('AdminPoster/index'));
  }
  // 删除推荐位
  public function delete()
  {
    $id=$this->request->param('id');
    if($id)
    {
      // 判断当前版位是否有信息
      $result=DB::name('poster_data')->where('pid',$id)->find();
      if($result){
        $this->error('当前分类下有信息');
      }
      Db::name('poster')->where(['id'=>$id])->delete();
      return $this->success('删除成功!');
    }
  }


}
