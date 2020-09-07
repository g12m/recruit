<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:31:"themes/index/portal\\index.html";i:1599439176;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\base.html";i:1599439177;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\head.html";i:1599439178;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\header.html";i:1599439178;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\footer.html";i:1599439177;}*/ ?>
<!DOCTYPE html>
<html>

  <head>
  
  <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
  <title><?php echo $site_info['site_name']; ?></title>
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta name="keywords" content="<?php echo (isset($category['seo_keywords']) && ($category['seo_keywords'] !== '')?$category['seo_keywords']:$site_info['site_seo_keywords']); ?>">
  <meta name="description" content="<?php echo (isset($category['seo_description']) && ($category['seo_description'] !== '')?$category['seo_description']:$site_info['site_seo_description']); ?>"/>

   
    <link rel="stylesheet" href="/themes/index/public/assets/css/default/dist/css/swiper.min.css" />
    <link rel="stylesheet" type="text/css" href="/themes/index/public/assets/css/default/index.css" />
    <link rel="stylesheet" type="text/css" href="/themes/index/public/assets/css/default/responsive.css" />

  <link rel="stylesheet" type="text/css" href="/themes/index/public/assets/css/default/page.css">

	
<script type="text/javascript">
      //全局变量
      var GV = {
          ROOT: "/",
          WEB_ROOT: "/",
          JS_ROOT: "static/js/"
      };
</script>
<script src="/static/js/wind.js"></script>
</head>


    <body>
      <!-- 头部  导航 -->
      
        <!-- 

<header>
  <div class="header-top">
    <div class="container clearfix">
      <div class="fl logo">
      <a href="/"><img src="/themes/index/public/assets/images/default/logo1.png"></a>
      </div>
      <div class="fr">
        <div class="fl nav">
          <ul class="clearfix">
              <li <?php if(empty($category['id'])): ?>class="fl active"
                <?php else: ?> class="fl"<?php endif; ?>><a href="/">首页</a></li>
              <?php 
                $where=['parent_id'=>0,'id'=>['neq','27']];
                $category['id']=isset($category['id'])? $category['id']:'';
                if(isset($category['id'])){
                $top_catid = cmf_get_top_catid($category['id']);
                }
               $portal_categories_data = \app\portal\service\ApiService::categories([
    'where'   => $where,
    'order'   => 'list_order DESC,id asc',
]);

 if(is_array($portal_categories_data) || $portal_categories_data instanceof \think\Collection || $portal_categories_data instanceof \think\Paginator): $i = 0; $__LIST__ = $portal_categories_data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;$ids=get_cid($vo['id']); ?>
                <li <?php if($top_catid==$vo['id']): ?> class="fl active"
                  <?php else: ?> class="fl"<?php endif; ?>><a <?php if(empty($ids)): ?>href="<?php echo cmf_url('portal/List/index',array('id'=>$vo['id'])); ?>"
                    <?php else: ?>href="<?php echo cmf_url('portal/List/index',array('id'=>$ids)); ?>"<?php endif; ?>><?php echo $vo['name']; ?></a></li>
              
<?php endforeach; endif; else: echo "" ;endif; ?>
        
          </ul>
        </div>
        <div class="fl yu">
          <a href="/"><img src="/themes/index/public/assets/images/default/zh.png"></a>
          <a href="<?php echo cmf_url('portal/index/indexen'); ?>"><img src="/themes/index/public/assets/images/default/en.png"></a>
        </div>
      </div>
    </div>
  </div>
  <div class="header-xiang">
    <div class="xiang-top">
      <div class="container clearfix">
        <div class="fl">
          <img src="/themes/index/public/assets/images/default/logo.png">
        </div>
        <div class="fr">
          <i class="iconfont">&#xe648;</i>
          <i class="iconfont">&#xe600;</i>
        </div>
      </div>
    </div>
    <div class="xiang-bottom">
      <ul>
        <li><a href="/">首页</a></li>
        <?php 
          $where=['parent_id'=>0,'id'=>['neq','27']];
          $category['id']=isset($category['id'])? $category['id']:'';
          if(isset($category['id'])){
          $top_catid = cmf_get_top_catid($category['id']);
          }
         $portal_categories_data = \app\portal\service\ApiService::categories([
    'where'   => $where,
    'order'   => 'list_order DESC,id asc',
]);

 if(is_array($portal_categories_data) || $portal_categories_data instanceof \think\Collection || $portal_categories_data instanceof \think\Paginator): $i = 0; $__LIST__ = $portal_categories_data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;$ids=get_cid($vo['id']); ?>
        <li><a <?php if(empty($ids)): ?>href="<?php echo cmf_url('portal/List/index',array('id'=>$vo['id'])); ?>"
                    <?php else: ?>href="<?php echo cmf_url('portal/List/index',array('id'=>$ids)); ?>"<?php endif; ?>><?php echo $vo['name']; ?></a></li>
         
<?php endforeach; endif; else: echo "" ;endif; ?>
      </ul>
    </div>
  </div>
</header> -->
      
      <!-- banner 区域 -->
      <!--content 内容区域  -->
      


  
      <!--footer 底部  -->
      
          
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

      
    </body>
</html>
