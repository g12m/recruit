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
            console.log('删除成功')
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