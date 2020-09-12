<?php
//招聘会管理

namespace app\portal\controller;
use think\Db;
use cmf\controller\HomeBaseController;
use app\portal\model\JobfairModel;
class EntfairController extends HomeBaseController
{
    public function __construct(){
        parent::__construct();
        $weidu = getweidu();
        $this->assign('weidu',$weidu);
        $this->assign('daohang','2');
    }
    public function index()
    {   
        $uid = cmf_get_current_user_id();
        $where['ent_id'] = getentstuid($uid);
        $request = '';
        $request = input('request.');
        if(!empty($request['title']))
        {
            $title = $request['title'];
            $where['title']=['like',"%$title%"];
        }
        if(!empty($request['title']))
        {
            $title = $request['title'];
            $where['title']=['like',"%$title%"];
        }
        if(!empty($request['datetime']) && !empty($request['datetime2']))
        {
            $where['time']=['between',[strtotime($request['datetime']),strtotime($request['datetime2'])]];
        }
        if(!empty($request['status']))
        {
            $status = $request['status'];
            $where['status']=$status;
        }

        $pos = new JobfairModel();
        $list = $pos->fair_list($where,$request);
        $page = $list->render();
        $this->assign('list',$list);
        $this->assign('page',$page);
        return $this->fetch();
    }
    // 添加招聘会
    public function addfair(){
        $uid = cmf_get_current_user_id();
        if($this->request->ispost()){
            //添加
            $param = $this->request->param();
            $param['status'] = 1;
            $param['uid'] = $uid;
            $param['ent_id'] = getentstuid($uid);
            $param['add_time'] = time();
            $param['dea_time'] = strtotime($param['dea_time']);
            $zws = $param['zws'];
            $posarr = $param['posarr'];
            unset($param['zws']);
            unset($param['posarr']);
            unset($param['zw']);
            foreach($param['alt_time'] as $k=>$v){
                $param['alt_time'][$k] = strtotime($v);
            }
            $param['alt_time'] = json_encode($param['alt_time']);
            $pos = new JobfairModel();
            $id = $pos->fair_add($param);
            //添加关联
            $posarr = explode(',',$posarr);
            if(count($posarr)>0){
                foreach($posarr as $k=>$v){
                    $data[$k]['pos_id'] = $v;
                    $data[$k]['fair_id'] = $id;
                    $data[$k]['time'] = time();
                }
                Db::name('fair_pos')->insertAll($data);
            }
            $this->redirect('index');
        }else{
            //页面
            $pos = Db::name('ent_position')->where('uid',$uid)->select()->toArray();
            $this->assign('pos',$pos);
            return $this->fetch();
        }
    }
    // 招聘会详情
    public function fair_desc(){
        $param = $this->request->param();
        $id = $param['id'];
        $pos = new JobfairModel();
        $res = $pos->getfair($id);
        $res['alt_time'] = json_decode($res['alt_time'],true);
        //获取关联学校
        $stu = Db::name('fair_stu')->where('fair_id',$id)->select()->toArray();
        $stunum = count($stu);
        //获取职位
        $pos = Db::name('fair_pos')->alias('fp')->join('ent_position ep','fp.pos_id=ep.id','LEFT')->where('fp.fair_id',$id)->field('ep.title,ep.major,ep.num,ep.salary_min,ep.salary_max,ep.effective_time,ep.desc')->select()->toArray();

        $this->assign('stunum',$stunum);
        $this->assign('stu',$stu);
        $this->assign('pos',$pos);
        $this->assign('res',$res);
        return $this->fetch();
    }
    //发布通知
    public function addtz(){
        $param = $this->request->param();
        $id = $param['id'];
        $time = $param['time'];
        $pos = new JobfairModel();
        $res = $pos->getfair($id);
        //添加到数据库
        $data['title'] = $res['title'].'确定开始日期'.$time;
        $data['cre_time'] = time();
        $data['type'] = 1;
        $data['form_id'] = $res['ent_id'];
        $data['status'] = 1;
        $data['fair_id'] = $id;
        //获取关联学校
        $stures = Db::name('fair_stu')->where('fair_id',$id)->select()->toArray();
        foreach($stures as $k=>$v){
            $data['to_id'] = $v['stu_id'];
            Db::name('stu_mess')->insert($data);
        }
    }
    //发布通知方法
    public function addtzact(){
        $param = $this->request->param();
        $pos = new JobfairModel();
        $pos->setField('time',$param['time']);
        //给学校发送
        $this->sendxx($param['fid'],$param['title'],$param['time'],1);
        //给学生发送
        $this->sendxs($param['fid'],$param['title'],$param['time'],1,$desc);
    }
    //给学校发送消息
    public function sendxx($fid,$title,$time,$type){
        //查询关联的学校
        $xx = Db::name('fair_stu')->where('fair_id',$fid)->select()->toArray();
        $data['title'] = $title;
        $data['cre_time'] = $time;
        $data['type'] = $type;
        $data['form_id'] = $rbac['user_id'];
        $data['status'] = 1;
        foreach($xx as $k=>$v){
            $data['to_id'] = $xx['id'];
            Db::name('stu_mess')->insert($data);
        }
    }
    //给学生发消息
    public function sendxs($fid,$title,$time,$type){
        //查询关联的学校
        $xx = Db::name('fair_user')->where('fair_id',$fid)->select()->toArray();
        $data['title'] = $title;
        $data['time'] = $time;
        $data['type'] = $type;
        $data['desc'] = $desc;
        foreach($xx as $k=>$v){
            $data['user_id'] = $xx['id'];
            Db::name('user_mess')->insert($data);
            $this->send_tz();
        }
        
    }

    //删除招聘会
    public function delfair(){
        $param = $this->request->param();
        $id = $param['id'];
        Db::name('jobfair')->where('id',$id)->delete();
    }
    // 发送通知
    public function send_tz($openid,$title,$name,$content,$id){
        $access_token = $this->gettoken();
        $url = 'https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token='.$access_token;
        
        $opt['page'] = 'pages/medical/medical?index='.$id;

        $opt['miniprogram_state'] = 'trial';
        $opt['lang'] = 'zh_CN';
        $opt['touser'] = $openid;
        $opt['template_id'] = 'Hs66hdsUk_jTGBZF2j7HVrj_KMzQMGrYvTjUBRmDaww';
        $opt['data']['thing1']['value'] = $title;
        $opt['data']['name4']['value'] = $name;
        $opt['data']['thing7']['value'] = $content;
        $json = json_encode($opt);
        $this->send($url,$json);
    }
    public function gettoken(){
        $config = cmf_get_option('sms_setting');
        $appid = $config['wx_appid'];
        $secret = $config['wx_secret'];
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$secret;
        $json = file_get_contents($url);
        return json_decode($json,true)['access_token'];
    }
    public function send($url,$xml){
       $ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
        $json = curl_exec($ch);
        curl_close($ch);
    }
    
}
