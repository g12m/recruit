<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:45:"themes/index/portal\sch_position\article.html";i:1599385450;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <ul>
        4有限公司
        招聘人数 <?php echo $num; ?>
        联系人
        电话
       
        <?php if(empty($value) || (($value instanceof \think\Collection || $value instanceof \think\Paginator ) && $value->isEmpty())): ?>
        <a href="<?php echo url('portal/sch_position/release'); ?>">发布</a>
        <?php else: ?>
        已关联
        <?php endif; ?>
        
        
      
    </ul>
    ----------------------------------
    招聘职位
    <table>
        <?php if(is_array($info) || $info instanceof \think\Collection || $info instanceof \think\Paginator): if( count($info)==0 ) : echo "" ;else: foreach($info as $key=>$v3): ?>
    
        
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
                <?php endforeach; endif; else: echo "" ;endif; ?>
         
    </table>
 
</body>
</html>