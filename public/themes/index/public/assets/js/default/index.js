



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
                    if(data==2)
                    {
                            layer.alert('该会场有关联的招聘会，请取消关联后删除', { icon: 2 })
                        // layer.msg('下面有关联!');
                    }
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
         
            var q_id = $('.q_id').val();
            var sch_id = $('.sch_id').val();
            $.ajax({
                url: "/portal/sch_position/release",
                data: {"id": q_id,"sch_id":sch_id},
                type: "post",
                async: true,
                success: function (data) {
                    if (data == '1') {
                        layer.msg('发布成功!');
                        var path = '/portal/sch_position/article/id/'+q_id;
                        location.href = path;
                    }
                }
            });
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
            var q_id = $('.q_id').val();
            var sch_id = $('.sch_id').val();
            $.ajax({
                url: "/portal/sch_position/withdraw",
                data: { "id": q_id, "sch_id": sch_id },
                type: "post",
                async: true,
                success: function (data) {
                    if (data == '1') {
                        layer.msg('撤回成功!');
                        var path = '/portal/sch_position/article/id/' + q_id;
                        location.href = path;
                    }
                }
            });
          

            layer.close(layer.index)
        })
        $('.fbtz').click(function () {
            layer.open({
                type: 1,
                title: '发布通知',
                content: $('#fbtz'),
                area: '750px'
            });
        })
        $('#fbtz .qx').click(function () {
            layer.close(layer.index)
        })
        $('#fbtz .qr').click(function () {
            console.log('发布成功')
            layer.close(layer.index)
        })
        $('.xjhc').click(function () {
            layer.open({
                type: 1,
                title: '新建会场',
                content: $('#xjhc'),
                area: '400px'
            });
        })
        $('#xjhc .qx').click(function () {
            layer.close(layer.index)
        })
        $('#xjhc .qr').click(function () {
            var address = $('.address').val();
            var num = $('.num').val();
           
                $.ajax({
                    url: "/portal/confer/addpost",
                    data: { "address": address, "num": num },
                    type: "post",
                    async: true,
                    success: function (data) {
                        if (data == '1') {
                            layer.msg('新建成功!');
                            var path = '/portal/confer/index';
                            location.href = path;
                        }
                        if(data=='2')
                        {
                            layer.msg('新建失败!');
                        }
                    }
                });
          
           
         
            layer.close(layer.index)
        })

        $('.qxgl').click(function () {
            layer.prompt({
                formType: 2,
                value: '取消原因',
                title: '取消关联',
                area: ['500px', '200px']
            }, function (value, index, elem) {
                alert(value);
                layer.close(index);
            });
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

    $('#fbtz .linput').click(function () {
        $('#fbtz .linput').eq($(this).index()).addClass("check").siblings().removeClass('check');
    })

    // // 图片上传预览
    // $("#yyzz").change(function () {
    //     var objUrl = getObjectURL(this.files[0]); //获取文件信息
    //     console.log("objUrl = " + objUrl);
    //     if (objUrl) {
    //         $(".img").attr("src", objUrl);
    //     }
    // });
    // function getObjectURL(file) {
    //     var url = null;
    //     if (window.createObjectURL != undefined) {
    //         url = window.createObjectURL(file);
    //     } else if (window.URL != undefined) {
    //         url = window.URL.createObjectURL(file);
    //     } else if (window.webkitURL != undefined) {
    //         url = window.webkitURL.createObjectURL(file);
    //     }
    //     return url;
    // }





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

