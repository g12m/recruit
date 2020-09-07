<<<<<<< HEAD
<<<<<<< HEAD
var swiper = new Swiper('.banner .swiper-container', {
    spaceBetween: 30,
    centeredSlides: true,
    loop:true,
    autoplay: {
        delay: 2500,
        disableOnInteraction: false,
    },
});

// 首页定位
// var xitong = document.querySelector(".xitong .jishi");
// var shang = document.querySelector(".chengji");
// if(xitong != null){
//     xitong.style.height=shang.offsetHeight+"px";
// }

// 产品展示
var chanZ1=document.querySelector(".ch_l_1");
var chanZ2=document.querySelector(".ch_l_2");
var chanZ3=document.querySelector(".ch_l_3");
var chanY1=document.querySelector(".ch_r_1");
var chanY2=document.querySelector(".ch_r_2");
var chanY3=document.querySelector(".ch_r_3");

var uiy=document.querySelector(".ch_r_3 .fl")
var yiu=document.querySelector(".ch_r_3 .fr")
if(chanZ1 != null){
    chanY1.style.height=chanZ1.offsetHeight+"px";
    chanY2.style.height=chanZ2.offsetHeight+"px";
    chanY3.style.height=chanZ3.offsetHeight+"px";
    yiu.style.height=uiy.offsetHeight+"px";
}

// 返回顶部
$(".go_top").click(function() {
    if($(window).scrollTop() > 0) {
        $("html,body").stop().animate({
            scrollTop: 0
        }, 600);
    }
});
var abs=document.querySelectorAll(".about-top .bottom .img");
var txts=document.querySelectorAll(".about-top .bottom .text");
var pas=document.querySelectorAll(".about-top .bottom .text p");
if(abs.length>0){
    var abhei=abs[0].offsetHeight;
    for(var i=0;i<abs.length;i++){
        abs[i].style.height=abhei+"px";
        txts[i].style.height=abhei+"px";
        var phe=pas[i].offsetHeight;
        txts[i].style.paddingTop=(abhei-phe)/2+"px";
    }
}

// 导航响应式
var guantan=document.querySelector(".header-xiang .fr");
var xitop=document.querySelector(".header-xiang")
var iis=document.querySelectorAll(".header-xiang .fr i");
var heabot=document.querySelector(".xiang-bottom");
if(guantan != null){
    guantan.onclick=function () {
        console.log(heabot)
        if(heabot.className == "xiang-bottom"){
            heabot.className="xiang-bottom active";
            iis[0].style.display="none";
            iis[1].style.display="block";
            xitop.style.background="rgba(0,0,0,0.6)";
        }else {
            heabot.className="xiang-bottom";
            iis[1].style.display="none";
            iis[0].style.display="block";
            xitop.style.background="rgba(0,0,0,0.3)";
        }
    }
}


=======
window.onload = function () {
    // layUI加载模块
    layui.use('element', function () {
        var element = layui.element;
    });
    layui.use('form', function () {});
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#timestart-kb',
            type: 'datetime',
            format: 'MM-dd HH:mm',
            min: ""
        });
        laydate.render({
            elem: '#timeend-kb',
            type: 'datetime',
            format: 'MM-dd HH:mm',
            min: ""
        });
        laydate.render({
            elem: '#timestart-zw',
            type: 'datetime',
            format: 'MM-dd HH:mm',
            min: ""
        });
        laydate.render({
            elem: '#timeend-zw',
            type: 'datetime',
            format: 'MM-dd HH:mm',
            min: ""
        });
    });
>>>>>>> dev

    layui.use('layer', function () {
        var layer = layui.layer;
        $('.schc').click(function () {
            layer.open({
                type: 1,
                title: '删除会场',
                content: $('#schc'),
                area: '500px'
            });
        })
        $('#schc .qx').click(function () {
            layer.close(layer.index)
        })
        $('#schc .qr').click(function () {
            var id = $('.h_id').val();
            $.ajax({
                url: "/portal/Confer/delete",
                data: {"id":id},
                type: "post",
                async: true,
                success: function (data) {
                    if (data == '1') {
                        layer.msg('删除成功!');
                        var path = "/portal/Confer/index";
                       location.href = path;
                    } 
                }
            });
            layer.close(layer.index)
        })

        $('.fb').click(function () {
            layer.open({
                type: 1,
                title: '发布职位',
                content: $('#fb'),
                area: '600px'
            });
        })
        $('#fb .qx').click(function () {
            layer.close(layer.index)
        })
        $('#fb .qr').click(function () {
            console.log('发布成功')
            layer.close(layer.index)
        })

        $('.ch').click(function () {
            layer.open({
                type: 1,
                title: '撤回职位',
                content: $('#ch'),
                area: '600px'
            });
        })
        $('#ch .qx').click(function () {
            layer.close(layer.index)
        })
        $('#ch .qr').click(function () {
            console.log('发布成功')
            layer.close(layer.index)
        })
    });

    // 滚动字幕配置项
    $(".txtMarquee-top").slide({
        mainCell: ".bd ul",
        autoPlay: true,
        effect: "topMarquee",
        vis: 5,
        interTime: 50,
        trigger: "click"
    });

