<?php
/**
 * xss过滤函数
 *
 * @param $string
 * @return string
 */
use \think\Db;
use \think\Sms;
function remove_xss($string) {
    $string = preg_replace('/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]+/S', '', $string);

    $parm1 = Array('javascript', 'vbscript', 'expression', 'applet', 'meta', 'xml', 'blink', 'link', 'script', 'embed', 'object', 'iframe', 'frame', 'frameset', 'ilayer', 'layer', 'bgsound', 'title', 'base');

    $parm2 = Array('onabort', 'onactivate', 'onafterprint', 'onafterupdate', 'onbeforeactivate', 'onbeforecopy', 'onbeforecut', 'onbeforedeactivate', 'onbeforeeditfocus', 'onbeforepaste', 'onbeforeprint', 'onbeforeunload', 'onbeforeupdate', 'onblur', 'onbounce', 'oncellchange', 'onchange', 'onclick', 'oncontextmenu', 'oncontrolselect', 'oncopy', 'oncut', 'ondataavailable', 'ondatasetchanged', 'ondatasetcomplete', 'ondblclick', 'ondeactivate', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'onerror', 'onerrorupdate', 'onfilterchange', 'onfinish', 'onfocus', 'onfocusin', 'onfocusout', 'onhelp', 'onkeydown', 'onkeypress', 'onkeyup', 'onlayoutcomplete', 'onload', 'onlosecapture', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onmove', 'onmoveend', 'onmovestart', 'onpaste', 'onpropertychange', 'onreadystatechange', 'onreset', 'onresize', 'onresizeend', 'onresizestart', 'onrowenter', 'onrowexit', 'onrowsdelete', 'onrowsinserted', 'onscroll', 'onselect', 'onselectionchange', 'onselectstart', 'onstart', 'onstop', 'onsubmit', 'onunload');

    $parm = array_merge($parm1, $parm2);

	for ($i = 0; $i < sizeof($parm); $i++) {
		$pattern = '/';
		for ($j = 0; $j < strlen($parm[$i]); $j++) {
			if ($j > 0) {
				$pattern .= '(';
				$pattern .= '(&#[x|X]0([9][a][b]);?)?';
				$pattern .= '|(&#0([9][10][13]);?)?';
				$pattern .= ')?';
			}
			$pattern .= $parm[$i][$j];
		}
		$pattern .= '/i';
		$string = preg_replace($pattern, ' ', $string);
	}
	return $string;
}
function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true)
 {
      if(function_exists("mb_substr"))
       {
              if($suffix)
              return mb_substr($str, $start, $length, $charset)."...";
              else
                   return mb_substr($str, $start, $length, $charset);
         }
         elseif(function_exists('iconv_substr')) {
             if($suffix)
                  return iconv_substr($str,$start,$length,$charset)."...";
             else
                  return iconv_substr($str,$start,$length,$charset);
         }
         $re['utf-8']   = "/[x01-x7f]|[xc2-xdf][x80-xbf]|[xe0-xef]
                  [x80-xbf]{2}|[xf0-xff][x80-xbf]{3}/";
         $re['gb2312'] = "/[x01-x7f]|[xb0-xf7][xa0-xfe]/";
         $re['gbk']    = "/[x01-x7f]|[x81-xfe][x40-xfe]/";
         $re['big5']   = "/[x01-x7f]|[x81-xfe]([x40-x7e]|xa1-xfe])/";
         preg_match_all($re[$charset], $str, $match);
         $slice = join("",array_slice($match[0], $start, $length));
         if($suffix) return $slice."…";
         return $slice;
}
// 获取某个分类信息
function get_cat_info($catid)
{
  $data=Db::name('portal_category')->where(['id'=>$catid])->find();
  return $data;
}


function get_caten_info($catid)
{
  $data=Db::name('portal_categoryen')->where(['id'=>$catid])->find();
  return $data;
}
function get_catfa_info($catid)
{
  $data=Db::name('portal_categoryfa')->where(['id'=>$catid])->find();
  return $data;
}
//获取职位id
function get_zhiwei_info($catid)
{
  $data=Db::name('fair_pos')->where(['fair_id'=>$catid])->field('pos_id')->select()->toArray();
  return $data;
}
//职位的信息
function get_zhi_info($catid)
{
  $data=Db::name('ent_position')->where(['id'=>$catid])->select()->toArray();
  return $data;
}
//获取职位名称
function get_zhiwei_name($catid)
{
  $data=Db::name('ent_position')->where(['id'=>$catid])->value('title');
  return $data;
}

//获取会场信息
function get_hui($catid)
{
  $uid=cmf_get_current_user_id();
  $data=Db::name('stu_conference')->where(['id'=>$catid,'uid'=>$uid])->find();
  return $data;
}

