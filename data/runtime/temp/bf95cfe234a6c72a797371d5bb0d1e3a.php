<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:39:"themes/index/portal\confer\article.html";i:1599650724;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\base.html";i:1599650656;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\head.html";i:1599649383;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left.html";i:1599645493;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\footer.html";i:1599439177;}*/ ?>
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

      
      <!-- banner 区域 -->
      <!--content 内容区域  -->
      
        <!-- 主体部分 -->
        <div class="layui-body">
            <div class="RightBody">
                <div class="xq-title layui-clear">
                    <div class="xq-h"><?php echo $article['address']; ?></div>
                    <div class="riqi">
                        <i>【容纳人数】<span><?php echo $article['num']; ?>人</span></i>
                    </div>
                    <div class="btns">
                        <button class="layui-btn btn-shanchu schc">删除会场</button>
                    </div>
                    <input type="hidden" name="id" value="<?php echo $article['id']; ?>" class="h_id">
                </div>
                <?php if(empty($zp) || (($zp instanceof \think\Collection || $zp instanceof \think\Paginator ) && $zp->isEmpty())): ?>
                    <div class="hcxq">
                        <div class="none">
                            <img src="/themes/index/public/assets/images/default/kong.png" alt="">
                            <p>暂无关联招聘会</p>
                        </div>
                    </div>
                    <?php else: ?>
                    <div class="hcxq">
                        <div class="xx">
                            <div class="xx-title">
                                <div class="a">该会场关联的招聘会</div>
                            </div>
                            <div class="xx-list">


                                <?php if(is_array($zp) || $zp instanceof \think\Collection || $zp instanceof \think\Paginator): if( count($zp)==0 ) : echo "" ;else: foreach($zp as $key=>$vo): $res=get_job($vo['fair_id']);if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v3): ?>
                                        <div class="xx-box">
                                            <div class="xx-box-h"><?php echo $v3['title']; ?></div>
                                            <div class="xx-box-m">
                                                <?php $restime=json_decode($v3['alt_time'],true);?>
                                                <p><i>备选日期：<?php if(is_array($restime) || $restime instanceof \think\Collection || $restime instanceof \think\Paginator): if( count($restime)==0 ) : echo "" ;else: foreach($restime as $key=>$v): ?>
                                                            <span><?php echo date("m-d H:i",$v); ?></span>
                                                        <?php endforeach; endif; else: echo "" ;endif; ?></i></p>
                                                <p><i>关联日期：<span>
                                                            <?php 
                                                                $time=get_zptime($v3['id']);
                                                             ?>
                                                            <?php echo date("m月d日 H:i",$time); ?>
                                                        </span></i></p>
                                                <p><i>招聘人数：<span><?php echo $v3['num']; ?>人</span></i></p>
                                                <p><i>招聘职位：<span>
                                                            <?php if(is_array($v3['pos_ids']) || $v3['pos_ids'] instanceof \think\Collection || $v3['pos_ids'] instanceof \think\Paginator): if( count($v3['pos_ids'])==0 ) : echo "" ;else: foreach($v3['pos_ids'] as $key=>$v): ?>

                                                                <?php echo get_zhiwei_name($v['pos_id']);endforeach; endif; else: echo "" ;endif; ?>
                                                        </span></i></p>
                                                <p><i>预约人数：<span><?php echo $v3['app_num']; ?>人</span></i></p>
                                                <p><i>投递简历：<span>5份</span></i></p>

                                            </div>
                                        </div>
                                    <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>



                            </div>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <div id="schc" class="tc">
        <img src="/themes/index/public/assets/images/default/ku.png" alt="">
        <p>删除该会场后将无法恢复，确认删除吗？</p>
        <button class="layui-btn btn-qx qx">取消</button>
        <button class="layui-btn qr">确认</button>
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
