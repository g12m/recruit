<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:37:"themes/index/user\register_check.html";i:1599549996;}*/ ?>
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

<body style="background: url(/themes/index/public/assets/images/default/bg_clear.jpg)" class="register_check">
    <style>
        html {
            width: 100%;
            height: 100%;
        }
    </style>
    <div class="center">
        <img class="logo" src="/themes/index/public/assets/images/default/logo_h.png" alt="">
        <div class="register_check_list">
            <div class="check_box">
                <div class="check_box_in">
                    <div class="h">我是学校</div>
                    <div class="imgbox">
                        <img src="/themes/index/public/assets/images/default/school.png" alt="">
                    </div>
                    <button class="layui-btn"><a href="<?php echo cmf_url('user/Register/index',array('type'=>3)); ?>">注册账号 ></a></button>
                </div>
            </div>
            <div class="check_box">
                <div class="check_box_in">
                    <div class="h">我是企业</div>
                    <div class="imgbox">
                        <img src="/themes/index/public/assets/images/default/company.png" alt="">
                    </div>
                    <button class="layui-btn"><a href="<?php echo cmf_url('user/Register/index',array('type'=>4)); ?>">注册账号 ></a></button>
                </div>
            </div>
        </div>
        <div class="copy">Copyright © 星臣教育 All Rights Reserved</div>
    </div>
</body>

</html>