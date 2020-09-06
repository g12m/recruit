<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:41:"themes/index/portal\scheduling\index.html";i:1599303383;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table>
        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
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
    </table>
 
</body>
</html>