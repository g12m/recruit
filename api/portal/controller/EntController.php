<?php
namespace api\portal\controller;

use api\user\model\UserFavoriteModel;
use api\user\model\UserLikeModel;
use cmf\controller\RestBaseController;
use api\portal\model\PortalPostModel;
use think\Db;
class EntController extends RestBaseController{
    public function ent_desc(){
        $param = $this->request->param();
        $id = $param['id'];
        $entres = Db::name('entstu')->where('id',$id)->find();
        echo json_encode($entres);
    }
}
?>