<?php
namespace app\portal\model;
use think\Db;
use think\Model;
class StuResumeModel extends Model
{
    public function resu_list($where,$request){
        $res = $this->alias('sr')->join('user u','sr.uid=u.id','LEFT')->join('ent_resume er','sr.id=er.res_id','LEFT')->join('ent_position ep','er.ent_id=ep.id','LEFT')->join('entstu e','er.ent_id=e.id','LEFT')->where($where)->field('sr.id,u.name,u.major,u.school,ep.title,ep.type as ep_type,er.time,e.ent_name')->paginate(12,false,[
            'query'=>$request,
            ]);
        return $res;
    }
    public function get_desc(){

    }
}