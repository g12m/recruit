<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"themes/index/portal\adminuser\login.html";i:1599392427;}*/ ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta name='renderer' content='webkit'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
    <title></title>
</head>
<link rel="stylesheet" href="/static/layui/css/layui.css">
<link rel='stylesheet' href='/static/css/index.css'>
<script src='/static/js/jquery-1.11.3.min.js'></script>
<script src='/static/layui/layui.all.js'></script>
<script src='/static/js/SuperSlide.js'></script>
<script src='/static/js/index.js'></script>

<body style="background: url(/static/images/bg.jpg)" class="login">
    <style>
        html {
            width: 100%;
            height: 100%;
        }
    </style>
    <div class="center">
        <img class="logo" src="/static/images/logo_h.png" alt="">
        <div class="loginbox">
            <div class="login-in">
                <form id="verform" class="layui-form" action="" method="POST">
                    <div class="login-h">用户登录</div>
                    <div class="num">
                        <input type="text" name="username" required lay-verify="required" placeholder="请输入手机号或邮箱"
                            autocomplete="off" class="layui-input">
                            <img src="/static/images/number.png" alt="">
                    </div>
                    <div class="password">
                        <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                            autocomplete="off" class="layui-input">
                            <img src="/static/images/password.png" alt="">
                    </div>
                </form>
                    <button class="layui-btn" onclick="verform()" lay-submit>登 录</button>
                    <p>没有账号？<a href="">请注册</a></p>
            </div>
        </div>
        <div class="copy">Copyright © 星臣教育 All Rights Reserved</div>
    </div>
    <script>
        function verform(){
            var data = $("#verform").serialize();
            console.log(data)
        }
    </script>
</body>

</html>