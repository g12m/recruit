<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:42:"themes/index/portal\entfair\fair_desc.html";i:1599398884;}*/ ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta name='renderer' content='webkit'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
    <title></title>
</head>
<link rel="stylesheet" href="/themes/index/public/assets/layui/css/layui.css">
<link rel='stylesheet' href='/themes/index/public/assets/css/index.css'>
<script src='/themes/index/public/assets/js/jquery-1.11.3.min.js'></script>
<script src='/themes/index/public/assets/layui/layui.all.js'></script>
<script src='/themes/index/public/assets/js/SuperSlide.js'></script>
<script src='/themes/index/public/assets/js/index.js'></script>

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
                    <a href="javascript:;"><?php echo $user_info['name']; ?></a>
                    <dl class="layui-nav-child">
                        <dd><a href="<?php echo cmf_url('user/adminuser/logout',['uid'=>$user_info['id'],'type'=>$user_info['type']]); ?>">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!-- 左侧导航 -->
        <div class="layui-side layui-bg-black" style="background: url(/themes/index/public/assets/images/navbg.png);">
            <div class="layui-logo"><img src="/themes/index/public/assets/images/logo.png" alt=""></div>
            <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
                    <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/icon_jl.png" alt=""> 简历管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/icon_zw.png" alt=""> 职位管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item layui-nav-itemed layui-this"><a href="javascript:;"><img
                                src="/themes/index/public/assets/images/icon_zph.png" alt=""> 招聘会管理 <span class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/icon_js.png" alt=""> 角色管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img src="/themes/index/public/assets/images/icon_ry.png" alt=""> 人员管理 <span
                                class="jian">></span></a></li>
                </ul>
            </div>
        </div>
        <!-- 主体部分 -->
        <div class="layui-body">
            <div class="RightBody">
                <div class="xq-title layui-clear">
                    <div class="xq-h">应届生招聘</div>
                    <div class="riqi">
                        <i>【备选日期】
                            <?php if(is_array($res['alt_time']) || $res['alt_time'] instanceof \think\Collection || $res['alt_time'] instanceof \think\Paginator): if( count($res['alt_time'])==0 ) : echo "" ;else: foreach($res['alt_time'] as $key=>$vo): ?>
                            <span><?php echo date("m/d H:i","$vo"); ?></span>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                            
                        <i>【截止日期】<span><?php echo date("m/d H:i",$res['dea_time']); ?></span></i>
                        <i>【关联日期】<span>8/27 14:23</span></i>
                        <br>
                        <i>【招聘人数】<span><?php echo $res['num']; ?>人</span> <span>预约人数：<?php echo $res['app_num']; ?>人</span></i>
                    </div>
                    <div class="btns">
                        <button class="layui-btn">发布通知</button>
                        <button class="layui-btn"><a href="">进入直播</a></button>
                        <button class="layui-btn btn-shanchu">删除</button>
                    </div>
                </div>
                <div class="xx">
                    <div class="xx-title">
                        <a class="check" href="">招聘职位</a><a href="">关联学校<?php echo $stunum; ?></a>
                    </div>
                    <div class="xx-list">
                        <div class="xx-box">
                            <?php if(is_array($pos) || $pos instanceof \think\Collection || $pos instanceof \think\Paginator): if( count($pos)==0 ) : echo "" ;else: foreach($pos as $key=>$vo): ?>
                            <div class="xx-box-h"><?php echo $vo['title']; ?></div>
                            <div class="xx-box-m">
                                <i>【建议专业】<span><?php echo $vo['major']; ?></span></i>
                                <i>【招聘人数】<span><?php echo $vo['num']; ?>人</span></i>
                                <i>【薪资范围】<span><?php echo $vo['salary_min']; ?>~<?php echo $vo['salary_max']; ?></span></i>
                                <i>【有效期】<span><?php echo date('Y年m月d日',$vo['effective_time']); ?></span></i>
                            </div>
                            <div class="xx-box-yq">
                                <b>职位描述</b>
                                <?php echo $vo['desc']; ?>
                            </div>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>