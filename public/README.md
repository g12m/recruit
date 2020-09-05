cmf标签说明
=========================================

############## 全局标签 ##################

### navcats  自定义导航标签
* categoryId 导航父ID，默认0
* navId 导航分类ID，默认1 主导航
* 标签嵌套：子导航
# <navcats categoryId="0" navId="1" item="vo">
#  <li><a class="bg" href="{$vo.href}"></a></li>
#      <navcats categoryId="$vo.id" item="voo">
#          <li><a class="bg" href="{$vo.href}"></a></li>
#      </navcats>
# </navcats>
------------------------------------
### links 友情链接
* id 分类ID
#  <links id="1">
#    <li>
#        <a href="{$vo.url|default=''}" target="{$vo.target|default=''}">{$vo.name|default=''}</a>
#        <div>成交时间：{:date('Y-m-d H:i',$vo.post_time)}</div>
#    </li>
#  </links>
--------------------------------------
### captcha 验证码标签
* 标签属性:  标签属性名 含义
* height |验证码高度,必须 |
* width |验证码宽度,必须 |
* font-size |验证码字体大小,默认25 |
* length |验证码长度,默认为 4,最小为3 |
* bg |验证码背景,默认为243,251,254,以英文逗号分开 |
* id |验证码 id,整数,最大5 ,如果设置后台验证时请传入这个值 |
# <captcha height="50" width="200" font-size="24" length="3" bg="0,0,0" id=2/>
--------------------------------------------
### slides 幻灯片
* id 幻灯片ID
* item 循环变量名
# <slides id="1">
#        <li>
#            <div class="caption-wraper">
#                <div class="caption">{$vo.name|default=''}</div>
#            </div>
#            <a href=""><img src="{:cmf_get_image_url($vo.image)}" alt=""></a>
#        </li>
#    </slides>
---------------------------------------------

############## 门户标签 ##################
# 加载标签库 <taglib name="app\portal\taglib\Portal"/>
---------------------------------------------

### articles  文章标签
* 标签属性: | 标签属性名 | 含义 | | --- | --- |
* | where | 查询条件变量, 支持数组和字符串,如$where |
* | limit | 最多查出文章数,如果分页开启,此设置无效 |
* | order | 文章排序方式 |
* | page | 分页参数,如果设置分页参数会自动分页 |
* | relation | 关联查询,支持categories和user,多个以英文逗号分隔
* |categoryIds | 分类 id,支持数组和字符串(英文逗号分开)|
#  <portal:articles limit="5" order="post.published_time DESC"
#                 categoryIds="$category_ids">
#    <a class="img-wraper" href="{:url('portal/Article/index',array('id'=>$vo.id,'cid'=>$vo.category_id))}">
#        <if condition="empty($vo.more.thumbnail)">
#               <img src="__TMPL__/public/assets/images/default_tupian4.png"
#                         class="img-responsive" alt="{$vo.post_title}"/>
#         <else/>
#                <img src="{:cmf_get_image_url($vo.more.thumbnail)}"
#                         class="img-responsive" alt="{$vo.post_title}"/>
#         </if>
#     </a>
#  </portal:articles>
### 如果分页 请传入 page 属性定义分页数量
#  <ul class="pagination">
#      <page/>
#   </ul>
------------------------------------------------------
### breadcrumb 面包屑标签
* 标签属性: | 标签属性名 | 含义 | | --- | --- |
* | cid | 当前的分类 id |
* | self | 是否包括自己,true或 false |
#  <li><a href="__ROOT__/">首页</a></li>
#      <portal:breadcrumb cid="currentCid" self="true">
#         <li><a href="{:url('portal/List/index',['id'=>$vo['id']])}">{$vo.name}</a></li>
#      </portal:breadcrumb>
#  <li class="active">当前分类名</li>
-------------------------------------------------------
### categories 分类标签
* 标签属性: | 标签属性名 | 含义 | | --- | --- |
* | where | 查询条件变量, 支持数组和字符串,如$where |
* | order | 排序方式 | | item | 循环变量,默认 vo |
#  <portal:categories where="$where" order="list_order DESC" item="vo">
#      {$vo.name}<br>
#      {$vo.description}<br>
#   </portal:categories>
-------------------------------------------------------
### allSubCategories 所有子分类标签
* categoryId | 父级分类 id
* item | 循环变量,默认 vo
#  <portal:allSubCategories categoryId="$categoryId" item="vo">
#       {$vo.name}<br>
#       {$vo.description}<br>
#  </portal:allSubCategories>
---------------------------------------------------------
### subCategories 子分类标签
* categoryId | 父级分类 id
* item | 循环变量,默认 vo
#<portal:subCategories categoryId="$categoryId" item="vo">
#    {$vo.name}<br>
#    {$vo.description}<br>
#</portal:subCategories>
-----------------------------------------------------------
### poster 广告位标签
* posterId 广告位id
* class 样式
* type 广告位展示类型： 传入 1, a标签背景图展示；不指定type 以 a标签 嵌套img 标签展示
     ` type="1" : <a  target="_blank" href="#" class=""  style="background: url(...) 50% no-repeat;"></a> `
     ` type="0" : <a  target="_blank" href="#" class=""><img onclick="addclick(19)" src="..." ></a>`
# <portal:poster posterId="5" class="in_ggw" type="1" />
------------------------------------------------------------
### position  推荐位标签
* positionId 推荐位ID
* limit  数量
* where
* field 字段
* order 排序
#  <portal:position positionId="2" order="id desc" limit="2">
#     {$vo.post_title}
#  </portal:position>
------------------------------------------------------------
### pages 获取页面、分类 列表标签
* categoryId 分类ID
* order 接收 list_order 排序
# <portal:pages categoryId="9" order="list_order desc">
#    {$vo.title}{$vo.url}
# </portal:pages>
*** title 栏目或单页名 url 为链接地址
-------------------------------------------------------------
