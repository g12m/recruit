<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:47:"themes/admin/portal\admin_categoryen\index.html";i:1545711210;s:70:"E:\phpStudy\PHPTutorial\WWW\xsj\public\themes\admin\public\header.html";i:1543480324;}*/ ?>
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
			<li class="active"><a href="<?php echo url('AdminCategoryen/index'); ?>">分类管理</a></li>
			<li><a href="<?php echo url('AdminCategoryen/add'); ?>">添加分类</a></li>
		</ul>
		<form class="well form-inline margin-top-20" method="post" action="<?php echo url('AdminCategoryen/index'); ?>">
        分类名称:
        <input type="text" class="form-control" name="keyword" style="width: 200px;"
               value="<?php echo (isset($keyword) && ($keyword !== '')?$keyword:''); ?>" placeholder="请输入分类名称">
        <input type="submit" class="btn btn-primary" value="搜索"/>
        <a class="btn btn-danger" href="<?php echo url('AdminCategoryen/index'); ?>">清空</a>
    </form>
		<form method="post" class="js-ajax-form" action="<?php echo url('AdminCategoryen/listOrder'); ?>">
			<div class="table-actions">
				<button type="submit" class="btn btn-primary btn-sm js-ajax-submit"><?php echo lang('SORT'); ?></button>
				<button class="btn btn-primary btn-sm js-ajax-submit" type="submit"
									 data-action="<?php echo url('AdminCategoryen/toggle',array('display'=>'1')); ?>" data-subcheck="true">
							 <?php echo lang('DISPLAY'); ?>
					 </button>
				 <button class="btn btn-primary btn-sm js-ajax-submit" type="submit"
								 data-action="<?php echo url('AdminCategoryen/toggle',array('hide'=>1)); ?>" data-subcheck="true"><?php echo lang('HIDE'); ?>
				 </button>
			</div>
			<?php if(empty($keyword) || (($keyword instanceof \think\Collection || $keyword instanceof \think\Paginator ) && $keyword->isEmpty())): ?>
			<table class="table table-hover table-bordered table-list" id="menus-table">
				<thead>
					<tr>
						<th width="16" style="padding-left:20px;"><label><input type="checkbox" class="js-check-all"
																																					 data-direction="x"
																																					 data-checklist="js-check-x"></label></th>
						<th width="50">排序</th>
						<th width="5">ID</th>
						<th width="160">分类名称</th>
						<th>描述</th>
						<th width="60">状态</th>
						<th width="200">操作</th>
					</tr>
				</thead>
				<tbody>
					<?php echo $category_tree; ?>
				</tbody>

			</table>
			<?php else: ?>
			<table class="table table-hover table-bordered table-list">
							 <thead>
							 <tr>
									 <th width="16"><label><input type="checkbox" class="js-check-all"
																								data-direction="x"
																								data-checklist="js-check-x"></label></th>
									 <th width="50">排序</th>
									 <th width="5">ID</th>
									 <th width="160">分类名称</th>
									 <th>描述</th>
									 <th width="60">状态</th>
									 <th width="200">操作</th>
							 </tr>
							 </thead>
							 <tbody>
							 <?php if(is_array($categories) || $categories instanceof \think\Collection || $categories instanceof \think\Paginator): if( count($categories)==0 ) : echo "" ;else: foreach($categories as $key=>$vo): ?>
									 <tr>
											 <td><input
															 type="checkbox" class="js-check" data-yid="js-check-y" data-xid="js-check-x"
															 name="ids[]" value="<?php echo $vo['id']; ?>"></td>
											 <td><input name="list_orders[<?php echo $vo['id']; ?>]" type="text" size="3" value="<?php echo $vo['list_order']; ?>"
																	class="input-order"></td>
											 <td><?php echo $vo['id']; ?></td>
											 <td><a href="{cmf_url('portal/List/index', ['id' => $vo['id']])}" target="_blank"><?php echo $vo['name']; ?></a>
											 </td>
											 <td><?php echo !empty($vo['description'])?msubstr($vo['description'],0,60):$vo['description']; ?></td>
											 <td><?php echo !empty($vo['status'])?'显示':'隐藏'; ?></td>
											 <td>
													 <a href="<?php echo url('AdminCategoryen/add', ['parent' => $vo['id']]); ?>">添加子分类</a>
													 <a href="<?php echo url('AdminCategoryen/edit',['id'=>$vo['id']]); ?>">编辑</a>
													 <a class="js-ajax-delete" href="<?php echo url('AdminCategoryen/delete',['id'=>$vo['id']]); ?>">删除</a>
													 <?php if(empty($vo['status']) || (($vo['status'] instanceof \think\Collection || $vo['status'] instanceof \think\Paginator ) && $vo['status']->isEmpty())): ?>
															 <a class="js-ajax-dialog-btn" data-msg="您确定显示此分类吗"
																	href="<?php echo url('AdminCategoryen/toggle',['ids'=>$vo['id'],'display'=>1]); ?>">显示</a>
															 <?php else: ?>
															 <a class="js-ajax-dialog-btn" data-msg="您确定隐藏此分类吗"
																	href="<?php echo url('AdminCategoryen/toggle',['ids'=>$vo['id'],'hide'=>1]); ?>">隐藏</a>
													 <?php endif; ?>
											 </td>
									 </tr>
							 <?php endforeach; endif; else: echo "" ;endif; ?>
							 </tbody>
					</table>
		<?php endif; ?>
		</form>
	</div>
	<script src="/static/js/admin.js"></script>
	<style media="screen">
		.js-ajax-dialog-btn{
			background-color: #e74c3c;
	    width: 44px;
	    height: 19px;
	    display: block;
	    float: right;
	    text-align: center;
	    color: white;
	    /* border-radius: 4px; */
	    text-decoration: none !important;
		}
	</style>
	<script>
	    $(document).ready(function() {
	        Wind.css('treeTable');
	        Wind.use('treeTable', function() {
	            $("#menus-table").treeTable({
	                indent : 20
	            });
	        });
	    });
	</script>
</body>
</html>
