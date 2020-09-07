<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:38:"themes/index/user\adminuser\login.html";i:1599395137;}*/ ?>
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

<body style="background: url(/themes/index/public/assets/images/bg.jpg)" class="login">
    <style>
        html {
            width: 100%;
            height: 100%;
        }
    </style>
    <div class="center">
        <img class="logo" src="/themes/index/public/assets/images/logo_h.png" alt="">
        <div class="loginbox">
            <div class="login-in">
                <form id="verform" class="layui-form" action="" method="POST">
                    <div class="login-h">用户登录</div>
                    <div class="num">
                        <input type="text" name="username" required lay-verify="required" placeholder="请输入手机号或邮箱"
                            autocomplete="off" id="username" class="layui-input">
                            <img src="/themes/index/public/assets/images/number.png" alt="">
                    </div>
                    <div class="password">
                        <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                            autocomplete="off" id="password" class="layui-input">
                            <img src="/themes/index/public/assets/images/password.png" alt="">
                    </div>
                </form>
                    <button class="layui-btn" onclick="verform()" lay-submit>登 录</button>
                    <p>没有账号？<a href="<?php echo cmf_url('register_check'); ?>">请注册</a></p>
            </div>
        </div>
        <div class="copy">Copyright © 星臣教育 All Rights Reserved</div>
    </div>
    <script>
        function verform(){
            var username = $("#verform").find("#username");
            var password = $("#verform").find("#password");
            // if(!isPhoneNo(username)){
            //     if(!vailEmail(username)){
            //         alert('请输入正确格式的手机号或邮箱');
            //         return false;
            //     }
            // }
            $("#verform").submit();
        }
        function isPhoneNo(phone) {
            var pattern = /^1[34578]\d{9}$/;
            console.log(RegExp(pattern).test(phone))
            return RegExp(pattern).test(phone);
        }
        function vailEmail(email){
            var myreg = /^([\\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\\.[a-zA-Z0-9_-])+/;
            console.log(myreg.test(email))
            return myreg.test(email)
        }
    </script>
</body>

</html>