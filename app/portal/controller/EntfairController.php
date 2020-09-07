<?php
//招聘会管理

namespace app\portal\controller;
use think\Db;
use cmf\controller\HomeBaseController;
use app\portal\model\JobfairModel;
class EntfairController extends HomeBaseController
{
    public function index()
    {
        $where = [];
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
        // return $this->fetch();
        var_dump($list);
    }
    // 添加招聘会
    public function addfair(){
        if($this->request->ispost()){
            // $alttime = array('1598716888','1598803255');
            // $param['title'] = 'C公司8月招聘专场';
            // $param['num'] = '50';
            // $param['alt_time'] = json_encode($alttime);
            // $param['time'] = 1598716844;
            // $param['dea_time'] = 1598630102;
            // $param['app_num'] = '80';
            //添加
            $param = $this->request->param();
            $pos = new JobfairModel();
            $pos->fair_add($param);
            // $this->redirect('index');
        }else{
            //页面

            // return $this->fetch();
        }
    }
    // 招聘会详情
    public function fair_desc(){
        $param = $this->request->param();
        // $id = $param['id'];
        $id = 1;
        $pos = new JobfairModel();
        $res = $pos->getfair($id);
        $res['alt_time'] = json_decode($res['alt_time'],true);
        //获取关联学校
        $stu = Db::name('fair_stu')->where('fair_id',$id)->select()->toArray();
        $stunum = count($stu);
        //获取职位
        $pos = Db::name('fair_pos')->alias('fp')->join('ent_position ep','fp.pos_id=ep.id','LEFT')->where('fp.fair_id',$id)->field('ep.title,ep.major,ep.num,ep.salary_min,ep.salary_max,ep.effective_time,ep.desc')->select()->toArray();

        $this->assign('user_info',session('Ent_user')['user_info']);
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
        $pos = new JobfairModel();
        $res = $pos->getfair($id);
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
