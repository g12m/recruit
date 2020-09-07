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
