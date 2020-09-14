<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:37:"themes/index/portal\resume\index.html";i:1599645493;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left.html";i:1599900750;}*/ ?>
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
       
        <!-- 左侧导航 -->
        

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
                            <tr>
                                <td>
                                    <p><span class="layui-badge-dot"></span>王琪琪</p>
                                </td>
                                <td>
                                    <p>软件设计</p>
                                </td>
                                <td>
                                    <p>北京XXX软件开发公司</p>
                                </td>
                                <td>
                                    <p>软件开发工程师</p>
                                </td>
                                <td>
                                    <p>正式</p>
                                </td>
                                <td>
                                    <p>8月23日 12:34</p>
                                </td>
                                <td><button class="layui-btn btn-xq">详情</button></td>
                            </tr>
                            <tr>
                                <td>
                                    <p><span class="layui-badge-dot"></span>王琪琪</p>
                                </td>
                                <td>
                                    <p>软件设计</p>
                                </td>
                                <td>
                                    <p>北京XXX软件开发公司</p>
                                </td>
                                <td>
                                    <p>软件开发工程师</p>
                                </td>
                                <td>
                                    <p>正式</p>
                                </td>
                                <td>
                                    <p>8月23日 12:34</p>
                                </td>
                                <td><button class="layui-btn btn-xq">详情</button></td>
                            </tr>
                            <tr>
                                <td>
                                    <p><span class="layui-badge-dot"></span>王琪琪</p>
                                </td>
                                <td>
                                    <p>软件设计</p>
                                </td>
                                <td>
                                    <p>北京XXX软件开发公司</p>
                                </td>
                                <td>
                                    <p>软件开发工程师</p>
                                </td>
                                <td>
                                    <p>正式</p>
                                </td>
                                <td>
                                    <p>8月23日 12:34</p>
                                </td>
                                <td><button class="layui-btn btn-xq">详情</button></td>
                            </tr>
                            <tr>
                                <td>
                                    <p><span class="layui-badge-dot"></span>王琪琪</p>
                                </td>
                                <td>
                                    <p>软件设计</p>
                                </td>
                                <td>
                                    <p>北京XXX软件开发公司</p>
                                </td>
                                <td>
                                    <p>软件开发工程师</p>
                                </td>
                                <td>
                                    <p>正式</p>
                                </td>
                                <td>
                                    <p>8月23日 12:34</p>
                                </td>
                                <td><button class="layui-btn btn-xq">详情</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>

</html>