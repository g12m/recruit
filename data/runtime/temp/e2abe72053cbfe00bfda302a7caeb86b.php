<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"themes/index/portal\sturesume\index.html";i:1599651498;}*/ ?>
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
<script src="/themes/index/public/assets/js/jquery-1.11.3.min.js"></script>
<script src='/themes/index/public/assets/layui/layui.js'></script>
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
                        <dd><a href="<?php echo cmf_url('user/adminuser/logout',['uid'=>$user_info['id'],'type'=>$user_info['user_type']]); ?>">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!-- 左侧导航 -->
        <div class="layui-side layui-bg-black" style="background: url(/themes/index/public/assets/images/default/navbg.png);">
            <div class="layui-logo"><img src="/themes/index/public/assets/images/default/logo.png" alt=""></div>
            <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed layui-this"><a href="javascript:;"><img src="/themes/index/public/assets/images/default/icon_jl.png" alt=""> 简历管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="<?php echo cmf_url('entposition/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_zw.png" alt=""> 职位管理 <span
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
                                    <input id="timestart-zw" type="text" name="price_min" placeholder="开始时间"
                                        autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid">-</div>
                                <div class="layui-input-inline" style="width: 200px;">
                                    <input id="timeend-zw" type="text" name="price_max" placeholder="结束时间"
                                        autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit>搜索</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div id="table" lay-filter="table">
                    <table class="layui-table" lay-skin="line">
                        <thead>
                            <tr>
                                <th>姓名</th>
                                <th>专业</th>
                                <th>公司名称</th>
                                <th>投递职位</th>
                                <th>职位类型</th>
                                <th>投递时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                            <tr>
                                <td><p><span class="layui-badge-dot"></span><?php echo $vo['name']; ?></p></td>
                                <td><p><?php echo $vo['major']; ?></p></td>
                                <td><p><?php echo $vo['ent_name']; ?></p></td>
                                <td><p><?php echo $vo['title']; ?></p></td>
                                <td><p><?php echo $vo['type']; ?></p></td>
                                <td><p><?php echo date('m月d日 H时m分'); ?></p></td>
                                <td><button data-id="<?php echo $vo['id']; ?>" class="layui-btn btn-xq">详情</button></td>
                            </tr>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>

</html>