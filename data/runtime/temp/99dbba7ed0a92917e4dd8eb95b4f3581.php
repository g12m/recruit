<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:36:"themes/admin/admin\setting\site.html";i:1599820817;s:74:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\admin\public\header.html";i:1599439176;}*/ ?>
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
<style >
    .set_radio{
     margin-right:10px;
    }
</style>
<body>
<div class="wrap js-check-wrap">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#A" data-toggle="tab"><?php echo lang('WEB_SITE_INFOS'); ?></a></li>
        <li><a href="#B" data-toggle="tab"><?php echo lang('SEO_SETTING'); ?></a></li>
        <!--<li><a href="#C" data-toggle="tab"><?php echo lang('URL_SETTING'); ?></a></li>-->
        <!--<li><a href="#E" data-toggle="tab"><?php echo lang('COMMENT_SETTING'); ?></a></li>-->
        <!-- <li><a href="#F" data-toggle="tab">用户注册设置</a></li> -->
        <!-- <li><a href="#G" data-toggle="tab">CDN设置</a></li> -->
        <li><a href="#H" data-toggle="tab">底部设置</a></li>
        <li><a href="#I" data-toggle="tab">短信/微信设置</a></li>
        <li><a href="#D" data-toggle="tab">腾讯直播设置</a></li>
        <!-- <li><a href="#S" data-toggle="tab">水印设置</a></li> -->
    </ul>
    <form class="form-horizontal js-ajax-form margin-top-20" role="form" action="<?php echo url('setting/sitePost'); ?>"
          method="post">
        <fieldset>
            <div class="tabbable">
                <div class="tab-content">
                    <div class="tab-pane active" id="A">
                        <div class="form-group">
                            <label for="input-site-name" class="col-sm-2 control-label"><span
                                    class="form-required">*</span><?php echo lang('WEBSITE_NAME'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" id="input-site-name" name="options[site_name]"
                                       value="<?php echo (isset($site_info['site_name']) && ($site_info['site_name'] !== '')?$site_info['site_name']:''); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-admin_url_password" class="col-sm-2 control-label">
                                后台加密码
                                <a href="http://www.thinkcmf.com/faq.html?url=https://www.kancloud.cn/thinkcmf/faq/493509"
                                   title="查看帮助手册"
                                   data-toggle="tooltip"
                                   target="_blank"><i class="fa fa-question-circle"></i></a>
                            </label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" id="input-admin_url_password"
                                       name="admin_settings[admin_password]"
                                       value="<?php echo (isset($admin_settings['admin_password']) && ($admin_settings['admin_password'] !== '')?$admin_settings['admin_password']:''); ?>"
                                       id="js-site-admin-url-password">
                                <p class="help-block">英文字母数字，不能为纯数字</p>
                                <p class="help-block" style="color: red;">
                                    设置加密码后必须通过以下地址访问后台,请劳记此地址，为了安全，您也可以定期更换此加密码!</p>
                                <?php 
                                    $root=cmf_get_root();
                                    $root=empty($root)?'':'/'.$root;
                                    $site_domain = cmf_get_domain().$root;
                                 ?>
                                <p class="help-block">后台登录地址：<span id="js-site-admin-url"><?php echo $site_domain; ?>/<?php echo (isset($admin_settings['admin_password']) && ($admin_settings['admin_password'] !== '')?$admin_settings['admin_password']:'admin'); ?></span>
                                </p>
                            </div>
                        </div>
                        <!--
                        <div class="form-group">
                            <label for="input-mobile_tpl_enabled" class="col-sm-2 control-label"><?php echo lang('ENABLE_MOBILE_THEME'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <?php $mobile_tpl_enabled_checked=empty($mobile_tpl_enabled)?'':'checked'; ?>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="options[mobile_tpl_enabled]" value="1" id="input-mobile_tpl_enabled" <?php echo $mobile_tpl_enabled_checked; ?>></label>
                                </div>
                            </div>
                        </div>
                        -->
                        <div class="form-group">
                            <label for="input-site_adminstyle" class="col-sm-2 control-label"><?php echo lang('WEBSITE_ADMIN_THEME'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <?php 
                                    $site_admin_style=empty($admin_settings['admin_style'])?'':$admin_settings['admin_style'];
                                 ?>
                                <select class="form-control" name="admin_settings[admin_style]"
                                        id="input-site_adminstyle">
                                    <?php if(is_array($admin_styles) || $admin_styles instanceof \think\Collection || $admin_styles instanceof \think\Paginator): if( count($admin_styles)==0 ) : echo "" ;else: foreach($admin_styles as $key=>$vo): $admin_style_selected = $site_admin_style == $vo ? "selected" : ""; ?>
                                        <option value="<?php echo $vo; ?>" <?php echo $admin_style_selected; ?>><?php echo $vo; ?></option>
                                    <?php endforeach; endif; else: echo "" ;endif; ?>
                                </select>
                            </div>
                        </div>
                        <!--
                        <div class="form-group">
                            <label for="input-html_cache_on" class="col-sm-2 control-label"><?php echo lang('HTML_CACHE'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <?php $html_cache_on_checked=empty($html_cache_on)?'':'checked'; ?>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="options[mobile_tpl_enabled]" value="1" id="input-html_cache_on" <?php echo $html_cache_on_checked; ?>></label>
                                </div>
                            </div>
                        </div>
                        -->
                        <!-- <div class="form-group">
                            <label for="input-site_admin_email" class="col-sm-2 control-label"><?php echo lang('登录'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" id="input-site_login"
                                       name="options[site_login]" value="<?php echo (isset($site_info['site_login']) && ($site_info['site_login'] !== '')?$site_info['site_login']:'http://'); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-site_admin_email" class="col-sm-2 control-label"><?php echo lang('注册'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" id="input-site_regi"
                                       name="options[site_regi]" value="<?php echo (isset($site_info['site_regi']) && ($site_info['site_regi'] !== '')?$site_info['site_regi']:'http://'); ?>">
                            </div>
                        </div> -->

                        <div class="form-group">
                            <label for="input-site_icp" class="col-sm-2 control-label"><?php echo lang('WEBSITE_ICP'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" id="input-site_icp" name="options[site_icp]"
                                       value="<?php echo (isset($site_info['site_icp']) && ($site_info['site_icp'] !== '')?$site_info['site_icp']:''); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-site_icp" class="col-sm-2 control-label"><?php echo lang('WEBSITE_GWA'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" id="input-site_gwa" name="options[site_gwa]"
                                       value="<?php echo (isset($site_info['site_gwa']) && ($site_info['site_gwa'] !== '')?$site_info['site_gwa']:''); ?>">
                            </div>
                        </div>

                        <!-- <div class="form-group">
                            <label for="input-site_admin_email" class="col-sm-2 control-label"><?php echo lang('WEBMASTER_EMAIL'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" id="input-site_admin_email"
                                       name="options[site_admin_email]" value="<?php echo (isset($site_info['site_admin_email']) && ($site_info['site_admin_email'] !== '')?$site_info['site_admin_email']:''); ?>">
                            </div>
                        </div> -->
                        <!-- <div class="form-group">
                            <label for="input-site_analytics" class="col-sm-2 control-label"><?php echo lang('WEBSITE_STATISTICAL_CODE'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <textarea class="form-control" id="input-site_analytics" name="options[site_analytics]"><?php echo (isset($site_info['site_analytics']) && ($site_info['site_analytics'] !== '')?$site_info['site_analytics']:''); ?></textarea>
                            </div>
                        </div> -->
                        <!--<div class="form-group">-->
                        <!--<label for="input-site_copyright" class="col-sm-2 control-label"><?php echo lang('WEBSITE_COPYRIGHT_INFOMATION'); ?></label>-->
                        <!--<div class="col-md-6 col-sm-10">-->
                        <!--<input type="text" class="form-control" id="input-site_copyright" name="options[site_copyright]" value="<?php echo (isset($site_info['site_copyright']) && ($site_info['site_copyright'] !== '')?$site_info['site_copyright']:''); ?>">-->
                        <!--</div>-->
                        <!--</div>-->
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="1">
                                    <?php echo lang('SAVE'); ?>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="B">
                        <div class="form-group">
                            <label for="input-site_seo_title" class="col-sm-2 control-label"><?php echo lang('WEBSITE_SEO_TITLE'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" id="input-site_seo_title"
                                       name="options[site_seo_title]" value="<?php echo (isset($site_info['site_seo_title']) && ($site_info['site_seo_title'] !== '')?$site_info['site_seo_title']:''); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-site_seo_keywords" class="col-sm-2 control-label"><?php echo lang('WEBSITE_SEO_KEYWORDS'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" id="input-site_seo_keywords"
                                       name="options[site_seo_keywords]" value="<?php echo (isset($site_info['site_seo_keywords']) && ($site_info['site_seo_keywords'] !== '')?$site_info['site_seo_keywords']:''); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-site_seo_description" class="col-sm-2 control-label"><?php echo lang('WEBSITE_SEO_DESCRIPTION'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <textarea class="form-control" id="input-site_seo_description"
                                          name="options[site_seo_description]"><?php echo (isset($site_info['site_seo_description']) && ($site_info['site_seo_description'] !== '')?$site_info['site_seo_description']:''); ?></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0">
                                    <?php echo lang('SAVE'); ?>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="F">
                        <div class="form-group">
                            <label for="input-banned_usernames" class="col-sm-2 control-label">用户注册验证</label>
                            <div class="col-md-6 col-sm-10">
                                <select class="form-control" name="cmf_settings[open_registration]">
                                    <option value="0">是</option>
                                    <?php 
                                        $open_registration_selected = empty($cmf_settings['open_registration'])?'':'selected';
                                     ?>
                                    <option value="1" <?php echo $open_registration_selected; ?>>否</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group" style="display: none;">
                            <label for="input-banned_usernames" class="col-sm-2 control-label"><?php echo lang('SPECAIL_USERNAME'); ?></label>
                            <div class="col-md-6 col-sm-10">
                                <textarea class="form-control" id="input-banned_usernames"
                                          name="cmf_settings[banned_usernames]"><?php echo $cmf_settings['banned_usernames']; ?></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0">
                                    <?php echo lang('SAVE'); ?>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="G">
                        <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">静态资源cdn地址</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" id="input-cdn_static_root"
                                       name="cdn_settings[cdn_static_root]"
                                       value="<?php echo (isset($cdn_settings['cdn_static_root']) && ($cdn_settings['cdn_static_root'] !== '')?$cdn_settings['cdn_static_root']:''); ?>">
                                <p class="help-block">
                                    不能以/结尾；设置这个地址后，请将ThinkCMF下的静态资源文件放在其下面；<br>
                                    ThinkCMF下的静态资源文件大致包含以下(如果你自定义后，请自行增加)：<br>
                                    themes/admin_simplebootx/public/assets<br>
                                    static<br>
                                    themes/simplebootx/public/assets<br>
                                    例如未设置cdn前：jquery的访问地址是/static/js/jquery.js, <br>
                                    设置cdn是后它的访问地址就是：静态资源cdn地址/static/js/jquery.js
                                </p>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0">
                                    <?php echo lang('SAVE'); ?>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="H">
                      <!-- <div style="margin:auto;text-align:left;padding-left:100px;"><h5>联系方式</h5></div>
                      <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">电话</label>
                          <div class="col-md-6 col-sm-10">
                            <input type="text" class="form-control"
                                   name="server_settings[k_tel]"
                                   value="<?php echo (isset($server_settings['k_tel']) && ($server_settings['k_tel'] !== '')?$server_settings['k_tel']:''); ?>">
                          </div>
                      </div> -->
                      <!-- <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">传真</label>
                          <div class="col-md-6 col-sm-10">
                            <input type="text" class="form-control"
                                   name="server_settings[q_tel]"
                                   value="<?php echo (isset($server_settings['q_tel']) && ($server_settings['q_tel'] !== '')?$server_settings['q_tel']:''); ?>">
                          </div>
                      </div> -->
                        <!-- <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control"
                                       name="server_settings[k_email]"
                                       value="<?php echo (isset($server_settings['k_email']) && ($server_settings['k_email'] !== '')?$server_settings['k_email']:''); ?>">
                            </div>
                        </div> -->

                        <!-- <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">地址</label>
                            <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="server_settings[q_email]"
                                     value="<?php echo (isset($server_settings['q_email']) && ($server_settings['q_email'] !== '')?$server_settings['q_email']:''); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">英文地址</label>
                            <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="server_settings[q_emailen]"
                                     value="<?php echo (isset($server_settings['q_emailen']) && ($server_settings['q_emailen'] !== '')?$server_settings['q_emailen']:''); ?>">
                            </div>
                        </div> -->
                      <!-- <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">英文地址</label>
                            <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="server_settings[q_emailen]"
                                     value="<?php echo (isset($server_settings['q_emailen']) && ($server_settings['q_emailen'] !== '')?$server_settings['q_emailen']:''); ?>">
                            </div>
                        </div>  -->
                         <!-- <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">技术支持</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control"
                                       name="server_settings[k_zhichi]"
                                       value="<?php echo (isset($server_settings['k_zhichi']) && ($server_settings['k_zhichi'] !== '')?$server_settings['k_zhichi']:''); ?>">
                            </div>
                        </div> -->
                        <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">版权所有</label>
                            <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="server_settings[q_banquan]"
                                     value="<?php echo (isset($server_settings['q_banquan']) && ($server_settings['q_banquan'] !== '')?$server_settings['q_banquan']:''); ?>">
                            </div>
                        </div>
                        <!-- <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">微博地址</label>
                            <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="server_settings[q_weibo]"
                                     value="<?php echo (isset($server_settings['q_weibo']) && ($server_settings['q_weibo'] !== '')?$server_settings['q_weibo']:''); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">版权所有(英)</label>
                            <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="server_settings[q_banquanen]"
                                     value="<?php echo (isset($server_settings['q_banquanen']) && ($server_settings['q_banquanen'] !== '')?$server_settings['q_banquanen']:''); ?>">
                            </div>
                        </div> -->

                        <!-- <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">关注微信</label>
                            <div class="col-md-6 col-sm-10">
                              <input type="hidden" name="server_settings[thumbnail]" id="thumbnail" value="<?php echo cmf_get_image_url($server_settings['thumbnail']); ?>">
                              <a href="javascript:uploadOneImage('图片上传','#thumbnail');">
                                <?php if($server_settings['thumbnail'] == ''): ?>
                                <img src="/themes/admin/public/assets/images/default-thumbnail.png"
                                                         id="thumbnail-preview"
                                                         width="135" style="cursor: pointer"/>

                                <?php else: ?>
                                <img src="<?php echo cmf_get_image_url($server_settings['thumbnail']); ?>"
                                                         id="thumbnail-preview"
                                                         width="135" style="cursor: pointer"/>
                              <?php endif; ?>
                              </a>
                              <input type="button" class="btn btn-sm btn-cancel-thumbnail" value="取消图片">
                            </div>
                        </div> -->

                            <!-- <div class="form-group">
                              <label for="input-image" class="col-sm-2 control-label">底部日历</label>
                            <div class="col-md-6 col-sm-10">

                                  <input type="text" class="form-control" id="input-image" name="server_settings[task_name]" value="<?php echo $server_settings['task_name']; ?>">
                        					<a href="javascript:uploadOneImage('图片上传','#input-image');">底部日历</a>
                           </div>

                            </div> -->

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0">
                                    <?php echo lang('SAVE'); ?>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="I">
                      <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">短信用户名</label>
                          <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="sms_settings[sms_appid]"
                                     value="<?php echo (isset($sms_setting['sms_appid']) && ($sms_setting['sms_appid'] !== '')?$sms_setting['sms_appid']:''); ?>">
                          </div>
                      </div>
                      <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">短信密码</label>
                          <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="sms_settings[sms_secret]"
                                     value="<?php echo (isset($sms_setting['sms_secret']) && ($sms_setting['sms_secret'] !== '')?$sms_setting['sms_secret']:''); ?>">
                          </div>
                      </div>
                      <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">短信内容</label>
                          <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="sms_settings[sms_sign]"
                                     value="<?php echo (isset($sms_setting['sms_sign']) && ($sms_setting['sms_sign'] !== '')?$sms_setting['sms_sign']:''); ?>">
                          </div>
                      </div>
                      <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">微信APPID</label>
                          <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="sms_settings[wx_appid]"
                                     value="<?php echo (isset($sms_setting['wx_appid']) && ($sms_setting['wx_appid'] !== '')?$sms_setting['wx_appid']:''); ?>">
                          </div>
                      </div>
                      <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">微信APPSECRET</label>
                          <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="sms_settings[wx_secret]"
                                     value="<?php echo (isset($sms_setting['wx_secret']) && ($sms_setting['wx_secret'] !== '')?$sms_setting['wx_secret']:''); ?>">
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                              <button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0">
                                  <?php echo lang('SAVE'); ?>
                              </button>
                          </div>
                      </div>
                    </div>
                    <div class="tab-pane" id="D">
                        <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">直播appid</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" name="zhi_setting[zhi_appid]"
                                    value="<?php echo (isset($zhi_setting['sms_appid']) && ($zhi_setting['sms_appid'] !== '')?$zhi_setting['sms_appid']:''); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">直播APPSECRET</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" name="zhi_setting[zhi_secret]"
                                    value="<?php echo (isset($zhi_setting['sms_secret']) && ($zhi_setting['sms_secret'] !== '')?$zhi_setting['sms_secret']:''); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">直播密钥</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" name="zhi_setting[zhi_sign]"
                                    value="<?php echo (isset($zhi_setting['sms_sign']) && ($zhi_setting['sms_sign'] !== '')?$zhi_setting['sms_sign']:''); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">推流服务器</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" name="zhi_setting[zhi_tl]"
                                    value="<?php echo (isset($zhi_setting['wx_appid']) && ($zhi_setting['wx_appid'] !== '')?$zhi_setting['wx_appid']:''); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-cdn_static_root" class="col-sm-2 control-label">播放服务器</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" name="zhi_setting[zhi_bf]"
                                    value="<?php echo (isset($zhi_setting['wx_secret']) && ($zhi_setting['wx_secret'] !== '')?$zhi_setting['wx_secret']:''); ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0">
                                    <?php echo lang('SAVE'); ?>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="S">
                      <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">是否开启图片水印:</label>
                          <div class="col-md-6 col-sm-10">
                             是
                              <input type="radio" style="margin-right:10px;"
                                     name="mark_setting[is_mark]"
                                     value="1" <?php if($mark_setting['is_mark'] == 1): ?>checked<?php endif; ?> />
                              否
                              <input type="radio"
                                     name="mark_setting[is_mark]"
                                     value="0" <?php if($mark_setting['is_mark'] == 0): ?>checked<?php endif; ?> />
                          </div>
                      </div>
                      <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">水印尺寸:</label>
                          <div class="col-md-6 col-sm-10">
                            宽(px):
                              <input type="text" class="form-control" style="display:inline;width:150px;margin-right:20px;"
                                     name="mark_setting[width]"
                                     value="<?php echo (isset($mark_setting['width']) && ($mark_setting['width'] !== '')?$mark_setting['width']:'300'); ?>">
                            高(px):
                            <input type="text" class="form-control" style="display:inline;width:150px;"
                                   name="mark_setting[height]"
                                   value="<?php echo (isset($mark_setting['height']) && ($mark_setting['height'] !== '')?$mark_setting['height']:'300'); ?>">

                          </div>
                      </div>
                      <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">水印图片:</label>
                          <div class="col-md-6 col-sm-10">
                              <input type="text" class="form-control"
                                     name="mark_setting[mark]"
                                     value="<?php echo (isset($mark_setting['mark']) && ($mark_setting['mark'] !== '')?$mark_setting['mark']:'mark.png'); ?>">
                              [直接填写文件名，图片放在upload/mark目录下]
                          </div>
                      </div>
                      <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">水印透明度:</label>
                          <div class="col-md-6 col-sm-10">
                            <input type="text" class="form-control"
                                   name="mark_setting[transparency]"
                                   value="<?php echo (isset($mark_setting['transparency']) && ($mark_setting['transparency'] !== '')?$mark_setting['transparency']:'100'); ?>">
                            [请设置为0-100之间的数字，0代表完全透明，100代表不透明]
                          </div>
                      </div>
                      <div class="form-group">
                          <label for="input-cdn_static_root" class="col-sm-2 control-label">水印位置:</label>
                          <div class="col-md-6 col-sm-10">
                            <input type="radio" style="margin-left:10px;"
                                   name="mark_setting[location]"
                                   value="1" <?php if($mark_setting['location'] == 1): ?>checked<?php endif; ?> />
                            左上角
                            <input type="radio" style="margin-left:10px;"
                                   name="mark_setting[location]"
                                   value="2" <?php if($mark_setting['location'] == 2): ?>checked<?php endif; ?>>
                            上居中
                            <input type="radio" style="margin-left:10px;"
                                   name="mark_setting[location]"
                                   value="3" <?php if($mark_setting['location'] == 3): ?>checked<?php endif; ?>>
                            右上角
                          </div>
                          <div class="col-md-6 col-sm-10" style="margin-top:15px;">
                            <input type="radio" style="margin-left:10px;"
                                   name="mark_setting[location]"
                                   value="4" <?php if($mark_setting['location'] == 4): ?>checked<?php endif; ?> >
                            左居中
                            <input type="radio" style="margin-left:10px;"
                                   name="mark_setting[location]"
                                   value="5" <?php if($mark_setting['location'] == 5): ?>checked<?php endif; ?>>
                            中居中
                            <input type="radio" style="margin-left:10px;"
                                   name="mark_setting[location]"
                                   value="6" <?php if($mark_setting['location'] == 6): ?>checked<?php endif; ?>>
                            右居中
                          </div>
                          <div class="col-md-6 col-sm-10" style="margin-top:15px;margin-left:205px;">
                            <input type="radio" style="margin-left:10px;"
                                   name="mark_setting[location]"
                                   value="7" <?php if($mark_setting['location'] == 7): ?>checked<?php endif; ?>>
                           左下角
                            <input type="radio" style="margin-left:10px;"
                                   name="mark_setting[location]"
                                   value="8" <?php if($mark_setting['location'] == 8): ?>checked<?php endif; ?>>
                            下居中
                            <input type="radio" style="margin-left:10px;"
                                   name="mark_setting[location]"
                                   value="9" <?php if($mark_setting['location'] == 9): ?>checked<?php endif; ?>>
                            右下角
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                              <button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0">
                                  <?php echo lang('SAVE'); ?>
                              </button>
                          </div>
                      </div>
                    </div>
                </div>
            </div>
        </fieldset>
    </form>

</div>
<script type="text/javascript" src="/static/js/admin.js"></script>
<script type="text/javascript">
    $(function () {
        $('.btn-cancel-thumbnail').click(function () {
            $('#thumbnail-preview').attr('src', '/themes/admin/public/assets/images/default-thumbnail.png');
            $('#thumbnail').val('');
        });

    });
</script>
</body>
</html>
