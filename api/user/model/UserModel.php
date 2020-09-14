<?php
// +----------------------------------------------------------------------
// | 文件说明：用户表关联model 
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: wuwu <15093565100@163.com>
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Date: 2017-7-26
// +----------------------------------------------------------------------
namespace api\user\model;

use think\Model;

class UserModel extends Model
{
    public function  check_openid($openid,$param)
    {
        $result = $this->where(['openid'=>$openid])->count();
        if(empty($result))
        {
            $data  = ['user_type'=>'2','user_nickname'=>$param['name'],'openid'=>$openid,'sex'=>$param['gender'],'create_time'=>time(),'avatar'=>$param['head_pic']];
            $this->allowField(true)->data($data, true)->isUpdate(false)->save();
        }
    }
}
