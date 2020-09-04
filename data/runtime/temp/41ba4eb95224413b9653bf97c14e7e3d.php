<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:35:"themes/index/portal\list_hezuo.html";i:1563355698;s:68:"E:\phpStudy\PHPTutorial\WWW\xsj\public\themes\index\public\base.html";i:1543484706;s:68:"E:\phpStudy\PHPTutorial\WWW\xsj\public\themes\index\public\head.html";i:1563266601;s:75:"E:\phpStudy\PHPTutorial\WWW\xsj\public\themes\index\public\header_list.html";i:1563325023;s:70:"E:\phpStudy\PHPTutorial\WWW\xsj\public\themes\index\public\banner.html";i:1563354765;s:70:"E:\phpStudy\PHPTutorial\WWW\xsj\public\themes\index\public\footer.html";i:1563267248;}*/ ?>
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
      
    
<header class="header2">
  <div class="header-top headerTop">
    <div class="container clearfix">
      <div class="fl logo">
        <img src="/themes/index/public/assets/images/default/logo1.png">
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
          <a href=""><img src="/themes/index/public/assets/images/default/zh.png"></a>
          <a href=""><img src="/themes/index/public/assets/images/default/en.png"></a>
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
        <li><a href="">首页</a></li>
        <li><a href="">关于我们</a></li>
        <li><a href="">新闻中心</a></li>
        <li><a href="">产品展示</a></li>
        <li><a href="">服务与支持</a></li>
        <li><a href="">合作伙伴</a></li>
        <li><a href="">联系我们</a></li>
        <li><a href="">加入我们</a></li>
      </ul>
    </div>
  </div>
</header>

      <!-- banner 区域 -->
      <!--content 内容区域  -->
      

<div data-scroll-reveal="enter bottom" class="banner">
  <?php if($category['id']==11|| $category['id']==12): $cat_image=get_cat_info(2)['more'];$thumb=json_decode($cat_image,true); ?>
         <img src="<?php echo cmf_get_image_url($thumb['thumbnail']); ?>">
         <img src="<?php echo cmf_get_image_url($thumb['thumbnail_m']); ?>">
  <?php elseif($category['id']==8): $cat_image=get_cat_info(1)['more'];$thumb=json_decode($cat_image,true); ?>
      <img src="<?php echo cmf_get_image_url($thumb['thumbnail']); ?>">
      <img src="<?php echo cmf_get_image_url($thumb['thumbnail_m']); ?>">
   <?php elseif($category['id']==22 || $category['id']==23 || $category['id']==24): $cat_image=get_cat_info(4)['more'];$thumb=json_decode($cat_image,true); ?>
      <img src="<?php echo cmf_get_image_url($thumb['thumbnail']); ?>">
      <img src="<?php echo cmf_get_image_url($thumb['thumbnail_m']); ?>">
   <?php elseif($category['id']==13 || $category['id']==14 || $category['id']==15 || $category['id']==16 || $category['id']==17 || $category['id']==18 || $category['id']==19  || $category['id']==20 || $category['id']==21): $cat_image=get_cat_info(3)['more'];$thumb=json_decode($cat_image,true); ?>
      <img src="<?php echo cmf_get_image_url($thumb['thumbnail']); ?>">
      <img src="<?php echo cmf_get_image_url($thumb['thumbnail_m']); ?>">
    <?php else: $cat_image=get_cat_info($category['id'])['more'];$thumb=json_decode($cat_image,true); ?>
     <img src="<?php echo cmf_get_image_url($thumb['thumbnail']); ?>">
     <img src="<?php echo cmf_get_image_url($thumb['thumbnail_m']); ?>">
  <?php endif; ?>
        </div>


<div class="hezuo" style="background-image: url(/themes/index/public/assets/images/default/chanpin_bg.jpg); background-repeat: no-repeat;">
    <div class="container">
        <div data-scroll-reveal="enter left" class="biaoti" data-scroll-reveal="enter top">
            <h2><?php echo $category['name']; ?></h2>
        </div>
        <div class="clearfix" data-scroll-reveal="enter right">
            <?php 
                $where=[
                'post.create_time'=>['egt',0]
                ];
             $articles_data = \app\portal\service\ApiService::articles([
    'field'   => '',
    'where'   => $where,
    'limit'   => '',
    'order'   => 'post.published_time DESC',
    'page'    => '6',
    'relation'=> 'categories',
    'category_ids'=>$category['id']
]);

$__PAGE_VAR_NAME__ = isset($articles_data['page'])?$articles_data['page']:'';

 if(is_array($articles_data['articles']) || $articles_data['articles'] instanceof \think\Collection || $articles_data['articles'] instanceof \think\Paginator): $i = 0; $__LIST__ = $articles_data['articles'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if(is_array($vo['more']['photos']) || $vo['more']['photos'] instanceof \think\Collection || $vo['more']['photos'] instanceof \think\Paginator): if( count($vo['more']['photos'])==0 ) : echo "" ;else: foreach($vo['more']['photos'] as $key=>$vo): ?>
            <div data-scroll-reveal="enter top" class="fl">
                <img src="<?php echo cmf_get_image_url($vo['url']); ?>">
            </div>
            <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </div>
</div>




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