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
            format: 'MM/dd HH:mm',
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
                    var fair_id = $('.qxyy').val();
                    $.ajax({
                        url: "/portal/scheduling/dis",
                        data: {"value": value,'fair_id':fair_id},
                        type: "post",
                        async: true,
                        success: function (data) {
                           if(data==1)
                           {
                               layer.msg('取消关联');
                               var path = '/portal/scheduling/article/id' + fair_id;
                               location.href = path;
                           }
                        }
                    });
                   
                layer.close(index);
            });
        })
        $('.glzph').click(function () {
            layer.open({
                type: 1,
                title: '关联招聘会',
                content: $('#glzph'),
                area: '750px'
            });
            var lid=$(this).attr('id');
         
            $.ajax({
                url: "/portal/scheduling/ajax_guan",
                data: { "lid": lid},
                type: "post",
                async: true,
                success: function (data) {
                    var res = data
                    var html = ''
                  
             
                    $.each(res,function(k,v){
                       
                        var vt=format(v*1000,'YYYY年MM月DD日 hh:mm')
                            html += '<label for="time' + k + '" class="linput">'
                            + '<input type="radio" name="time" value="' + v + '" id="time' + k + '" >'+'<input type="hidden" value="' + lid + '" class="lid">' + vt + '</label>'
                    })
                    $(".alttime").text('')
                    $(".alttime").append(html)
                    qiehuan()
                }
            });
            
        })
        $('#glzph .qx').click(function () {

            layer.close(layer.index)
        })
        $('#glzph .next').click(function () {
            layer.close(layer.index)
            layer.open({
                type: 1,
                title: '关联招聘会',
                content: $('#next'),
                area: '750px'
            });
          
            $.ajax({
                url: "/portal/scheduling/ajax_hui",
                type: "post",
                async: true,
                success: function (data) {
                    var res = data
                    var html = ''
                    $.each(res, function (k, v) {
                        console.log(v)
                        html += '<tr >'
                            + '<td><label for="' + v.address +'" class="h_id"><input type="radio"  name="room" id="'+v.address+'" value="'+v.id+'">'+v.address+'</label></td>'
                            +'<td>'+v.num+'</td>'
                             +'</tr>'   
                    })
                     $(".hcxx").text('')
                     $(".hcxx").append(html)
                    // qiehuan()
                }
            });
        
        })
        $('#next .prev').click(function () {
            layer.close(layer.index)
            layer.open({
                type: 1,
                title: '关联招聘会',
                content: $('#glzph'),
                area: '750px'
            });
        })
        $('#next .qr').click(function () {
            var nid = $('.check').children().val();
            var id = $('.lid').val();
            var h_id = $("[name='room']:checked").val();
            if (h_id ==undefined)
            {
                layer.close(layer.index) 
            }
            else{
                if (nid == undefined)
                {
                    nid=0;
                }
            
                $.ajax({
                    url: "/portal/scheduling/relation",
                    data: {"nid": nid,"id":id,"h_id":h_id},
                    type: "post",
                    async: true,
                    success: function (data) {
                        if(data==1)
                        {
                            layer.msg('关联成功')
                        }
                        // qiehuan()
                    }
                });
        
                layer.close(layer.index)  
            }
           
        })

        $('.yyms').click(function () {
            layer.open({
                type: 1,
                title: '预约面试',
                content: $('#yyms'),
                area: '500px'
            });
        })
        $('#yyms .qx').click(function () {
            layer.close(layer.index)
        })
        $('#yyms .qr').click(function () {
            console.log('预约成功')
            layer.close(layer.index)
        })

        $('.tjzpzw').click(function () {
            layer.open({
                type: 1,
                title: '添加招聘职位',
                content: $('#tjzpzw'),
                area: '750px'
            });
        })
        $('#tjzpzw .qx').click(function () {
            layer.close(layer.index)
        })
        $('#tjzpzw .qr').click(function () {
            console.log('添加成功')
            layer.close(layer.index)
        })

        $('.sfjjw').click(function () {
            layer.open({
                type: 1,
                title: '确认交换',
                content: $('#sfjjw'),
                area: '500px'
            });
        })
        $('#sfjjw .qx').click(function () {
            layer.close(layer.index)
        })
        $('#sfjjw .qr').click(function () {
            console.log('交换成功')
            layer.close(layer.index)
        })

        $('.bjm').click(function () {
            layer.open({
                type: 1,
                title: '编辑名称',
                content: $('#bjm'),
                area: '500px'
            });
            var rid = $(this).attr('id');
             
              
            $.ajax({
                url: "/portal/sturole/edit",
                data: {"rid": rid },
                type: "post",
                async: true,
                success: function (data) {
                    var res = data
                
                    var html = ''


                    // $.each(res, function (k, v) {
                        html += '<div class="layui-form-item">'
                            +' <label class="layui-form-label">名称：</label>'
                            + ' <div class="layui-input-block">'
                            + ' <input type="text" name="name" id="rname" required lay-verify="required" autocomplete="off" class="layui-input" value = "'+res+'">'
                            +'</div>'
                            +'</div>'
                            + '<div class="layui-btn btn-qx qx">取消</div>'
                            + '<button class="layui-btn qr"> 确认</button >'
                      
                    // })
                    $(".erole").text('')
                    $(".erole").append(html)
                    $('#bjm .qx').click(function () {
                        layer.close(layer.index)
                    })
                    $('#bjm .qr').click(function () {
                        var r_name = $("#rname").val();
                        
                        console.log('编辑成功')
                        layer.close(layer.index)
                    })
                    // qiehuan()
                }
            });
            // return false;
        })
        

        $('.tjjs').click(function () {
            layer.open({
                type: 1,
                title: '添加角色',
                content: $('#tjjs'),
                area: '500px'
            });
        })
        $('#tjjs .qx').click(function () {
            layer.close(layer.index)
        })
        $('#tjjs .qr').click(function () {
            var id = $('#role').val();
            console.log(id);
            $.ajax({
                url: "/portal/sturole/addpost",
                data: {"name": id},
                type: "post",
                async: true,
                success: function (data) {
                    if (data == 1) {
                        layer.msg('添加成功')
                    }
                    // qiehuan()
                }
            });
       
            layer.close(layer.index)
        })

        $('.tjry').click(function () {
            layer.open({
                type: 1,
                title: '添加人员',
                content: $('#tjry'),
                area: '500px'
            });
        })
        $('#tjry .qx').click(function () {
            layer.close(layer.index)
        })
        $('#tjry .qr').click(function () {
            console.log('编辑成功')
            layer.close(layer.index)
        })

        $('.bjry').click(function () {
            layer.open({
                type: 1,
                title: '编辑人员',
                content: $('#bjry'),
                area: '500px'
            });
        })
        $('#bjry .qx').click(function () {
            layer.close(layer.index)
        })
        $('#bjry .qr').click(function () {
            console.log('编辑成功')
            layer.close(layer.index)
        })

        $('.bjsq').click(function () {
            layer.open({
                type: 1,
                title: '编辑权限',
                content: $('#bjsq'),
                area: '300px'
            });
        })
        $('#bjsq .qx').click(function () {
            layer.close(layer.index)
        })
        $('#bjsq .qr').click(function () {
            console.log('编辑成功')
            layer.close(layer.index)
        })

        $('.cbjm').click(function () {
            layer.open({
                type: 1,
                title: '编辑名称',
                content: $('#cbjm'),
                area: '500px'
            });
        })
        $('#cbjm .qx').click(function () {
            layer.close(layer.index)
        })
        $('#cbjm .qr').click(function () {
            console.log('编辑成功')
            layer.close(layer.index)
        })

        $('.cbjsq').click(function () {
            layer.open({
                type: 1,
                title: '编辑权限',
                content: $('#cbjsq'),
                area: '300px'
            });
        })
        $('#cbjsq .qx').click(function () {
            layer.close(layer.index)
        })
        $('#cbjsq .qr').click(function () {
            console.log('编辑成功')
            layer.close(layer.index)
        })
        // 滚动字幕配置项
        $("#gun1").slide({
            mainCell: ".bd ul",
            autoPlay: true,
            effect: "topMarquee",
            vis: 5,
            interTime: 50,
            trigger: "click"
        });
        $("#gun2").slide({
            mainCell: ".bd ul",
            autoPlay: true,
            effect: "topMarquee",
            vis: 5,
            interTime: 50,
            trigger: "click"
        });

        $('.sczph').click(function(){
            var id = $(this).attr('data');
            layer.confirm('删除后不可恢复，是否仍然删除？',{title:'确认删除'}, function(index){
                $.ajax({
                    url: "/portal/Entfair/delfair",
                    data: {"id":id},
                    type: "post",
                    async: true,
                    success: function (data) {
                        history.go(-1)
                    }
                });
                layer.close(index);
              }); 
        })
        function qiehuan(){
            $('.tc .linput').click(function () {
            $('.tc .linput').eq($(this).index()).addClass("check").siblings().removeClass('check');
        })
        }
        qiehuan()

        // 鼠标移动显示退出按钮 点击返回上一页
        $('.dkb').mousemove(function () {
            $('.dkb .tuichu').fadeIn()
        });
        $('.dkb .tuichu').click(function () {
            history.go(-1)
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

    function format(time, format) {
        time = time ? new Date(time) : new Date();
        format = format || 'YYYY-MM-DD';
        function tf(i) {
            return (i < 10 ? '0' : '') + i;
        }
        return format.replace(/YYYY|MM|DD|hh|mm|ss|WW/g, function (a) {
            switch (a) {
                case 'YYYY':
                    return tf(time.getFullYear());
                case 'MM':
                    return tf(time.getMonth() + 1);
                case 'DD':
                    return tf(time.getDate());
                case 'mm':
                    return tf(time.getMinutes());
                case 'hh':
                    return tf(time.getHours());
                case 'ss':
                    return tf(time.getSeconds());
                case 'WW':
                    return ['日', '一', '二', '三', '四', '五', '六'][time.getDay()];
            }
        });
    };
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

