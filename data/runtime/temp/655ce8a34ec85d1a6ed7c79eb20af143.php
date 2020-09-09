<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:43:"themes/index/portal\scheduling\article.html";i:1599643970;s:76:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\con_left.html";i:1599568033;}*/ ?>

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



<?php dump($_SERVER['PHP_SELF']);?>
  <div class="layui-side layui-bg-black" style="background: url(/themes/index/public/assets/images/default/navbg.png);">
    <div class="layui-logo"><img src="/themes/index/public/assets/images/default/logo.png" alt=""></div>
    <div class="layui-side-scroll">
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item"><a href="<?php echo url('portal/msg/kanban'); ?>"><img src="/themes/index/public/assets/images/default/icon_kb.png"
              alt="">招聘大看板 <span class="jian">></span></a></li>
        <li class="layui-nav-item layui-nav-itemed layui-this"><a href="<?php echo url('portal/Scheduling/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_pq.png"
              alt=""> 排期管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item  "><a href="<?php echo url('portal/confer/index'); ?>"><img
              src="/themes/index/public/assets/images/default/icon_hc.png" alt=""> 会场管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="/sch_position"><img src="/themes/index/public/assets/images/default/icon_zw.png"
              alt=""> 职位管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/resume/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_jl.png"
              alt=""> 简历管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/Sturole/index'); ?>"><img src="/themes/index/public/assets/images/default/icon_js.png"
              alt=""> 角色管理 <span class="jian">></span></a></li>
        <li class="layui-nav-item"><a href="<?php echo url('portal/Sturole/pindex'); ?>"><img src="/themes/index/public/assets/images/default/icon_ry.png"
              alt=""> 人员管理 <span class="jian">></span></a></li>
      </ul>
    </div>
  </div>

        <!-- 主体部分 -->
        <div class="layui-body">
            <div class="RightBody">
                <div class="xq-title layui-clear m">
                    <?php if(is_array($article) || $article instanceof \think\Collection || $article instanceof \think\Paginator): if( count($article)==0 ) : echo "" ;else: foreach($article as $key=>$vo): ?>
                    
                    <div class="xq-h"><?php echo $vo['title']; ?></div>
                    <div class="riqi">
                       
                        <?php 
                            $res=json_decode($vo['alt_time'],true);
                            $status=get_gltime($vo['id'])['status'];
                         if($status==1): if(empty($confer['fair_time']) || (($confer['fair_time'] instanceof \think\Collection || $confer['fair_time'] instanceof \think\Paginator ) && $confer['fair_time']->isEmpty())): ?>
                        <i>【备选日期】
                            <?php if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v): ?>
                                <span><?php echo date("m/d H:i",$v); ?></span>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </i>
                            <?php else: ?>
                        <i>【开始日期】
                             
                                <span><?php echo date("m/d H:i",$confer['fair_time']); ?></span>
                              
                        </i>
                        <?php endif; else: ?>
                        <i>【备选日期】
                            <?php if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v): ?>
                                <span><?php echo date("m/d H:i",$v); ?></span>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </i>
                        <?php endif; ?>
                        <i>【截止日期】<span><?php echo date("m/d H:i",$vo['dea_time']); ?></span></i>
                        <?php if($status==1): ?>
                        <i>【关联日期】<span><?php echo date("m/d H:i",$confer['time']); ?></span></i>
                        <?php endif; ?>
                        <i>【招聘人数】<span><?php echo $vo['num']; ?>人</span></i>
                        <i>【预约人数】<span><?php echo $vo['app_num']; ?>人</span></i>
                        <i>【投递简历】<span>5份 <?php echo get_userlist_info($vo['uid'])['ent_name'];?></span></i>
                    </div>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    <div class="btns">
                       
                        <?php if($status==2): ?>
                            <button class="layui-btn btn-gl glzph" id="<?php echo $vo['id']; ?>">关联</button>
                            <?php elseif($status==1): ?>
                                <button class="layui-btn qxgl">取消关联</button>
                                <input type="hidden" value="<?php echo $vo['id']; ?>" class="qxyy">
                                <?php else: ?>
                                <button class="layui-btn btn-gl glzph" id="<?php echo $vo['id']; ?>">关联</button>
                                <!-- <button class="layui-btn btn-ysx">已失效</button> -->
                        <?php endif; ?>
                    
                    </div>
                    <div class="rightlogo">
                        <img src="/themes/index/public/assets/images/default/phone.png" alt="">
                        <div class="right">
                            <p class="rname">企业联系人：<?php echo get_userlist_info($vo['uid'])['user_name'];?></p>
                            <a class="rphone" href="tel:<?php echo get_userlist_info($vo['uid'])['phone'];?>"><?php echo get_userlist_info($vo['uid'])['phone'];?></a>
                        </div>
                    </div>
                </div>
                <div class="pqxq">
                    <div class="xx">
                        <div class="xx-title">
                            <div class="a">招聘职位</div>
                        </div>
                        <div class="xx-list">
                            <?php if(is_array($article) || $article instanceof \think\Collection || $article instanceof \think\Paginator): if( count($article)==0 ) : echo "" ;else: foreach($article as $key=>$vo): if(is_array($vo['pos_ids']) || $vo['pos_ids'] instanceof \think\Collection || $vo['pos_ids'] instanceof \think\Paginator): if( count($vo['pos_ids'])==0 ) : echo "" ;else: foreach($vo['pos_ids'] as $key=>$v): $res=get_zhi_info($v['pos_id']);if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v3): ?>
                            <div class="xx-box">
                                <div class="xx-box-h"><?php echo $v3['title']; ?></div>
                                <div class="xx-box-m">
                                    <i>【建议专业】<span><?php echo $v3['major']; ?></span></i>
                                    <i>【招聘人数】<span><?php echo $v3['num']; ?>人</span></i>
                                    <i>【薪资范围】<span><?php echo $v3['salary_min']; ?>~<?php echo $v3['salary_max']; ?></span></i>
                                    <i>【有效期】<span><?php echo date("Y年m月d日",$v3['effective_time']); ?></span></i>
                                </div>
                                <div class="xx-box-yq">
                                    <b>职位描述</b>
                                    <p><?php echo $v3['desc']; ?></p>
                                  
                                </div>
                            </div>
                            <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <div class="right-xx">
                        <div class="rxx-h">招聘会直播</div>
                        <img class="ewm" src="/themes/index/public/assets/images/default/ewm.png" alt="">
                        <div class="rxx-p">
                            <?php 
                             $list=get_hui($confer['h_id']);
                            ?>
                          
                            <span class="pl">【地点】<?php echo $list['address']; ?></span>
                            <span class="pr">【容纳人数】<?php echo $list['num']; ?>人</span>
                        </div>
                        <button class="layui-btn btn-qx">微信扫一扫</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="glzph" class="tc">
        <form action="">
            <div class="layui-form-item">
                <span class="layui-form-label">选择时间：</span>
                <div class="layui-input-block alttime">
                    <label for="time1" class="linput check">
                        <input type="radio" name="time" value="2020年09月10日 13:00" id="time1" checked>2020年09月10日 13:00
                    </label>
                </div>
            </div>
            <p style="font-size:14px;color:#707070;font-weight: 100;">以上为企业备选时间，请关联后与企业相关负责人联系，确定最终时间</p>
            <div class="layui-btn btn-qx qx">取消</div>
            <div class="layui-btn next">下一步</div>
        </form>
    </div>
    <div id="next" class="tc">
        <form action="">
            <table class="layui-table" lay-skin="line">
                <thead>
                    <tr>
                        <th>地点</th>
                        <th>容纳人数</th>
                    </tr>
                </thead>
                <tbody class="hcxx">
                    <tr>
                        <td><label for="A101"><input type="radio" name="room" id="A101" value="A101">A101</label></td>
                        <td>30人</td>
                    </tr>
    
                </tbody>
            </table>
            <div class="layui-btn btn-qx prev">上一步</div>
            <button class="layui-btn qr" lay-submit>确定</button>
        </form>
    </div>
</body>

</html>



