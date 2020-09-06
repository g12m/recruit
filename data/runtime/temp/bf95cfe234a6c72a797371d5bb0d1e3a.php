<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"themes/index/portal\confer\article.html";i:1599357566;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <ul>
        
        
            <li>场地：<?php echo $article['address']; ?>--容纳人数<?php echo $article['num']; ?></li>
        
      
    </ul>
    ------------------------------------------------------------------
<table>
    <?php if(empty($zp) || (($zp instanceof \think\Collection || $zp instanceof \think\Paginator ) && $zp->isEmpty())): ?>
        未关联
        <?php else: if(is_array($zp) || $zp instanceof \think\Collection || $zp instanceof \think\Paginator): if( count($zp)==0 ) : echo "" ;else: foreach($zp as $key=>$vo): $res=get_job($vo['fair_id']);if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$v3): ?>
                
                <tr>
                    <td>招聘会名称：<?php echo $v3['title']; ?></td>
                    <td>关联日期：
                        <?php 
                            $time=get_zptime($v3['id']);
                         ?>
                        <?php echo date("m月d日 H:i",$time); ?></td>
                <td>招聘人数：<?php echo $v3['num']; ?></td>
                <td>招聘职位：
                    <?php if(is_array($v3['pos_ids']) || $v3['pos_ids'] instanceof \think\Collection || $v3['pos_ids'] instanceof \think\Paginator): if( count($v3['pos_ids'])==0 ) : echo "" ;else: foreach($v3['pos_ids'] as $key=>$v): ?>
                
                        <?php echo get_zhiwei_name($v['pos_id']);endforeach; endif; else: echo "" ;endif; ?>
                </td>
                <?php 
                    $restime=json_decode($v3['alt_time'],true);
                 ?>
                <td>备选日期：
                    <?php if(is_array($restime) || $restime instanceof \think\Collection || $restime instanceof \think\Paginator): if( count($restime)==0 ) : echo "" ;else: foreach($restime as $key=>$v): ?>
                        <?php echo date("m-d H:i",$v); endforeach; endif; else: echo "" ;endif; ?>
                </td>
                <td>开启日期：<?php echo date("m-d H:i",$v3['time']); ?></td>
              
             <td>预约人数：<?php echo $v3['app_num']; ?></td>
             <td>简历：</td>
            <td>公司名称：</td>
                </tr>
           
        <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; endif; ?>
</table>
</body>
</html>