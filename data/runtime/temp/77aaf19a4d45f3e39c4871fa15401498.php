<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:37:"themes/index/portal\confer\index.html";i:1599358248;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <ul>
        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
       
            <li>场地：<?php echo $vo['address']; ?>--容纳人数<?php echo $vo['num']; ?>---招聘排期
                <?php $num=get_pqnum($vo['id']);if(empty($num) || (($num instanceof \think\Collection || $num instanceof \think\Paginator ) && $num->isEmpty())): ?>
                    无
                <?php else: ?>
                  <?php echo $num; ?>场
                <?php endif; ?>
            </li>

        <?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
 
</body>
</html>