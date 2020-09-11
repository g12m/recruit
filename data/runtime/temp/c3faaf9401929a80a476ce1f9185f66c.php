<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:38:"themes/index/portal\sturole\index.html";i:1599800835;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left.html";i:1599724443;}*/ ?>
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



<?php echo $url=$_SERVER['REQUEST_URI'];?>
  <div class="layui-side layui-bg-black" style="background: url(/themes/index/public/assets/images/default/navbg.png);">
    <div class="layui-logo"><img src="/themes/index/public/assets/images/default/logo.png" alt=""></div>
    <div class="layui-side-scroll">
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item"><a href="<?php echo url('portal/msg/kanban'); ?>"><img src="/themes/index/public/assets/images/default/icon_kb.png"
              alt="">招聘大看板 <span class="jian">></span></a></li>
        <li <?php if($url=="/scheduling"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/scheduling"><img src="/themes/index/public/assets/images/default/icon_pq.png"
              alt=""> 排期管理 <span class="jian">></span></a></li>
        <li <?php if($url=="/confer"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/confer"><img
              src="/themes/index/public/assets/images/default/icon_hc.png" alt=""> 会场管理 <span class="jian">></span></a></li>
        <li <?php if($url=="/sch_position"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/sch_position"><img src="/themes/index/public/assets/images/default/icon_zw.png"
              alt=""> 职位管理 <span class="jian">></span></a></li>
        <li <?php if($url=="/resume"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/resume"><img src="/themes/index/public/assets/images/default/icon_jl.png"
              alt=""> 简历管理 <span class="jian">></span></a></li>
        <li <?php if($url=="/sturole"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/sturole"><img src="/themes/index/public/assets/images/default/icon_js.png"
              alt=""> 角色管理 <span class="jian">></span></a></li>
        <li <?php if($url=="/stu_role"): ?>class="layui-nav-item layui-nav-itemed layui-this"<?php else: ?>class="layui-nav-item"<?php endif; ?>><a href="/stu_role"><img src="/themes/index/public/assets/images/default/icon_ry.png"
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
                                    <input type="text" name="title" autocomplete="off" class="layui-input" value="<?php echo $title; ?>">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit>搜索</button>
                                <div class="layui-btn tjjs">添加</div>
                            </div>
                        </div>
                    </form>
                </div>
                <div id="table" lay-filter="table">
                    <table class="layui-table" lay-skin="line">
                        <thead>
                            <tr>
                                <th>序号</th>
                                <th>名称</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                           <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                            <tr>
                                <td>
                                    <p><?php echo $vo['id']; ?></p>
                                </td>
                                <td>
                                    <p><?php echo $vo['name']; ?></p>
                                </td>
                                <td><button class="layui-btn btn-xq bjm" id="<?php echo $vo['id']; ?>">编辑</button><button
                                        class="layui-btn btn-xq">删除</button><button class="layui-btn btn-xq bjsq">授权</button>
                                </td>
                            </tr>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div id="bjm" class="tc">
        <form class="layui-form erole" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">名称：</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input"
                        value="普通管理员">
                </div>
            </div>
           
            <div class="layui-btn btn-qx qx">取消</div>
            <button class="layui-btn qr">确认</button>
        </form>
    </div>
    <div id="tjjs" class="tc">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">名称：</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input"
                        placeholder="普通管理员" id="role">
                </div>
            </div>
            <div class="layui-btn btn-qx qx">取消</div>
            <button class="layui-btn qr">确认</button>
        </form>
    </div>
    <div id="bjsq" class="tc">
        <form action="">
            <div class="layui-form-item">
                <label>
                    <input type="checkbox" name="dkb">招聘大看板
                </label>
            </div>
            <div class="layui-form-item">
                <label>
                    <input type="checkbox" name="pqgl">排期管理
                </label>
            </div>
            <div class="layui-form-item">
                <label>
                    <input type="checkbox" name="rygl">人员管理
                </label>
            </div>
            <div class="layui-btn btn-qx qx">取消</div>
            <button class="layui-btn qr">确认</button>
        </form>
    </div>
</body>

</html>