<<<<<<< HEAD
=======
var swiper = new Swiper('.banner .swiper-container', {
    spaceBetween: 30,
    centeredSlides: true,
    loop:true,
    autoplay: {
        delay: 2500,
        disableOnInteraction: false,
    },
});

// 首页定位
// var xitong = document.querySelector(".xitong .jishi");
// var shang = document.querySelector(".chengji");
// if(xitong != null){
//     xitong.style.height=shang.offsetHeight+"px";
// }

// 产品展示
var chanZ1=document.querySelector(".ch_l_1");
var chanZ2=document.querySelector(".ch_l_2");
var chanZ3=document.querySelector(".ch_l_3");
var chanY1=document.querySelector(".ch_r_1");
var chanY2=document.querySelector(".ch_r_2");
var chanY3=document.querySelector(".ch_r_3");

var uiy=document.querySelector(".ch_r_3 .fl")
var yiu=document.querySelector(".ch_r_3 .fr")
if(chanZ1 != null){
    chanY1.style.height=chanZ1.offsetHeight+"px";
    chanY2.style.height=chanZ2.offsetHeight+"px";
    chanY3.style.height=chanZ3.offsetHeight+"px";
    yiu.style.height=uiy.offsetHeight+"px";
}

// 返回顶部
$(".go_top").click(function() {
    if($(window).scrollTop() > 0) {
        $("html,body").stop().animate({
            scrollTop: 0
        }, 600);
    }
});
var abs=document.querySelectorAll(".about-top .bottom .img");
var txts=document.querySelectorAll(".about-top .bottom .text");
var pas=document.querySelectorAll(".about-top .bottom .text p");
if(abs.length>0){
    var abhei=abs[0].offsetHeight;
    for(var i=0;i<abs.length;i++){
        abs[i].style.height=abhei+"px";
        txts[i].style.height=abhei+"px";
        var phe=pas[i].offsetHeight;
        txts[i].style.paddingTop=(abhei-phe)/2+"px";
    }
}

// 导航响应式
var guantan=document.querySelector(".header-xiang .fr");
var xitop=document.querySelector(".header-xiang")
var iis=document.querySelectorAll(".header-xiang .fr i");
var heabot=document.querySelector(".xiang-bottom");
if(guantan != null){
    guantan.onclick=function () {
        console.log(heabot)
        if(heabot.className == "xiang-bottom"){
            heabot.className="xiang-bottom active";
            iis[0].style.display="none";
            iis[1].style.display="block";
            xitop.style.background="rgba(0,0,0,0.6)";
        }else {
            heabot.className="xiang-bottom";
            iis[1].style.display="none";
            iis[0].style.display="block";
            xitop.style.background="rgba(0,0,0,0.3)";
        }
    }
}







>>>>>>> dev2
=======
    // 城市职位需求图表配置项
    // echarts.init($('#echart1')[0]).setOption({
    //     title: {
    //         text: '城市区域职位需求',
    //         x: 'center'
    //     },
    //     tooltip: {},
    //     legend: {
    //         data: ['地区']
    //     },
    //     xAxis: {
    //         data: ["锦江区", "青羊区", "成华区", "金牛区", "武侯区", "龙泉驿", "新都区", "温江区"],
    //         axisLabel: {
    //             textStyle: {
    //                 fontSize: 11
    //             }
    //         }
    //     },
    //     yAxis: {},
    //     series: [{
    //         name: '职位数量',
    //         type: 'bar',
    //         data: [710, 666, 500, 450, 300, 220, 100, 150],
    //         axisLabel: {
    //             textStyle: {
    //                 fontSize: 10
    //             }
    //         }
    //     }],
    //     grid: {
    //         right: '3%',
    //         left: '10%',
    //         top: '10%',
    //         bottom: '10%',
    //     }
    // });
}
>>>>>>> dev