//获取招聘会信息
function get_job($catid)
{
   $uid=cmf_get_current_user_id();
 $data= Db::name('jobfair')
        ->where(['id'=>$catid])
        ->select()
         ->each(function($item,$key){
           $item['pos_ids'] = get_zhiwei_info($item['id']);
             return   $item;
           });
        ;
  return $data;
}

//获取招聘会关联日期

function get_zptime($catid)
{
  $data=Db::name('stu_pz')->where(['fair_id'=>$catid,'uid'=>4])->value('time');
  return $data;
}

//获取学校会场招聘排期

function get_pqnum($catid)
{
  $uid=cmf_get_current_user_id();
  $data=Db::name('stu_pz')->where(['h_id'=>$catid,'uid'=>$uid,'status'=>1])->count('h_id');
  return $data;
}

//获取学校职位管理

function get_schnum($uid)
{
  $data=Db::name('ent_position')->where(['uid'=>$uid])->field('title')->select()->toArray();
  return $data;
}
function get_countsch($uid)
{
  $data=Db::name('ent_position')->where(['uid'=>$uid])->sum('num');
  return $data;
}

function get_user_info($uid)
{
   $data=Db::name('entstu')->where(['uid'=>$uid])->value('user_name');
  return $data;
}

function get_userlist_info($uid)
{
   $data=Db::name('entstu')->where(['uid'=>$uid])->find();
  return $data;
}
//学校排期关联日期
function get_gltime($id)
{
  $uid=cmf_get_current_user_id();
   $confer = Db::name('stu_pz')->where('fair_id',$id)->where('uid',$uid)->find(); 
    return $confer;   
      
}
// 获取某个分类下的第一个分类
function get_cid($catid)
{
  $data=Db::name('portal_category')->where(['parent_id'=>$catid])->field('id')->order('id ASC')->find();
  return $data['id'];
}

function get_ciden($catid)
{
  $data=Db::name('portal_categoryen')->where(['parent_id'=>$catid])->field('id')->order('id ASC')->find();
  return $data['id'];
}
// 获取某条文章信息
function get_article_info_byid($id)
{
  $data=Db::name('portal_post')->where(['id'=>$id])->find();
  $data['post_content']=cmf_replace_content_file_url(htmlspecialchars_decode($data['post_content']));
  return $data;
}

function get_articleen_info_byid($id)
{
  $data=Db::name('portal_posten')->field('id,post_title,post_content,post_title_en')->where(['id'=>$id])->find();
  $data['post_content']=cmf_replace_content_file_url(htmlspecialchars_decode($data['post_content']));
  return $data;
}
// 获得城市信息，淘宝api
function getCity($ip)
{
  $ip = @file_get_contents("http://ip.taobao.com/service/getIpInfo.php?ip=".$ip);
  $ip = json_decode($ip,true);
  return $ip;
}

 /*
  @发送短信函数 调用阿里云短信接口
  @mobile 手机号，tpl 短信模板 ,code 验证码
  */
  function cmf_sendSms($mobile,$tpl,$code="")
  {
    vendor('aliyun_sdk/Sms');//引入发送短信类
    if(empty($code)){
      $code=rand(100000, 999999);
    }
    $smsModel=new Sms($mobile,$tpl,$code);
    $result=$smsModel->sendSms();
    if($result->Code == 'OK')
    {
      $expireTime =time()+60*10;//有效期10分钟
      cmf_verification_code_log($mobile, $code, $expireTime);
      return "ok";
    }else
    {
      return "error";
    }
  }
  /*
  @隐藏手机，座机号
  */
  function hideCode($code)
  {
      $pattern ='/^((0[\d]{2,3}-[\d]{7,8})|([\d]{11}))$/';
      preg_match($pattern,$code,$data);
      if($data){
        $part_mobile='/(^[\d]{3})\d{6}([\d]{2})$/';
        preg_match($part_mobile,$code,$result);
        if($result)
          return  preg_replace($part_mobile,'$1******$2',$code);
        else
          return  preg_replace('/(^[\d]{3,4})-([\d])([\d]{5,6})([\d]$)/','$1-$2******$4',$code);
      }else{
        return json_encode(['type'=>'error','msg'=>'格式错误'],JSON_UNESCAPED_UNICODE);
      }
  }
  /*
   @对二维数组进行排序，按照某列排序
  */
  function cmf_array_sort($arr,$shortKey,$short=SORT_ASC,$shortType=SORT_REGULAR)
  {
    foreach ($arr as $key => $data){
     $name[$key] = $data[$shortKey];
    }
    array_multisort($name,$shortType,$short,$arr);
    return $arr;
  }
  /*获取制定分类顶级分类*/
  function cmf_get_top_catid($catid)
  {
    $result=Db::name('portal_category')->where(['id'=>$catid])->field('parent_id,id')->find();
    if($result['parent_id'] == 0){
      return $result['id'];
    }else{
      return cmf_get_top_catid($result['parent_id']);
    }
  }

  /*获取制定分类顶级分类*/
  function cmf_get_top_catiden($catid)
  {
    $result=Db::name('portal_categoryen')->where(['id'=>$catid])->field('parent_id,id')->find();
    if($result['parent_id'] == 0){
      return $result['id'];
    }else{
      return cmf_get_top_catiden($result['parent_id']);
    }
  }

  /**
   * 导航 数据，获取单页 分类id 入库
   */
  function cmf_get_catid_by_pageid($id)
  {
      return  Db::name('portal_category_post')->where(['post_id'=>$id])->field(['category_id'])->find();
  }

  /**
   * 导航 数据，获取单页 分类id 入库
   */
  function cmf_get_catiden_by_pageid($id)
  {
      return  Db::name('portal_categoryen_post')->where(['post_id'=>$id])->field(['category_id'])->find();
  }

  /**
   * 获取顶级类id
   * @$table  数据表
   * @$id     当前数据的id
   * @$parent_id  顶级类的父id
   */
  function get_top_parent($table,$id,$parent_id=0){
     $r = Db::name($table)->where('id',$id)->find();
     if($r['parent_id'] != $parent_id) return get_top_parent($table,$r['parent_id'],$parent_id);
     return $r['id'];
   }


   /*获取文章id*/

  function getChildPost($id)
  {
    $where['category_id'] = ['in',$id];
    $categories  = Db::name('portal_category_post')->where($where)->field('post_id')->select()->toArray();
    $info   = array();
    foreach ($categories as $key => $val) {
      $info[] = implode(',',$val);
    }
    return implode(',',$info);
  }



