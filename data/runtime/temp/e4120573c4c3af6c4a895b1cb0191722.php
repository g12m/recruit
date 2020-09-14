<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"themes/index/portal\zhibosch\index.html";i:1599811683;}*/ ?>
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
<script src="/themes/index/public/assets/js/default/jquery-1.11.3.min.js"></script>
<script src='/themes/index/public/assets/css/default/layui/layui.js'></script>
<script src='/themes/index/public/assets/js/default/SuperSlide.js'></script>
<script src='/themes/index/public/assets/js/default/index.js'></script>

<body style="background: url(/themes/index/public/assets/images/default/bg_clear.jpg)" class="zhibo">
    <style>
        html {
            width: 100%;
            height: 100%;
        }
    </style>
    <div class="header">
        <img src="/themes/index/public/assets/images/default/logo_h.png" alt="">
    </div>
<div class="mine">
    <div class="zb">
        <?php $list=get_job($id);if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
        <div class="zb-h"><?php echo $vo['title']; ?></div>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        <p><i class="layui-icon layui-icon-user"></i> <span>1300人</span></p>
        <div class="pm" id="video-container">
            <!-- 直播画面 -->
        </div>
    </div>
    <div class="zbxx">
        <div class="zbxx-h">招聘职位</div>
        <div class="zwlist">
            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): if(is_array($vo['pos_ids']) || $vo['pos_ids'] instanceof \think\Collection || $vo['pos_ids'] instanceof \think\Paginator): if( count($vo['pos_ids'])==0 ) : echo "" ;else: foreach($vo['pos_ids'] as $key=>$v): $res=get_zhi_info($v['pos_id']);if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v3): ?>
                <p><span class="zwname"><?php echo $v3['title']; ?></span><span class="xs"><?php echo $v3['type']==1?"正式":"实习"?></span><span class="doing">正在讲解</span></p>
                    <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
        </div>
        <div class="ewmword">
            <img class="ewm" src="/themes/index/public/assets/images/default/ewm.png" alt="">
            <p class="ewmms">微信扫描二维码查看职位描述</p>
        </div>
    </div>
</div>
   
    <input type="hidden" id="zphid" value="<?php echo $id; ?>">
    <script>
        function start(){
            var name = 'entzph'+$("#zphid").val();
            $.post("<?php echo cmf_url('zhibosch/getLiveStream'); ?>",{'name':name},
            function(data){
                console.log(data)
                var html = '<p>服务器：'+data.live1+'&nbsp;&nbsp;&nbsp;&nbsp;串流密钥：'+data.live2+'</p>&nbsp;&nbsp;&nbsp;&nbsp;播放地址：'+data.obsurl
                $("#urladd").html(html)
            })
        }
    </script>
    <script src="https://imgcache.qq.com/open/qcloud/video/vcplayer/TcPlayer-2.3.2.js"></script>
    <script>
        (function () {
            function getParams(name) {
                var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    
                var r = window.location.search.substr(1).match(reg);
                if (r != null) {
                    return decodeURIComponent(r[2]);
                }
                return null;
            }
    
            function getPathParams() {
                var path = location.pathname.split('/');
                if (path[1] == 'vod-player') {
                    return {
                        'path': location.origin + path.slice(0, 4).join('/'),
                        'appid': path[2],
                        'fileid': path[3]
                    }
                } else {
                    return null;
                }
            }
    
            var rtmp = getParams('rtmp'),
                flv = getParams('flv'),
                m3u8 = getParams('m3u8'),
                mp4 = getParams('mp4'),
                live = (getParams('live') == 'true' ? true : false),
                coverpic = getParams('coverpic'),
                width = getParams('width'),
                height = getParams('height'),
                volume = getParams('volume'),
                flash = (getParams('flash') == 'true' ? true : false),
                x5_player = (getParams('x5_player') == 'false' ? false : true),
                h5_flv = (getParams('h5_flv') == 'true' ? true : false),
                autoplay = (getParams('autoplay') == 'true' ? true : false),
                flashUrl = (function () {
                    var params = getPathParams();
                    if (params) {
                        return params.path + '/player/release/QCPlayer.swf';
                    }
                    return '//imgcache.qq.com/open/qcloud/video/player/release/QCPlayer.swf'
                })(),
                log = getParams('log');
            /**
             * 视频类型播放优先级
             * mobile ：m3u8>mp4
             * PC ：RTMP>flv>m3u8>mp4
             */
    
            var options = {
                m3u8: 'http://live.cdsln.club/live/entzph7.m3u8' ,
                autoplay: autoplay,
                live: live,
                width: width,
                height: height,
                volume: volume,
                flash: flash,
                flashUrl: flashUrl,
                x5_player: x5_player,
                h5_flv: h5_flv,
                wording: {
                    2032: '请求视频失败，请检查网络',
                    2048: '请求m3u8文件失败，可能是网络错误或者跨域问题'
                },
                listener: function (msg) {
                    if(msg.type == 'load') {
                        var _div = document.createElement('div');
                        _div.className = 'marker';
                        _div.innerText = '测试';
                        document.querySelector('.vcp-player').appendChild(_div)
                    }
                }
            };
            window.tcplayer = new TcPlayer('video-container', options);
    
        })();
    </script>
</body>

</html>