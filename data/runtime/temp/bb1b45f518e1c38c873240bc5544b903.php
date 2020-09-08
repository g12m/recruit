<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"themes/index/user\\register_success.html";i:1599555524;}*/ ?>
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
<script src='/themes/index/public/assets/js/default/jquery-1.11.3.min.js'></script>
<script src='/themes/index/public/assets/css/default/layui/layui.all.js'></script>
<script src='/themes/index/public/assets/js/default/SuperSlide.js'></script>
<script src='/themes/index/public/assets/js/default/index.js'></script>


<body style="background: url(/themes/index/public/assets/images/default/bg_clear.jpg)" class="zcsuccess">
    <style>
        html {
            width: 100%;
            height: 100%;
        }
    </style>
    <div class="center">
        <img class="logo" src="/themes/index/public/assets/images/default/logo_h.png" alt="">
        <div class="success">
            <p class="success-h">注册账号</p>
            <div class="successout">
                <div class="successin">
                    <img src="/themes/index/public/assets/images/default/success.png" alt="">
                    <p>恭喜您，注册成功！</p>
                    <button class="layui-btn"><a href="<?php echo url('user/login/index'); ?>">返回登陆</a></button>
                </div>
            </div>
        </div>
        <div class="copy">Copyright © 星臣教育 All Rights Reserved</div>
    </div>
</body>

</html>