/*找子级所有id*/
  function getChildrenIds($id)
  {
    $catModel = new  app\portal\model\PortalCategoryModel;
    $info     = $catModel->where(['delete_time'=>0])->select();
    $cats=array();
    foreach($info as $v)
    {
       if($v['parent_id'] == $id)
       {
         $cats[]=$v['id'];
         $cats=array_merge($cats,getChildrenIds($v['id']));
       }
    }
    return $cats;
  }


  function getChildPosten($id)
  {
    $where['category_id'] = ['in',$id];
    $categories  = Db::name('portal_categoryen_post')->where($where)->field('post_id')->select()->toArray();
    $info   = array();
    foreach ($categories as $key => $val) {
      $info[] = implode(',',$val);
    }
    return implode(',',$info);
  }
   function getChildPostfa($id)
  {
    $where['category_id'] = ['in',$id];
    $categories  = Db::name('portal_categoryfa_post')->where($where)->field('post_id')->select()->toArray();
    $info   = array();
    foreach ($categories as $key => $val) {
      $info[] = implode(',',$val);
    }
    return implode(',',$info);
  }



/*找子级所有id*/
  function getChildrenIdsen($id)
  {
    $catModel = new  app\portal\model\PortalCategoryenModel;
    $info     = $catModel->where(['delete_time'=>0])->select();
    $cats=array();
    foreach($info as $v)
    {
       if($v['parent_id'] == $id)
       {
         $cats[]=$v['id'];
         $cats=array_merge($cats,getChildrenIdsen($v['id']));
       }
    }
    return $cats;
  }

/*找子级所有id*/
  function getChildrenIdsfa($id)
  {
    $catModel = new  app\portal\model\PortalCategoryfaModel;
    $info     = $catModel->where(['delete_time'=>0])->select();
    $cats=array();
    foreach($info as $v)
    {
       if($v['parent_id'] == $id)
       {
         $cats[]=$v['id'];
         $cats=array_merge($cats,getChildrenIdsfa($v['id']));
       }
    }
    return $cats;
  }





function GetCollection($lid)
{
 $uid = cmf_get_current_user_id();
 $thumbs = Db::name('thumbs')->where('uid',$uid)->where('lid',$lid)->find();
 if ($thumbs == NULL) {
   return 0;
 }
 return $thumbs['status'];

}
// 获取当前文章分类id
function Getcid($cid)
{
$data=Db::name('portal_post')
->where(['id'=>$cid])
->paginate(5)
->each(function($item,$key){
    $item['category_id'] = Db::name('portal_category_post')->where(['post_id'=>$item['id']])->value('category_id');
      return   $item;
  });
return $data[0]['category_id'];
}



?>
