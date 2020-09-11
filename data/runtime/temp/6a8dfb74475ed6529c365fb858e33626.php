<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:45:"themes/index/portal\sch_position\article.html";i:1599724443;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\base.html";i:1599651498;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\head.html";i:1599698875;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left.html";i:1599724443;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\footer.html";i:1599439177;}*/ ?>
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



<?php echo $url=$_SERVER['REQUEST_URI'];?>
  <div class="layui-side layui-bg-black" style="background: url(/themes/index/public/assets/images/default/navbg.png);">
    <div class="layui-logo"><img src="/themes/index/public/assets/images/default/logo.png" alt=""></div>
    <div class="layui-side-scroll">
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item"><a href="<?php echo url('portal/msg/kanban'); ?>"><img src="/themes/index/public/assets/images/default/icon_kb.png"
              alt="">招聘大看板 <span class="jian">></span></a></li>
        <li <?php if($url=="/scheduling"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/scheduling"><img src="/themes/index/public/assets/images/default/icon_pq.png"
              alt=""> 排期管理 <span class="jian">></span></a></li>
        <li <?php if($url=="/confer"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/confer"><img
              src="/themes/index/public/assets/images/default/icon_hc.png" alt=""> 会场管理 <span class="jian">></span></a></li>
        <li <?php if($url=="/sch_position"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/sch_position"><img src="/themes/index/public/assets/images/default/icon_zw.png"
              alt=""> 职位管理 <span class="jian">></span></a></li>
        <li <?php if($url=="/resume"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/resume"><img src="/themes/index/public/assets/images/default/icon_jl.png"
              alt=""> 简历管理 <span class="jian">></span></a></li>
        <li <?php if($url=="/sturole"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/sturole"><img src="/themes/index/public/assets/images/default/icon_js.png"
              alt=""> 角色管理 <span class="jian">></span></a></li>
        <li <?php if($url=="/stu_role"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/stu_role"><img src="/themes/index/public/assets/images/default/icon_ry.png"
              alt=""> 人员管理 <span class="jian">></span></a></li>
      </ul>
    </div>
  </div>

      
      <!-- banner 区域 -->
      <!--content 内容区域  -->
      
        <!-- 主体部分 -->
        <div class="layui-body">
            <div class="RightBody">
                <div class="xq-title layui-clear">
                   
                    <div class="xq-h"><?php echo get_userlist_info($id)['ent_name'];?></div>
                    <div class="riqi">
                        <i>【招聘人数】<span><?php echo $num; ?>人</span></i>
                        <i>【企业联系人】<span><?php echo get_userlist_info($id)['user_name'];?></span></i>
                        <i>【联系电话】<span><?php echo get_userlist_info($id)['phone'];?></span></i>
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
                                        <input type="hidden" name="q_id" value="<?php echo $v3['uid']; ?>" class="q_id">
                                        <input type="hidden" name="sch_id" value="<?php echo $sch_id; ?>" class="sch_id">
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
