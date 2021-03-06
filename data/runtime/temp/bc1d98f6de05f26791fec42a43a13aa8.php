<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:44:"themes/admin/portal\admin_sturole\index.html";i:1599968965;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\admin\public\header.html";i:1599439176;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->


    <link href="/themes/admin/public/assets/themes/<?php echo cmf_get_admin_style(); ?>/bootstrap.min.css" rel="stylesheet">
    <link href="/themes/admin/public/assets/simpleboot3/css/simplebootadmin.css" rel="stylesheet">
    <link href="/static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        form .input-order {
            margin-bottom: 0px;
            padding: 0 2px;
            width: 42px;
            font-size: 12px;
        }

        form .input-order:focus {
            outline: none;
        }

        .table-actions {
            margin-top: 5px;
            margin-bottom: 5px;
            padding: 0px;
        }

        .table-list {
            margin-bottom: 0px;
        }

        .form-required {
            color: red;
        }
    </style>
    <script type="text/javascript">
        //全局变量
        var GV = {
            ROOT: "/",
            WEB_ROOT: "/",
            JS_ROOT: "static/js/",
            APP: '<?php echo \think\Request::instance()->module(); ?>'/*当前应用名*/
        };
    </script>
    <script src="/themes/admin/public/assets/js/jquery-1.10.2.min.js"></script>
    <script src="/static/js/wind.js"></script>
    <script src="/themes/admin/public/assets/js/bootstrap.min.js"></script>
    <script>
        Wind.css('artDialog');
        Wind.css('layer');
        $(function () {
            $("[data-toggle='tooltip']").tooltip({
                container:'body',
                html:true,
            });
            $("li.dropdown").hover(function () {
                $(this).addClass("open");
            }, function () {
                $(this).removeClass("open");
            });
        });
    </script>
    <?php if(APP_DEBUG): ?>
        <style>
            #think_page_trace_open {
                z-index: 9999;
            }
        </style>
    <?php endif; ?>
</head>
<body>
	<div class="wrap js-check-wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a href="<?php echo url('rbac/index'); ?>"><?php echo lang('ADMIN_RBAC_INDEX'); ?></a></li>
			<li><a href="<?php echo url('rbac/roleAdd'); ?>"><?php echo lang('ADMIN_RBAC_ROLEADD'); ?></a></li>
		</ul>
		<form action="<?php echo url('Rbac/listorders'); ?>" method="post" class="margin-top-20">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th width="80">ID</th>
						<th align="left">角色名称</th>
						<!-- <th align="left"><?php echo lang('ROLE_DESCRIPTION'); ?></th> -->
						<!-- <th width="60" align="left"><?php echo lang('STATUS'); ?></th> -->
						<th width="250">操作</th>
					</tr>
				</thead>
				<tbody>
					<?php if(is_array($roles) || $roles instanceof \think\Collection || $roles instanceof \think\Paginator): if( count($roles)==0 ) : echo "" ;else: foreach($roles as $key=>$vo): ?>
					<tr>
						<td><?php echo $vo['id']; ?></td>
						<td><?php echo $vo['name']; ?></td>
					
						<td>
							
								<a href="<?php echo url('AdminStuquan/index',array('id'=>$vo['id'])); ?>">权限设置</a>
								<!-- <a href="javascript:openIframeDialog('<?php echo url('rbac/member',array('id'=>$vo['id'])); ?>','成员管理');">成员管理</a>| -->
								<a href="<?php echo url('AdminSturole/roleedit',array('id'=>$vo['id'])); ?>"><?php echo lang('EDIT'); ?></a>
								<a class="js-ajax-delete" href="<?php echo url('AdminSturole/roledelete',array('id'=>$vo['id'])); ?>"><?php echo lang('DELETE'); ?></a>	
						</td>
					</tr>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</tbody>
			</table>
		</form>
	</div>
	<script src="/static/js/admin.js"></script>
</body>
</html>