<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:43:"themes/index/portal\entposition\addpos.html";i:1599724649;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\base_ent.html";i:1599699062;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\head_ent.html";i:1599699062;s:80:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left_ent.html";i:1599802051;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\footer.html";i:1599439177;}*/ ?>
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

<div class="layui-side layui-bg-black" style="background: url(/themes/index/public/assets/images/default/navbg.png);">
      <div class="layui-logo"><img src="/themes/index/public/assets/images/default/logo.png" alt=""></div>
      <div class="layui-side-scroll">
          <ul class="layui-nav layui-nav-tree" lay-filter="test">
              <li class="layui-nav-item"><a href="<?php echo cmf_url('sturesume/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_jl.png" alt=""> 简历管理 <span
                          class="jian">></span></a></li>
              <li class="layui-nav-item layui-nav-itemed"><a href="<?php echo cmf_url('entposition/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_zw.png" alt=""> 职位管理 <span
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
  <input type="hidden" id="daohang" value="<?php echo $daohang; ?>">
  <script>
        $(function(){
            $(".layui-side-scroll ul li").eq($("#daohang").val()).addClass('layui-this')
        })
  </script>

      
      <!-- banner 区域 -->
      <!--content 内容区域  -->
      
        <div class="layui-body">
            <div class="RightBody">
                <div class="zw-xinjian">
                    <div class="xj-h">新建职位</div>
                    <div class="zj-form">
                        <form class="layui-form" action="" method="POST">
                            <div class="layui-form-item">
                                <label class="layui-form-label">职位名称：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="title" required lay-verify="required" placeholder="请输入职位名称"
                                        autocomplete="off" class="layui-input">
                                </div>
                                <label class="layui-form-label">建议专业：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="major" required lay-verify="required" placeholder="请输入建议专业"
                                        autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">招聘人数：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="num" required lay-verify="required" placeholder="请输入招聘人数"
                                        autocomplete="off" class="layui-input">
                                </div>
                                <label class="layui-form-label">薪资范围：</label>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <input type="text" name="salary_min" autocomplete="off" placeholder="最低"
                                        class="layui-input">
                                </div>
                                <div class="layui-form-mid">-</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <input type="text" name="salary_max" autocomplete="off" placeholder="最高"
                                        class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">职位类型：</label>
                                <div class="layui-input-inline">
                                    <select name="type" lay-verify="required">
                                        <option value="1">正式</option>
                                        <option value="2">实习</option>
                                    </select>
                                </div>
                                <label class="layui-form-label">有效期：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="effective_time" required lay-verify="required" autocomplete="off"
                                    <input type="text" id="timestart-zw" name="effective_time" required lay-verify="required" autocomplete="off"
                                        class="layui-input zwyxq">
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">职位描述：</label>
                                <div class="layui-input-block">
                                    <textarea name="desc" placeholder="请输入职位描述" class="layui-textarea"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-submit>保 存</button>
                                </div>
                            </div>
                        </form>
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
