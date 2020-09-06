<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:43:"themes/index/portal\sch_position\index.html";i:1599379115;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <ul>
       
        
    <?php 
        $ress=get_schnum(4);
        $num=get_countsch(4);
    foreach($ress as $k=>$v)
    {
        $arr[] = $v['title'];
    }
    $str = implode('、',$arr);
     ?>
  <table>
      <tr>
        <td>公司名称</td>
        <td>招聘人数</td>
        <td>职位</td>
      </tr>
      <tr>
          <td>4有限公司</td>
        <td><?php echo $num; ?></td>
        <td><?php echo $str; ?></td>
      </tr>
  </table>
            <!-- <li>
                <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                场地：
             
              
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </li> -->

        <!-- </foreach> -->
    </ul>
 
</body>
</html>