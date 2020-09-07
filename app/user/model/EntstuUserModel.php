<?php
namespace app\user\model;
use think\Db;
use think\Model;
class EntstuUserModel extends Model
{
    //获取用户信息
    public function getuser($name){
        $res['user_info'] = $this->alias('u')->join('entstu_roleuser er','u.id=er.admin_id','LEFT')->where('u.login_name',$name)->field('u.id,u.login_name,u.password,u.name,u.type,er.role_id')->find();
        if($res['user_info']){
            $roleid = $res['user_info']['role_id'];
            $res['user_acc'] = Db::name('entstu_accrole')->where('role_id',$roleid)->select()->toArray();
            return $res;
        }else{
            return false;
        }
    }
    public function adduser($data){
        $this->insert($data);
    }
    public function edituser($data){
        $this->update($data);
    }
    public function deletuser($id){
        $this->where('id',$id)->delete();
    }
    public function get_one($username){
        return $this->where('login_name',$username)->find();
    }

}