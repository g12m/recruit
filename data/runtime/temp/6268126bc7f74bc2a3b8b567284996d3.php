<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:32:"themes/index/user\\register.html";i:1599958473;}*/ ?>
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
<script type="text/javascript">
    //全局变量
    var GV = {
        ROOT: "/",
        WEB_ROOT: "/",
        JS_ROOT: "static/js/"
    };
</script>
<script src="/static/js/wind.js"></script>

<body style="background: url(/themes/index/public/assets/images/default/bg_clear.jpg)" class="register-form">
    <div class="center">
        <a href="/"><img class="logo" src="/themes/index/public/assets/images/default/logo_h.png" alt=""></a>
        <div class="register">
            <p class="register-h">注册学校账号</p>
            <div class="form">
                <form action="<?php echo url('user/Register/doRegister'); ?>" method="POST" class="js-ajax-form">
                    <div class="form-h">账号信息</div>
                    <div class="form-m">
                        <div class="layui-form-item">
                            <label class="layui-form-label">账号：</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" required lay-verify="required" placeholder="请输入手机号或邮箱"
                                    autocomplete="off" class="layui-input">
                                <div class="layui-btn fsyzm">发送验证码</div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">验证码：</label>
                            <div class="layui-input-block">
                                <input type="text" name="code" required lay-verify="required" placeholder="请输入验证码"
                                    autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码：</label>
                            <div class="layui-input-block">
                                <input type="password" name="password" required lay-verify="required"
                                    placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">确认密码：</label>
                            <div class="layui-input-block">
                                <input type="password" name="pwd" required lay-verify="required"
                                    placeholder="请再次输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="form-h">联系人信息</div>
                    <div class="form-m">
                        <div class="layui-form-item">
                            <label class="layui-form-label">联系人：</label>
                            <div class="layui-input-block">
                                <input type="text" name="user_name" required lay-verify="required" placeholder="请输入联系人姓名"
                                    autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">联系人电话：</label>
                            <div class="layui-input-block">
                                <input type="text" name="phone" required lay-verify="required"
                                    placeholder="请输入联系人电话" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="form-h">学校信息</div>
                    <div class="form-m">
                        <div class="layui-form-item">
                            <label class="layui-form-label">学校名称：</label>
                            <div class="layui-input-block">
                                <input type="text" name="ent_name" required lay-verify="required"
                                    placeholder="请输入学校名称" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">学校地址：</label>
                            <div class="layui-input-block">
                                <select class=" province" name="province">
                                </select>
                                <select class=" city" name="city">
                                </select>
                                <select class=" area" name="area">
                                </select>
                            </div>
                            <script src="/themes/index/public/assets/js/default/jsAddress.js"></script>
                            <script>
                                addressInit('province', 'city', 'area');
                            </script>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">开设专业：</label>
                            <div class="layui-input-block">
                                <input type="text" name="major" placeholder="请输入专业名称/用回车键隔开（非必填）" autocomplete="off"
                                    class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">学生人数：</label>
                            <div class="layui-input-block">
                                <input type="text" name="num" required lay-verify="required" placeholder="请输入学生人数"
                                    autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item width">
                            <label class="layui-form-label">学校简介：</label>
                            <div class="layui-input-block">
                                <textarea name="desc" required lay-verify="required" placeholder="请输入学校简介"
                                    class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <input name="user_type" value="3" type="hidden">
                        <div class="zc">
                            <button class="layui-btn js-ajax-submit" type="submit">注 册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script src="/static/js/admin.js"></script>
        <div class="copy"><?php echo cmf_get_option('server_settings')['q_banquan']; ?></div>
    </div>
</body>

</html>