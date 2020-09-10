<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:42:"themes/index/portal\entposition\index.html";i:1599699062;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\base_ent.html";i:1599699062;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\head_ent.html";i:1599699062;s:80:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left_ent.html";i:1599699062;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\footer.html";i:1599439177;}*/ ?>
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
                <div class="sousuo">
                    <form class="layui-form" action="" method="POST">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">搜索：</label>
                                <div class="layui-input-inline" style="width: 240px;">
                                    <input type="text" name="title" autocomplete="off" class="layui-input" value="<?php echo input('request.title'); ?>">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">日期：</label>
                                <div class="layui-input-inline" style="width: 200px;">
                                    <input id="timestart-zw" type="text" name="datetime" placeholder="开始时间"
                                        autocomplete="off" class="layui-input" value="<?php echo input('request.datetime'); ?>">
                                </div>
                                <div class="layui-form-mid">-</div>
                                <div class="layui-input-inline" style="width: 200px;">
                                    <input id="timeend-zw" type="text" name="datetime2" placeholder="结束时间"
                                        autocomplete="off" class="layui-input" value="<?php echo input('request.datetime2'); ?>">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">类型：</label>
                                <div class="layui-input-block" style="width: 100px;">
                                    <select name="type" lay-verify="" id="sele_type">
                                        <option value="0">全部</option>
                                        <option value="1">正式</option>
                                        <option value="2">实习</option>
                                    </select>
                                    <input type="hidden" id="type" value="<?php echo input('request.type'); ?>">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit lay-filter="formDemo">搜索</button>
                                <div class="layui-btn btn-shanchu"><a href="<?php echo cmf_url('addpos'); ?>">新建职位</a></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div id="table" lay-filter="table">
                    <table class="layui-table" lay-skin="line">
                        <thead>
                            <tr>
                                <th>创建时间</th>
                                <th>职位</th>
                                <th>职位类型</th>
                                <th>职位描述</th>
                                <th>薪资</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                            <tr>
                                <td><p><?php echo date('Y年m月d日 H:i',$vo['time']); ?></p></td>
                                <td><p><?php echo $vo['title']; ?></p></td>
                                <td><p>
                                    <?php if($vo['type'] == '1'): ?>正式<?php endif; if($vo['type'] == '2'): ?>实习<?php endif; ?>
                                </p></td>
                                <td><p><?php echo $vo['desc']; ?></p></td>
                                <td><p><?php echo $vo['salary_min']; ?>~<?php echo $vo['salary_max']; ?></p></td>
                                <td><a class="layui-btn btn-xq" href="<?php echo cmf_url('editpos',array('id'=>$vo['id'])); ?>">编辑</a><a class="layui-btn btn-shanchu" href="<?php echo cmf_url('delpos',array('id'=>$vo['id'])); ?>">删除</a></td>
                            </tr>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function(){
           var typeval = $("#type").val();
           if(typeval > 0){
            $("#sele_type").find('option').eq(typeval).attr('selected','selected')
           }
        })
    </script>

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
