<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:31:"themes/index/portal\\index.html";i:1599199034;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\base.html";i:1599199035;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\head.html";i:1599199035;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\header.html";i:1599199035;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\footer.html";i:1599199035;}*/ ?>
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
</header>
      
      <!-- banner 区域 -->
      <!--content 内容区域  -->
      

<div data-scroll-reveal="enter bottom" class="banner shou">
    <div class="swiper-container">
        <div class="swiper-wrapper">

        <?php
     $__SLIDE_ITEMS__ = \app\admin\service\ApiService::slides(1);
if(is_array($__SLIDE_ITEMS__) || $__SLIDE_ITEMS__ instanceof \think\Collection || $__SLIDE_ITEMS__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__SLIDE_ITEMS__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>

            <div class="swiper-slide">
                <img src="<?php echo cmf_get_image_url($vo['image']); ?>" alt="">
                <img src="<?php echo cmf_get_image_url($vo['image_m']); ?>" alt="">
            </div>
        
<?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </div>
</div>
<div data-scroll-reveal="enter left" class="xitong">
    <div class="jishi">
        <div class="container">
            <?php
$portal_sub_categories_data = \app\portal\service\ApiService::subCategories(4);

 if(is_array($portal_sub_categories_data) || $portal_sub_categories_data instanceof \think\Collection || $portal_sub_categories_data instanceof \think\Paginator): $i = 0; $__LIST__ = $portal_sub_categories_data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>

            <div class="fl">
                <a href="<?php echo cmf_url('portal/List/index',array('id'=>$vo['id'])); ?>">
                    <i class="iconfont shang">&#<?php echo $vo['name_en']; ?>;</i>
                    <h3><?php echo $vo['name']; ?></h3>
                    <?php 
                    
                        $array=explode(PHP_EOL,$vo['description']);
                        $con=implode('<br />',$array);
                     ?>
                    <p><?php echo $con; ?></p>
                    <i class="iconfont xia">&#xe718;</i>
                </a>
            </div>
           
<?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </div>
</div>


<!--公司简介-->
<div class="gongsi">
    <?php $article=\app\portal\service\ApiService::article(14); ?>
    <div class="container clearfix">
        <div class="fr" data-scroll-reveal="enter right">
            <img src="<?php echo cmf_get_image_url($article['more']['thumbnail']); ?>">
        </div>
        <div class="fl" data-scroll-reveal="enter left">
            <h2>公司简介</h2>
            <h3>北京永创合利体育发展有限公司</h3>
        <?php echo $article['post_content']; ?>
            <a class="geng" href="<?php echo cmf_url('portal/List/index',array('id'=>8)); ?>" style="background-image: url(/themes/index/public/assets/images/default/jiantou.jpg)">查看更多</a>
        </div>
    </div>
</div>
<!--产品展示-->
<div class="zhanshi" style="background-image: url(/themes/index/public/assets/images/default/zhanshi.jpg)">
    <div class="container clearfix">
        <div class="fr" data-scroll-reveal="enter bottom">
            <div class="ch_r_1">
                <?php  $info= get_cat_info(3);?>
                <h3><?php echo $info['name']; ?></h3>
                <p><?php echo $info['description']; ?></p>
                <a class="geng" href="<?php echo cmf_url('portal/List/index',array('id'=>13)); ?>" style="background-image: url(/themes/index/public/assets/images/default/jiantou.jpg)">查看更多</a>
            </div>
            <div class="img ch_r_2">
                <img src="/themes/index/public/assets/images/default/chan2.jpg">
            </div>
            <?php  $info18= get_cat_info(18);$image=json_decode($info18['more'],true);?>
            <div class="clearfix ch_r_3">
                <div class="fl">
                    <div class="img">
                        <img src="<?php echo cmf_get_image_url($image['thumbnail']); ?>">
                    </div>
                </div>
                <div class="fr">
                    <a href="<?php echo cmf_url('portal/List/index',array('id'=>18)); ?>">
                        <span></span>
                        <h3><?php echo $info18['name']; ?></h3>
                        <i class="iconfont">&#xe718;</i>
                    </a>
                </div>
            </div>
        </div>
        <div class="fl" data-scroll-reveal="enter top">
            <?php  $info13= get_cat_info(13);$image=json_decode($info13['more'],true);?>
            <div class="clearfix ch_l_1">
                <div class="fl">
                    <a href="<?php echo cmf_url('portal/List/index',array('id'=>13)); ?>">
                        <span></span>
                            <h3><?php echo $info13['name']; ?></h3>
                        <i class="iconfont">&#xe718;</i>
                    </a>
                </div>
                <div class="fr">
                    <div class="img">
                        <img src="<?php echo cmf_get_image_url($image['thumbnail']); ?>">
                    </div>
                </div>
            </div>
            <?php  
            $info15= get_cat_info(15);
            $info17= get_cat_info(17);

            $image15=json_decode($info15['more'],true);
            $image17=json_decode($info17['more'],true);
            ?>
            <div class="clearfix ch_l_2">
                <div class="fl">
                    <div class="img">
                        <img src="<?php echo cmf_get_image_url($image17['thumbnail']); ?>">
                    </div>
                </div>
                <div class="fr">
                    <a href="<?php echo cmf_url('portal/List/index',array('id'=>15)); ?>">
                        <span></span>
                        <h3><?php echo $info15['name']; ?></h3>
                        <i class="iconfont">&#xe718;</i>
                    </a>
                </div>
            </div>
          
            <div class="clearfix ch_l_3">
                <div class="fl">
                    <a href="<?php echo cmf_url('portal/List/index',array('id'=>17)); ?>">
                        <span></span>
                        <h3><?php echo $info17['name']; ?></h3>
                        <i class="iconfont">&#xe718;</i>
                    </a>
                </div>
                <div class="fr">
                    <div class="img">
                        <img src="<?php echo cmf_get_image_url($image15['thumbnail']); ?>">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--新闻中心-->
<div class="xinwen">
    <div class="container">
        <div class="biaoti" data-scroll-reveal="enter top">
            <h2>新闻中心</h2>
            <span></span>
        </div>
        <div class="clearfix" data-scroll-reveal="enter left">
            <?php
$articles_data = \app\portal\service\ApiService::articlesPosition([
  'field'   => '',
  'where'   => "",
  'limit'   => '',
  'order'   => 'listorder DESC',
  'position_id'=>'1'
]);
if(is_array($articles_data['articles']) || $articles_data['articles'] instanceof \think\Collection || $articles_data['articles'] instanceof \think\Paginator): $i = 0; $__LIST__ = $articles_data['articles'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>

            <div class="fl">
                <a href="<?php echo cmf_url('portal/Article/index',array('id'=>$vo['id'],'cid'=>$vo['category_id'])); ?>">
                    <h2><?php echo date("m-d",$vo['published_time']); ?></h2>
                    <h3><?php echo $vo['post_title']; ?></h3>
                    <span></span>
                    <p><?php echo $vo['post_excerpt']; ?></p>
                    <i class="iconfont">&#xe718;</i>
                </a>
            </div>
        
<?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
        <a data-scroll-reveal="enter right" class="geng" href="<?php echo cmf_url('portal/List/index',array('id'=>11)); ?>"
            style="background-image: url(/themes/index/public/assets/images/default/jiantou.jpg)">查看更多</a>
    </div>
</div>

<!--合作伙伴-->
<div class="hezuo">
    <div class="container">
        <div class="biaoti" data-scroll-reveal="enter top">
            <h2>合作伙伴</h2>
            <span></span>
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
    'category_ids'=>'5'
]);

$__PAGE_VAR_NAME__ = isset($articles_data['page'])?$articles_data['page']:'';

 if(is_array($articles_data['articles']) || $articles_data['articles'] instanceof \think\Collection || $articles_data['articles'] instanceof \think\Paginator): $i = 0; $__LIST__ = $articles_data['articles'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if(is_array($vo['more']['photos']) || $vo['more']['photos'] instanceof \think\Collection || $vo['more']['photos'] instanceof \think\Paginator): if( count($vo['more']['photos'])==0 ) : echo "" ;else: foreach($vo['more']['photos'] as $key=>$vo): ?>
                    <div  class="fl">
                        <img src="<?php echo cmf_get_image_url($vo['url']); ?>">
                    </div>
                <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>

        </div>
        <a data-scroll-reveal="enter left" class="geng" href="<?php echo cmf_url('portal/List/index',array('id'=>5)); ?>"
            style="background-image: url(/themes/index/public/assets/images/default/jiantou.jpg)">查看更多</a>
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
