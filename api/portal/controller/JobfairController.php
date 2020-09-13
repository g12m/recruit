<?php
namespace api\portal\controller;

use api\user\model\UserFavoriteModel;
use api\user\model\UserLikeModel;
use cmf\controller\RestBaseController;
use api\portal\model\PortalPostModel;
use think\Db;
class JobfairController extends RestBaseController{
    public function fair_list(){
        $param = $this->request->param();
        //获取学校id
        $where['type'] == 3;
        $where['ent_name'] = $param['name'];
        $schid = Db::name('entstu')->field('id')->where($where)->find();
        $where2['j.status'] = 2;
        $where2['fs.stu_id'] = $schid;
        $fairlist = Db::name('fair_stu')->alias('fs')->join('jobfair j','fs.fair_id=j.id','LEFT')->where($where2)->field('j.id,j.title,j.time,j.num')->select()->toArray();
        foreach($fairlist as $k=>$v){
            $fairid = $v['id'];
            $poslist = Db::name('fair_pos')->alias('fp')->join('ent_position ep','fp.pos_id=ep.id','LEFT')->where('fp.fair_id',$fairid)->field('ep.title')->select()->toArray();
            foreach($poslist as $k2=>$v2){
                $posarr[$k2] = $v2['title'];
            }
            $fairlist[$k]['position'] = implode('、',$posarr);
        }
        echo json_encode($fairlist);
    }
    public function fair_desc(){
        $param = $this->request->param();
        $id = $param['id'];
        $fairres = Db::name('jobfair')->alias('j')->join('entstu e','j.ent_id=e.id','LEFT')->field('j.title,j.time,j.num,e.ent_name,e.id as ent_id')->where('j.id',$id)->find();
        //获取地点
        $fairres['address'] = Db::name('stu_pz')->alias('sp')->join('stu_conference sc','sp.h_id=sc.id','LEFT')->where('sp.fair_id',$id)->field('sc.address')->find();
        //获取职位
        $fairres['position'] = Db::name('fair_pos')->alias('fp')->join('ent_position ep','fp.pos_id=ep.id','LEFT')->where('fp.fair_id',$id)->field('ep.title,ep.salary_min,ep.salary_max,ep.type,ep.num')->select()->toArray();
        echo json_encode($fairres);
    }
    public function yuyue(){
        $param = $this->request->param();
        $param['time'] = time();
        Db::name('fair_user')->insert($param);
    }
    public function yuyue_list(){
        $param = $this->request->param();
        $yuyuelist = Db::name('fair_user')->alias('fu')->join('jobfair j','fu.fair_id=j.id','LEFT')->where('fu.user_id',$param['id'])->field('j.id,j.title,j.time,j.num')->select()->toArray();
        foreach($yuyuelist as $k=>$v){
            $fairid = $v['id'];
            $poslist = Db::name('fair_pos')->alias('fp')->join('ent_position ep','fp.pos_id=ep.id','LEFT')->where('fp.fair_id',$fairid)->field('ep.title')->select()->toArray();
            foreach($poslist as $k2=>$v2){
                $posarr[$k2] = $v2['title'];
            }
            $yuyuelist[$k]['position'] = implode('、',$posarr);
        }
        echo json_encode($yuyuelist);
    }
}
?>