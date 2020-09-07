<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:37:"themes/index/portal\confer\index.html";i:1599439360;}*/ ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta name='renderer' content='webkit'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
    <title></title>
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
                    <a href="javascript:;">王奇博</a>
                    <dl class="layui-nav-child">
                        <dd><a href="">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!-- 左侧导航 -->
        <div class="layui-side layui-bg-black" style="background: url(/themes/index/public/assets/images/default/navbg.png);">
            <div class="layui-logo"><img src="/themes/index/public/assets/images/default/logo.png" alt=""></div>
            <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
                    <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_kb.png" alt="">招聘大看板 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_pq.png" alt=""> 排期管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item  layui-nav-itemed layui-this"><a href="javascript:;"><img
                                src="/themes/index/public/assets/images/default/icon_hc.png" alt=""> 会场管理 <span class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_zw.png" alt=""> 职位管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_jl.png" alt=""> 简历管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_js.png" alt=""> 角色管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_ry.png" alt=""> 人员管理 <span
                                class="jian">></span></a></li>
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
                                <button class="layui-btn" lay-submit lay-filter="formDemo">搜索</button>
                                <button class="layui-btn btn-shanchu">新建会场</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="hc">
                    <div class="list">
                        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                        <a href="<?php echo url('portal/confer/article',array('id'=>$vo['id'])); ?>" class="box">
                            <div class="box-title"><?php echo $vo['address']; ?></div>
                            <div class="box-xx">
                                <p>容纳人数：<span><?php echo $vo['num']; ?>人</span></p>
                                <p>招聘排期：<span><?php $num=get_pqnum($vo['id']);if(empty($num) || (($num instanceof \think\Collection || $num instanceof \think\Paginator ) && $num->isEmpty())): ?>
                                    无
                                    <?php else: ?>
                                    <?php echo $num; ?>场
                                <?php endif; ?></span></p>
                            </div>
                        </a>
                        <?php endforeach; endif; else: echo "" ;endif; ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>