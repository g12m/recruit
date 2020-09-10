<?php
namespace app\portal\model;
use think\Model;
class EntPositionModel extends Model
{
    //获取企业职位
    public function pos_list($where,$request){
        $res = $this->where($where)->paginate(11,false,[
            'query'=>$request,
            ]);
        return $res;
    }
    //添加职位
    public function pos_add($arr){
        $res= $this->insertGetId($arr);
        return $res;
    }
    // 删除职位
    public function pos_del($id){
        $this->where('id',$id)->delete();
    }
    // 编辑职位
    public function pos_edit($arr,$id){
        $this->where('id',$id)->update($arr);
    }
    // 查询一个职位
    public function getpos($id){
        return $this->where('id',$id)->find();
    }


}