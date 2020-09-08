<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:41:"themes/index/portal\scheduling\index.html";i:1599556559;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left.html";i:1599556636;}*/ ?>

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
        <!-- 头部 -->
        <div class="layui-header">
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;">
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
        <!-- 左侧导航 -->
    

<?php dump($_SERVER['PHP_SELF']);?>
  <div class="layui-side layui-bg-black" style="background: url(/themes/index/public/assets/images/default/navbg.png);">
    <div class="layui-logo"><img src="/themes/index/public/assets/images/default/logo.png" alt=""></div>
    <div class="layui-side-scroll">
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_kb.png"
              alt="">招聘大看板 <span class="jian">></span></a></li>
        <li class="layui-nav-item layui-nav-itemed layui-this"><a href="<?php echo url('portal/Scheduling/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_pq.png"
              alt=""> 排期管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item  "><a href="<?php echo url('portal/confer/index'); ?>"><img
              src="/themes/index/public/assets/images/default/icon_hc.png" alt=""> 会场管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="/sch_position"><img src="/themes/index/public/assets/images/default/icon_zw.png"
              alt=""> 职位管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_jl.png"
              alt=""> 简历管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_js.png"
              alt=""> 角色管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_ry.png"
              alt=""> 人员管理 <span class="jian">></span></a></li>
      </ul>
    </div>
  </div>

        <!-- 主体部分 -->
        <div class="layui-body">
            <div class="RightBody">
                <div class="sousuo">
                    <form class="layui-form" action="" method="">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">搜索：</label>
                                <div class="layui-input-inline" style="width: 240px;">
                                    <input type="text" name="" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">日期：</label>
                                <div class="layui-input-inline" style="width: 200px;">
                                    <input id="timestart-kb" type="text" name="price_min" placeholder="开始时间"
                                        autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid">-</div>
                                <div class="layui-input-inline" style="width: 200px;">
                                    <input id="timeend-kb" type="text" name="price_max" placeholder="结束时间"
                                        autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">招聘人数：</label>
                                <div class="layui-input-inline" style="width: 50px;">
                                    <input type="text" name="price_min" placeholder="0" autocomplete="off"
                                        class="layui-input">
                                </div>
                                <div class="layui-form-mid">-</div>
                                <div class="layui-input-inline" style="width: 50px;">
                                    <input type="text" name="price_max" placeholder="50" autocomplete="off"
                                        class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit lay-filter="formDemo">搜索</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="pq">
                    <div class="title">
                        <p>状态 <a class="checktitle" href="">全部</a><a href="">已关联</a><a href="">未关联</a><a href="">已失效</a>
                        </p>
                    </div>
                    <div class="list">
                        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                            <div class="box">
                                <div class="box-title"><a href="<?php echo url('portal/scheduling/article',array('id'=>$vo['id'])); ?>"><?php echo $vo['title']; ?></a></div>
                                <div class="box-xx">
                                    <p>备选日期：
                                        <?php 
                                            $res=json_decode($vo['alt_time'],true);
                                         if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v): ?>
                                            <span><?php echo date("m月d日 H:i",$v); ?></span> 
                                            
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                       
                                    </p>
                                    <p>关联日期：<span>8月28日 13：00</span></p>
                                    <p>招聘人数：<span><?php echo $vo['num']; ?>人</span></p>
                                    <p>招聘职位：
                                        <span class="over"><?php if(is_array($vo['pos_ids']) || $vo['pos_ids'] instanceof \think\Collection || $vo['pos_ids'] instanceof \think\Paginator): if( count($vo['pos_ids'])==0 ) : echo "" ;else: foreach($vo['pos_ids'] as $key=>$v): ?>
                                        
                                            <?php echo get_zhiwei_name($v['pos_id']);endforeach; endif; else: echo "" ;endif; ?></span>
                                    </p>
                                    <p>预约人数：<span><?php echo $vo['app_num']; ?>人</span></p>
                                    <p>投递简历：<span>5份</span></p>
                                    <div>
                                        <?php if($vo['status']==1): ?>
                                            <button class="layui-btn btn-gl">关联</button>
                                         <?php elseif($vo['status']==2): ?> 
                                            <button class="layui-btn btn-ygl">已关联</button>
                                        <?php else: ?>
                                        <button class="layui-btn btn-ysx">已失效</button>
                                         <?php endif; ?>      
                                       
                                    </div>
                                </div>
                            </div>


                        <?php endforeach; endif; else: echo "" ;endif; ?>

                        
                   
                     
                   
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>