<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:34:"themes/index/portal\msg\index.html";i:1599875293;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\base.html";i:1599651498;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\head.html";i:1599877169;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left.html";i:1599831015;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\footer.html";i:1599439177;}*/ ?>
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
<script type="text/javascript">
  //全局变量
  var GV = {
    ROOT: "/",
    WEB_ROOT: "/",
    JS_ROOT: "static/js/"
  };
</script>
<script src="/static/js/wind.js"></script>

<body class="layui-layout-body">
  <div class="layui-layout layui-layout-admin">

      <!-- 头部  导航 -->
      
        

<div class="layui-header">
      <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                  <a href="<?php echo url('portal/msg/index'); ?>">
                        <i class="layui-icon layui-icon-notice"></i>
                        <?php $info=get_msg();if($info >= '1'): ?>
                        <span class="layui-badge-dot"></span>
                        <?php endif; ?>
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



<?php echo $url=$_SERVER['REQUEST_URI'];?>
  <div class="layui-side layui-bg-black" style="background: url(/themes/index/public/assets/images/default/navbg.png);">
    <div class="layui-logo"><img src="/themes/index/public/assets/images/default/logo.png" alt=""></div>
    <div class="layui-side-scroll">
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item"><a href="<?php echo url('portal/msg/kanban'); ?>"><img src="/themes/index/public/assets/images/default/icon_kb.png"
              alt="">招聘大看板 <span class="jian">></span></a></li>
        <li class="layui-nav-item" ><a href="<?php echo url('portal/scheduling/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_pq.png"
              alt=""> 排期管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/confer/index'); ?>"><img
              src="/themes/index/public/assets/images/default/icon_hc.png" alt=""> 会场管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/sch_position/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_zw.png"
              alt=""> 职位管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/resume/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_jl.png"
              alt=""> 简历管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/sturole/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_js.png"
              alt=""> 角色管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/sturole/pindex'); ?>"><img src="/themes/index/public/assets/images/default/icon_ry.png"
              alt=""> 人员管理 <span class="jian">></span></a></li>
      </ul>
      <input type="hidden" id="daohang" value="<?php echo $daohang; ?>">
      <script>
            $(function () {
                  $(".layui-side-scroll ul li").eq($("#daohang").val()).addClass('layui-this')
            })
      </script>
    </div>
  </div>

      
      <!-- banner 区域 -->
      <!--content 内容区域  -->
      
        <!-- 主体部分 -->
        <div class="layui-body">
            <div class="RightBody">
                <div class="tz">
                    <div class="tz-h">消息通知</div>
                    <div class="tz-list">
                            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                        <a href="<?php echo url('portal/scheduling/article',array('id'=>$vo['to_id'])); ?>">
                                <?php if($vo['status']==1): ?>
                                <i class="layui-badge-dot"></i>
                                <?php endif; ?>
                                <span class="tz-xx"><?php echo $vo['title']; ?>
                             </span><span class="tz-t"><?php echo date("m/d H:i",$vo['cre_time']); ?></span></a>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

      <!--footer 底部  -->
      <!-- 
          
    <footer>
        <div class="footer-top">
            <div class="container clearfix">
                <div class="fl clearfix" data-scroll-reveal="enter top">
                    <div class="fl">
                        <i class="iconfont">&#xe60b;</i>
                    </div>
                    <div class="fl">
                        <h3>ADDRESS</h3>
                        <div class="lian">公司地址：</div>
                        <p><?php echo cmf_get_option('server_settings')['q_email']; ?></p>
                        <span></span>
                    </div>
                </div>
                <div class="fl clearfix" data-scroll-reveal="enter bottom">
                    <div class="fl">
                        <i class="iconfont">&#xe6f7;</i>
                    </div>
                    <div class="fl">
                        <h3>CONTACT</h3>
                        <div class="lian">联系方式</div>
                        <p><a href="tel:010-87358007"><?php echo cmf_get_option('server_settings')['k_tel']; ?></a><a
                                href="mailto:yongchuang@holy-sport.com">yongchuang@holy-sport.com</a></p>
                        <span></span>
                    </div>
                </div>
                <div class="fr" data-scroll-reveal="enter right">
                    <img src="<?php echo cmf_get_image_url(cmf_get_option('server_settings')['thumbnail']); ?>">
                    <p>扫码关注我们</p>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p><span><?php echo cmf_get_option('server_settings')['q_banquan']; ?></span><?php echo cmf_get_option('site_info')['site_icp']; ?></p>
        </div>
    </footer>
    <div class="go_top">
        <img src="/themes/index/public/assets/images/default/go_top.png">
    </div>
    
    
    <script src="/themes/index/public/assets/js/default/jquery-3.3.1.js"></script>
    <script src="/themes/index/public/assets/css/default/dist/js/swiper.min.js"></script>
    <script src="/themes/index/public/assets/js/default/gundong.js"></script>
    <script>
        var config = {
            after: '0.2s',
            enter: 'bottom',
            move: '30px',
            over: '0.5s',
            easing: 'ease-in-out',
            viewportFactor: 0.33,
            reset: false,
            init: true
        };
        window.scrollReveal = new scrollReveal(config);
    </script>
    <script src="/themes/index/public/assets/js/default/index.js"></script>
    </body>
    
    </html>

       -->
    </body>
</html>
