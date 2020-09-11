<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:43:"themes/index/portal\sch_position\index.html";i:1599724443;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\base.html";i:1599651498;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\head.html";i:1599698875;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left.html";i:1599724443;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\footer.html";i:1599439177;}*/ ?>
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
      
        <div class="layui-body">
            <div class="RightBody">
                <div class="sousuo">
                    <form class="layui-form" action="" method="post">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">搜索：</label>
                                <div class="layui-input-inline" style="width: 240px;">
                                    <input type="text" name="name" autocomplete="off" class="layui-input" value="<?php echo $title; ?>">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">日期：</label>
                                <div class="layui-input-inline" style="width: 200px;">
                                    <input id="timestart-zw" type="text" name="price_min" placeholder="开始时间" autocomplete="off"
                                        class="layui-input"  value="<?php echo $price_min; ?>">
                                </div>
                                <div class="layui-form-mid">-</div>
                                <div class="layui-input-inline" style="width: 200px;">
                                    <input id="timeend-zw" type="text" name="price_max" placeholder="结束时间" autocomplete="off"
                                        class="layui-input"  value="<?php echo $price_max; ?>">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">状态：</label>
                                <div class="layui-input-block" style="width: 100px;">
                                    <select name="status" lay-verify="">
                                        <option value="0">全部</option>
                                        <option value="1">发布</option>
                                        <option value="2">未发布</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit lay-filter="formDemo">搜索</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div id="table" lay-filter="table">
                    <table class="layui-table" lay-skin="line">
                        <thead>
                            <tr>
                                <th>公司名称</th>
                                <th>招聘人数</th>
                                <th>职位</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): 
                                $arr = array();
                                $ress=get_schnum($vo['uid']);
                                $num=get_countsch($vo['uid']);
                                foreach($ress as $k=>$v)
                                {
                                $arr[] = $v['title'];
                                }
                                $str = implode('、',$arr);
                             ?>
                            <tr>
                                <td>
                                    <p><?php echo $vo['ent_name']; ?></p>
                                </td>
                                <td>
                                    <p><?php echo $num; ?>人</p>
                                </td>
                                <td>
                                    <p><?php echo $str; ?></p>
                                </td>
                                <td><button class="layui-btn btn-xq"><a href="<?php echo url('portal/sch_position/article',array('id'=>$vo['uid'])); ?>">详情</a></button></td>
                            </tr>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                         
                        </tbody>
                    </table>
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
