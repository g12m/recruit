<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"themes/index/portal\entfair\addfair.html";i:1599648061;}*/ ?>
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
                    <a href="javascript:;">王奇博</a>
                    <dl class="layui-nav-child">
                        <dd><a href="">退出</a></dd>
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
                    <li class="layui-nav-item layui-nav-itemed layui-this"><a href="<?php echo cmf_url('entposition/index'); ?>"><img src="/themes/index/public/assets/images/icon_zw.png" alt=""> 职位管理 <span
                                class="jian">></span></a></li>
                    <li class="layui-nav-item"><a href="<?php echo cmf_url('entfair/index'); ?>"><img
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
                <div class="zw-xinjian">
                    <div class="xj-h">新建招聘会</div>
                    <div class="zj-form">
                        <form class="layui-form" action="" method="POST">
                            <div class="layui-form-item">
                                <label class="layui-form-label">招聘会名称：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="title" required lay-verify="required" placeholder="请输入招聘会名称"
                                        autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">招聘人数：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="num" required lay-verify="required" placeholder="请输入招聘人数"
                                        autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">备选日期：</label>
                                <div class="layui-input-inline times">
                                    <input type="text" name="alt_time[]" autocomplete="off" class="layui-input zptime1">
                                    <input type="text" name="alt_time[]" autocomplete="off" class="layui-input zptime2">
                                    <input type="text" name="alt_time[]" autocomplete="off" class="layui-input zptime3">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">截止日期：</label>
                                <div class="layui-input-inline times">
                                    <input type="text" name="dea_time" required lay-verify="required" autocomplete="off"
                                        class="layui-input jztime">
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">招聘职位：</label>
                                <div class="layui-input-inline times">
                                    <input type="text" name="zws" id="zws" required lay-verify="required" autocomplete="off" class="layui-input">
                                    <input type="hidden" name="posarr" id="posarr">
                                    <div class="tjzpzw"><img src="/themes/index/public/assets/images/jia.png" alt="" for="tjzpzw"></div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-submit>保 存</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="tjzpzw" class="tc">
        <form action="">
            <table class="layui-table" lay-skin="line">
                <thead>
                    <tr>
                        <th>职位</th>
                        <th>职位类型</th>
                        <th>职位描述</th>
                        <th>薪资</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if(is_array($pos) || $pos instanceof \think\Collection || $pos instanceof \think\Paginator): if( count($pos)==0 ) : echo "" ;else: foreach($pos as $key=>$vo): ?>
                    <tr id="postr">
                        <td>
                            <label for="zw<?php echo $vo['id']; ?>">
                                <input type="checkbox" name="zw[]" id="zw<?php echo $vo['id']; ?>" value="<?php echo $vo['id']; ?>">
                                <span id="postitle"><?php echo $vo['title']; ?></span>
                            </label>
                        </td>
                        <td>
                            <?php if($vo['type'] == '1'): ?>正式<?php endif; if($vo['type'] == '2'): ?>实习<?php endif; ?>
                        </td>
                        <td><?php echo $vo['desc']; ?></td>
                        <td><?php echo $vo['salary_min']; ?>~<?php echo $vo['salary_max']; ?></td>
                    </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    
                </tbody>
            </table>
            <div class="layui-btn btn-qx qx">取消</div>
            <div onclick="addpos()" class="layui-btn qr">确定</div>
        </form>
    </div>
    <script>
        function addpos(){
            var str = '';
            var zws = '';
            var postr = $("#tjzpzw #postr")
            postr.each(function(){
                if($(this).find("input[type='checkbox']").is(':checked')){
                    str += $(this).find("input[type='checkbox']").val()+','
                    zws += $(this).find("#postitle").text()+','
                }
            });
            str=str.substring(0,str.length-1)
            zws=zws.substring(0,zws.length-1)

            $("#zws").val(zws)
            $("#posarr").val(str)
        }
    </script>
</body>

</html>