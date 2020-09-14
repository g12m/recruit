<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:35:"themes/index/portal\msg\kanban.html";i:1599651498;s:72:"E:\phpStudy\PHPTutorial\WWW\zhaopin\public\themes\index\public\head.html";i:1599877169;}*/ ?>
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
<script type="text/javascript">
  //全局变量
  var GV = {
    ROOT: "/",
    WEB_ROOT: "/",
    JS_ROOT: "static/js/"
  };
</script>
<script src="/static/js/wind.js"></script>

<body style="background: url(/themes/index/public/assets/images/default/bg_clear.jpg);" class="dkb">
    <script src="/themes/index/public/assets/js/default/echarts.min.js"></script>
    <div class="header">
        <div class="tuichu"><i class="layui-icon layui-icon-logout"></i> 退出</div>
    </div>
    <div class="mine">
        <div class="csqyzwxq">
            <!-- 城市区域职位需求表 -->
            <div id="echart1"></div>
        </div>
        <div class="hyxzfb">
            <!-- 行业薪资分布表 -->
            <div id="echart2"></div>
        </div>
        <div class="zpgdxx">
            <div id="gun1" class="Marquee">
                <div class="hd">
                    <p>近期校招企业展示 <span>地点</span></p>
                </div>
                <div class="bd">
                    <ul class="infoList">
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">8月29日 13:00</span><span class="bd-center">成都XX电子有限公司</span><span class="bd-right">A102</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">8月29日 13:00</span><span class="bd-center">成都XX电子有限公司</span><span class="bd-right">A102</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">8月29日 13:00</span><span class="bd-center">成都XX电子有限公司</span><span class="bd-right">A102</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">8月29日 13:00</span><span class="bd-center">成都XX电子有限公司</span><span class="bd-right">A102</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">8月29日 13:00</span><span class="bd-center">成都XX电子有限公司</span><span class="bd-right">A102</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">8月29日 13:00</span><span class="bd-center">成都XX电子有限公司</span><span class="bd-right">A102</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">8月29日 13:00</span><span class="bd-center">成都XX电子有限公司</span><span class="bd-right">A102</span></a></li>
                    </ul>
                </div>
            </div>
            <div id="gun2" class="Marquee">
                <div class="hd">
                    <p>近期校招职位 <span>薪资范围</span></p>
                </div>
                <div class="bd">
                    <ul class="infoList">
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">平面设计</span><span class="bd-right">5000~8000</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">平面设计</span><span class="bd-right">5000~8000</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">平面设计</span><span class="bd-right">5000~8000</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">平面设计</span><span class="bd-right">5000~8000</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">平面设计</span><span class="bd-right">5000~8000</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">平面设计</span><span class="bd-right">5000~8000</span></a></li>
                        <li class="layui-clear"><a href="javascrpit:;"><span class="bd-left">平面设计</span><span class="bd-right">5000~8000</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="Marquee">
                <div class="hd">
                    <p>校招预约二维码</p>
                </div>
                <div class="hd-ewm">
                    <div class="hd-ewm-box">
                        <img src="/themes/index/public/assets/images/default/ewm.png" alt="">
                        <p>北京秋季招聘会</p>
                    </div>
                    <div class="hd-ewm-box">
                        <img src="/themes/index/public/assets/images/default/ewm.png" alt="">
                        <p>北京秋季招聘会</p>
                    </div>
                    <div class="hd-ewm-box">
                        <img src="/themes/index/public/assets/images/default/ewm.png" alt="">
                        <p>北京秋季招聘会</p>
                    </div>
                    <div class="hd-ewm-box">
                        <img src="/themes/index/public/assets/images/default/ewm.png" alt="">
                        <p>北京秋季招聘会</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    // 城市职位需求图表配置项
    echarts.init($('#echart1')[0]).setOption({
        color: ['#049241'],
        title: {
            text: '城市区域职位需求'
        },
        tooltip: {},
        legend: {
            data: ['地区']
        },
        xAxis: {
            data: ["锦江区", "青羊区", "成华区", "金牛区", "武侯区", "龙泉驿", "新都区", "温江区"],
            axisLabel: {
                textStyle: {
                    fontSize: 14
                }
            }
        },
        yAxis: {},
        series: [{
            name: '职位数量',
            type: 'bar',
            data: [710, 666, 500, 450, 300, 220, 100, 150],
            axisLabel: {
                textStyle: {
                    fontSize: 12
                }
            }
        }],
        grid: {
            right: '3%',
            left: '5%',
            top: '10%',
            bottom: '10%',
        }
    });
    // 行业薪资分布表配置项
    echarts.init($('#echart2')[0]).setOption({
        color: ['#ff5700'],
        title: {
            text: '行业薪资分布'
        },
        tooltip: {},
        legend: {
            data: ['薪资']
        },
        xAxis: {
            data: ["金融", "互联网", "教育", "制造", "电气", "医疗", "建筑", "运输"],
            axisLabel: {
                textStyle: {
                    fontSize: 14
                }
            }
        },
        yAxis: {},
        series: [{
            name: '职位数量',
            type: 'bar',
            data: [998, 886, 777, 666, 555, 333, 234, 111],
            axisLabel: {
                textStyle: {
                    fontSize: 12
                }
            }
        }],
        grid: {
            right: '3%',
            left: '5%',
            top: '10%',
            bottom: '10%',
        }
    });
</script>
</html>