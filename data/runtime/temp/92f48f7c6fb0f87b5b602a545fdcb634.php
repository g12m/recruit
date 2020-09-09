<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:34:"themes/index/portal\msg\index.html";i:1599563990;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left.html";i:1599568033;}*/ ?>
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
       
        <!-- 左侧导航 -->
        

<div class="layui-header">
      <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                  <a href="<?php echo url('portal/msg/index'); ?>">
                        <i class="layui-icon layui-icon-notice"></i>
                        <span class="layui-badge-dot"></span>
                  </a>
            </li>
            <li class="layui-nav-item">
                  <a href="javascript:;">
                        <?php $user=cmf_get_current_user_id();
                              $name=get_user_info($user);
                        ?>
                        <?php echo $name; ?>
                  </a>
                  <dl class="layui-nav-child">
                        <dd><a href="<?php echo url('user/index/logout'); ?>">退出</a></dd>
                  </dl>
            </li>
      </ul>
</div>



<?php dump($_SERVER['PHP_SELF']);?>
  <div class="layui-side layui-bg-black" style="background: url(/themes/index/public/assets/images/default/navbg.png);">
    <div class="layui-logo"><img src="/themes/index/public/assets/images/default/logo.png" alt=""></div>
    <div class="layui-side-scroll">
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item"><a href="<?php echo url('portal/msg/kanban'); ?>"><img src="/themes/index/public/assets/images/default/icon_kb.png"
              alt="">招聘大看板 <span class="jian">></span></a></li>
        <li class="layui-nav-item layui-nav-itemed layui-this"><a href="<?php echo url('portal/Scheduling/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_pq.png"
              alt=""> 排期管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item  "><a href="<?php echo url('portal/confer/index'); ?>"><img
              src="/themes/index/public/assets/images/default/icon_hc.png" alt=""> 会场管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="/sch_position"><img src="/themes/index/public/assets/images/default/icon_zw.png"
              alt=""> 职位管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/resume/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_jl.png"
              alt=""> 简历管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/Sturole/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_js.png"
              alt=""> 角色管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/Sturole/pindex'); ?>"><img src="/themes/index/public/assets/images/default/icon_ry.png"
              alt=""> 人员管理 <span class="jian">></span></a></li>
      </ul>
    </div>
  </div>

        <!-- 主体部分 -->
        <div class="layui-body">
            <div class="RightBody">
                <div class="tz">
                    <div class="tz-h">消息通知</div>
                    <div class="tz-list">
                        <a href=""><i class="layui-badge-dot"></i><span class="tz-xx">北京XXX公司8月招聘专场确定开始日期 8月29日
                                13:00</span><span class="tz-t">09/25 10:54</span></a>
                        <a href=""><i class="layui-badge-dot"></i><span class="tz-xx">北京XXX公司8月招聘专场确定开始日期 8月29日
                                13:00</span><span class="tz-t">09/25 10:54</span></a>
                        <a href=""><i class="layui-badge-dot"></i><span class="tz-xx">北京XXX公司8月招聘专场确定开始日期 8月29日
                                13:00</span><span class="tz-t">09/25 10:54</span></a>
                        <a href=""><i class="layui-badge-dot"></i><span class="tz-xx">北京XXX公司8月招聘专场确定开始日期 8月29日
                                13:00</span><span class="tz-t">09/25 10:54</span></a>
                        <a href=""><i class="layui-badge-dot"></i><span class="tz-xx">北京XXX公司8月招聘专场确定开始日期 8月29日
                                13:00</span><span class="tz-t">09/25 10:54</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    
</body>

</html>