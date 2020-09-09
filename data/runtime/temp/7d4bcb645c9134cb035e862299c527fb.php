<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:42:"themes/index/portal\entfair\fair_desc.html";i:1599652527;s:68:"D:\phpstudy_pro\WWW\zhaopin\public\themes\index\public\base_ent.html";i:1599651969;s:68:"D:\phpstudy_pro\WWW\zhaopin\public\themes\index\public\head_ent.html";i:1599651573;s:72:"D:\phpstudy_pro\WWW\zhaopin\public\themes\index\public\con_left_ent.html";i:1599652315;s:66:"D:\phpstudy_pro\WWW\zhaopin\public\themes\index\public\footer.html";i:1599285135;}*/ ?>
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

      <!-- 头部  导航 -->
      
        

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
              <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_jl.png" alt=""> 简历管理 <span
                          class="jian">></span></a></li>
              <li class="layui-nav-item layui-nav-itemed layui-this"><a href="<?php echo cmf_url('entposition/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_zw.png" alt=""> 职位管理 <span
                          class="jian">></span></a></li>
              <li class="layui-nav-item"><a href="<?php echo cmf_url('entfair/index'); ?>"><img
                          src="/themes/index/public/assets/images/default/icon_zph.png" alt=""> 招聘会管理 <span class="jian">></span></a></li>
              <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_js.png" alt=""> 角色管理 <span
                          class="jian">></span></a></li>
              <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_ry.png" alt=""> 人员管理 <span
                          class="jian">></span></a></li>
          </ul>
      </div>
  </div>

      
      <!-- banner 区域 -->
      <!--content 内容区域  -->
      
        <div class="layui-body">
            <div class="RightBody">
                <div class="xq-title layui-clear">
                    <div class="xq-h">应届生招聘</div>
                    <div class="riqi">
                        <i>【备选日期】
                            <?php if(is_array($res['alt_time']) || $res['alt_time'] instanceof \think\Collection || $res['alt_time'] instanceof \think\Paginator): if( count($res['alt_time'])==0 ) : echo "" ;else: foreach($res['alt_time'] as $key=>$vo): ?>
                            <span><?php echo date("m/d H:i","$vo"); ?></span>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                            
                        <i>【截止日期】<span><?php echo date("m/d H:i",$res['dea_time']); ?></span></i>
                        <i>【创建日期】<span><?php echo date("m/d H:i",$res['add_time']); ?></span></i>
                        <br>
                        <i>【招聘人数】<span><?php echo $res['num']; ?>人</span> <span>预约人数：<?php echo $res['app_num']; ?>人</span></i>
                    </div>
                    <div class="btns">
                        <button class="layui-btn">发布通知</button>
                        <button class="layui-btn"><a href="">进入直播</a></button>
                        <button class="layui-btn btn-shanchu">删除</button>
                    </div>
                </div>
                <div class="xx">
                    <div class="xx-title">
                        <a class="check" href="">招聘职位</a><a href="">关联学校<?php echo $stunum; ?></a>
                    </div>
                    <div class="xx-list">
                        <div class="xx-box">
                            <?php if(is_array($pos) || $pos instanceof \think\Collection || $pos instanceof \think\Paginator): if( count($pos)==0 ) : echo "" ;else: foreach($pos as $key=>$vo): ?>
                            <div class="xx-box-h"><?php echo $vo['title']; ?></div>
                            <div class="xx-box-m">
                                <i>【建议专业】<span><?php echo $vo['major']; ?></span></i>
                                <i>【招聘人数】<span><?php echo $vo['num']; ?>人</span></i>
                                <i>【薪资范围】<span><?php echo $vo['salary_min']; ?>~<?php echo $vo['salary_max']; ?></span></i>
                                <i>【有效期】<span><?php echo date('Y年m月d日',$vo['effective_time']); ?></span></i>
                            </div>
                            <div class="xx-box-yq">
                                <b>职位描述</b>
                                <?php echo $vo['desc']; ?>
                            </div>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
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
