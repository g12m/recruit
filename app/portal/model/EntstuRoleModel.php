<?php
namespace app\portal\model;
use think\Db;
use think\Model;
class EntstuRoleModel extends Model
{
    public function addrole($data){
        $this->insert($data);
    }
    public function editrole($data){
        $this->update($data);
    }
    public function deletrole($id){
        $this->where('id',$id)->delete();
    }
    public function add_roleaddr($data){
        Db::name('entstu_accrole')->insert($data);
    }
    public function del_roleaddr($data){
        Db::name('entstu_accrole')->where($data)->delete();
    }

}