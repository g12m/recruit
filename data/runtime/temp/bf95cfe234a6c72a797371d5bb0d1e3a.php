<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"themes/index/portal\confer\article.html";i:1599398480;}*/ ?>
<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <ul>
        
        
            <li>场地：<?php echo $article['address']; ?>--容纳人数<?php echo $article['num']; ?></li>
        
      
    </ul>
    ------------------------------------------------------------------
<table>
    <?php if(empty($zp) || (($zp instanceof \think\Collection || $zp instanceof \think\Paginator ) && $zp->isEmpty())): ?>
        未关联
        <?php else: if(is_array($zp) || $zp instanceof \think\Collection || $zp instanceof \think\Paginator): if( count($zp)==0 ) : echo "" ;else: foreach($zp as $key=>$vo): $res=get_job($vo['fair_id']);if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v3): ?>
                
                <tr>
                    <td>招聘会名称：<?php echo $v3['title']; ?></td>
                    <td>关联日期：
                        <?php 
                            $time=get_zptime($v3['id']);
                         ?>
                        <?php echo date("m月d日 H:i",$time); ?></td>
                <td>招聘人数：<?php echo $v3['num']; ?></td>
                <td>招聘职位：
                    <?php if(is_array($v3['pos_ids']) || $v3['pos_ids'] instanceof \think\Collection || $v3['pos_ids'] instanceof \think\Paginator): if( count($v3['pos_ids'])==0 ) : echo "" ;else: foreach($v3['pos_ids'] as $key=>$v): ?>
                
                        <?php echo get_zhiwei_name($v['pos_id']);endforeach; endif; else: echo "" ;endif; ?>
                </td>
                <?php 
                    $restime=json_decode($v3['alt_time'],true);
                 ?>
                <td>备选日期：
                    <?php if(is_array($restime) || $restime instanceof \think\Collection || $restime instanceof \think\Paginator): if( count($restime)==0 ) : echo "" ;else: foreach($restime as $key=>$v): ?>
                        <?php echo date("m-d H:i",$v); endforeach; endif; else: echo "" ;endif; ?>
                </td>
                <td>开启日期：<?php echo date("m-d H:i",$v3['time']); ?></td>
              
             <td>预约人数：<?php echo $v3['app_num']; ?></td>
             <td>简历：</td>
            <td>公司名称：</td>
                </tr>
           
        <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; endif; ?>
</table>
</body>
</html> -->









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
        <div class="layui-side layui-bg-black"
            style="background: url(/themes/index/public/assets/images/default/navbg.png);">
            <div class="layui-logo"><img src="/themes/index/public/assets/images/default/logo.png" alt=""></div>
            <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
                    <li class="layui-nav-item"><a href="javascript:;"><img
                                src="/themes/index/public/assets/images/default/icon_kb.png" alt="">招聘大看板 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img
                                src="/themes/index/public/assets/images/default/icon_pq.png" alt=""> 排期管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item  layui-nav-itemed layui-this"><a href="javascript:;"><img
                                src="/themes/index/public/assets/images/default/icon_hc.png" alt=""> 会场管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img
                                src="/themes/index/public/assets/images/default/icon_zw.png" alt=""> 职位管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img
                                src="/themes/index/public/assets/images/default/icon_jl.png" alt=""> 简历管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img
                                src="/themes/index/public/assets/images/default/icon_js.png" alt=""> 角色管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="javascript:;"><img
                                src="/themes/index/public/assets/images/default/icon_ry.png" alt=""> 人员管理 <span
                                class="jian">></span></a></li>
                </ul>
            </div>
        </div>
        <!-- 主体部分 -->
    <!-- 主体部分 -->
    <div class="layui-body">
        <div class="RightBody">
            <div class="xq-title layui-clear">
                <div class="xq-h"><?php echo $article['address']; ?></div>
                <div class="riqi">
                    <i>【容纳人数】<span><?php echo $article['num']; ?>人</span></i>
                </div>
                <div class="btns">
                    <button class="layui-btn btn-shanchu schc">删除会场</button>
                </div>
            </div>
            <div class="hcxq">
                <div class="xx">
                    <div class="xx-title">
                        <div class="a">该会场关联的招聘会</div>
                    </div>
                    <div class="xx-list">
                        <input type="hidden" name="id" value="<?php echo $article['id']; ?>" class="h_id">
                        <?php if(empty($zp) || (($zp instanceof \think\Collection || $zp instanceof \think\Paginator ) && $zp->isEmpty())): ?>
                            未关联
                            <?php else: if(is_array($zp) || $zp instanceof \think\Collection || $zp instanceof \think\Paginator): if( count($zp)==0 ) : echo "" ;else: foreach($zp as $key=>$vo): $res=get_job($vo['fair_id']);if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v3): ?>
                                    <div class="xx-box">
                                        <div class="xx-box-h"><?php echo $v3['title']; ?></div>
                                        <div class="xx-box-m">
                                            <p><i>备选日期：<?php if(is_array($restime) || $restime instanceof \think\Collection || $restime instanceof \think\Paginator): if( count($restime)==0 ) : echo "" ;else: foreach($restime as $key=>$v): ?>
                                                <span><?php echo date("m-d H:i",$v); ?></span>
                                            <?php endforeach; endif; else: echo "" ;endif; ?></i></p>
                                            <p><i>关联日期：<span><?php 
                                                $time=get_zptime($v3['id']);
                                             ?>
                                            <?php echo date("m月d日 H:i",$time); ?></span></i></p>
                                            <p><i>招聘人数：<span><?php echo $v3['num']; ?>人</span></i></p>
                                            <p><i>招聘职位：<span><?php if(is_array($v3['pos_ids']) || $v3['pos_ids'] instanceof \think\Collection || $v3['pos_ids'] instanceof \think\Paginator): if( count($v3['pos_ids'])==0 ) : echo "" ;else: foreach($v3['pos_ids'] as $key=>$v): ?>
                                            
                                                <?php echo get_zhiwei_name($v['pos_id']);endforeach; endif; else: echo "" ;endif; ?></span></i></p>
                                            <p><i>预约人数：<span><?php echo $v3['app_num']; ?>人</span></i></p>
                                            <p><i>投递简历：<span>5份</span></i></p>
                                            
                                        </div>
                                    </div>
                                <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; endif; ?>


                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div id="schc" class="tc">
        <img src="/themes/index/public/assets/images/default/ku.png" alt="">
        <p>删除该会场后将无法恢复，确认删除吗？</p>
        <button class="layui-btn btn-qx qx">取消</button>
        <button class="layui-btn qr">确认</button>
    </div>
    <!-- <script>
        $('.qr').click(function (e) {
        //    layui.use('layer', function () {
        //         var layer = layui.layer;

        //         layer.msg('hello');
        //     });
            // var que = '是否返回官网主页';
            // layer.confirm(que, {
            //     title: '提示',
            //     btn: ['确定', '取消'] //按钮
            // }, function () {
            //     var path = "http://px.cie.org.cn";
            //     location.href = path;
            // });
            
        });




    </script> -->
    </div>
</body>

</html>