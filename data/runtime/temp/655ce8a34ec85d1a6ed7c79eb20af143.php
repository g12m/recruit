<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:43:"themes/index/portal\scheduling\article.html";i:1599469395;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table>
        <?php if(is_array($article) || $article instanceof \think\Collection || $article instanceof \think\Paginator): if( count($article)==0 ) : echo "" ;else: foreach($article as $key=>$vo): ?>
            <tr>
                <td>场地：<?php echo $vo['title']; ?></td>
                <td>招聘人数：<?php echo $vo['num']; ?></td>
                <td>招聘职位：
                    <?php if(is_array($vo['pos_ids']) || $vo['pos_ids'] instanceof \think\Collection || $vo['pos_ids'] instanceof \think\Paginator): if( count($vo['pos_ids'])==0 ) : echo "" ;else: foreach($vo['pos_ids'] as $key=>$v): ?>
    
                        <?php echo get_zhiwei_name($v['pos_id']);endforeach; endif; else: echo "" ;endif; ?>
                </td>
                <?php 
                    $res=json_decode($vo['alt_time'],true);
                 ?>
                <td>备选日期：
                    <?php if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v): ?>
                        <?php echo date("m-d H:i",$v); endforeach; endif; else: echo "" ;endif; ?>
                </td>
                <td>开启日期：<?php echo date("m-d H:i",$vo['time']); ?></td>
                <td>截止日期：<?php echo date("m-d H:i",$vo['dea_time']); ?></td>
               
                <td>预约人数：<?php echo $vo['app_num']; ?></td>
                <td>状态：<?php echo $vo['status']==1?'未关联':($vo['status']==2?"已关联":"已失效");?></td>
            </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
         <td>关联日期：<?php echo date("m-d H:i",$confer['time']); ?></td>
        <td>公司名字：A公司</td>
    </table>


    ----------------------------------
    招聘职位
<table>
    <?php if(is_array($article) || $article instanceof \think\Collection || $article instanceof \think\Paginator): if( count($article)==0 ) : echo "" ;else: foreach($article as $key=>$vo): if(is_array($vo['pos_ids']) || $vo['pos_ids'] instanceof \think\Collection || $vo['pos_ids'] instanceof \think\Paginator): if( count($vo['pos_ids'])==0 ) : echo "" ;else: foreach($vo['pos_ids'] as $key=>$v): $res=get_zhi_info($v['pos_id']);if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v3): ?>
    <tr>
        <td>职位名称：<?php echo $v3['title']; ?></td>
        <td>专业：<?php echo $v3['major']; ?></td>
        <td>招聘人数：
                 <?php echo $v3['num']; ?>
        </td>
      
        <td>职位类型：
        <?php echo $v3['type']==1?'正式':"实习";?>
        </td>
        <td>薪资范围：<?php echo $v3['salary_min']; ?>~<?php echo $v3['salary_max']; ?></td>
        <td>有效期：<?php echo date("Y年m月d日",$v3['effective_time']); ?></td>
    
        <td>职位描述：
            <?php echo $v3['desc']; ?>
        </td>
        
    </tr>
        <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
</table>
-----------------------------------
会场
<?php 
 $list=get_hui($confer['h_id']);
?>
地点：<?php echo $list['address']; ?>
容纳人数：<?php echo $list['num']; ?>
</body>
</html>



