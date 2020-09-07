<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:45:"themes/index/portal\sch_position\article.html";i:1599457479;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left.html";i:1599459379;}*/ ?>

<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta name='renderer' content='webkit'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
    <title><?php echo $site_info['site_name']; ?></title>
    <meta name="keywords" content="<?php echo (isset($category['seo_keywords']) && ($category['seo_keywords'] !== '')?$category['seo_keywords']:$site_info['site_seo_keywords']); ?>">
    <meta name="description" content="<?php echo (isset($category['seo_description']) && ($category['seo_description'] !== '')?$category['seo_description']:$site_info['site_seo_description']); ?>" />

</head>
<link rel="stylesheet" href="/themes/index/public/assets/css/default/layui/css/layui.css">
<link rel='stylesheet' href='/themes/index/public/assets/css/default/index.css'>
<script src="/themes/index/public/assets/js/default/jquery-1.11.3.min.js"></script>
<script src='/themes/index/public/assets/css/default/layui/layui.js'></script>
<script src='/themes/index/public/assets/js/default/SuperSlide.js'></script>
<script src='/themes/index/public/assets/js/default/index.js'></script>

<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <!-- 头部 -->
        <div class="layui-header">
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon layui-icon-notice"></i>
                        <span class="layui-badge-dot"></span>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">王奇博</a>
                    <dl class="layui-nav-child">
                        <dd><a href="">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!-- 左侧导航 -->
        

<?php dump($_SERVER['PHP_SELF']);?>
  <div class="layui-side layui-bg-black" style="background: url(/themes/index/public/assets/images/default/navbg.png);">
    <div class="layui-logo"><img src="/themes/index/public/assets/images/default/logo.png" alt=""></div>
    <div class="layui-side-scroll">
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_kb.png"
              alt="">招聘大看板 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/Scheduling/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_pq.png"
              alt=""> 排期管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item  layui-nav-itemed layui-this"><a href="<?php echo url('portal/confer/index'); ?>"><img
              src="/themes/index/public/assets/images/default/icon_hc.png" alt=""> 会场管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="/sch_position"><img src="/themes/index/public/assets/images/default/icon_zw.png"
              alt=""> 职位管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_jl.png"
              alt=""> 简历管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_js.png"
              alt=""> 角色管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_ry.png"
              alt=""> 人员管理 <span class="jian">></span></a></li>
      </ul>
    </div>
  </div>

        <!-- 主体部分 -->
        <div class="layui-body">
            <div class="RightBody">
                <div class="xq-title layui-clear">

                    <div class="xq-h">北京XXX有限公司</div>
                    <input type="hidden" name="q_id" value="4" class="q_id">
                    <input type="hidden" name="sch_id" value="3" class="sch_id">
                    <div class="riqi">
                        <i>【招聘人数】<span><?php echo $num; ?>人</span></i>
                        <i>【企业联系人】<span>王芳</span></i>
                        <i>【联系电话】<span>13800001111</span></i>
                    </div>
                    <div class="btns">
                        <?php if(empty($value) || (($value instanceof \think\Collection || $value instanceof \think\Paginator ) && $value->isEmpty())): ?>
                        <button class="layui-btn fb">发布</button>
                            <?php else: ?>
                            <button class="layui-btn">已发布</button>
                            <?php endif; ?>
                        <button class="layui-btn btn-qx ch">
                           撤回
                          
                        </button>
                       
                    
                       
                    </div>
                </div>
                <div class="hcxq">
                    <div class="xx">
                        <div class="xx-title">
                            <div class="a">招聘职位</div>
                        </div>
                        <div class="xx-list">
                            <?php if(is_array($info) || $info instanceof \think\Collection || $info instanceof \think\Paginator): if( count($info)==0 ) : echo "" ;else: foreach($info as $key=>$v3): ?>
                            

                                <div class="xx-box">
                                    <div class="xx-box-h"><?php echo $v3['title']; ?></div>
                                    <div class="xx-box-m">
                                        <i>【建议专业】<span><?php echo $v3['major']; ?></span></i>
                                        <i>【招聘人数】<span><?php echo $v3['num']; ?>人</span></i>
                                        <i>【职位类型】<span><?php echo $v3['type']==1?'正式':"实习";?></span></i>
                                        <i>【薪资范围】<span><?php echo $v3['salary_min']; ?>~<?php echo $v3['salary_max']; ?></span></i>
                                        <i>【有效期】<span><?php echo date("Y年m月d日",$v3['effective_time']); ?></span></i>
                                    </div>
                                    <div class="xx-box-yq">
                                        <b>职位描述</b>
                                        <p><?php echo $v3['desc']; ?></p>
                                       
                                    </div>
                                </div>
                            <?php endforeach; endif; else: echo "" ;endif; ?>

                          
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="fb" class="tc">
        <img style="width:100px;" src="/themes/index/public/assets/images/default/fb.png" alt="">
        <p>发布后，本校学生可在微信小程序看到该企业的招聘职位</p>
        <button class="layui-btn btn-qx qx">取消</button>
        <button class="layui-btn qr">确认</button>
    </div>
    <div id="ch" class="tc">
        <img src="/themes/index/public/assets/images/default/ch.png" alt="">
        <p>撤回后，本校学生在微信小程序看不到该企业的招聘职位</p>
        <button class="layui-btn btn-qx qx">取消</button>
        <button class="layui-btn qr">确认</button>
    </div>
</body>

</html>