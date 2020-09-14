<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:43:"themes/index/portal\scheduling\article.html";i:1599961069;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\base.html";i:1599651498;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\head.html";i:1599877169;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left.html";i:1599900750;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\footer.html";i:1599439177;}*/ ?>
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
<script type="text/javascript">
  //全局变量
  var GV = {
    ROOT: "/",
    WEB_ROOT: "/",
    JS_ROOT: "static/js/"
  };
</script>
<script src="/static/js/wind.js"></script>

<body class="layui-layout-body">
  <div class="layui-layout layui-layout-admin">

      <!-- 头部  导航 -->
      
        

<div class="layui-header">
      <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                  <a href="<?php echo url('portal/msg/index'); ?>">
                        <i class="layui-icon layui-icon-notice"></i>
                        <?php $info=get_msg();if($info >= '1'): ?>
                        <span class="layui-badge-dot"></span>
                        <?php endif; ?>
                  </a>
            </li>
            <li class="layui-nav-item">
                  <a href="javascript:;">
                        <?php $user=cmf_get_current_user_id();
                     
                        $uinfo=get_userinfolist();
                     
                              $name=get_user_info($user);
                              $zname=get_users($user);
                        if(!(empty($uinfo) || (($uinfo instanceof \think\Collection || $uinfo instanceof \think\Paginator ) && $uinfo->isEmpty()))): ?>
                        <?php echo $zname; else: ?>

                        <?php echo $name; endif; ?>     
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
        <li class="layui-nav-item" ><a href="<?php echo url('portal/scheduling/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_pq.png"
              alt=""> 排期管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/confer/index'); ?>"><img
              src="/themes/index/public/assets/images/default/icon_hc.png" alt=""> 会场管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/sch_position/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_zw.png"
              alt=""> 职位管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/resume/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_jl.png"
              alt=""> 简历管理 <span class="jian">></span></a></li>
        <?php if(empty($uinfo) || (($uinfo instanceof \think\Collection || $uinfo instanceof \think\Paginator ) && $uinfo->isEmpty())): ?>
        <li class="layui-nav-item"><a href="<?php echo url('portal/sturole/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_js.png"
              alt=""> 角色管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/sturole/pindex'); ?>"><img src="/themes/index/public/assets/images/default/icon_ry.png"
              alt=""> 人员管理 <span class="jian">></span></a></li>
        <?php endif; ?>
      </ul>
      <input type="hidden" id="daohang" value="<?php echo $daohang; ?>">
      <script>
            $(function () {
                  $(".layui-side-scroll ul li").eq($("#daohang").val()).addClass('layui-this')
            })
      </script>
    </div>
  </div>

      
      <!-- banner 区域 -->
      <!--content 内容区域  -->
      
        <!-- 主体部分 -->
        <div class="layui-body">
            <div class="RightBody">
                <div class="xq-title layui-clear m">
                    <?php if(is_array($article) || $article instanceof \think\Collection || $article instanceof \think\Paginator): if( count($article)==0 ) : echo "" ;else: foreach($article as $key=>$vo): ?>
                    
                    <div class="xq-h"><?php echo $vo['title']; ?></div>
                    <div class="riqi">
                       
                        <?php 
                            $res=json_decode($vo['alt_time'],true);
                           
                            $status=get_zpstu($vo['id']);
                         
                         if($status==1): if(empty($confer['fair_time']) || (($confer['fair_time'] instanceof \think\Collection || $confer['fair_time'] instanceof \think\Paginator ) && $confer['fair_time']->isEmpty())): ?>
                        <i>【备选日期】
                            <?php if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v): ?>
                                <span><?php echo date("m/d H:i",$v); ?></span>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </i>
                            <?php else: ?>
                        <i>【开始日期】
                             
                                <span><?php echo date("m/d H:i",$confer['fair_time']); ?></span>
                              
                        </i>
                        <?php endif; else: ?>
                        <i>【备选日期】
                            <?php if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v): ?>
                                <span><?php echo date("m/d H:i",$v); ?></span>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </i>
                        <?php endif; ?>
                        <i>【截止日期】<span><?php echo date("m/d H:i",$vo['dea_time']); ?></span></i>
                        <?php if($status==1): ?>
                        <i>【关联日期】<span><?php echo date("m/d H:i",$confer['time']); ?></span></i>
                        <?php endif; ?>
                        <i>【招聘人数】<span><?php echo $vo['num']; ?>人</span></i>
                        <i>【预约人数】<span><?php echo $vo['app_num']; ?>人</span></i>
                        <i>【投递简历】<span>5份 <?php echo get_userlist_info($vo['uid'])['ent_name'];?></span></i>
                    </div>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    <div class="btns">
                       
                        <?php if($status==1): ?>
                            <button class="layui-btn btn-gl glzph" id="<?php echo $vo['id']; ?>">关联</button>
                            <?php elseif($status==2): ?>
                                <button class="layui-btn qxgl">取消关联</button>
                                <input type="hidden" value="<?php echo $vo['id']; ?>" class="qxyy">
                                <?php else: ?>
                                <!-- <button class="layui-btn btn-gl glzph" id="<?php echo $vo['id']; ?>">关联</button> -->
                                <button class="layui-btn btn-ysx">已失效</button>
                        <?php endif; ?>
                        
                    <button class="layui-btn"><a href="<?php echo url('portal/zhibosch/index',array('id'=>$vo['id'])); ?>" target="_black">进入直播</a></button>
                    </div>
                    <div class="rightlogo">
                        <img src="/themes/index/public/assets/images/default/phone.png" alt="">
                        <div class="right">
                            <p class="rname">企业联系人：<?php echo get_userlist_info($vo['uid'])['user_name'];?></p>
                            <a class="rphone" href="tel:<?php echo get_userlist_info($vo['uid'])['phone'];?>"><?php echo get_userlist_info($vo['uid'])['phone'];?></a>
                        </div>
                    </div>
                </div>
                <div class="pqxq">
                    <div class="xx">
                        <div class="xx-title">
                            <div class="a">招聘职位</div>
                        </div>
                        <div class="xx-list">
                            <?php if(is_array($article) || $article instanceof \think\Collection || $article instanceof \think\Paginator): if( count($article)==0 ) : echo "" ;else: foreach($article as $key=>$vo): if(is_array($vo['pos_ids']) || $vo['pos_ids'] instanceof \think\Collection || $vo['pos_ids'] instanceof \think\Paginator): if( count($vo['pos_ids'])==0 ) : echo "" ;else: foreach($vo['pos_ids'] as $key=>$v): $res=get_zhi_info($v['pos_id']);if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v3): ?>
                            <div class="xx-box">
                                <div class="xx-box-h"><?php echo $v3['title']; ?></div>
                                <div class="xx-box-m">
                                    <i>【建议专业】<span><?php echo $v3['major']; ?></span></i>
                                    <i>【招聘人数】<span><?php echo $v3['num']; ?>人</span></i>
                                    <i>【职位类型】<span><?php echo $v3['type']==1?"正式":"实习"?></span></i>
                                    <i>【薪资范围】<span><?php echo $v3['salary_min']; ?>~<?php echo $v3['salary_max']; ?></span></i>
                                    <i>【有效期】<span><?php echo date("Y年m月d日",$v3['effective_time']); ?></span></i>
                                </div>
                                <div class="xx-box-yq">
                                    <b>职位描述</b>
                                    <p><?php echo $v3['desc']; ?></p>
                                  
                                </div>
                            </div>
                            <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <div class="right-xx">
                        <div class="rxx-h">招聘会直播</div>
                        <img class="ewm" src="/themes/index/public/assets/images/default/ewm.png" alt="">
                        <div class="rxx-p">
                            <?php 
                             $list=get_hui($confer['h_id']);
                            ?>
                          
                            <span class="pl">【地点】<?php echo $list['address']; ?></span>
                            <span class="pr">【容纳人数】<?php echo $list['num']; ?>人</span>
                        </div>
                        <button class="layui-btn btn-qx">微信扫一扫</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="glzph" class="tc">
        <form action="">
            <div class="layui-form-item">
                <span class="layui-form-label">选择时间：</span>
                <div class="layui-input-block alttime">
                    <label for="time1" class="linput check">
                        <input type="radio" name="time" value="2020年09月10日 13:00" id="time1" checked>2020年09月10日 13:00
                    </label>
                </div>
            </div>
            <p style="font-size:14px;color:#707070;font-weight: 100;">以上为企业备选时间，请关联后与企业相关负责人联系，确定最终时间</p>
            <div class="layui-btn btn-qx qx">取消</div>
            <div class="layui-btn next">下一步</div>
        </form>
    </div>
    <div id="next" class="tc">
        <form action="">
            <table class="layui-table" lay-skin="line">
                <thead>
                    <tr>
                        <th>地点</th>
                        <th>容纳人数</th>
                    </tr>
                </thead>
                <tbody class="hcxx">
                    <tr>
                        <td><label for="A101"><input type="radio" name="room" id="A101" value="A101">A101</label></td>
                        <td>30人</td>
                    </tr>
    
                </tbody>
            </table>
            <div class="layui-btn btn-qx prev">上一步</div>
            <button class="layui-btn qr" lay-submit>确定</button>
        </form>
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
