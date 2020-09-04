<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:35:"themes/index/portal\list_about.html";i:1599199034;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\base.html";i:1599199035;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\head.html";i:1599199035;s:79:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\header_list.html";i:1599199035;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\banner.html";i:1599199035;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\footer.html";i:1599199035;}*/ ?>
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


<div class="about-top" style="background-image: url(/themes/index/public/assets/images/default/about_top_bg.jpg); background-repeat: no-repeat;">
    <div class="container">
        <div data-scroll-reveal="enter left" class="top">
            <h2>北京永创合利体育发展有限<span>公司简介</span></h2>
            <span class="span"></span>
            <?php $content=get_cat_info(8)['description'];
            
                $array=explode(PHP_EOL,$content);
                $con=implode('<br />',$array);
             ?>
            <p><?php echo $con; ?></p>
        </div>
        <div class="bottom box clearfix">
<?php 
    $n=1;
    $where=[
    'post.create_time'=>['egt',0]
    ];
 $articles_data = \app\portal\service\ApiService::articles([
    'field'   => '',
    'where'   => $where,
    'limit'   => '',
    'order'   => 'post.published_time DESC',
    'page'    => '3',
    'relation'=> 'categories',
    'category_ids'=>$category['id']
]);

$__PAGE_VAR_NAME__ = isset($articles_data['page'])?$articles_data['page']:'';

 if(is_array($articles_data['articles']) || $articles_data['articles'] instanceof \think\Collection || $articles_data['articles'] instanceof \think\Paginator): $i = 0; $__LIST__ = $articles_data['articles'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if($vo['id']==14): else: if($n%2==0): ?>
        <div class="fl">
            <div class="text">
                <p><?php echo $vo['post_content']; ?>
                </p>
            </div>
            <div class="img">
                <img src="<?php echo cmf_get_image_url($vo['more']['thumbnail']); ?>">
            </div>
        </div>
        <?php else: ?>
            <div class="fl">
                <div class="img">
                    <img src="<?php echo cmf_get_image_url($vo['more']['thumbnail']); ?>">
                </div>
                <div class="text">
                    <p><?php echo $vo['post_content']; ?>   </p>
                </div>
            </div>
          <?php endif; endif; $n++;endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </div>
</div>
<?php $content=get_cat_info(9)['description'];
$info=get_cat_info(9)['more'];$image=json_decode($info,true);
?>

<div data-scroll-reveal="enter left" class="linian clearfix">
    <div class="fl">
        <img src="<?php echo cmf_get_image_url($image['thumbnail']); ?>">
    </div>
    <div class="fr">
        <h3>公司理念</h3>
        <?php 
        
            $array=explode(PHP_EOL,$content);
            $con=implode('<br />',$array);
         ?>
        <p><?php echo $con; ?></p>  </div>
</div>

<div class="about-bottom" style="background-image: url(/themes/index/public/assets/images/default/about_bottom_bg.jpg); background-repeat: no-repeat;">
    <div class="container">
        <div data-scroll-reveal="enter right" class="top">
            <h2>公司<span>业绩</span></h2>
            <span class="span"></span>

            <?php $content=get_cat_info(10)['description'];
            
                $array=explode(PHP_EOL,$content);
                $con=implode('<br />',$array);
             ?>
            <p><?php echo $con; ?></p>
        </div>
        <div data-scroll-reveal="enter left" class="bottom box">
            <h3>2017年羽毛球比赛</h3>
            <div class="clearfix ming">
                <div class="fl xu">序号</div>
                <div class="fl bi">比赛名称</div>
                <div class="fl shi">比赛时间</div>
                <div class="fl di">比赛地点</div>
            </div>
            <div class="clearfix">
                <div class="fl xu">1</div>
                <div class="fl bi">全国少年乙组羽毛球比赛</div>
                <div class="fl shi">4.8-4.15</div>
                <div class="fl di">河北迁安</div>
            </div>
            <div class="clearfix">
                <div class="fl xu">2</div>
                <div class="fl bi">全国青年羽毛球锦标赛</div>
                <div class="fl shi">5.5-5.19</div>
                <div class="fl di">安徽铜陵</div>
            </div>
            <div class="clearfix">
                <div class="fl xu">3</div>
                <div class="fl bi">全国青少年羽毛球分站赛（淮北站）</div>
                <div class="fl shi">6.6-6.15</div>
                <div class="fl di">安徽淮北</div>
            </div>
            <div class="clearfix">
                <div class="fl xu">4</div>
                <div class="fl bi">十三届全运会羽毛球资格赛</div>
                <div class="fl shi">6.15-7.11</div>
                <div class="fl di">广东佛山</div>
            </div>
            <div class="clearfix">
                <div class="fl xu">5</div>
                <div class="fl bi">第十三届运动会羽毛球比赛</div>
                <div class="fl shi">8.26-9.8</div>
                <div class="fl di">天津宝坻区体育馆</div>
            </div>
            <div class="clearfix">
                <div class="fl xu">6</div>
                <div class="fl bi">全国少年甲组羽毛球比赛</div>
                <div class="fl shi">9.13-9.21</div>
                <div class="fl di">江西瑞昌</div>
            </div>
            <div class="clearfix">
                <div class="fl xu">7</div>
                <div class="fl bi">全国青少年分站赛（宁波站）</div>
                <div class="fl shi">10.15-10.24</div>
                <div class="fl di">浙江宁波</div>
            </div>
            <div class="clearfix">
                <div class="fl xu">8</div>
                <div class="fl bi">全国羽毛球冠军赛</div>
                <div class="fl shi">10.28-11.10</div>
                <div class="fl di">广东佛山</div>
            </div>
        </div>
        <a data-scroll-reveal="enter right" class="geng box" href=""
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
