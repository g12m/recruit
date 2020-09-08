<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:29:"themes/index/user\\login.html";i:1599548885;}*/ ?>
<!DOCTYPE html>
<html>

<head>
	<meta charset='utf-8'>
	
	<meta name='renderer' content='webkit'>
	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
	<title><?php echo $site_info['site_name']; ?></title>
	<meta name="keywords" content="<?php echo (isset($category['seo_keywords']) && ($category['seo_keywords'] !== '')?$category['seo_keywords']:$site_info['site_seo_keywords']); ?>">
	<meta name="description" content="<?php echo (isset($category['seo_description']) && ($category['seo_description'] !== '')?$category['seo_description']:$site_info['site_seo_description']); ?>" />

	<link rel="stylesheet" href="/themes/index/public/assets/css/default/layui/css/layui.css">
	<link rel='stylesheet' href='/themes/index/public/assets/css/default/index.css'>
	<script src="/themes/index/public/assets/js/default/jquery-1.11.3.min.js"></script>
	<script src='/themes/index/public/assets/css/default/layui/layui.js'></script>
	<script src='/themes/index/public/assets/js/default/SuperSlide.js'></script>
	<script src='/themes/index/public/assets/js/default/index.js'></script>
	<script type="text/javascript">
		//全局变量
		var GV = {
			ROOT: "/",
			WEB_ROOT: "/",
			JS_ROOT: "static/js/"
		};
	</script>
	<script src="/static/js/wind.js"></script>
</head>



<body style="background: url(/themes/index/public/assets/images/default/bg.jpg)" class="login">
	<style>
		html {
			width: 100%;
			height: 100%;
		}
	</style>
	<div class="center">
		<img class="logo" src="/themes/index/public/assets/images/default/logo_h.png" alt="">
		<div class="loginbox">
			<div class="login-in">
				<form class="layui-form js-ajax-form" action="<?php echo url('user/login/doLogin'); ?>" method="POST">
					<div class="login-h">用户登录</div>
					<div class="num">
						<input type="text" name="username" required lay-verify="required" placeholder="请输入手机号或邮箱"
							autocomplete="off" class="layui-input">
						<img src="/themes/index/public/assets/images/default/number.png" alt="">
					</div>
					<div class="password">
						<input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
							autocomplete="off" class="layui-input">
						<img src="/themes/index/public/assets/images/default/password.png" alt="">
					</div>
					<button class="layui-btn js-ajax-submit" lay-submit>登 录</button>
					<p>没有账号？<a href="<?php echo cmf_url('register_check'); ?>">请注册</a></p>
				</form>
			</div>
		</div>
		<div class="copy">Copyright © 星臣教育 All Rights Reserved</div>
			<script src="/static/js/admin.js"></script>
	</div>
</body>








</html>