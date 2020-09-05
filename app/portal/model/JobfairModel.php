<?php
namespace app\portal\model;
use think\Db;
use think\Model;
class JobfairModel extends Model
{
    public function fair_list($wehre,$request){
        $res = $this->where($where)->paginate(12,false,[
            'query'=>$request,
            ]);
        return $res;
    }

    public function fair_add($arr){
        $res = $this->insert($arr);
        var_dump($res);
    }
    public function getfair($id){
        return $this->where('id',$id)->find();
    }

}