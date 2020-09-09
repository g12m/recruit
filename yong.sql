/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : pec

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-07-20 15:51:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ld_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `ld_admin_menu`;
CREATE TABLE `ld_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

-- ----------------------------
-- Records of ld_admin_menu
-- ----------------------------
INSERT INTO `ld_admin_menu` VALUES ('1', '0', '0', '0', '20', 'admin', 'Plugin', 'default', '', '插件中心', 'cloud', '插件中心');
INSERT INTO `ld_admin_menu` VALUES ('2', '1', '1', '1', '10000', 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO `ld_admin_menu` VALUES ('3', '2', '1', '0', '10000', 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO `ld_admin_menu` VALUES ('4', '2', '2', '0', '10000', 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO `ld_admin_menu` VALUES ('5', '2', '1', '0', '10000', 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO `ld_admin_menu` VALUES ('6', '0', '0', '1', '0', 'admin', 'Setting', 'default', '', '网站设置', 'cogs', '系统设置入口');
INSERT INTO `ld_admin_menu` VALUES ('7', '6', '1', '1', '50', 'admin', 'LinkType', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `ld_admin_menu` VALUES ('8', '7', '1', '0', '10000', 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接');
INSERT INTO `ld_admin_menu` VALUES ('9', '7', '2', '0', '10000', 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存');
INSERT INTO `ld_admin_menu` VALUES ('10', '7', '1', '0', '10000', 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接');
INSERT INTO `ld_admin_menu` VALUES ('11', '7', '2', '0', '10000', 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存');
INSERT INTO `ld_admin_menu` VALUES ('12', '7', '2', '0', '10000', 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接');
INSERT INTO `ld_admin_menu` VALUES ('13', '7', '2', '0', '10000', 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序');
INSERT INTO `ld_admin_menu` VALUES ('14', '7', '2', '0', '10000', 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO `ld_admin_menu` VALUES ('15', '6', '1', '0', '10', 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO `ld_admin_menu` VALUES ('16', '15', '2', '0', '10000', 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存');
INSERT INTO `ld_admin_menu` VALUES ('17', '15', '1', '0', '10000', 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板');
INSERT INTO `ld_admin_menu` VALUES ('18', '15', '2', '0', '10000', 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交');
INSERT INTO `ld_admin_menu` VALUES ('19', '15', '1', '0', '10000', 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试');
INSERT INTO `ld_admin_menu` VALUES ('20', '6', '1', '0', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `ld_admin_menu` VALUES ('21', '20', '1', '0', '10000', 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `ld_admin_menu` VALUES ('22', '20', '1', '0', '10000', 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `ld_admin_menu` VALUES ('23', '20', '2', '0', '10000', 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `ld_admin_menu` VALUES ('24', '20', '1', '0', '10000', 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `ld_admin_menu` VALUES ('25', '20', '2', '0', '10000', 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `ld_admin_menu` VALUES ('26', '20', '2', '0', '10000', 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `ld_admin_menu` VALUES ('27', '20', '2', '0', '10000', 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `ld_admin_menu` VALUES ('28', '20', '1', '0', '10000', 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `ld_admin_menu` VALUES ('29', '6', '1', '0', '30', 'admin', 'Nav', 'index', '', '中文导航', '', '导航管理');
INSERT INTO `ld_admin_menu` VALUES ('30', '29', '1', '0', '10000', 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航');
INSERT INTO `ld_admin_menu` VALUES ('31', '29', '2', '0', '10000', 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO `ld_admin_menu` VALUES ('32', '29', '1', '0', '10000', 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO `ld_admin_menu` VALUES ('33', '29', '2', '0', '10000', 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO `ld_admin_menu` VALUES ('34', '29', '2', '0', '10000', 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航');
INSERT INTO `ld_admin_menu` VALUES ('35', '29', '1', '0', '10000', 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO `ld_admin_menu` VALUES ('36', '35', '1', '0', '10000', 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO `ld_admin_menu` VALUES ('37', '35', '2', '0', '10000', 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO `ld_admin_menu` VALUES ('38', '35', '1', '0', '10000', 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO `ld_admin_menu` VALUES ('39', '35', '2', '0', '10000', 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO `ld_admin_menu` VALUES ('40', '35', '2', '0', '10000', 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO `ld_admin_menu` VALUES ('41', '35', '2', '0', '10000', 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO `ld_admin_menu` VALUES ('42', '1', '1', '1', '10000', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO `ld_admin_menu` VALUES ('43', '42', '2', '0', '10000', 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO `ld_admin_menu` VALUES ('44', '42', '1', '0', '10000', 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO `ld_admin_menu` VALUES ('45', '42', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `ld_admin_menu` VALUES ('46', '42', '2', '0', '10000', 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO `ld_admin_menu` VALUES ('47', '42', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO `ld_admin_menu` VALUES ('48', '42', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `ld_admin_menu` VALUES ('49', '109', '0', '1', '10000', 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO `ld_admin_menu` VALUES ('50', '49', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO `ld_admin_menu` VALUES ('51', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `ld_admin_menu` VALUES ('52', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `ld_admin_menu` VALUES ('53', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `ld_admin_menu` VALUES ('54', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `ld_admin_menu` VALUES ('55', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `ld_admin_menu` VALUES ('56', '50', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `ld_admin_menu` VALUES ('57', '50', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `ld_admin_menu` VALUES ('58', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO `ld_admin_menu` VALUES ('59', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `ld_admin_menu` VALUES ('60', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `ld_admin_menu` VALUES ('61', '6', '1', '0', '10000', 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO `ld_admin_menu` VALUES ('62', '61', '1', '0', '10000', 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO `ld_admin_menu` VALUES ('63', '61', '2', '0', '10000', 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO `ld_admin_menu` VALUES ('64', '61', '1', '0', '10000', 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO `ld_admin_menu` VALUES ('65', '61', '2', '0', '10000', 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO `ld_admin_menu` VALUES ('66', '61', '2', '0', '10000', 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO `ld_admin_menu` VALUES ('67', '61', '2', '0', '10000', 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO `ld_admin_menu` VALUES ('68', '61', '2', '0', '10000', 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO `ld_admin_menu` VALUES ('69', '61', '2', '0', '10000', 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO `ld_admin_menu` VALUES ('70', '61', '1', '0', '10000', 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO `ld_admin_menu` VALUES ('71', '6', '1', '1', '0', 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO `ld_admin_menu` VALUES ('72', '71', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `ld_admin_menu` VALUES ('73', '6', '1', '0', '10000', 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO `ld_admin_menu` VALUES ('74', '73', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `ld_admin_menu` VALUES ('75', '6', '1', '1', '10000', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `ld_admin_menu` VALUES ('76', '75', '2', '0', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `ld_admin_menu` VALUES ('77', '6', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `ld_admin_menu` VALUES ('78', '6', '1', '1', '40', 'admin', 'Slide', 'index', '', '轮播管理', '', '幻灯片管理');
INSERT INTO `ld_admin_menu` VALUES ('79', '78', '1', '0', '10000', 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `ld_admin_menu` VALUES ('80', '78', '2', '0', '10000', 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `ld_admin_menu` VALUES ('81', '78', '1', '0', '10000', 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `ld_admin_menu` VALUES ('82', '78', '2', '0', '10000', 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `ld_admin_menu` VALUES ('83', '78', '2', '0', '10000', 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `ld_admin_menu` VALUES ('84', '78', '1', '0', '10000', 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `ld_admin_menu` VALUES ('85', '84', '1', '0', '10000', 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `ld_admin_menu` VALUES ('86', '84', '2', '0', '10000', 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `ld_admin_menu` VALUES ('87', '84', '1', '0', '10000', 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `ld_admin_menu` VALUES ('88', '84', '2', '0', '10000', 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `ld_admin_menu` VALUES ('89', '84', '2', '0', '10000', 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `ld_admin_menu` VALUES ('90', '84', '2', '0', '10000', 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `ld_admin_menu` VALUES ('91', '84', '2', '0', '10000', 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `ld_admin_menu` VALUES ('92', '84', '2', '0', '10000', 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `ld_admin_menu` VALUES ('93', '6', '1', '0', '10000', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO `ld_admin_menu` VALUES ('94', '93', '2', '0', '10000', 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO `ld_admin_menu` VALUES ('95', '6', '1', '1', '20', 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO `ld_admin_menu` VALUES ('96', '95', '1', '0', '10000', 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO `ld_admin_menu` VALUES ('97', '95', '2', '0', '10000', 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO `ld_admin_menu` VALUES ('98', '95', '2', '0', '10000', 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO `ld_admin_menu` VALUES ('99', '95', '2', '0', '10000', 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO `ld_admin_menu` VALUES ('100', '95', '2', '0', '10000', 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO `ld_admin_menu` VALUES ('101', '95', '1', '0', '10000', 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO `ld_admin_menu` VALUES ('102', '95', '1', '0', '10000', 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO `ld_admin_menu` VALUES ('103', '95', '1', '0', '10000', 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO `ld_admin_menu` VALUES ('104', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO `ld_admin_menu` VALUES ('105', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `ld_admin_menu` VALUES ('106', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO `ld_admin_menu` VALUES ('107', '95', '2', '0', '10000', 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO `ld_admin_menu` VALUES ('108', '95', '1', '0', '10000', 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO `ld_admin_menu` VALUES ('109', '0', '0', '1', '10', 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理');
INSERT INTO `ld_admin_menu` VALUES ('110', '49', '1', '1', '10000', 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO `ld_admin_menu` VALUES ('111', '110', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO `ld_admin_menu` VALUES ('112', '110', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `ld_admin_menu` VALUES ('113', '110', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO `ld_admin_menu` VALUES ('114', '110', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `ld_admin_menu` VALUES ('115', '110', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `ld_admin_menu` VALUES ('116', '110', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `ld_admin_menu` VALUES ('117', '110', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `ld_admin_menu` VALUES ('118', '110', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `ld_admin_menu` VALUES ('119', '110', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `ld_admin_menu` VALUES ('120', '0', '0', '1', '30', 'portal', 'AdminIndex', 'default', '', '内容管理', 'th', '门户管理');
INSERT INTO `ld_admin_menu` VALUES ('121', '120', '1', '1', '10000', 'portal', 'AdminArticle', 'index', '', '关于我们', '', '文章列表');
INSERT INTO `ld_admin_menu` VALUES ('122', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章');
INSERT INTO `ld_admin_menu` VALUES ('123', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交');
INSERT INTO `ld_admin_menu` VALUES ('124', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章');
INSERT INTO `ld_admin_menu` VALUES ('125', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交');
INSERT INTO `ld_admin_menu` VALUES ('126', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除');
INSERT INTO `ld_admin_menu` VALUES ('127', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布');
INSERT INTO `ld_admin_menu` VALUES ('128', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶');
INSERT INTO `ld_admin_menu` VALUES ('129', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐');
INSERT INTO `ld_admin_menu` VALUES ('130', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序');
INSERT INTO `ld_admin_menu` VALUES ('131', '120', '1', '0', '10000', 'portal', 'AdminCategory2', 'index', '', '分类管理', '', '文章分类列表');
INSERT INTO `ld_admin_menu` VALUES ('132', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类');
INSERT INTO `ld_admin_menu` VALUES ('133', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交');
INSERT INTO `ld_admin_menu` VALUES ('134', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类');
INSERT INTO `ld_admin_menu` VALUES ('135', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交');
INSERT INTO `ld_admin_menu` VALUES ('136', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框');
INSERT INTO `ld_admin_menu` VALUES ('137', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序');
INSERT INTO `ld_admin_menu` VALUES ('138', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类');
INSERT INTO `ld_admin_menu` VALUES ('139', '120', '1', '0', '10000', 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO `ld_admin_menu` VALUES ('140', '139', '1', '0', '10000', 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO `ld_admin_menu` VALUES ('141', '139', '2', '0', '10000', 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO `ld_admin_menu` VALUES ('142', '139', '1', '0', '10000', 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO `ld_admin_menu` VALUES ('143', '139', '2', '0', '10000', 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO `ld_admin_menu` VALUES ('144', '139', '2', '0', '10000', 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO `ld_admin_menu` VALUES ('145', '120', '1', '0', '10000', 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签');
INSERT INTO `ld_admin_menu` VALUES ('146', '145', '1', '0', '10000', 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签');
INSERT INTO `ld_admin_menu` VALUES ('147', '145', '2', '0', '10000', 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交');
INSERT INTO `ld_admin_menu` VALUES ('148', '145', '2', '0', '10000', 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO `ld_admin_menu` VALUES ('149', '145', '2', '0', '10000', 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签');
INSERT INTO `ld_admin_menu` VALUES ('150', '0', '1', '0', '10000', 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO `ld_admin_menu` VALUES ('151', '150', '2', '0', '10000', 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO `ld_admin_menu` VALUES ('152', '109', '0', '1', '10000', 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组');
INSERT INTO `ld_admin_menu` VALUES ('153', '152', '1', '1', '10000', 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户');
INSERT INTO `ld_admin_menu` VALUES ('154', '153', '2', '0', '10000', 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `ld_admin_menu` VALUES ('155', '153', '2', '0', '10000', 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `ld_admin_menu` VALUES ('156', '152', '1', '1', '10000', 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户');
INSERT INTO `ld_admin_menu` VALUES ('157', '156', '2', '0', '10000', 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO `ld_admin_menu` VALUES ('158', '6', '1', '0', '10000', 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理');
INSERT INTO `ld_admin_menu` VALUES ('159', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作');
INSERT INTO `ld_admin_menu` VALUES ('160', '158', '2', '0', '10000', 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交');
INSERT INTO `ld_admin_menu` VALUES ('161', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作');
INSERT INTO `ld_admin_menu` VALUES ('162', '120', '1', '0', '10000', 'portal', 'AdminMessage1', 'index', '', '了', '', '');
INSERT INTO `ld_admin_menu` VALUES ('163', '120', '1', '1', '10001', 'portal', 'AdminPosition', 'index', '', '推荐位管理', '', '');
INSERT INTO `ld_admin_menu` VALUES ('164', '165', '1', '1', '10000', 'portal', 'AdminPoster', 'index', '', '广告列表', '', '');
INSERT INTO `ld_admin_menu` VALUES ('165', '0', '1', '0', '10000', 'portal', 'AdminPoster', 'default', '', '广告管理', 'paper-plane', '');
INSERT INTO `ld_admin_menu` VALUES ('166', '0', '1', '0', '10000', 'gii', 'AdminIndex', 'default', '', '模块生成', 'exchange', '');
INSERT INTO `ld_admin_menu` VALUES ('167', '166', '1', '1', '10000', 'gii', 'AdminIndex', 'index', '', '模块生成', '', '');
INSERT INTO `ld_admin_menu` VALUES ('168', '0', '1', '1', '10000', 'portal', 'AdminPicture', 'default', '', '内容管理(英)', 'th', '');
INSERT INTO `ld_admin_menu` VALUES ('170', '168', '1', '1', '10000', 'portal', 'AdminArticleen', 'index', '', '关于我们', '', '');
INSERT INTO `ld_admin_menu` VALUES ('171', '168', '1', '1', '10000', 'portal', 'AdminAbouten', 'index', '', '新闻中心', '', '');
INSERT INTO `ld_admin_menu` VALUES ('172', '168', '1', '1', '10000', 'portal', 'AdminSourceen', 'index', '', '合作伙伴', '', '');
INSERT INTO `ld_admin_menu` VALUES ('173', '168', '1', '1', '10000', 'portal', 'AdminResen', 'index', '', '产品展示', '', '');
INSERT INTO `ld_admin_menu` VALUES ('174', '120', '1', '0', '10000', 'portal', 'AdminProduct', 'index', '', '招聘类型', '', '');
INSERT INTO `ld_admin_menu` VALUES ('175', '168', '1', '1', '10000', 'portal', 'AdminProductsen', 'index', '', '服务与支持', '', '');
INSERT INTO `ld_admin_menu` VALUES ('177', '0', '1', '0', '10000', 'portal', 'AdminConst', 'default', '', '表单申请', 'id-badge', '');
INSERT INTO `ld_admin_menu` VALUES ('178', '177', '1', '1', '10000', 'portal', 'AdminMessage', 'index', '', '预约参观 ', '', '');
INSERT INTO `ld_admin_menu` VALUES ('179', '120', '1', '1', '10000', 'portal', 'AdminAbout', 'index', '', '新闻中心', '', '');
INSERT INTO `ld_admin_menu` VALUES ('180', '120', '1', '1', '10000', 'portal', 'AdminRes', 'index', '', '产品展示', '', '');
INSERT INTO `ld_admin_menu` VALUES ('181', '120', '1', '1', '10000', 'portal', 'AdminProducts', 'index', '', '服务与支持', '', '');
INSERT INTO `ld_admin_menu` VALUES ('182', '120', '1', '1', '10000', 'portal', 'AdminSource', 'index', '', '合作伙伴', '', '');
INSERT INTO `ld_admin_menu` VALUES ('183', '120', '1', '1', '10000', 'portal', 'AdminConwe', 'index', '', '联系我们', '', '');
INSERT INTO `ld_admin_menu` VALUES ('184', '0', '1', '1', '10000', 'portal', 'AdminCategory1', 'index', '', '栏目管理', 'bars', '');
INSERT INTO `ld_admin_menu` VALUES ('185', '184', '1', '1', '10000', 'portal', 'AdminCategory', 'index', '', '分类管理', '', '');
INSERT INTO `ld_admin_menu` VALUES ('188', '184', '1', '1', '10000', 'portal', 'AdminCategoryen', 'index', '', '英文分类', '', '');
INSERT INTO `ld_admin_menu` VALUES ('189', '168', '1', '1', '10000', 'portal', 'AdminConween', 'index', '', '联系我们', '', '');
INSERT INTO `ld_admin_menu` VALUES ('190', '120', '1', '1', '10000', 'portal', 'AdminDownload', 'index', '', '加入我们', '', '');
INSERT INTO `ld_admin_menu` VALUES ('191', '168', '1', '1', '10000', 'portal', 'AdminDownloaden', 'index', '', '加入我们', '', '');
INSERT INTO `ld_admin_menu` VALUES ('192', '177', '1', '1', '10000', 'portal', 'AdminMsg', 'index', '', '在线留言', '', '');
INSERT INTO `ld_admin_menu` VALUES ('193', '177', '1', '1', '10000', 'portal', 'AdminSign', 'index', '', '报名申请', '', '');
INSERT INTO `ld_admin_menu` VALUES ('194', '168', '1', '1', '10000', 'portal', 'AdminPositionen', 'index', '', '推荐位管理', '', '');
INSERT INTO `ld_admin_menu` VALUES ('195', '6', '1', '0', '10000', 'portal', 'AdminNaven', 'index', '', '英文导航', '', '');
INSERT INTO `ld_admin_menu` VALUES ('196', '184', '1', '0', '10000', 'portal', 'AdminCategoryfa', 'index', '', '法文分类', '', '');
INSERT INTO `ld_admin_menu` VALUES ('197', '0', '1', '0', '10000', 'portal', 'AdminIndexfa', 'default', '', '内容管理(法)', 'th', '');
INSERT INTO `ld_admin_menu` VALUES ('198', '197', '1', '1', '10000', 'portal', 'AdminArticlefa', 'index', '', '特别计划', '', '');
INSERT INTO `ld_admin_menu` VALUES ('199', '197', '1', '1', '10000', 'portal', 'AdminAboutfa', 'index', '', '平台服务', '', '');
INSERT INTO `ld_admin_menu` VALUES ('200', '197', '1', '1', '10000', 'portal', 'AdminSourcefa', 'index', '', '博物要闻', '', '');
INSERT INTO `ld_admin_menu` VALUES ('201', '197', '1', '1', '10000', 'portal', 'AdminResfa', 'index', '', '走出去', '', '');
INSERT INTO `ld_admin_menu` VALUES ('202', '197', '1', '1', '10000', 'portal', 'AdminProductsfa', 'index', '', '引进来', '', '');

-- ----------------------------
-- Table structure for ld_asset
-- ----------------------------
DROP TABLE IF EXISTS `ld_asset`;
CREATE TABLE `ld_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- ----------------------------
-- Records of ld_asset
-- ----------------------------
INSERT INTO `ld_asset` VALUES ('1', '1', '761182', '1533527740', '1', '0', 'c268a582c4dbb0d9b1531fe6c6a2d8f6653289aadb53252efa793254b96888d2', 'banner.png', 'admin/20180806/d30e42e0c71593b758e966a4efdb8f59.png', 'c268a582c4dbb0d9b1531fe6c6a2d8f6', 'ec550a54eae3009a19e232affdb7ea44a6147164', 'png', null);
INSERT INTO `ld_asset` VALUES ('2', '1', '31877', '1533528863', '1', '0', '4cff5883f160bbc9516e0c6ae138c59db60dbb1f70af493d7c7f8853f6b222cd', '108.png', 'portal/20180806/20f6921d6beb8a4db7971b3f3552186a.png', '4cff5883f160bbc9516e0c6ae138c59d', '0a4358f2a7aced1bda7d7e5ee649ca6c724a44b2', 'png', null);
INSERT INTO `ld_asset` VALUES ('3', '1', '27386', '1533528870', '1', '0', '53f1a91b022d3a285cbae977f66bb464029b3f7a288331ad41ccb172575fbf92', '80.jpg', 'portal/20180806/cab575353c5ff8db241a0ef994d56ad7.jpg', '53f1a91b022d3a285cbae977f66bb464', '9fb15f187b911396862e201c1a8b362132552354', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('4', '1', '156041', '1533529361', '1', '0', '57b4f7dfda88fbda37db0f498b18e6899edd3067ce1c899fe35f3cd29fe7807f', 'in1_1.png', 'portal/20180806/108503f256ef7a2b30e781d39764501e.png', '57b4f7dfda88fbda37db0f498b18e689', '445e8e3cb2b9626a7209dd266fa2f672e11d301c', 'png', null);
INSERT INTO `ld_asset` VALUES ('5', '1', '75501', '1533536325', '1', '0', '1f6e413222cc042b74ac30ef6cf6419bd077dd61a5d9c270e947421a701c58f7', 'cnxh_1.png', 'portal/20180806/5ba4c24f8689a17999b3dedd075e6df4.png', '1f6e413222cc042b74ac30ef6cf6419b', '95d570efdd3c4fc9d0f718a5a5b1ec079fe8e5e3', 'png', null);
INSERT INTO `ld_asset` VALUES ('6', '1', '484191', '1533536434', '1', '0', '817d8b046efd220e7d995e5b48437c34ec65a61bac2c72a3c7130e6a6b589e74', 'banner3.png', 'portal/20180806/992485d35468b41e31eb4c8f67f97ec1.png', '817d8b046efd220e7d995e5b48437c34', '5af37b2570e27bc1cea90c2137fcfddfb2b0884f', 'png', null);
INSERT INTO `ld_asset` VALUES ('7', '1', '356363', '1533538150', '1', '0', '95bb1213d731bc55cf4e05efad3b1d6c352e3047084f18604973a9553c1fba63', 'in2_1.png', 'portal/20180806/dd4745396f2b1fdf52bd7e53b564e1b4.png', '95bb1213d731bc55cf4e05efad3b1d6c', '040d6435685518372b311bb6d8c1b578aadbd0e3', 'png', null);
INSERT INTO `ld_asset` VALUES ('8', '1', '2724295', '1533542280', '1', '0', '8b6ada2b50584f81aa8780bd3ec5cf8ad56ff95238c3e4807b7137469b58af9c', 'banner2.png', 'portal/20180806/9f761718230c6d6ad604d02b8f35d6dd.png', '8b6ada2b50584f81aa8780bd3ec5cf8a', 'd387269ca86a92ee41c41d1c4bf32b93d57a2d4f', 'png', null);
INSERT INTO `ld_asset` VALUES ('9', '1', '171245', '1533542446', '1', '0', 'a0ee9eaf34565e51fa6d514ee9abd880c290b59e49ed4ff5a1f5e0861e52b735', 'case1.png', 'portal/20180806/aa9b9a6c90286b3c0b8ed02555c48132.png', 'a0ee9eaf34565e51fa6d514ee9abd880', 'c7619adc3a25f6262b03f29c910bf9565a55abe8', 'png', null);
INSERT INTO `ld_asset` VALUES ('10', '1', '844132', '1533542700', '1', '0', '13c428b70314d486c6c4e70c2461bb38cc317b1a3f539f57f6f85adec4b8e5dc', 'case2.png', 'portal/20180806/8ece1120770de83d5c4b1e2cb5d8a42f.png', '13c428b70314d486c6c4e70c2461bb38', '603f02df34d44e4dde7e0bbbccac5331665de86c', 'png', null);
INSERT INTO `ld_asset` VALUES ('11', '1', '13282', '1533543771', '1', '0', 'ccd276e5f732cea11e3cf5bbe7bba63ba04ca9057046c49cbd90feab988ba0d5', 'case2_1.png', 'admin/20180806/a8fa82295b7d647768ca86d9f0626312.png', 'ccd276e5f732cea11e3cf5bbe7bba63b', 'd82d23e98c09a0e4b492682165f3e51f342380ee', 'png', null);
INSERT INTO `ld_asset` VALUES ('12', '1', '12469', '1533543803', '1', '0', '440f8b85d59e8b80959e1040605f5f1a612641e21e0a706f63ff8f1cbad3a69a', 'case2_2.png', 'admin/20180806/0fcdfe7320bb954762a3a1ba3b16a2d5.png', '440f8b85d59e8b80959e1040605f5f1a', '584f372ab5a69d871bfe0e0608db208d6f213b79', 'png', null);
INSERT INTO `ld_asset` VALUES ('13', '1', '23258', '1533543829', '1', '0', '9de46b173d364f2ff339583f253a8d41f793f28a6865376fc3b30eb7794f17e5', 'case2_3.png', 'admin/20180806/b28d5f8731c750ef61332db0d6590af1.png', '9de46b173d364f2ff339583f253a8d41', 'bb5967125918c11c95fb3ef3d7f4de804d81d311', 'png', null);
INSERT INTO `ld_asset` VALUES ('14', '1', '687653', '1533545048', '1', '0', '950bc5fe963535ec4ebcc32040913fada17c6106286a0ef1130dd9f4e4220bd6', 'js1_1.png', 'portal/20180806/f805b75007fa1d4b096b88e923c2ad93.png', '950bc5fe963535ec4ebcc32040913fad', '4925d374b81932c650e3c0271d10052b5a8c5228', 'png', null);
INSERT INTO `ld_asset` VALUES ('15', '1', '18264', '1533546726', '1', '0', '7fd19bccc4b8784301c48377018cfaeab278b78fb4d535b1d49961a90bc21940', 'js2_1.png', 'portal/20180806/6a3036eb3423a589c0ca7535e982bf25.png', '7fd19bccc4b8784301c48377018cfaea', 'a83b3d7575b0d9699802a441ab2627011473839b', 'png', null);
INSERT INTO `ld_asset` VALUES ('16', '1', '1655754', '1533547898', '1', '0', 'e3b28dcc5735a4274a6aabff4044e26767060a3b027fb44babdb4ca860fecbac', 'banner5.png', 'portal/20180806/1677d66f6765de265830a916fc937734.png', 'e3b28dcc5735a4274a6aabff4044e267', '97b3c5deb9290f0c95de7b6c5c871088f3410809', 'png', null);
INSERT INTO `ld_asset` VALUES ('17', '1', '679454', '1533548998', '1', '0', '3160980574ca8d8d8033f1f3ca619ab598ace8cadbadf3df88e5053c9ec2539e', 'banner6.png', 'portal/20180806/de3eddd5c9b41356c96252e27b01edaf.png', '3160980574ca8d8d8033f1f3ca619ab5', '414ffaf86fb558db11bccfa06ef10a2d23c19219', 'png', null);
INSERT INTO `ld_asset` VALUES ('18', '1', '129564', '1533609663', '1', '0', '348252ccca8fac4010d97c5091f4fadd924d461c7982934f957b8c997a8b9190', 'ab1_1 (1).png', 'portal/20180807/1a51af0b077cfe13033bb121eb1aea3b.png', '348252ccca8fac4010d97c5091f4fadd', '931235b7e3b9bb39453937d78489a18ed55c50c7', 'png', null);
INSERT INTO `ld_asset` VALUES ('19', '1', '44702', '1533610695', '1', '0', '2d545b1e23ec2e411ae2caa13afc270a067825fe10974cafca6cc47ce2495ece', 'ab3_1.png', 'portal/20180807/7e1ceb63d79e7328d470044889e6a509.png', '2d545b1e23ec2e411ae2caa13afc270a', 'a7809d1f0659fce7699b05743ebca91bc7f678af', 'png', null);
INSERT INTO `ld_asset` VALUES ('20', '1', '1748123', '1533625043', '1', '0', 'b1bedfe1eb23f1084468dd96df988a27eb60ce765ee3b8ae50cec00bb730fc3b', 'banner4.png', 'portal/20180807/ca5f84c7302c1740dfb5866f1d110a8b.png', 'b1bedfe1eb23f1084468dd96df988a27', '462379215baf09684b139abab31ed3684949b3ec', 'png', null);
INSERT INTO `ld_asset` VALUES ('21', '1', '24718', '1533708114', '1', '0', '25b13c19ea5a049cc28d8cc0ec954bc092bac0428da0670ccbc9fb8be3546258', '64.jpg', 'admin/20180808/1e848eb9ac69c19a88182e6efdc1a9cd.jpg', '25b13c19ea5a049cc28d8cc0ec954bc0', 'b01357776de5cab44ca85e2c88b9afd85168aad7', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('22', '1', '18105', '1533708374', '1', '0', '8be3bd5fcc00d652d00db7c02975330aab0e4251d45ae8a51616696e3174e704', '16.jpg', 'admin/20180808/93ae8540aebfce304f67f1f0d52e7027.jpg', '8be3bd5fcc00d652d00db7c02975330a', '11eff346862643e6814ac7eff282685c5ea30182', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('23', '1', '29727', '1533708435', '1', '0', '8f7fe2b426fe8b3676450d9bc9e33fa20088c4810e7747d4c393282a8228e898', '七牛云qshell单个文件上传.png', 'admin/20180808/afcde12f54bf069c3e1b0090ce371d10.png', '8f7fe2b426fe8b3676450d9bc9e33fa2', '835bb925bbd80741883fd5faefca19fc9bd4c083', 'png', null);
INSERT INTO `ld_asset` VALUES ('24', '1', '19660', '1534393366', '1', '0', 'ffd4534233f7ca635a07916848755aed4edf6be5164a67c1af59f46ed4fdc3ef', '28.png', 'portal/20180816/913d74d8d11bba22b22e4c986505006a.png', 'ffd4534233f7ca635a07916848755aed', 'b55105698e8bd1c86ca0ff3c2f1922f772c7294e', 'png', null);
INSERT INTO `ld_asset` VALUES ('25', '1', '11315', '1534407092', '1', '0', '9ad5cebc0dca0a8b3585e9cfec69cf09bcd3c1ff6dc38796368ca12e14e62302', 'u=2557774124,253594805&fm=58&bpow=400&bpoh=591.jpg', 'portal/20180816/9467746cad69ddbea5bbf7767b67cc84.jpg', '9ad5cebc0dca0a8b3585e9cfec69cf09', 'cc2aa238b209354e49a87e427662b72b79e35962', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('26', '1', '26920', '1538190027', '1', '0', '1003fcd8cf69c1bceb08af26efa6089f9f71a679f531341cf9be567c846c728f', 'image.png', 'default/20180929/75de689d2c2a8cf134d3dada4ac070c4.png', '1003fcd8cf69c1bceb08af26efa6089f', 'bb57531940269536ddfe03e8561d1f3e4a87a92c', 'png', null);
INSERT INTO `ld_asset` VALUES ('27', '1', '83566', '1543377700', '1', '0', '90f7fd5627be5c4c71515ca2a6f7659fcab5fffecc9abe695f5f49c8e45f2448', 'gh_02d54e279339_430.jpg', 'default/20181128/c07cc38924a1449217f9eec17e6c8353.jpg', '90f7fd5627be5c4c71515ca2a6f7659f', '9cc80f9519c3f6d37a634e3df751a8329e119331', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('28', '1', '359236', '1543384208', '1', '0', '67bc05ce01cd791d9354835cc21f28b597c1707f1a1ca62dd5dca58b1332984b', '大端模式与小端模式.png', 'default/20181128/f2c1d028a41f5dad2f18528b2c448fe1.png', '67bc05ce01cd791d9354835cc21f28b5', 'cc3bacab075cf033e3690a1e2ba91b17fb72c0a2', 'png', null);
INSERT INTO `ld_asset` VALUES ('29', '1', '476540', '1543384608', '1', '0', 'a139e03a94f8ca8727ec8cbcc727d60c98d6741849ef8487b6d65b7a601038ca', '腾讯云网站备案真实性核验单.jpg', 'default/20181128/078b6b87dff0b4e159ce18b88f504062.jpg', 'a139e03a94f8ca8727ec8cbcc727d60c', 'af0956b86081e44cfe3945365c5150738220c1d7', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('30', '1', '746820', '1543395673', '1', '0', '30d6a32b977c060bf6f4996053e5bca7bd7afd28cac86601ecd97c5325d5c72d', '30d6a32b977c060bf6f4996053e5bca7_768x432.png', 'default/20181128/a5730250a93707520f246c26010197ff.png', '30d6a32b977c060bf6f4996053e5bca7', 'd39a570eee0884f73eaf94634e1d699b5e33cf68', 'png', null);
INSERT INTO `ld_asset` VALUES ('31', '1', '738736', '1543395716', '1', '0', '67fb22eaa6b1f2c1325d498d2ecadbe9ad2e5c0615a1b7d48abdd6b0dcd60b16', '67fb22eaa6b1f2c1325d498d2ecadbe9_768x432.png', 'default/20181128/b3b8f83cf85a3f95393d098829986ba2.png', '67fb22eaa6b1f2c1325d498d2ecadbe9', 'f95098c573ab5c9913f608437d740c1d02333313', 'png', null);
INSERT INTO `ld_asset` VALUES ('32', '1', '195866', '1543396263', '1', '0', 'fae80e5ec099fe5e7d866c6f1e606b75b973fbb716c1d0a44e15ff6bbf576c8b', '83025aafa40f4bfb0786420f0e4f78f0f7361813.jpg', 'default/20181128/6fbe4e79f66755c17ac3cc25d18e9f7c.jpg', 'fae80e5ec099fe5e7d866c6f1e606b75', '3a2e90f9d9d8d27c9e2177b2200c6f03a5988b1c', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('33', '1', '517324', '1543396428', '1', '0', '520b955bfa6232459c68b426e7b3db0634f2e91d3d82985c13b51e23f9ae12e0', '5bafa40f4bfbfbed5572eb3875f0f736afc31f4a.jpg', 'default/20181128/8bac1f672c3247eb0c53ca09d35c6634.jpg', '520b955bfa6232459c68b426e7b3db06', '66e066cb7176b5ef9b06d25e995404f04a09772f', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('34', '1', '50191', '1543397065', '1', '0', 'a706845de7de4218e53c5a53cf1a03b8bdfcb47a9bc46c24dff9559426192ce2', '54fbb2fb43166d22b1380dd24b2309f79052d22d.jpg', 'portal/20181128/be15e23c03b34864bfcfaa56b410a01a.jpg', 'a706845de7de4218e53c5a53cf1a03b8', '764517de25e5ac6e3c645ec86d06e274a03fb385', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('35', '1', '1924613', '1543397628', '1', '0', '30b35765a953c032c530aa15c4baaad60ccc235925cbc9d357a75f2e29977296', 'ChinaPay_跨境平台_B2C接口文档_1.4.doc', 'portal/20181128/9300fb94628c6fc194497a4b04a28e60.doc', '30b35765a953c032c530aa15c4baaad6', 'c876291127984290258dd5f099e25634c6a984c1', 'doc', null);
INSERT INTO `ld_asset` VALUES ('36', '1', '4470', '1543398358', '1', '0', '34fd30b05548afb1c426d0d6c01933652e6375d5bb6d2b09fd82e2005b46ba69', 'thinkcmf.txt', 'portal/20181128/92101ad4f0c738a0bd6fbe6ba874f03a.txt', '34fd30b05548afb1c426d0d6c0193365', '358bda834a9ec99a079ca4f2f67a24f3f320586f', 'txt', null);
INSERT INTO `ld_asset` VALUES ('37', '1', '93008', '1543454979', '1', '0', 'f0333aca58322676504ea3a2c2aac9ba33364d5905e55a1b3125ee4caaf4e4ee', '91529822720e0cf3a2dcc5be0746f21fbe09aa48.jpg', 'portal/20181129/828d42c452d4ab92f77a599d518f5c66.jpg', 'f0333aca58322676504ea3a2c2aac9ba', '503f052936b31e16c0a572b150518995917acd63', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('38', '2', '472303', '1543481067', '1', '0', '670e91c0c782647a403d35510d08ecd571b112f93402fa1439253182bee9a75e', '2018.jpg', 'portal/20181129/34ca26991676d1df40af81e204f906b3.jpg', '670e91c0c782647a403d35510d08ecd5', 'bd344f5263f6db5d41a065ed9443d653600343bd', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('39', '2', '89645', '1543481101', '1', '0', '5250c5bb8a28e32331ada08c236d91798a1af56f0dcf96d49266f98b4bf18e9a', '418054320722839609.jpg', 'portal/20181129/6835f85b3d6769938a7f11f788de9947.jpg', '5250c5bb8a28e32331ada08c236d9179', 'bb34b280a2e2a10948c851aa6da2adb9745ebd28', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('40', '2', '199480', '1543483063', '1', '0', '256fe5467d6bae69214f0fee435df54c5d058370d285db210a4f337c27933e6a', 'c774567026d700b7b67ff8f6bce6e36c.png', 'portal/20181129/aa68b62a82739c29eeff50bb5f91ec0e.png', '256fe5467d6bae69214f0fee435df54c', '35cb02e0976c338634e4a9ac82a901092d72e6f4', 'png', null);
INSERT INTO `ld_asset` VALUES ('41', '2', '1129', '1543486094', '1', '0', '0ae2e7cfa4c122468ad7a98a132d3e61907b97d8ffbffde8301f1aca52c02d44', 'ewm.png', 'admin/20181129/4f92274dba39863d742ec28684d7bf3d.png', '0ae2e7cfa4c122468ad7a98a132d3e61', '1b7ff957f787fd79d627dff7983baf8a44893921', 'png', null);
INSERT INTO `ld_asset` VALUES ('42', '2', '12746', '1543539960', '1', '0', 'cfcc0b1707fb230abf16b0ee48bf6c883f917318eef5a3f47fc31248edeee10c', 'banner.png', 'portal/20181130/cd22078944b99dd5b4bc138b807beb46.png', 'cfcc0b1707fb230abf16b0ee48bf6c88', 'f04eec703849aebf126eb59979f228ff02254082', 'png', null);
INSERT INTO `ld_asset` VALUES ('43', '2', '2645', '1543539962', '1', '0', '73db44b73a6c36545b42ccee55120806e47353b3778b00467abb139a9337cb0d', 'banner_jt.png', 'portal/20181130/90dee85f70c6ad9625689d0b97737186.png', '73db44b73a6c36545b42ccee55120806', 'b866a252d6e120f2f91b8f07c50146b734522660', 'png', null);
INSERT INTO `ld_asset` VALUES ('44', '2', '2957', '1543539963', '1', '0', 'dab6d18fafef23a3fa25c423dcba3fc9de39e7723711c25dcd2a4e014cb4aa1f', 'case_ej1.png', 'portal/20181130/de4b2d0b765ddf07daf31d375068a11b.png', 'dab6d18fafef23a3fa25c423dcba3fc9', '8a4d8c5eb818f0b3f38a6fba904a6e06dcdf03e6', 'png', null);
INSERT INTO `ld_asset` VALUES ('45', '2', '2963', '1543540368', '1', '0', 'ed3dbb102569ae1868cadfd9a7e76fdb7c8bdffb21c860ac473548b67217898f', 'case_ej1h.png', 'portal/20181130/6abdb545db121daf73528bc45a7b1931.png', 'ed3dbb102569ae1868cadfd9a7e76fdb', 'c34966653ec0b457e1e48182a3694bf87b26ac06', 'png', null);
INSERT INTO `ld_asset` VALUES ('46', '2', '3748', '1543545936', '1', '0', 'a697d2de18c1f0abf54dc1fd872283b5668aa58708603b7c572165c1fbac2633', 'hyyx1_2.png', 'portal/20181130/4dde4ad7b1dcb41557dbcb35d71baae1.png', 'a697d2de18c1f0abf54dc1fd872283b5', '5b08dc9e4b134996e278a40f362a795637669373', 'png', null);
INSERT INTO `ld_asset` VALUES ('47', '2', '4320', '1543551534', '1', '0', '63c2ff424b9c792175f6b6167a8681c0806b5d2b39d4b28ccc22a3154c58176a', 'sh1_1.png', 'portal/20181130/8521162f5662faa6223216612f739fdd.png', '63c2ff424b9c792175f6b6167a8681c0', 'b89f214deb4d61c0f3e875818dd92b8f50199dae', 'png', null);
INSERT INTO `ld_asset` VALUES ('48', '2', '2581', '1543559772', '1', '0', 'cabd2e3d026429cdf6bda5ba47700c502e63848a82e762776055beeb022724fa', 'in2_1.png', 'portal/20181130/1a62d9115dd9b4d8a59d77f59ec980b7.png', 'cabd2e3d026429cdf6bda5ba47700c50', 'bc65da06604e0ef1f64b810a883cd61f4b133287', 'png', null);
INSERT INTO `ld_asset` VALUES ('49', '2', '3123', '1543559982', '1', '0', 'df122c6ed0eec827158fa7b1f4149fe4c37d38070969ec9220351c272dcc10e1', 'dxtz_3_1.png', 'portal/20181130/2d5ff66627afcc1c4f767145e974119b.png', 'df122c6ed0eec827158fa7b1f4149fe4', '8d0ada902a7d33ff96ac5b16b0f0f4d56bbfe128', 'png', null);
INSERT INTO `ld_asset` VALUES ('50', '2', '4294', '1543560129', '1', '0', '3491db50b9fc5820937913860f1ba51abe23a92b05abe371bbe22551ee281bfa', 'dxtz_3_6.png', 'portal/20181130/1b193797944b265ca3a8e11701e6d165.png', '3491db50b9fc5820937913860f1ba51a', '412d7e8406e3b0888a91631022fbdeb8befbbe6f', 'png', null);
INSERT INTO `ld_asset` VALUES ('51', '2', '2310', '1543560266', '1', '0', '38d0a9c7c19e580619f821f043bc2bf7409641cf80f166a0e084e1f9680d2971', 'dxtz_3_5.png', 'portal/20181130/62992a2fef3dc5083020f61c41168d99.png', '38d0a9c7c19e580619f821f043bc2bf7', 'b2c8222de8b969abc282e928db5cf306f024e003', 'png', null);
INSERT INTO `ld_asset` VALUES ('52', '2', '4720', '1543560300', '1', '0', '7c6741225524edff19869457e69fb3ba87fd7f4197a23ad20aaaa4b45444d7c0', 'dxtz_3_4.png', 'portal/20181130/e2a35397e50b37d0056ca1d9899be5ff.png', '7c6741225524edff19869457e69fb3ba', 'f7209d6428ecb6d990319490417f1e88354ae035', 'png', null);
INSERT INTO `ld_asset` VALUES ('53', '2', '2729', '1543560327', '1', '0', '66e9c9ba317f85990be877048f8ab61d5365350b1b62243f80ea033df43c51ab', 'dxtz_3_3.png', 'portal/20181130/f89c0b3ec1c37a1f367a31bcbe00725a.png', '66e9c9ba317f85990be877048f8ab61d', '710ea533cf17c48007d2812e0277c2c34491e32d', 'png', null);
INSERT INTO `ld_asset` VALUES ('54', '2', '2416', '1543560355', '1', '0', '8541945b12d22ab19050a9c7d9a461d27bd01c752301354eff85ef7fc7d7fa05', 'dxtz_3_2.png', 'portal/20181130/29b0d7e0273b9d16f53a315d4b9fd2fb.png', '8541945b12d22ab19050a9c7d9a461d2', '361938c24fd6ac333635a978fb4598ef750f14a9', 'png', null);
INSERT INTO `ld_asset` VALUES ('55', '2', '2767', '1543560499', '1', '0', '67d16bda20722158d86e0e28e6c72df0041942a49ae1edfc776dfbd279095b12', 'sh1_6.png', 'portal/20181130/e2a0588de5071d2621b709ae7e2b67e0.png', '67d16bda20722158d86e0e28e6c72df0', '4489786d8e560781bf4e68f3c1f64317a6c9a487', 'png', null);
INSERT INTO `ld_asset` VALUES ('56', '2', '4068', '1543560570', '1', '0', 'cceb5018b5fbf2131ff2c45787457f145ecb762d15d58a522edcfee7a5f8be51', 'sh1_5.png', 'portal/20181130/c2ccda581c3e679fdcef99c1f24e7ff8.png', 'cceb5018b5fbf2131ff2c45787457f14', 'ebaccc1b38c14a0adc6ad7e2ec650008d0e656ff', 'png', null);
INSERT INTO `ld_asset` VALUES ('57', '2', '3619', '1543560684', '1', '0', 'b098b26585162f176da053ddbfe1ec49ac83b47e516371ddb1534f8cbaff2398', 'sh1_4.png', 'portal/20181130/b4d36131c4b43e669624efded64d78dd.png', 'b098b26585162f176da053ddbfe1ec49', 'bd3bc1d576b02d7f553dc07f3b7804d28122f75a', 'png', null);
INSERT INTO `ld_asset` VALUES ('58', '2', '4877', '1543560716', '1', '0', '9c68da08a0e51b813b56b36add5e8422328454c375241fe245beea7f85100047', 'sh1_3.png', 'portal/20181130/c31a1408b30d72ce435d16dcc2e7cfc9.png', '9c68da08a0e51b813b56b36add5e8422', '980819480020d374edaf723bf888e87e2de04c9d', 'png', null);
INSERT INTO `ld_asset` VALUES ('59', '2', '3192', '1543560742', '1', '0', '38964ab82e29ff4172f2c1417f870617b26bc9a1a70f21d7738cb9e03bb48d75', 'sh1_2.png', 'portal/20181130/a1970a33a64a6c02d1cc2b7069e6d0d7.png', '38964ab82e29ff4172f2c1417f870617', '4cfd0893496090afd4390237790d8f6ee6989cc9', 'png', null);
INSERT INTO `ld_asset` VALUES ('60', '2', '4358', '1543562000', '1', '0', '3e7ddd0ff0d87e588003e947865137cd88aef0d46ae9c1563a5454b20fdd3d17', 'sh1_1h.png', 'portal/20181130/b52acb45e66d2e0d6f8649418fa3e076.png', '3e7ddd0ff0d87e588003e947865137cd', '2c060825e8c3bf2085074d5f5bac60fafe293658', 'png', null);
INSERT INTO `ld_asset` VALUES ('61', '2', '3208', '1543562124', '1', '0', '36d61e7055345bf072e732d9f62a34025356bd23fde7cb078d2d590094634966', 'sh1_2h.png', 'portal/20181130/83635ca78c73c2591dd79fe11aac87f0.png', '36d61e7055345bf072e732d9f62a3402', '5e685db7006d0512e50690d67a26b77043474995', 'png', null);
INSERT INTO `ld_asset` VALUES ('62', '2', '4886', '1543562247', '1', '0', '7ac5f71af8570d2b9d5a18157f79f2ba740b3de6c9264f7aeb5185a28abb12a1', 'sh1_3h.png', 'portal/20181130/8e1ad4039f31d439e22f04dbf31ff254.png', '7ac5f71af8570d2b9d5a18157f79f2ba', 'a4ee36d243ed850fd5666bae9b7ea51611622eca', 'png', null);
INSERT INTO `ld_asset` VALUES ('63', '2', '4532', '1543562286', '1', '0', '551a55794d7dd49cb63ef288ba7f3fc2bbc3342545be840fff1466d29e69144d', 'sh1_4h.png', 'portal/20181130/44f7e660d6be9bcba433c8bae8214570.png', '551a55794d7dd49cb63ef288ba7f3fc2', 'ff1f3b04fa2bca0101315e5c4144bd0aa3fa2439', 'png', null);
INSERT INTO `ld_asset` VALUES ('64', '2', '4040', '1543562303', '1', '0', '449884e54cb0de461ad590a1aea85f5b1687ecbcf39f1aac9cb36d6b2837ebaa', 'sh1_5h.png', 'portal/20181130/43e4541b18d536e136a1b52143729aae.png', '449884e54cb0de461ad590a1aea85f5b', '0314b6264d9f64b03f6a5c6ba1f73a1486b1c5a0', 'png', null);
INSERT INTO `ld_asset` VALUES ('65', '2', '2784', '1543562317', '1', '0', 'a48a0985fb33331d6251d4f0c5d414917745151b015848c38facc52fa91ff017', 'sh1_6h.png', 'portal/20181130/993b9118f599fd4c4bdb5779dc081faa.png', 'a48a0985fb33331d6251d4f0c5d41491', 'a65fb6b8ac595905b39c2a7ee2da0981b3843be7', 'png', null);
INSERT INTO `ld_asset` VALUES ('66', '2', '2686', '1543566299', '1', '0', 'cada08e8765cad1604134659bd89b5f7e13d75f6ea2c29ee0447392a2b4fe36f', 'case_ej2.png', 'portal/20181130/5d0cc9c3fb89b82a0e4f966848896d72.png', 'cada08e8765cad1604134659bd89b5f7', '42f83b69e3ec8aa59f8eb94d33abbe28ab35d31f', 'png', null);
INSERT INTO `ld_asset` VALUES ('67', '2', '1559', '1543566336', '1', '0', 'ae037c62e9e95823caeb3b2b06ae24e7af7521a135e8f76cd05475122ec16360', 'case_ej3.png', 'portal/20181130/0e689fb5eedb6eb4d299b2d6135d2a9a.png', 'ae037c62e9e95823caeb3b2b06ae24e7', '7762a9e21e18bc066504f92a18f58c50f442bffa', 'png', null);
INSERT INTO `ld_asset` VALUES ('68', '2', '2590', '1543566362', '1', '0', '0a41d3bc8ef320a83daddc06b7c12f59689aca75f012f618c870fd3e99742e01', 'case_ej4.png', 'portal/20181130/c175617e28c266407b79b42156eb681d.png', '0a41d3bc8ef320a83daddc06b7c12f59', '4fb7b973fb9479e60f861cf54d12f2eaa625ecf5', 'png', null);
INSERT INTO `ld_asset` VALUES ('69', '2', '2393', '1543566385', '1', '0', 'af74b623f8f5371175b1a7ec3b3523a132d01bb85044fd0af6d78285fd968375', 'case_ej5.png', 'portal/20181130/245016edf0aa9ecc5a7e0b6bd0b1c032.png', 'af74b623f8f5371175b1a7ec3b3523a1', '8d051a5fb4876a4627f7ff9b3632660f4674be88', 'png', null);
INSERT INTO `ld_asset` VALUES ('70', '2', '2695', '1543566723', '1', '0', 'a135d9e11ab94212d1fd0006c4eedd87b1e42047e4bfc77d00c3aa142497b0f5', 'case_ej2h.png', 'portal/20181130/f906f4c3d7e8f6eb188ca7736dd40cde.png', 'a135d9e11ab94212d1fd0006c4eedd87', '8299de9f531955c4856eac7d61ad7148d9d2ab82', 'png', null);
INSERT INTO `ld_asset` VALUES ('71', '2', '1551', '1543566745', '1', '0', '9efe2e438755e919fcc2848b4354e355141424d592328b3e3fcd34538646f99d', 'case_ej3h.png', 'portal/20181130/267b7be9b64dbb73ae86c17a9887c8b8.png', '9efe2e438755e919fcc2848b4354e355', 'cab3a28f6435a8d4901e28e22c190634155257be', 'png', null);
INSERT INTO `ld_asset` VALUES ('72', '2', '2594', '1543566763', '1', '0', '6ed0a8f915dc7cd9116e08e90a4a18e9bb7612206726967d0e9051542c77e106', 'case_ej4h.png', 'portal/20181130/240cd05645aa7a6410f51b4a3b003835.png', '6ed0a8f915dc7cd9116e08e90a4a18e9', '8b2d801ada4219d1e189e31c27dce93faab0411a', 'png', null);
INSERT INTO `ld_asset` VALUES ('73', '2', '2402', '1543566804', '1', '0', 'ffe446309bac844e2aa060618120826b59579fbfc314cd117b51ea8dfe629c92', 'case_ej5h.png', 'portal/20181130/782243dcf11c080d6e9549fa5eb26487.png', 'ffe446309bac844e2aa060618120826b', '04af8bd2bce8b1f3d810b37f0a6d7ee5b25818cc', 'png', null);
INSERT INTO `ld_asset` VALUES ('74', '2', '13752', '1543570177', '1', '0', 'ed98871a7d66679e03a72e5912889413782294aa39113c8d34b9766cb7ac9008', 'case_ul.png', 'portal/20181130/c7ea02fe26a0e8463a2890e53208c5fe.png', 'ed98871a7d66679e03a72e5912889413', 'bf1adeeaeca536a3bb8878061a355b0bf5135b77', 'png', null);
INSERT INTO `ld_asset` VALUES ('75', '2', '2391', '1543571001', '1', '0', '12bdc7e9f39ae33d3f06c528edc48b63b997105c68538a30d0d1d31fdb690028', 'in1_1d.png', 'portal/20181130/ede3fa254a93797915aeaae1a882af96.png', '12bdc7e9f39ae33d3f06c528edc48b63', '089f1fb1cbd65da6357ec50a369ef9eb4c19a8c1', 'png', null);
INSERT INTO `ld_asset` VALUES ('76', '2', '2394', '1543571014', '1', '0', 'bec0ddc8091d71b47222726e5187bbd45d41269f74cf9c7ef8685e5c4b45c834', 'in1_1.png', 'portal/20181130/ec832e8c18afa69089b011233926f59e.png', 'bec0ddc8091d71b47222726e5187bbd4', 'bc92ec6ad2ae5677091fb10bb689e07533ba7eee', 'png', null);
INSERT INTO `ld_asset` VALUES ('77', '2', '3788', '1543571033', '1', '0', '1510e691c1732b5c9bd0d081b47c844bf7d5e5e155b9d2dbf0a804894460ce65', 'in1_2d.png', 'portal/20181130/d6627dd1ff6c4cc5c6c3633ca252fbfc.png', '1510e691c1732b5c9bd0d081b47c844b', '3a5098c0cf2d084890b6198aa42dd7f8d6f3a77f', 'png', null);
INSERT INTO `ld_asset` VALUES ('78', '2', '4000', '1543571043', '1', '0', 'cd74e5f0c735af11a2e0fccd120d5806256f1fcc5f5f14015ed51d219d6cb89d', 'in1_2.png', 'portal/20181130/1838b9ef5fe363cdaee46761640ca0a2.png', 'cd74e5f0c735af11a2e0fccd120d5806', '407784db4f853d0aafef2da596d767c8dea2dd92', 'png', null);
INSERT INTO `ld_asset` VALUES ('79', '2', '2082', '1543571062', '1', '0', 'cbcf8ba38d3b5295f7cfeed3ef70df8f8863b453daff4888bfb737511af51d9e', 'in1_3d.png', 'portal/20181130/63455c87d7b78d599659a16850a38eab.png', 'cbcf8ba38d3b5295f7cfeed3ef70df8f', 'a5516159b784378b230b057ea93521b6c4d38651', 'png', null);
INSERT INTO `ld_asset` VALUES ('80', '2', '2059', '1543571069', '1', '0', '4ac73c1d4de70d994346ac5ac88d0ce6cc5617024717ac4b63a6ad7a52f4739a', 'in1_3.png', 'portal/20181130/788f4c3b2b34e7f94b2d22e4b8a9c472.png', '4ac73c1d4de70d994346ac5ac88d0ce6', 'ed6b4f37e455b2226d3e08bfd281cc8a1e61d11f', 'png', null);
INSERT INTO `ld_asset` VALUES ('81', '2', '1631', '1543571088', '1', '0', '0a31d7a72553205a298c61a628877a40c1f0ec5ab16a8a849ed180bde5cf1b51', 'in1_4d.png', 'portal/20181130/c495980b8edf7b32310775cdba7ef3ff.png', '0a31d7a72553205a298c61a628877a40', '51eccc75d1ecca25a7586686a2a9426d94a996ce', 'png', null);
INSERT INTO `ld_asset` VALUES ('82', '2', '1638', '1543571096', '1', '0', '28881adff0c6b42845853f27003ecab44ac5ad26ab976b255c46330c800aded7', 'in1_4.png', 'portal/20181130/cac8674fbcccf4bf472d919f7a32aa5c.png', '28881adff0c6b42845853f27003ecab4', '0ffd59a85de01ccadc041629db583797913125ec', 'png', null);
INSERT INTO `ld_asset` VALUES ('83', '2', '3755', '1543803636', '1', '0', '786efa63fbce7f64c4be75ec021c34b8f15782ca9d739fb3e739fa1d94add123', 'dxtz_3_1h.png', 'portal/20181203/c10bf2c66b4a4fd5d4b25dee1761087c.png', '786efa63fbce7f64c4be75ec021c34b8', 'e16f667d122bf3aa5769ce37b96bef0b4676e2ef', 'png', null);
INSERT INTO `ld_asset` VALUES ('84', '2', '2613', '1543803650', '1', '0', '907b8e2d0ee7878c43aa4d3e06257581c64b0794679e3933f40a3dafbc81298c', 'dxtz_3_2h.png', 'portal/20181203/6d8d105558a695b2f046a7b07a72f486.png', '907b8e2d0ee7878c43aa4d3e06257581', '2ce4b758b89ece97a5157dcc8abcee35d8748828', 'png', null);
INSERT INTO `ld_asset` VALUES ('85', '2', '3551', '1543803666', '1', '0', '574555905bdbc2ca28d38f71328d4583aae48a3688b066e3b9075a8de10a32e1', 'dxtz_3_3h.png', 'portal/20181203/2cb8bd2c885b0bbb9bdf6239ff0031f8.png', '574555905bdbc2ca28d38f71328d4583', '23b278474f02c9589d64ac0ff7a3a48dde31fc3d', 'png', null);
INSERT INTO `ld_asset` VALUES ('86', '2', '5839', '1543803679', '1', '0', '2b8f4ece9f4babbcd769fdf08b33d27b0e20db0e20d1690dd435270b1161aa42', 'dxtz_3_4h.png', 'portal/20181203/c35d73112857b80e4c3f8171fec45996.png', '2b8f4ece9f4babbcd769fdf08b33d27b', 'a597a4d68345b3f14746cc7246fb20f38c2500d5', 'png', null);
INSERT INTO `ld_asset` VALUES ('87', '2', '2515', '1543803701', '1', '0', '510f3692ca82bd396a2ac17938ad731f64e0bb1d51bff6ce4b7743b8cc865e85', 'dxtz_3_5h.png', 'portal/20181203/12cc7327496ac7ef06301f09ee1bcdeb.png', '510f3692ca82bd396a2ac17938ad731f', 'b5a4fb704446abf80aa162cc3d34b68a79aef908', 'png', null);
INSERT INTO `ld_asset` VALUES ('88', '2', '5184', '1543803714', '1', '0', '408907867e56864a4651638d9315472fc690820eac8d39728eb352652b0b9b5f', 'dxtz_3_6h.png', 'portal/20181203/3dcbebb57724574bd8ecf018781494a5.png', '408907867e56864a4651638d9315472f', '8654ca3d4027aa2c87ffe182ac4ce57c45ff8743', 'png', null);
INSERT INTO `ld_asset` VALUES ('89', '2', '1661', '1543804501', '1', '0', 'f9574eddee744354fceb0a5d8d3e117b6fa06520217c3fb8fb59a8651af5cfd3', 'hyyx1_4.png', 'portal/20181203/49a2b97729f4e5dc70a0479cbb797de3.png', 'f9574eddee744354fceb0a5d8d3e117b', '69dd4e724ec2e7074af00435fa114101df62eee0', 'png', null);
INSERT INTO `ld_asset` VALUES ('90', '2', '1799', '1543804513', '1', '0', '02ec8f50c185eacc0440acdacbb6b31b17d05a69f73c3d5441d70dcb4089ab2c', 'hyyx1_4h.png', 'portal/20181203/0a527d6163d5366e2ff78983bbe4828b.png', '02ec8f50c185eacc0440acdacbb6b31b', '92e5b3977fa8da02d9b4b7a7f351f1a244a086ad', 'png', null);
INSERT INTO `ld_asset` VALUES ('91', '2', '2327', '1543804571', '1', '0', '569c98985fd2dec8cc838c1e5af033108860ec75a51a351c56c8fefaa3ed4cfa', 'hyyx1_3.png', 'portal/20181203/8823a612f93a5d34f04a81e68627f0c2.png', '569c98985fd2dec8cc838c1e5af03310', 'a07774c64d9d7b449f7001e135efd6f1ee4a272f', 'png', null);
INSERT INTO `ld_asset` VALUES ('92', '2', '4334', '1543804623', '1', '0', '13ea7381a37469e11fb170e56f6a5056d695016d4b29061734d9e0a5851d8eca', 'hyyx1_2h.png', 'portal/20181203/8b6e4140458d8f04cc2644c90983f38a.png', '13ea7381a37469e11fb170e56f6a5056', '97d6c4e55a02f0059555083e2ce4c5d3afbd5a70', 'png', null);
INSERT INTO `ld_asset` VALUES ('93', '2', '2996', '1543804644', '1', '0', 'd70bccc9efbdb6839bfac249aff828fe0fb0dc856ee4561da777a34bd3430d2d', 'hyyx1_1.png', 'portal/20181203/b105f3bb5e1bb19a2c118edc1582fc6f.png', 'd70bccc9efbdb6839bfac249aff828fe', 'a2ff942a7295e223ae049f7d5d7608850b52002c', 'png', null);
INSERT INTO `ld_asset` VALUES ('94', '2', '3218', '1543804652', '1', '0', '6cafef99f35c1c2a9801d05627533d4b6e00d8e8e7c4098fb12a11831385a879', 'hyyx1_1h.png', 'portal/20181203/51b47107aa21d0c5d92cf96a3c32dbcd.png', '6cafef99f35c1c2a9801d05627533d4b', '477a20be46faf7f0fc899244b541668dcc737b0c', 'png', null);
INSERT INTO `ld_asset` VALUES ('95', '2', '1796', '1543806558', '1', '0', '910ae88b27ead8e58169e533977b28be408c1a631bfba4b4b17ba45b1e54f1e9', 'in2_3.png', 'portal/20181203/bbf268ffc641a9f17168909a234882e0.png', '910ae88b27ead8e58169e533977b28be', '3c01d3adde0ad1abc8290cdbd2bda0ac3234dfba', 'png', null);
INSERT INTO `ld_asset` VALUES ('96', '2', '2115', '1543806582', '1', '0', 'ab552c95071e2beaf0daff06a3891267084e4634662be7f0fa59be7a999cf6a9', 'in2_4.png', 'portal/20181203/58f6c9cd828d422a9204ecc5e8b10dc9.png', 'ab552c95071e2beaf0daff06a3891267', '3e9e0c835f32f96e77ee22591033b44940a6d2f7', 'png', null);
INSERT INTO `ld_asset` VALUES ('97', '2', '2371', '1543806612', '1', '0', 'fb31e7e96dd86c1de1156b2ac4b77179a7cf2f9c9c8b7f5a3c8d6ac7d7ce124f', 'in2_2.png', 'portal/20181203/ebd02b864fc407c8b6403eaabb2f6394.png', 'fb31e7e96dd86c1de1156b2ac4b77179', '930739cd02f6ffc279625aad3b5f022bacffebde', 'png', null);
INSERT INTO `ld_asset` VALUES ('98', '2', '338638', '1543806839', '1', '0', '8665abaae022323736ab8a128fd142e5eb8af5feb7d1833382829f5d63d74c5b', 'in2_bei.png', 'portal/20181203/0843311392f6f6b91dc774cfe327d219.png', '8665abaae022323736ab8a128fd142e5', '16f75f355671781e5c103b7f7de1b0cbc4106f28', 'png', null);
INSERT INTO `ld_asset` VALUES ('99', '2', '2361', '1543810349', '1', '0', '5fbad55ad26088f1f13734e391d49e7ba118d6e2e147e63239e158f53ee2894b', 'in1_1h.png', 'portal/20181203/59d63bb91ec2af9a881dbd90450f1bd7.png', '5fbad55ad26088f1f13734e391d49e7b', 'cd80f45d880341f3949b7c4100523274adccfae6', 'png', null);
INSERT INTO `ld_asset` VALUES ('100', '2', '3385', '1543810378', '1', '0', '282cad8c53c6bc49d05d1ab8a8c6fbcec9072839fe88b3693788be74310bd550', 'in1_2h.png', 'portal/20181203/101e145fcebb9286b684fc229055d332.png', '282cad8c53c6bc49d05d1ab8a8c6fbce', 'f63a626fcc091374194ab0d92b9dcd5290a05a5b', 'png', null);
INSERT INTO `ld_asset` VALUES ('101', '2', '2102', '1543810398', '1', '0', 'd60c881d40c1b219eddee69849961b015fecb4244e56190f2c510427e2fd8d70', 'in1_3h.png', 'portal/20181203/5231aa8132b82bf8c4edb20c034194b4.png', 'd60c881d40c1b219eddee69849961b01', 'ba0e8b2d3343dbd672ee0c12e0be8158f150433a', 'png', null);
INSERT INTO `ld_asset` VALUES ('102', '2', '1608', '1543810423', '1', '0', 'd730a299193826fe9583a578114647832ad6c660fde6f75f15eba4f802f0ab7e', 'in1_4h.png', 'portal/20181203/7efc0b375ff3e739f7fbfb0697faa655.png', 'd730a299193826fe9583a57811464783', '761c4735fba76e3fd12072d099d11f6bf02d6cfb', 'png', null);
INSERT INTO `ld_asset` VALUES ('103', '2', '11807', '1544751211', '1', '0', 'ff2fafc18dcb729ee7f35c2d7203818bcda188f5d5eb33b0ac4e395c0dcb5c4e', 'ewm.png', 'admin/20181214/5cde4ba76910b1df2ff6c08c7e2d194c.png', 'ff2fafc18dcb729ee7f35c2d7203818b', '2f1bcedd207eb655ce6dc4e47bd20de58aa1bb98', 'png', null);
INSERT INTO `ld_asset` VALUES ('104', '2', '1542281', '1544753845', '1', '0', '904344c86869ae6653e5de6cb48037c6d7f8e3f731c27e3f152e274d9df5e321', 'banner1.png', 'admin/20181214/9bc3dde7943ed8d24ec122e2ac2dbac2.png', '904344c86869ae6653e5de6cb48037c6', '515ece4e7d36790503306d864121079ec42d61ff', 'png', null);
INSERT INTO `ld_asset` VALUES ('105', '2', '126499', '1544755951', '1', '0', 'ce24ea100e6909107b4068ecccd239b2bb8699a2c828b968ec5907cef2b09a0a', 'news_img.png', 'portal/20181214/47f1a10f767f49576119d2c021c60227.png', 'ce24ea100e6909107b4068ecccd239b2', '86683c75b617248997fe9686694f97a92d07acef', 'png', null);
INSERT INTO `ld_asset` VALUES ('106', '2', '581587', '1544759431', '1', '0', '482591707c2dc4e032237fb1fdc22e4130fa65b0f22ff7978f95a27210f4ded5', 'gsjs_img.png', 'portal/20181214/2cf31eb4bd335ca265261abb2dd0d641.png', '482591707c2dc4e032237fb1fdc22e41', '2e1299ebe68d19c27f594c2273a150152baf4bff', 'png', null);
INSERT INTO `ld_asset` VALUES ('107', '2', '234228', '1544765831', '1', '0', 'e0163f069b40209643867abc043d52d810c24ccfa3d769473d7ab05fb20a64c0', 'videos_img.png', 'portal/20181214/09fea82e4c5beb9c333d65a56e619969.png', 'e0163f069b40209643867abc043d52d8', '7dd4ecb0e156be50a6ad1cf222fed564db660f51', 'png', null);
INSERT INTO `ld_asset` VALUES ('108', '2', '41798906', '1544765933', '1', '0', 'baedda985331f12640e76be7d49875fe5b74d2e9c37b88052d18b46578113b97', 'shipin.mp4', 'portal/20181214/51509a49060d7b0a1264b31206f5ee39.mp4', 'baedda985331f12640e76be7d49875fe', 'f6dd2d08354e850679bca7aad2e26a13be21d2d1', 'mp4', null);
INSERT INTO `ld_asset` VALUES ('109', '2', '13512', '1544766778', '1', '0', '72a33260b140c2faf187719b68351161712fd3224f6316ffddf09ce9df60cc0a', 'in3_1.png', 'portal/20181214/74307152a7641997303d5be2265cb38b.png', '72a33260b140c2faf187719b68351161', 'aec5cff19d5c1bff4c2c23874df1b495d5714dfb', 'png', null);
INSERT INTO `ld_asset` VALUES ('110', '2', '97099', '1544780201', '1', '0', '7f145be12e0cde44f7e368bff1f342c561a34cac3077a4e1c59a4f6c69442f2e', 'hdry1.png', 'portal/20181214/bfc085cf35c95c99780686d71be8aedb.png', '7f145be12e0cde44f7e368bff1f342c5', '6a25974ee915e35d409c23717d3cf29c74d2d631', 'png', null);
INSERT INTO `ld_asset` VALUES ('111', '2', '102435', '1544780369', '1', '0', 'c2ba7deca4dc79829021c06097342fce7c0e7ed359758f6c8906a065f7466af9', 'hdry2.png', 'portal/20181214/3c4ba907bbc1edad034080087aeec10a.png', 'c2ba7deca4dc79829021c06097342fce', 'b2f9b5f57b9bd6405681289991b25d91fc94041d', 'png', null);
INSERT INTO `ld_asset` VALUES ('112', '2', '151033', '1544780439', '1', '0', 'e16f7483bd719056d97ce10f64d22728f6512bc7c5d535a3e699cd59e3342b18', 'hdry3.png', 'portal/20181214/86491e6b389ad661e8e26e66a2af5f9f.png', 'e16f7483bd719056d97ce10f64d22728', '62778af6370915339b3b59a023dc9d44671d972b', 'png', null);
INSERT INTO `ld_asset` VALUES ('113', '2', '152617', '1544780969', '1', '0', 'eff5d0315a9eb61df5e981b6f7ed8bd8347458bfba7ce218217236beb71b51a0', 'hdry4.png', 'portal/20181214/def18fa24cfaa4bf6d07555d2a97c7e5.png', 'eff5d0315a9eb61df5e981b6f7ed8bd8', 'a54318f59f6d4b9d2cf9af34e8f2b7bb7cb636d0', 'png', null);
INSERT INTO `ld_asset` VALUES ('114', '2', '213434', '1545013823', '1', '0', '19e4cd6fdbf4553bf569d690ad415506f483ae18e1f42d1e0dbbd9a867b8b181', 'jjfa4_flimg.png', 'portal/20181217/b2824bf5b93dbc10d873981dd3084314.png', '19e4cd6fdbf4553bf569d690ad415506', '338ec2aa887186f8bc0ab85866af54efc1d114f5', 'png', null);
INSERT INTO `ld_asset` VALUES ('115', '2', '202900', '1545026448', '1', '0', '7424928994da2a8d3135a25c044232083b33db71f3a2aeee73bfa6a373ac6838', 'jjfa1_flimg.png', 'portal/20181217/a6961b16bee39be1960eb67e53238a00.png', '7424928994da2a8d3135a25c04423208', 'b7214f527310ba8df4598e3120ab3bbddca2f843', 'png', null);
INSERT INTO `ld_asset` VALUES ('116', '2', '187198', '1545026465', '1', '0', '968d2e0ceb1b4911b6c18655b9450301a51ea270c62320fe484241765a966bf8', 'jjfa3_fl_img.png', 'portal/20181217/7ba123a6c78e8f167e469e65f6b41447.png', '968d2e0ceb1b4911b6c18655b9450301', '29e47ad4900516a9443bb80d256c23d54bc4e918', 'png', null);
INSERT INTO `ld_asset` VALUES ('117', '2', '2703', '1545034218', '1', '0', 'b30e4b6d0601b81cd26642e315fff0ace6ab776cc2e7df9e3e8c490aec8263cd', 'lxwm1.png', 'portal/20181217/b82e307a5cc7df06d726cb729d281a26.png', 'b30e4b6d0601b81cd26642e315fff0ac', 'f2cd7c88df5d82c7a69e97ef41d961fa51d0bbf4', 'png', null);
INSERT INTO `ld_asset` VALUES ('118', '2', '2022', '1545035434', '1', '0', 'e0e9182cc859973e3a8a2563a86ce503479d45d97b1457479dacdd1c9d135cca', 'lxwm2.png', 'portal/20181217/648ba5e9b823c2c82c6d4ca1c9e7c7a9.png', 'e0e9182cc859973e3a8a2563a86ce503', 'a58e9a84b18f7541005cd4c09f1a03ece69f2bff', 'png', null);
INSERT INTO `ld_asset` VALUES ('119', '2', '22983', '1545035450', '1', '0', '4d1739c08bb4423e2c08bfc867500b227ee4466b66a5d36dba823a1c2814dd90', 'lxwm_ewm.png', 'portal/20181217/d753551fc0e8b3ddf3ce8b5e0ae2a93a.png', '4d1739c08bb4423e2c08bfc867500b22', '9d96b6d1d7902eea7a58ab5be1c9817e7c7f8e8a', 'png', null);
INSERT INTO `ld_asset` VALUES ('120', '2', '2018', '1545037247', '1', '0', '53e04821bf821e299c4cdd8c20f23fa0c54fa952991184d73984d72388ff8522', 'lxwm3.png', 'portal/20181217/58f4b2cb16eb597727660631a18ba55f.png', '53e04821bf821e299c4cdd8c20f23fa0', '14a1fbe95bb5c5ac6630dff10799f231405c0517', 'png', null);
INSERT INTO `ld_asset` VALUES ('121', '2', '8395', '1545040098', '1', '0', '3e9aface790aefcc75f4b419daaf5c53d809eb94e6e7843870cf89ea1b60cf84', 'in1_2.png', 'portal/20181217/b6a60e43b4fdddc2c18a75cb91536379.png', '3e9aface790aefcc75f4b419daaf5c53', '6e59a9a466b59970bc1552775a6ebad23a748b8a', 'png', null);
INSERT INTO `ld_asset` VALUES ('122', '2', '9469', '1545040142', '1', '0', 'cc55c838f6d0cbd18477368bf13376cfe351f61cda75b569589f077900a90fcf', 'in1_1.png', 'portal/20181217/97e61403cafb3e21f716402ce95d3037.png', 'cc55c838f6d0cbd18477368bf13376cf', '6d714f92149b49ff2091a749ed84713803ab1df8', 'png', null);
INSERT INTO `ld_asset` VALUES ('123', '2', '10486', '1545040165', '1', '0', '3e701f13fd47d188f35843d107241fb957bcdc7fc44c44a2dcb6c56b4559bd20', 'in1_3.png', 'portal/20181217/89722d0ec305a9cdb729c5c76c8ec2c2.png', '3e701f13fd47d188f35843d107241fb9', '1d0f38690f327caf4845c355f7fd7072a11f2953', 'png', null);
INSERT INTO `ld_asset` VALUES ('124', '2', '304203', '1545040842', '1', '0', 'b962c93b40dd38e71637777108c1237b880a2d0d2e3aa517471511c58135a19f', 'in1_bei.png', 'portal/20181217/477138eee0816029996a46bbe4e8bcd7.png', 'b962c93b40dd38e71637777108c1237b', '9863b6876938202d9c6977aaf191727b06bd61da', 'png', null);
INSERT INTO `ld_asset` VALUES ('125', '2', '437259', '1545097388', '1', '0', '534c0f22645645f2755d7f4129a1146744d2675275dadd195871a1b3d404f92f', 'in2_img.png', 'portal/20181218/5671e2f182717934d54aa474106bd2d2.png', '534c0f22645645f2755d7f4129a11467', 'ce21cc665ea1bc0d5e278a764f45e987d2ad105d', 'png', null);
INSERT INTO `ld_asset` VALUES ('126', '2', '529173', '1545099028', '1', '0', '7c715015ee1bf57b9ba90cd6aea7ca6d762904cfc24c50f27339293d28e2ac6d', 'in2_bei.png', 'portal/20181218/cb69129c85837c56528264ed26d166b2.png', '7c715015ee1bf57b9ba90cd6aea7ca6d', 'd1f702f740a9e9ec215bbe41e99796ac1e5611a9', 'png', null);
INSERT INTO `ld_asset` VALUES ('127', '2', '851705', '1545099268', '1', '0', '7d1a2762c4161635f43359f08e3870de0519897603e3ddd8b44651663daf62eb', 'in3_bei.png', 'portal/20181218/6d3b1a8a1954734f9a2ba9f2bd035223.png', '7d1a2762c4161635f43359f08e3870de', 'f62b8bf7e1ce19280d64e52d1000d95c593b9ad3', 'png', null);
INSERT INTO `ld_asset` VALUES ('128', '2', '691001', '1545099953', '1', '0', '48b4773600d2ec9b9e3a008216f11de2f9674d4c882d41523eff38224459fb3c', 'in4_bei.png', 'portal/20181218/997e32b9d541cdeb87dda92551c3dce8.png', '48b4773600d2ec9b9e3a008216f11de2', '4479440f04751083e274e0cc4f15374f02fa48ee', 'png', null);
INSERT INTO `ld_asset` VALUES ('129', '2', '21560', '1545703514', '1', '0', '7df1032e316ba2fe27cf516619544ffb7eb089030a6acdaf4d9dd4ba871ffa85', '_c_SNKFOVAKHIsWJ53CZ89YDQVhP1QdbKLBn4NKFV8pQgwhEDTyCfGrFCBPVk9PozS_6Kb2y3rGwNwmIxe6fS56IRJPs6MozZSG.', 'portal/20181225/0ae2989426c204fa106cf4e8d8e34cdd.jpg', '7df1032e316ba2fe27cf516619544ffb', 'e7b1a8017ae5e05988004a8dcd149e4bb8f1baa7', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('130', '2', '9728', '1545707972', '1', '0', '24bde11e4aacad9265914a9266800f4818922ec2b54a2ba6b89ca116849279a5', 'ces.doc', 'portal/20181225/e2903cbb02769e0dedd10affa5494da4.doc', '24bde11e4aacad9265914a9266800f48', '97b1f663bf8623d06e14a5cdf10a7d0ffc173ab2', 'doc', null);
INSERT INTO `ld_asset` VALUES ('131', '2', '438975', '1551249900', '1', '0', '412092559faa96b0f7dc67f978af7c02d57ea6370b005a41a0dee6a6d9ff969b', 'sdbecher006_-_BO_310_耐碱性地板清洁剂.pdf', 'portal/20190227/bd1a139065cf0b5844b249f09cae6de1.pdf', '412092559faa96b0f7dc67f978af7c02', 'd70e379a2a6b2bc4aec8bf6f136a2467a239d8e5', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('132', '2', '13282', '1551948874', '1', '0', 'decbc30439609eeb0ff5caaa9f5e531c1544a9712defb10d75581accbeec04f1', 'ewm.png', 'admin/20190307/3750c3adfdef0c0c9be65eb57225d330.png', 'decbc30439609eeb0ff5caaa9f5e531c', '41f2f16190606e1d01a266d713e33fa839b99724', 'png', null);
INSERT INTO `ld_asset` VALUES ('133', '2', '193182', '1552014183', '1', '0', '00b493d13d327343c7d1568c99a3a8f5b845105b6662af4d50355b0031952745', 'xyhj_1.png', 'portal/20190308/3bbd744e82fadee949d310616061b5a0.png', '00b493d13d327343c7d1568c99a3a8f5', 'f30f16c694a22f996041e57814e09a9b04557e5e', 'png', null);
INSERT INTO `ld_asset` VALUES ('134', '2', '15109', '1552018896', '1', '0', '8d732216b033de24c50bff5a86d752c0ccd8d00fdb20555033338fecc848c9c9', 'jstds_1.png', 'portal/20190308/59b9bbe6128f59bf02183a583c8ec2c0.png', '8d732216b033de24c50bff5a86d752c0', '586b53b0dc81fd1d6a255cdb2174b2a42473ff68', 'png', null);
INSERT INTO `ld_asset` VALUES ('135', '2', '151121', '1552023747', '1', '0', '3781a18733e5dc13f060b43cd669e8959ac2d24f2dcea71a5e364aa527e24094', 'xsqx2_1.png', 'portal/20190308/7e5003b525b637fec20c196ee4e98c1f.png', '3781a18733e5dc13f060b43cd669e895', '792fff062124d7ccaa576aa7784ef6e422009df5', 'png', null);
INSERT INTO `ld_asset` VALUES ('136', '2', '196783', '1552024037', '1', '0', 'd22f81da866fd8f5bc1f96b2fe9712d0c06e054fee7da998cb3225e26b7ccc8d', 'xsqx1_1.png', 'portal/20190308/b34c69f17cc8b14b5185015cb59b727d.png', 'd22f81da866fd8f5bc1f96b2fe9712d0', '4bc416b645b1a15405957a122fa457466915094a', 'png', null);
INSERT INTO `ld_asset` VALUES ('137', '2', '1958636', '1552289202', '1', '0', '2de20281190143c371b623368f74f974609df7435ae4dcb97928f6226c70978c', '20190202041224526.pdf', 'portal/20190311/c1783c2995f231072727bd3fcb990fbd.pdf', '2de20281190143c371b623368f74f974', 'd20005976612e4caa5c21d720687c91df0a8ba36', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('138', '2', '146362', '1552465499', '1', '0', '36532ad3f10849c0358c6e6f6e8cc251b79289f4766b76d5cd6255462c7b9293', 'zmkc3_1.png', 'portal/20190313/92220e0ef063d0d8ea243302a0832683.png', '36532ad3f10849c0358c6e6f6e8cc251', '4ed18e544a3c6a1dc7798281fae76ad51af5cd9e', 'png', null);
INSERT INTO `ld_asset` VALUES ('139', '2', '1793819', '1552528100', '1', '0', '882316941d0ad428f868c5ee621ba327d9fe775e788c8c12c45b493ea27069cd', 'banner.png', 'admin/20190314/b34ae3b8b177747a27a5b1fe4c02eaba.png', '882316941d0ad428f868c5ee621ba327', '0b6b63426a8e44399563da1d11c12d4994c40146', 'png', null);
INSERT INTO `ld_asset` VALUES ('140', '2', '135492', '1552536429', '1', '0', 'f7d36fb986c29fff9f2236673b6ed89ba4a0994ba7aaf96a5d1015456476156c', 'in5_1.png', 'portal/20190314/d453716b1b7000ba91c71d035d037606.png', 'f7d36fb986c29fff9f2236673b6ed89b', '26a058a447924fbc16fb0250f783d50116880d83', 'png', null);
INSERT INTO `ld_asset` VALUES ('141', '2', '248749', '1552613997', '1', '0', '76b97a39d86fe04d51d28ab2da3170ac476a316f218d6d46d1ab34851b88efbe', 'gsgk1_img.png', 'portal/20190315/3f5a9ca40bd332107b13de17f0919a4c.png', '76b97a39d86fe04d51d28ab2da3170ac', '87fc7883f2ff3542f332474448b5f648578d5ab8', 'png', null);
INSERT INTO `ld_asset` VALUES ('142', '2', '7364', '1552614089', '1', '0', '9e323ca863973cd76c171e42d537aed47c825c119e87265b2282b155a484215b', 'logo_m.png', 'portal/20190315/095b3fb3c4ebce9650d929ed38707ac3.png', '9e323ca863973cd76c171e42d537aed4', '2349bfb9a0c26358de9e6860527432da5decfbb6', 'png', null);
INSERT INTO `ld_asset` VALUES ('143', '2', '738623', '1552614240', '1', '0', '8df8000e7ccebfffaeae109f0e69d76468f5522723670e43ee13545b6d338037', 'gsgk2_bei.png', 'portal/20190315/5611b82be4a608ce3f5a7439e1db7dfd.png', '8df8000e7ccebfffaeae109f0e69d764', '3e30fb99534b5d9bba08da5284bbaf8cc82d09a2', 'png', null);
INSERT INTO `ld_asset` VALUES ('144', '2', '1139046', '1552636451', '1', '0', 'df92b0bf277970fe1d6320870e7b43a1a2e51752539684833b36feff8d4d03d1', 'xly4_img.png', 'portal/20190315/ea4148e26548b67724ccb6080ee6e18c.png', 'df92b0bf277970fe1d6320870e7b43a1', '94fe2a405afb4075663cc0efa26e88531149e91b', 'png', null);
INSERT INTO `ld_asset` VALUES ('145', '2', '377254', '1552636501', '1', '0', '33e85533737e3b24b8711ce23890e786681c335e60860142713000960a021b73', 'xly3_img.png', 'portal/20190315/e0e449c858ac1fb323d0c0aac20c388b.png', '33e85533737e3b24b8711ce23890e786', 'd9d123ad261d38165c5fe82a366a46a1c75fbe54', 'png', null);
INSERT INTO `ld_asset` VALUES ('146', '2', '1884', '1552969610', '1', '0', 'c3e5ec8e8dd6436aaa633f314a4866ab4a9fd58f73188c140f0de216669f82bc', 'in2_1h.png', 'portal/20190319/2ee489181bf30f692b92e41ad5d8aea2.png', 'c3e5ec8e8dd6436aaa633f314a4866ab', 'a570f3ecedbf9ee52b9feca2214c7e76d9b75cda', 'png', null);
INSERT INTO `ld_asset` VALUES ('147', '2', '2075', '1552969628', '1', '0', '6fe27bdf94c3b65d08b52d69ac976a75bc15b5f4af0debf567204e5630c29385', 'in2_1.png', 'portal/20190319/9e83c237355a9564a4e58f2890dc174b.png', '6fe27bdf94c3b65d08b52d69ac976a75', '2f5458ee46a42815b13d54887795fdf647bd9a7a', 'png', null);
INSERT INTO `ld_asset` VALUES ('148', '2', '2237', '1552974705', '1', '0', 'e1c3783e9369b74f780e2122237a040868e1c78dd8396934a0d97a0bd48ca86a', 'in2_2.png', 'portal/20190319/54ac35358c490c3aa7f9c199aaab4d03.png', 'e1c3783e9369b74f780e2122237a0408', 'b0b43e1b1ddbc6b139deaf30b3a2baeb2edb2534', 'png', null);
INSERT INTO `ld_asset` VALUES ('149', '2', '2141', '1552974712', '1', '0', '786272ec2c89dedf3bc3a16e1179ebf9717bd2c38a7c2270e3bc23dbb20af99e', 'in2_2h.png', 'portal/20190319/ddf6e4d25b705820a7f2c128e47f3e82.png', '786272ec2c89dedf3bc3a16e1179ebf9', '8a2c42094be03ed10b621aed08fa5c760ed5a0ac', 'png', null);
INSERT INTO `ld_asset` VALUES ('150', '2', '2281', '1552977209', '1', '0', '81239b72bdd7a71c4c759a06e2b439a558e7078acb2f7b5146f6932ca1210477', 'in2_3.png', 'portal/20190319/bd7bc7b2277117f1ddaf8fb65c384814.png', '81239b72bdd7a71c4c759a06e2b439a5', '2223475af115128df051d6d854a9aa68a7fbbfc4', 'png', null);
INSERT INTO `ld_asset` VALUES ('151', '2', '2051', '1552977217', '1', '0', '1851c80dffbfbee4c2951c49667f05c2fc51f0c29c463103d8f21282f0d19547', 'in2_3h.png', 'portal/20190319/75c905d526cf4a0025c6ace07eebae2d.png', '1851c80dffbfbee4c2951c49667f05c2', '84f679a6ecd82f63774a12187a18a19ecd044dca', 'png', null);
INSERT INTO `ld_asset` VALUES ('152', '2', '2640', '1552979950', '1', '0', '3a548484250b8d74d2516cf98c65a28295e995be80ef4aeb50f93380ff954be2', 'in2_4.png', 'portal/20190319/c3e70e65ce5e1c4ce194236dfe4a7cde.png', '3a548484250b8d74d2516cf98c65a282', '33c85467a7a96390e74a5b4307c902803cdbf1e6', 'png', null);
INSERT INTO `ld_asset` VALUES ('153', '2', '2627', '1552979957', '1', '0', '22afceefffbe657f7fe2856adbb1c1557304970504be41339e6e055068776747', 'in2_4h.png', 'portal/20190319/513313c05ea4d96b0c5650380bcc2143.png', '22afceefffbe657f7fe2856adbb1c155', '9517b563a7524d028b959a1c3bd91553dd33f848', 'png', null);
INSERT INTO `ld_asset` VALUES ('154', '2', '186772', '1552981187', '1', '0', 'a8726bef5a124b66f21cb9ebde931bac04db24672255d1121b566ad592289333', 'in3_1.png', 'portal/20190319/87b6c94cf499d115c1c4638cc2a7e735.png', 'a8726bef5a124b66f21cb9ebde931bac', '71b3ec0da1efc1fb880408b0455e536dc4fdfb60', 'png', null);
INSERT INTO `ld_asset` VALUES ('155', '2', '192278', '1552983117', '1', '0', 'e5a422d6e4ea8100003244f7ff9410233e0b1942ca8aa036ecedef92e773da12', 'in4_1.png', 'portal/20190319/d0e8833d0f8ca62cede74574874a9c81.png', 'e5a422d6e4ea8100003244f7ff941023', 'c453c8c581bcc58cf05ff85501ef6ace73b2889c', 'png', null);
INSERT INTO `ld_asset` VALUES ('156', '2', '9338', '1553072163', '1', '0', '54c41e97e1ca2b4ee7f3cc3cbd64a540cd463e91d0269c75a41063deecba0922', 'logo.png', 'portal/20190320/7e24a2fc983d612c9e7d908eaf24fd91.png', '54c41e97e1ca2b4ee7f3cc3cbd64a540', 'eef0e57cb2c9151c6721d6d33e0a073bb4846e4d', 'png', null);
INSERT INTO `ld_asset` VALUES ('157', '2', '28122', '1553073496', '1', '0', 'f33881e469c8339a617ad9a5621b21996d6871ef14eaae28a0d09de288283a6b', 'ces.pdf', 'portal/20190320/c70fee8fad7e2061e5f265311ede2547.pdf', 'f33881e469c8339a617ad9a5621b2199', '3d0588715f4d87d48d8971db4410932def21089c', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('158', '2', '1240569', '1553165293', '1', '0', '79133390fa8813cc27c3b3e4b08e8d7bccb29144c7ab77b4b7370fef477febbf', 'banner2.png', 'portal/20190321/ceb24c5521f985da6cd00ef147068da2.png', '79133390fa8813cc27c3b3e4b08e8d7b', '534728844a6feeda92818a04e69c9bff3aa2dd3f', 'png', null);
INSERT INTO `ld_asset` VALUES ('159', '3', '30857', '1553315092', '1', '0', '7c8630a21865abbf150f289dedbb8c697aa269f86f7dbed1aade15f36fa73398', '图片1.png', 'portal/20190323/168e0ab8cae2fd9108c16184034b2034.png', '7c8630a21865abbf150f289dedbb8c69', '2c9fde5875951d84aeaf74cc53e03f88e90ee0dd', 'png', null);
INSERT INTO `ld_asset` VALUES ('160', '3', '249078', '1553327931', '1', '0', '4068c803e1a8fa8e5961e9d69ef21589c4494614ec83b39a5f83861c9ec386aa', '01.jpg', 'portal/20190323/7b845b0df1bdb840c2138a043b2a3c6d.jpg', '4068c803e1a8fa8e5961e9d69ef21589', '36ad9a79511879dc936d8cd58350fc412198bcc6', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('161', '3', '10471697', '1553328330', '1', '0', '70064d4fffc0229e47e2e3febab61f76c3ae6e8cccd40edc6cce878250c7b81a', '1.pdf', 'portal/20190323/0959262a3d7849772048d81731d8c34b.pdf', '70064d4fffc0229e47e2e3febab61f76', 'd489012f948fd70c6892e0abae8145ccb5d6323e', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('162', '3', '9658898', '1553328445', '1', '0', '7dae2a6e40642ff9a9dd37bbda8c88b6d244430a76c9119747ded9a3b32cf488', '2.pdf', 'portal/20190323/46746d951afaa88f4726300127a54ebd.pdf', '7dae2a6e40642ff9a9dd37bbda8c88b6', '3493a54d7181338636f14acebe9935592fc1385a', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('163', '3', '313806', '1553329235', '1', '0', '78e7dac176a81aebc362d7993cdf39e0730cd8ad91f9da20fc14de018e9003fe', 'b5.jpg', 'portal/20190323/615fa2846bf6f12116655138d7708a8c.jpg', '78e7dac176a81aebc362d7993cdf39e0', '7a56079447234b82bdc70b884ff2904d78228d06', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('164', '3', '245071', '1553329269', '1', '0', 'bc8e65ac9680f0b74e2fceb6fe54d0ef3dd6a0f21a11ead8f5834e9a0b80a186', '7.jpg', 'portal/20190323/a200af77c5857b275e3f7e6c3fdab400.jpg', 'bc8e65ac9680f0b74e2fceb6fe54d0ef', '82a7145678fb58a8d046fa5624f549f5d212677b', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('165', '3', '165571', '1553329289', '1', '0', '479d984bbc2434b00f655516fdd6058dd4a4e747be37eca8ddfb3497bbc02bee', '8.jpg', 'portal/20190323/0d2a58af3a331139182308bd5e485f8f.jpg', '479d984bbc2434b00f655516fdd6058d', 'c38452749ce597d18a5a90394010ac1f858dc148', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('166', '3', '281346', '1553329332', '1', '0', '5c98401f3d2844dea9d99e41fdb18c032b8cdb883a213887efb22647ae8e6b9d', '9.jpg', 'portal/20190323/b22b4ccfcf3063c1d4b0be7b0fb54fd9.jpg', '5c98401f3d2844dea9d99e41fdb18c03', '29c29889b2e06c36df0c0a96bb5607772fa4d363', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('167', '3', '265579', '1553329400', '1', '0', '164acf887e578e03ec29952bf2b3f9bb5f3a1d97728c1feab8898ff2670b1835', '04.jpg', 'portal/20190323/ddd084524819e459db114518c4b9ec13.jpg', '164acf887e578e03ec29952bf2b3f9bb', '1be5856164ba5c0b6184f9c5ac1da220998015f7', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('168', '3', '293797', '1553329427', '1', '0', '98cd22ae3827ff2663b7bc0fc0ef3253fbb3b0a03758cec2ef801cb5ec0fad98', '06.jpg', 'portal/20190323/adf0e03a86ed3cc2f96a2bdf192297db.jpg', '98cd22ae3827ff2663b7bc0fc0ef3253', 'ee96b1bcd5f24eb87a4adce370d604ea499bacb2', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('169', '3', '280893', '1553329459', '1', '0', 'c2c7e483a73786fcfaa821e03e76de5a8b792746f5da863925751456e727bf6d', '011.jpg', 'portal/20190323/253f8c8111e56a46cb73104ebe4e37b1.jpg', 'c2c7e483a73786fcfaa821e03e76de5a', 'f9c9d6bef5b202079e04ba3ac7103a21c4b6ffda', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('170', '3', '238496', '1553329480', '1', '0', '878a1f99d5c2bbaea6281c26e4a004cdd321c5962b0dbf538fd68fb621aa6284', 'a1.jpg', 'portal/20190323/b5dc46e957d960f84716ce6f940cf418.jpg', '878a1f99d5c2bbaea6281c26e4a004cd', 'd9bf6d1843b67aaf2db71f34b6d5481f3237064f', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('171', '3', '239004', '1553329497', '1', '0', 'fb94cdead29a92db42b7c0215e5f59c386147ec1f5688f8d1bf7e3c8f058b4cc', 'a7.jpg', 'portal/20190323/458e352ae786c85a16f06f83d519e8d6.jpg', 'fb94cdead29a92db42b7c0215e5f59c3', '8b230af55e62ea578bbd3d53bbc1479500d7c3fe', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('172', '3', '156144', '1553392800', '1', '0', '719ccf339f4ba16b40db63bee3bb5923af6af2ec403fbef9b0f681452c9395ee', '20180304102207978.jpg', 'portal/20190324/9c56ea583a32bd17287e003c2b721d37.jpg', '719ccf339f4ba16b40db63bee3bb5923', '974bd1de278681a505f9d1f021198ec0442985bc', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('173', '3', '324369', '1553393307', '1', '0', '8eb60d9c37a4515365e65809165a0a00744575f3c411c9b396ad05f427715f3c', '20180304101211661166.jpg', 'portal/20190324/63f91eabe9c98579f89e2e670c4a7dc4.jpg', '8eb60d9c37a4515365e65809165a0a00', '996b826933190057ee6465c83c17bdd79e12706e', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('174', '3', '366995', '1553393315', '1', '0', '6015406c798c267f21ed3a835e115024dc55a1912bfba0ae74dd5bca9bfe5b13', '2018030410130487487.jpg', 'portal/20190324/a18a8c6f15caf8a9542e6fb6528f913b.jpg', '6015406c798c267f21ed3a835e115024', '3deb392705bf9c08a8b14cd753dcc3865da18efe', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('175', '3', '674374', '1553393930', '1', '0', '2ef2f3ef454d927533c1eac836703150831723c30c2eb85587c8ade6492f5e93', '1553393632(1).png', 'default/20190324/5b0b178db48d75018919a06dce4006b9.png', '2ef2f3ef454d927533c1eac836703150', '43a6c6bbf624193429efb2021e17786530428658', 'png', null);
INSERT INTO `ld_asset` VALUES ('176', '3', '90641', '1553394102', '1', '0', 'ca90da9b9d984e5c7608eca1f42ca47a29ed41f2867f31b93426bdb99e203454', 'board-boy-cheerful-childhood[1].jpg', 'default/20190324/a522df6bb97860d938179a7767e413ac.jpg', 'ca90da9b9d984e5c7608eca1f42ca47a', 'ececd55094ef9936c0272b40ac0421fac355ae24', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('177', '3', '800406', '1553394149', '1', '0', '0b0c707e8bd8aaa67b0070a18ef7b8e04aec847724d6bef85d522596d38e6c80', '20181117142572507250.jpg.png', 'default/20190324/e6189ca7e5308893afc8663b4ef01c4c.png', '0b0c707e8bd8aaa67b0070a18ef7b8e0', 'bbdeeac901061552df159e52bc8bf5ea920328c9', 'png', null);
INSERT INTO `ld_asset` VALUES ('178', '3', '306749', '1553396223', '1', '0', '716367ea381c4029efa33182a5f1275ad6f62e1e838508d16c5a67f76077a619', '20180304100585068506.jpg', 'default/20190324/3d8d9ea5b1079163dc98edb3f9f47584.jpg', '716367ea381c4029efa33182a5f1275a', 'f3442dc384a9bd7e82a5d380c2d714bf55858458', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('179', '3', '2092824', '1553401263', '1', '0', 'b41b2cae1c7ffb0f1b0ae2a79172639e73b2b055c0fd008ef34e8ed6bcb30f55', '网站banner1.png', 'admin/20190324/ca28864f021cc5ceb2937b5cd5ea388e.png', 'b41b2cae1c7ffb0f1b0ae2a79172639e', 'a7771d47465756579e32c47c7ba6c774a5da3e2c', 'png', null);
INSERT INTO `ld_asset` VALUES ('180', '3', '1592758', '1553409261', '1', '0', 'fc9196ad9921b9830734baf8b705f0452a94db613f695c4f88e1c5223e3c44fc', '4859071.jpg', 'admin/20190324/23a3d015fe2651cd2c5d9838acd2936f.jpg', 'fc9196ad9921b9830734baf8b705f045', 'db660f0e69404d38de6ace305f98776299e82ab8', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('181', '3', '2287841', '1553409299', '1', '0', '14bd776474a2ab198ab3f931cbad3d584fb13c03057a42c7259410173aa63be7', '359840744.jpg', 'admin/20190324/0d75fab5ef08b631dff4135685ff3c50.jpg', '14bd776474a2ab198ab3f931cbad3d58', '34b7d3c6bfce11687c9fa430f0ac1c40716b2e5a', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('182', '3', '1186794', '1553409509', '1', '0', 'db103e66766818230530cc928fe4513e0c9e2f9b548c0708094c624d78d14b06', '二级页面banner1.png', 'portal/20190324/dccc55b3b3c13747a0adb580301e99de.png', 'db103e66766818230530cc928fe4513e', 'd458ee7f8b38905e00d42a19ed2cdd4c44c6ef52', 'png', null);
INSERT INTO `ld_asset` VALUES ('183', '3', '1972661', '1553415998', '1', '0', '5d6cbe8f1da92ff88a3b95aa2530b89b6f1f2c761470b2aead6e628b82c5be4f', '20180207.pdf', 'portal/20190324/939bce4f076a38c5a1783eb4421953ac.pdf', '5d6cbe8f1da92ff88a3b95aa2530b89b', '024f8392d23474b46e65f81c36cc386fe0ab121d', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('184', '3', '590701', '1553416047', '1', '0', '61cb845458a6b9a5eb48e9e01f12e8aea2aac19e03c8944eb8e91ae4730d4b71', '20180304.pdf', 'portal/20190324/86c09758c17f7a9a6a7c35621d9d5250.pdf', '61cb845458a6b9a5eb48e9e01f12e8ae', '60993d006bd0b540ba0f4507d2ec8eccf7b984c5', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('185', '3', '3883994', '1553416130', '1', '0', '46b13b517f2fe408e01e9cf18de0e445210d562a721a9a2fd74ccda5e18ea78d', '20181212.pdf', 'portal/20190324/bb5c9060647a897a93b95c246ea99786.pdf', '46b13b517f2fe408e01e9cf18de0e445', '09fb5af726e6494d9ae1e49559da8ac6eca0e622', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('186', '3', '257171', '1553416277', '1', '0', '55040dddd13851f82d61512d5da902ae35b374ab10d957f45ef5b056271322fb', '微信图片_20190324162622.png', 'portal/20190324/887e96d1383330c8b818ce0e14ae2d2c.png', '55040dddd13851f82d61512d5da902ae', 'afbcd6faf63ee9d46b9bca68e7383032787aa1d9', 'png', null);
INSERT INTO `ld_asset` VALUES ('187', '3', '1183238', '1553480125', '1', '0', '63d921be82d10ae32b3562d3a2ed1afd64f84d9c0d65e9d9e1ddce937733af49', '二级页面banner7.png', 'portal/20190325/a839b806c4c1ba4ad40ea5254af1e001.png', '63d921be82d10ae32b3562d3a2ed1afd', 'd00c2ba041d0d83fa398bf2f0593533249acebfc', 'png', null);
INSERT INTO `ld_asset` VALUES ('188', '3', '813024', '1553480156', '1', '0', '9d3f26d2367188057a4085d936944059df724cd52f6aafa16a84ea00b6ddbcf5', '二级页面banner6.png', 'portal/20190325/4608bda31590b07e15e1108ba329fe9d.png', '9d3f26d2367188057a4085d936944059', '2df626c35b5a2d419a9bf5196c19ad480ae02951', 'png', null);
INSERT INTO `ld_asset` VALUES ('189', '3', '1466585', '1553480199', '1', '0', 'b6b8bf049f02174ddbce3c1dbf0ef424065227d01318c04567cd1c79ae5cd115', '二级页面banner5.png', 'portal/20190325/c5dfffdd7cdf9bfcf9f5d1297c3c361b.png', 'b6b8bf049f02174ddbce3c1dbf0ef424', 'd4a9edad160b10a4f337789912d6392fcb0e086f', 'png', null);
INSERT INTO `ld_asset` VALUES ('190', '3', '1369295', '1553480250', '1', '0', '6b1c1934c4506d6ba3a0a8a1ca89931b1bc206535e87f691907b88aeeee4659f', '二级页面banner9.png', 'portal/20190325/805775ae92988369f93698d39f8e49aa.png', '6b1c1934c4506d6ba3a0a8a1ca89931b', '1531dfb77b1e903b1456cad39d1964f031426286', 'png', null);
INSERT INTO `ld_asset` VALUES ('191', '3', '1384895', '1553480330', '1', '0', '226b2246b041e7795a3a9029fbe1748a8188cbd238f8907f1f296bd35d220d9c', '二级页面banner10.png', 'portal/20190325/45f5a2988b978261dd492f7ae86c26c3.png', '226b2246b041e7795a3a9029fbe1748a', '73e771e365c26a415dd8c2795af3786ca666cdbe', 'png', null);
INSERT INTO `ld_asset` VALUES ('192', '3', '1405542', '1553480381', '1', '0', '68bbeab6e51896403aad1de1bfb1190163e58a14d7e86307c919deac7a5ab562', '二级页面banner2.png', 'portal/20190325/91b2d61ed8c1253358901d8b7c173c10.png', '68bbeab6e51896403aad1de1bfb11901', '313e0f3f3ff9ca53e39b69d91ec0e1ef327ca01a', 'png', null);
INSERT INTO `ld_asset` VALUES ('193', '3', '792000', '1553480511', '1', '0', '223ea667febeb20198bba9722e735e198d9f1bb010df3340826af7c8276ac542', '二级页面banner4.png', 'portal/20190325/f60a6c1b19be0a2f18ab3b069500e8e5.png', '223ea667febeb20198bba9722e735e19', '793d6ef283b5fcade0ea3e9f098cbf8b41bea1b6', 'png', null);
INSERT INTO `ld_asset` VALUES ('194', '3', '1172965', '1553480617', '1', '0', 'e43f4bea0737cc78d8b2ff1ecb32aaa30a31e683243693b7bd04534a76da8635', '二级页面banner11.png', 'portal/20190325/ab665f4ef31107663ff3ee8ae4014c72.png', 'e43f4bea0737cc78d8b2ff1ecb32aaa3', '5f8d064b320d00c0651d04f65e6dfcb4e0c73ef4', 'png', null);
INSERT INTO `ld_asset` VALUES ('195', '3', '1963561', '1553480854', '1', '0', '9f1c709528e0611291d12c3494c1a8cfcfe0a826cba77b2463b6c71bf92d7079', '官网banner2.png', 'admin/20190325/77d4d2d44a396e4d347d028bbae2be14.png', '9f1c709528e0611291d12c3494c1a8cf', '0fb1552c66f78d682552f214e6ea9e117eabafc1', 'png', null);
INSERT INTO `ld_asset` VALUES ('196', '3', '37317', '1553481269', '1', '0', '07d42c47df6ff679bb4df9c97d3514b14e2116ebf11348c1117341358e119d20', '1.jpg', 'portal/20190325/084c33ac51a2d09b1582845d261b513d.jpg', '07d42c47df6ff679bb4df9c97d3514b1', '419f1a761baba31d78ea515b7c68513eedffcbd5', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('197', '3', '28278', '1553481469', '1', '0', 'a24ea2eb2658d3f5569ffaf37ecc0e86a5cdf683f57c8b1754b22840778ff61f', '2.jpg', 'portal/20190325/e3334330d827ba016ea3a1c279430f7e.jpg', 'a24ea2eb2658d3f5569ffaf37ecc0e86', '164893a6d339a220a1732fffcc72fc65e147e0c7', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('198', '3', '42967', '1553481604', '1', '0', 'f1b7e67201c9b43545a354d70cd8ce353632b67d9e389a2ab1284ebdd155b4bd', '3.jpg', 'portal/20190325/ab9ac346bca5073c02932de2bbe5dc38.jpg', 'f1b7e67201c9b43545a354d70cd8ce35', 'aab0770222f900a6b869b595775014e7d6ee2112', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('199', '3', '31586', '1553481696', '1', '0', '5c83b666ba6db6915826c53a5a7216326c8ce9fc8c43fa2c4cdc309559f0fc05', '4.jpg', 'portal/20190325/68b438912cdf13bd4492ed880cc17cec.jpg', '5c83b666ba6db6915826c53a5a721632', 'f4577f4da83577456ab931d7fd0864c7f4521e65', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('200', '3', '41444', '1553481824', '1', '0', 'd780cb3270beb3289a5754d9e1cdef613f4241eede381e6e6ee42354cb39cb40', '5.jpg', 'portal/20190325/449742a26104a2a910cedb486ce5c74d.jpg', 'd780cb3270beb3289a5754d9e1cdef61', '0684165a6c3e6d1333c1d5971c11ad0cc15fc732', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('201', '3', '40930', '1553481927', '1', '0', '31f8f87437be497526b56fbdaca16d8a34be1c1a03811e4ec9309d87443f5581', '5.jpg', 'portal/20190325/befa87b3b6e67de195eeb977334b7039.jpg', '31f8f87437be497526b56fbdaca16d8a', 'a4a6916e4008ad04c3ec80a36aa452e8bb97cba4', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('202', '3', '27517', '1553481992', '1', '0', 'e3b15daf6448aeb88d2993697dc2bec0eca307090a43a9bbf70c508722a50e69', '6.jpg', 'portal/20190325/23334cc0e72a478f2ed87012129f3333.jpg', 'e3b15daf6448aeb88d2993697dc2bec0', 'b584d5f60dba6cdc0c729f8b08185ef30edfdbea', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('203', '3', '650554', '1553497128', '1', '0', '763c55c9848e6b256a6e05273c3afdb205b3d6292ddd633dce9c9aabca4ff9f1', '未标题-3.png', 'portal/20190325/a8907ac96722183dc2651f9d873a3c8d.png', '763c55c9848e6b256a6e05273c3afdb2', '7587ae0dd22f2a1d0a38406d85fa2957799f982e', 'png', null);
INSERT INTO `ld_asset` VALUES ('204', '3', '447165', '1553500070', '1', '0', '45fcfef9c30310a3ac04863089b5b41cf342248f7c54886941be2a782a9e6bb7', 'image.png', 'default/20190325/838d19aab3d289130ee1baf92d1cd1ad.png', '45fcfef9c30310a3ac04863089b5b41c', '7e25e5fae2d2bf27891a7bc6d9c667a0912de6b0', 'png', null);
INSERT INTO `ld_asset` VALUES ('205', '2', '190952', '1553508095', '1', '0', '872cdde1307fa76c29ceeafa53bad743aabbcfcd20cdd313cb10bc7829f03f4b', 'news_1.png', 'portal/20190325/bedc781d087929f84ff3c2fc30d65ba4.png', '872cdde1307fa76c29ceeafa53bad743', 'ed17966e78ff6f2b130bcc29c9771998567eed4b', 'png', null);
INSERT INTO `ld_asset` VALUES ('206', '2', '41096', '1553513750', '1', '0', '6a1876da25f73dee7688f78a9e6ea44a5dd7dd756716a46458f236c41327c399', 'ceshi.pdf', 'admin/20190325/5862f15e2b1e038edefb59d680036be7.pdf', '6a1876da25f73dee7688f78a9e6ea44a', '0e9e9791dee9c61e623bd86ebc91d0ffbc59dbab', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('207', '3', '396553', '1553591177', '1', '0', 'f70ffcc1b513769df690a479e13e97df4ecded46a04f35988a90d7df9825b2af', 'image.png', 'default/20190326/378ab96f7ec126268ac742af7e7e058b.png', 'f70ffcc1b513769df690a479e13e97df', '73231a4a0991b3227417000eefa92c8c7badc11f', 'png', null);
INSERT INTO `ld_asset` VALUES ('208', '3', '1132535', '1553757542', '1', '0', '90b9f81a84beaa1f5b56d76ee033d9e36dee3fe95dfd4be62689b2bebe87edef', '1.png', 'portal/20190328/1b04ee83f05f74b2183ff924b11721fd.png', '90b9f81a84beaa1f5b56d76ee033d9e3', '85024215d2069acdcba55a4eb4ed17ebc25c5a2a', 'png', null);
INSERT INTO `ld_asset` VALUES ('209', '3', '1181407', '1553757576', '1', '0', 'd392d4feaf778404d877f3a1e87158e06a7c30972201dc627e5ed0a3e5ac4ee7', '2.png', 'portal/20190328/e7637a5600678df3973233c1d0a8b7d4.png', 'd392d4feaf778404d877f3a1e87158e0', '56a6d58372d7ad6989f2cb92d402ec2d30d3b715', 'png', null);
INSERT INTO `ld_asset` VALUES ('210', '3', '935148', '1553757595', '1', '0', 'a1fe094cbd2a51a2cefdd4229de32cad884f96bef975bff05bf5101b7652d6df', '3.png', 'portal/20190328/c2625f32764b5af1ffd046bfd84b6dcc.png', 'a1fe094cbd2a51a2cefdd4229de32cad', '48373f41a6e7e0292e21c7fb70aa1b59b2381508', 'png', null);
INSERT INTO `ld_asset` VALUES ('211', '3', '1081707', '1553757641', '1', '0', 'acd52eabfc052ac5d38587b683baef41829f08f2fe10887504bde4843e37cf17', '4.png', 'portal/20190328/67d2442d6494f9efe2f84ec810822f28.png', 'acd52eabfc052ac5d38587b683baef41', '5fe166ee9ee3aaa547c44ffa35edb2feb64ba538', 'png', null);
INSERT INTO `ld_asset` VALUES ('212', '3', '1109214', '1553757660', '1', '0', '66086aefe71df278c777cfc836e8dce9a85eda6bc250b11a0ee90bbb0bff5829', '5.png', 'portal/20190328/717238eaf395823e8c25322ae7604519.png', '66086aefe71df278c777cfc836e8dce9', '7e9850ef1bfa85d3a2afad2b79174acf7dcdf55f', 'png', null);
INSERT INTO `ld_asset` VALUES ('213', '3', '1195548', '1553757683', '1', '0', '77cace9f2258a3eb04fe1217e74594a343b106c2f914a1a5b6943fed42dd5220', '6.png', 'portal/20190328/c0152023de7f2512a7512860a11f1bfa.png', '77cace9f2258a3eb04fe1217e74594a3', 'a935d4c42464205755d1ef80ddc1069513a9a254', 'png', null);
INSERT INTO `ld_asset` VALUES ('214', '3', '1094139', '1553757701', '1', '0', 'ff70cb0c529141674a74134c3952c995c73d6b631c1ce446688bc408358d5218', '7.png', 'portal/20190328/4193f167ec4e5ce647d062aab2c74aea.png', 'ff70cb0c529141674a74134c3952c995', '088aef7c36460783c88ea5e43f37e55b4083a3b6', 'png', null);
INSERT INTO `ld_asset` VALUES ('215', '3', '1245249', '1553757723', '1', '0', '80178d6e0319dda9fe8a7ee99597893429e51509b364412368758fdfc161c61f', '8.png', 'portal/20190328/b7b53883e7e7aec183d7661c63eef052.png', '80178d6e0319dda9fe8a7ee995978934', '39a53bbe5e279da2457217e63ef2efe21c3384ab', 'png', null);
INSERT INTO `ld_asset` VALUES ('216', '3', '1060785', '1553757740', '1', '0', '21c8665639864f40a44796f8662c76ffb158ca01037a26f1927d85c04c1fce6d', '9.png', 'portal/20190328/0a23fc0c7bcfef1f1e7559ee9c933e0d.png', '21c8665639864f40a44796f8662c76ff', '53a98aece0c61ef0b638580b70e49f29a827be2a', 'png', null);
INSERT INTO `ld_asset` VALUES ('217', '3', '1006973', '1553757761', '1', '0', 'd97f6314f834e6eb039ea80ba0205b91d09e45eb7cf35deb6556be6c36d77346', '10.png', 'portal/20190328/e6b481e11a24503f5af5b1f958ebcfe8.png', 'd97f6314f834e6eb039ea80ba0205b91', 'ce65a5e5bcf75dda1c672359a58f2165af200d91', 'png', null);
INSERT INTO `ld_asset` VALUES ('218', '3', '1202303', '1553757775', '1', '0', '8a8dc50cd961975afe9aaea3bd0f5c30a4c24fbd4b0e7402421c375f8c575a29', '11.png', 'portal/20190328/35c20b839c6509f42dac132c0ba1ef9f.png', '8a8dc50cd961975afe9aaea3bd0f5c30', '5cf5903f5223c2703d388bd3820cdf3f34f52e74', 'png', null);
INSERT INTO `ld_asset` VALUES ('219', '3', '957564', '1553757789', '1', '0', '28b001d7a0edebd4969ae5500e0aced23a3f386edf3cfffa029b2f6f25696365', '12.png', 'portal/20190328/7ce43eae7c1006c6084b9f8a94063aa2.png', '28b001d7a0edebd4969ae5500e0aced2', '459a3c2a8a92b11e95f88e17175727182fff6bc7', 'png', null);
INSERT INTO `ld_asset` VALUES ('220', '3', '927830', '1553757803', '1', '0', 'e4cf0420728c18a1e3c92e7392584bef04285c5d824a18280d1b946770faa149', '13.png', 'portal/20190328/0c69c8fc644c728b1240922c066cd585.png', 'e4cf0420728c18a1e3c92e7392584bef', 'b9e74e0dd93b6224103e28cd48841bbd0ba3a05d', 'png', null);
INSERT INTO `ld_asset` VALUES ('221', '3', '1094747', '1553758027', '1', '0', 'b77b7047aa6e077f89b2dbd73b9182ca76fad99fdda77ebfd00dfb2392c61075', '20171222144616701670.jpg', 'default/20190328/0b156d9c72e58ee6fbccb38639492050.jpg', 'b77b7047aa6e077f89b2dbd73b9182ca', '0a771b1102c61e522b8793a33d436c5d7ee6b620', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('222', '3', '982863', '1553758139', '1', '0', '395e09a11443ca235b353e838eef6d92a09b92477ffc4eb966e97128f1b7db64', '1.png', 'portal/20190328/936cc72932e0ffc45b748e7cbf62aa48.png', '395e09a11443ca235b353e838eef6d92', 'ef0807ff2d7db77d8c32e4e82476b9a128428b1b', 'png', null);
INSERT INTO `ld_asset` VALUES ('223', '3', '1000212', '1553758165', '1', '0', 'ace6c71f1f8b5b3616b4c4928850304c84dc41cf2c3cbf5f2ea8a60215a7af9e', '2.png', 'portal/20190328/a8f1d9aaceca31b0dc17c70eb543d13a.png', 'ace6c71f1f8b5b3616b4c4928850304c', 'da10c45b18d10e358865d81c277e0e753622f957', 'png', null);
INSERT INTO `ld_asset` VALUES ('224', '3', '892439', '1553758390', '1', '0', 'd55dcd2165efd4b5ab561ddf185c18794f681966da396178ff6582c300792b1b', '4.png', 'portal/20190328/423cbfd81c7c3fbde20fd0387a057a47.png', 'd55dcd2165efd4b5ab561ddf185c1879', '387513d203562194385ffcd83fa31f35e2d4d429', 'png', null);
INSERT INTO `ld_asset` VALUES ('225', '3', '1098817', '1553758406', '1', '0', '95a63f011457c8ce9ffce020cff76b6b46cc582d028316e80fa5db396d821c64', '5.png', 'portal/20190328/1a9dd8cdd25b554e4b40d31a008b463c.png', '95a63f011457c8ce9ffce020cff76b6b', 'fed73726980fe04ec67c11a6dea1e0711db4c167', 'png', null);
INSERT INTO `ld_asset` VALUES ('226', '3', '1142603', '1553758476', '1', '0', '9c6afac494e86fbc1c9d3106ca9a4a5ec6c013f6c3efab7e99cac834e402cb85', '6.png', 'portal/20190328/0d2091293ab2007d3eba099335000eab.png', '9c6afac494e86fbc1c9d3106ca9a4a5e', '9dd8304a084afe3e6fa3eeac77268eeaa9069b6c', 'png', null);
INSERT INTO `ld_asset` VALUES ('227', '3', '1012732', '1553758576', '1', '0', '85532d092bfef3b38e8438f6bccb712330888bb674ce102e791af9cb862cb069', '7.png', 'portal/20190328/aaf396f637b26ae8bd61add9298b9155.png', '85532d092bfef3b38e8438f6bccb7123', 'a113655ba30d97b800fb1060d2ac173444262603', 'png', null);
INSERT INTO `ld_asset` VALUES ('228', '3', '960879', '1553758629', '1', '0', '593b5f910afbfb6c4e9dfd14791a92a38d7881e249f59fc391b437b1dd1bfb82', '8.png', 'portal/20190328/8e62fb9c18521df60c8551d53c26a3f6.png', '593b5f910afbfb6c4e9dfd14791a92a3', 'a469225da919baba4e4225d1f1a3fc39b84e69e4', 'png', null);
INSERT INTO `ld_asset` VALUES ('229', '3', '1019178', '1553758657', '1', '0', 'a5c9aa82d3aacd25f165ffd0c01f8bc255ccae6e50f00415056943b26cb4fd7a', '9.png', 'portal/20190328/e7c0508524079091901cfd064f8e7ffa.png', 'a5c9aa82d3aacd25f165ffd0c01f8bc2', 'fd1d12f50ee80e9002f1c4309f3b1c30f44cce55', 'png', null);
INSERT INTO `ld_asset` VALUES ('230', '3', '1202120', '1553758681', '1', '0', '3593df50ede1bffe4cc8fc7c3727ff44487b0cf3dba140e0dceeee290b46879b', '10.png', 'portal/20190328/6850636f7546c93e3be5682cad4cd5dc.png', '3593df50ede1bffe4cc8fc7c3727ff44', '806d023bd09769048fa9e39928811640e2c6bcd6', 'png', null);
INSERT INTO `ld_asset` VALUES ('231', '3', '809906', '1553763013', '1', '0', '61d1d60c39cac88057b48304d03d7516d3e4a49ef4f7ae19390fe463e3108a67', '1265344067.jpg', 'portal/20190328/ccf5fe5a6d1bb9e6d32dbe5bfcfecf24.jpg', '61d1d60c39cac88057b48304d03d7516', 'ee7c84c6b218a4163d1d9c38fcb0ffc116085e05', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('232', '3', '416433', '1553763594', '1', '0', '826b4226cc118f9b204618e7a5c60b2a6af899f5cb3bc67caf78dc55c48e8aa5', '708969445.jpg', 'default/20190328/6bd448e35b8dfcc0a3b682693efd9df4.jpg', '826b4226cc118f9b204618e7a5c60b2a', '4e185e15f316f1dd7877e19819571370b571d1b8', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('233', '3', '925243', '1553844699', '1', '0', 'f499c788c8ddd39ca7c7bf735dae9fba3895b1ebc4b33639090f0f831d56f216', '8791228.jpg', 'portal/20190329/1d9192e225847dcef07c8210e90cacca.jpg', 'f499c788c8ddd39ca7c7bf735dae9fba', 'f2fb99f6b2861613547675195c78d92733dc3b9d', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('234', '3', '834957', '1553844750', '1', '0', 'a2682b289838eb4e6cfe0533823c7c06c8a8f847cf947530a8db8bf520f63eb1', '1482493967.jpg', 'portal/20190329/0b8fde54e96077acbfd86e6541e7cfb9.jpg', 'a2682b289838eb4e6cfe0533823c7c06', 'fc69f7d78b91f2d2d9d2a7ee3cf407d3c2d6f9eb', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('235', '3', '847085', '1553844775', '1', '0', '1a236b2b7d3416cf8ad8504d602fbba65fa74982f0392f0143227df1944e9926', '552554774.jpg', 'portal/20190329/4b38e91e37178dcb331a896619975628.jpg', '1a236b2b7d3416cf8ad8504d602fbba6', 'c8edae018c3555df52032d343afaeb7437f36aab', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('236', '3', '926212', '1553845938', '1', '0', 'c128163e0ef53a533f9daa86657e3cfc1033eab1b54ffda3de0fab3964eeb709', '3.png', 'portal/20190329/a0f64e08a497f9b6b6b6414a7c3af713.png', 'c128163e0ef53a533f9daa86657e3cfc', 'bf7f6670c0ed211d4488c3278553a5d19b5a67a6', 'png', null);
INSERT INTO `ld_asset` VALUES ('237', '3', '1295589', '1553849352', '1', '0', '7665c0d4370b4ab1645d4f428c3c9ef07e93c66de66e4d62bbb1344dec187701', '1.png', 'portal/20190329/1ec008f16cebc62c896edb8ebc6b57df.png', '7665c0d4370b4ab1645d4f428c3c9ef0', '9af3dfcb98862b07df731b4d847c70220f184b0a', 'png', null);
INSERT INTO `ld_asset` VALUES ('238', '3', '1075277', '1553849399', '1', '0', '0494a909ebea05e3afa24bfa05227ef1be0234100a4a1cd7a52d03e3bf894d5d', '2.png', 'portal/20190329/b6529d49ad0398588a18fee258b129e7.png', '0494a909ebea05e3afa24bfa05227ef1', '0866a0e64da22900e2fad0fe58ce9d0f2c1ff702', 'png', null);
INSERT INTO `ld_asset` VALUES ('239', '3', '1049762', '1553849433', '1', '0', 'eac2a6b9cf2dd493af1a0fd3f0fe937f035f9ec790fca1b7c42993afa03170e9', '3.png', 'portal/20190329/4f00969f7e22f2354bc1e3d83e968eff.png', 'eac2a6b9cf2dd493af1a0fd3f0fe937f', 'c5a6f69edd9ae492413697ec6f333847b6da3ef5', 'png', null);
INSERT INTO `ld_asset` VALUES ('240', '3', '737747', '1553849456', '1', '0', '833ede59891045ee0ba9a2267647188804e536c1dcc9993308aaa69347ecb8a8', '5.png', 'portal/20190329/0734f0d317caca7b4d4ce7de5d9416df.png', '833ede59891045ee0ba9a22676471888', '08272cb425de74efe9f8291367551b1c77dc578d', 'png', null);
INSERT INTO `ld_asset` VALUES ('241', '3', '998679', '1553849486', '1', '0', '21dba5ef8ac79bd0c84c0ea74cdf797155ebcd19b301efce97682020ad52ad61', '7.png', 'portal/20190329/b97f479d376bdec3d2fce4bff561bfe3.png', '21dba5ef8ac79bd0c84c0ea74cdf7971', '3b26380344f3bae231a14f04681247361b0674ea', 'png', null);
INSERT INTO `ld_asset` VALUES ('242', '3', '941607', '1553849505', '1', '0', '64100b3d545e58d0bfad831414f1b6520b14390336d6e087669f4fe14ac8fa66', '8.png', 'portal/20190329/293df3fb375edf320708da6e39beafa4.png', '64100b3d545e58d0bfad831414f1b652', '7224d0a10df7bc4c46209e07fb40cbc537373fec', 'png', null);
INSERT INTO `ld_asset` VALUES ('243', '3', '1157891', '1553849611', '1', '0', '1b32e5d5da4eb5b64dfd9c82b286fffbfb44c78ab9c7ef0465835ad16370dfba', '10.png', 'portal/20190329/db44d19f8d5b5fcd7639666b907af5ac.png', '1b32e5d5da4eb5b64dfd9c82b286fffb', '6fd8662f06408d1b1198f040de0410f281ca32fe', 'png', null);
INSERT INTO `ld_asset` VALUES ('244', '3', '26866', '1553850222', '1', '0', '72a466c438627a19d92d5ce89fe48c8ed6ff837e9249be128c4f3816a6725a25', 'logo.png', 'portal/20190329/45db4afb075a0512c292530ddc933bd2.png', '72a466c438627a19d92d5ce89fe48c8e', 'b5506a4ce49af8d8e9f0b81fcc454b02a81c3713', 'png', null);
INSERT INTO `ld_asset` VALUES ('245', '3', '73788', '1553998052', '1', '0', '2b3551cefa894bcd5108f13658ed7fae1b64606c1973394e95db5602b5e8797e', 'Matthew.jpg', 'portal/20190331/241a6699c36db4863f1d4c524144bea7.jpg', '2b3551cefa894bcd5108f13658ed7fae', 'beb4b733bfc4863e0a8c07da7cebdc21b98522da', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('246', '3', '81926', '1553998231', '1', '0', '51bdc7c7835c0865af08fda266db37143849b39243a467c43dfb280a92827db8', 'Chelsea.jpg', 'portal/20190331/4be071a7e8c9e020ac8d9be81bb03d84.jpg', '51bdc7c7835c0865af08fda266db3714', 'bc47fbe25e09508bc30fc4a5b8098df6acf8de17', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('247', '3', '125304', '1553998302', '1', '0', '21e259c7890ec9aab4de0c2649d6c5c42f601efb6626f0c7c8ef485d45b76b40', 'Madeleine.jpg', 'portal/20190331/d79409a812c6198d0305d28e862db553.jpg', '21e259c7890ec9aab4de0c2649d6c5c4', '9cf2986045c0b1f01c1477ddb1be4456d80b30e5', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('248', '3', '81766', '1553998363', '1', '0', '038042b1be4a4010338457e9f0af4e201141a1f526b824e00dabd5f2bbe55b65', 'Manfred.jpg', 'portal/20190331/95ea9a0611dadaea69b3e02fa1c585fb.jpg', '038042b1be4a4010338457e9f0af4e20', '88351b83e96e29b1e58cd1b91bd7c525d156a8c1', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('249', '3', '69372', '1553998411', '1', '0', 'a2f89c5d91d0d3fef122cbb509a94a9a486b783e567b24d1e47bda8715b02fef', 'Peter.jpg', 'portal/20190331/99df29add7536599cfc3c76f6a00c0f0.jpg', 'a2f89c5d91d0d3fef122cbb509a94a9a', '8064b7f072389d8c622bc46c12dc494e7fe90cc0', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('250', '3', '137030', '1553999458', '1', '0', '98d3969e4ee25a6ae6fd976c7b56582b0d77972231d883c02104e533498d327f', '273798402.jpg', 'default/20190331/be17f5cb9dec121551695007c9c4e9e3.jpg', '98d3969e4ee25a6ae6fd976c7b56582b', 'b434a4c1987eae16367870636d2aeb11c60ec15d', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('251', '3', '23808', '1553999797', '1', '0', '69911d3bb0e295cc4f3910ba38adffdc4772fbe3ab99d187be45b88033ba18cd', '83526775.jpg', 'default/20190331/ababda5958a31aff46668d0189895d75.jpg', '69911d3bb0e295cc4f3910ba38adffdc', '9d6c570ad05c73ee2394251c87a1a2d18b11404f', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('252', '3', '40512', '1554001247', '1', '0', '5cba86ef49c37b1523547139629e2226e389c445bfb1fc1a77da5c8dc6d2cf7f', '371880592.jpg', 'default/20190331/cabe346499fa41882b8432d0736df88b.jpg', '5cba86ef49c37b1523547139629e2226', '8ce8d5f0ce89c3f22a7ff86572d93c31aae927ed', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('253', '3', '112887', '1554022031', '1', '0', 'dd88e1bf3394cf99d5b4191203d05bc6a811b5897525a83087a5e41a8b91e174', '英国夏令营600X400.png', 'portal/20190331/947defd060981294d93d2056f75a1ad6.png', 'dd88e1bf3394cf99d5b4191203d05bc6', 'e09a856d99defc9593b011a613dc82a49cfc92a1', 'png', null);
INSERT INTO `ld_asset` VALUES ('254', '3', '135451', '1554022208', '1', '0', '91be132328df3f9b85c5c1fbe7c4ed2a1d2fb80c7e7e2e5af7ab640cd82c8ca6', '英国夏令营600X400的副本.png', 'portal/20190331/fe15b618e0a30ec5d2d70e549d0949dd.png', '91be132328df3f9b85c5c1fbe7c4ed2a', '56de28c2c6fbc2f7506e1d8a8a65f0985b7f6371', 'png', null);
INSERT INTO `ld_asset` VALUES ('255', '3', '645362', '1554185362', '1', '0', 'e62d76050e5bd794ef74e2d94ab1007dad120bd61276a6ba289a912f1adb3e96', '1.jpg', 'default/20190402/ed38e0ce7ab5cdf4d24945f3dc306bd8.jpg', 'e62d76050e5bd794ef74e2d94ab1007d', '9b6da69d07b699341b702495ae1f2bee7baf7bc3', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('256', '3', '508896', '1554185383', '1', '0', '5714d8e62c5fee7d42652e68f1197e6a583aea4da26564bc30a057ef21ff09a3', '2.jpg', 'default/20190402/1c2037e8b940cb5840ec3535130f1273.jpg', '5714d8e62c5fee7d42652e68f1197e6a', '7f8ea21ee0f1f3fd6c611d180ebd6c9297b5f3d4', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('257', '3', '539290', '1554185393', '1', '0', '811c72e9652b6b96492e6ece7d69a93ce44ef9cea390539dd98c75f81efd1123', '3.jpg', 'default/20190402/ff2ba5e762e72639ecef70bd2a73066e.jpg', '811c72e9652b6b96492e6ece7d69a93c', '0c1a62c7e3727e920d41507ee92a2b954fbbcad3', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('258', '3', '566272', '1554185401', '1', '0', '4bac91b840b50cde4842b94906574617d6efd546ba475c6b24d00dcfb1ef3202', '4.jpg', 'default/20190402/8dce9336a5ec5571369cc010bd18b98b.jpg', '4bac91b840b50cde4842b94906574617', 'b936150a9d411afd849c331e0b920e8b8671de26', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('259', '3', '731309', '1554185409', '1', '0', '97fc704c0a0f518e148f396f35ecf720b489d950ee2e2f78114c2e8834c592ab', '5.jpg', 'default/20190402/80d2f57287794fb35a477250efcc351c.jpg', '97fc704c0a0f518e148f396f35ecf720', 'a905db4bede7926a4b3e79a7234257a48babc82f', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('260', '3', '144595', '1554189335', '1', '0', 'b6c58077a37ff00224cd90f1674f9d93e3b44937fe7e1e2e16bb657fda26bab8', '1.jpg', 'default/20190402/2986a4dc7b2a1d936e6bd99080b17f0f.jpg', 'b6c58077a37ff00224cd90f1674f9d93', 'f5650facfec9b070b15b014078bbbc4629a6d0f5', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('261', '3', '90726', '1554189380', '1', '0', '40c95e6bcd5036801e37c18da8b203433e981ad13d4e95aeb749c101da3d3c68', '2.jpg', 'default/20190402/69555ab8e09f462492b75d4b67685091.jpg', '40c95e6bcd5036801e37c18da8b20343', '4cdb7f616dca3ba567ec38d8aa2188ada25544ab', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('262', '3', '85400', '1554189386', '1', '0', 'a278f98ecce806b07dadc8c310644f5725d32484ef1b2705aab53e46dce856af', '3.jpg', 'default/20190402/2e2abd4e60378bd8acc7ae14fabcc8d2.jpg', 'a278f98ecce806b07dadc8c310644f57', '196620258ec9fb3f18db1b1f4baacdf8ce589d13', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('263', '3', '112693', '1554189395', '1', '0', '4b41740ba162c8f8fac8756909efd9029885adca591f1af7c7f056e06d57a4ea', '4.jpg', 'default/20190402/82303d6c2f5f15c980cd1a4c099794ea.jpg', '4b41740ba162c8f8fac8756909efd902', '3843cc3888773c703f5404899727e027a021d933', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('264', '3', '88513', '1554189399', '1', '0', 'c136170c9058968787d3e551b4268825ac836abb21f86c262ea32de5abd397d0', '5.jpg', 'default/20190402/c7e40001ffd486691407e03c5b7f625d.jpg', 'c136170c9058968787d3e551b4268825', '7eed947fcce45dadf1abc4aa803688b86d4cd1f7', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('265', '3', '58777', '1554189405', '1', '0', '2b62078c7a7f0e8ba0f8a8abd509a9e3f906972d54288f7d6a736fb799b36d08', '6.jpg', 'default/20190402/724043a132bf39f265e21b2bb386248f.jpg', '2b62078c7a7f0e8ba0f8a8abd509a9e3', '662689235532ac55229a13b0022a3b94fd0eacda', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('266', '3', '135697', '1554189409', '1', '0', 'b5f03f66511c8a84d0226be73c6b16a655f7fc5bfa8cd9ee36eeabb8ea82c31f', '7.jpg', 'default/20190402/3b85982b296a89a12d33aad3a0135d4b.jpg', 'b5f03f66511c8a84d0226be73c6b16a6', 'b78de39c98b97a672619e270a25b8144e786f912', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('267', '3', '79291', '1554189652', '1', '0', 'cadb1b6ec8b7a39fa3ccc8d9c8c273de0eac7ca34c87968bf062e27b72aa64a7', '1.jpg', 'default/20190402/1dee9bc0fd8a5c82483dfc403da0af2a.jpg', 'cadb1b6ec8b7a39fa3ccc8d9c8c273de', '3c9405524662ebd3fc772961cfff1ab8e36d78a1', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('268', '3', '815230', '1554189825', '1', '0', '461e44ce20ef16bb31a68a566730ed40db62dc5ca9b93b0bb18be50f30cbc43f', '1.jpg', 'default/20190402/e738eb503d1b34fcd05eb34194a89c2f.jpg', '461e44ce20ef16bb31a68a566730ed40', 'd0ae9ce9397a76e51d4ad1696d11c6b8531fbb61', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('269', '3', '91277', '1554189953', '1', '0', 'c3ab208d27ddf06c2f3916beff6e7f039c71e1097ee9c11ba2540d3e781ae750', '1.jpg', 'default/20190402/d438ec85da93941a8fc910e633d15d2d.jpg', 'c3ab208d27ddf06c2f3916beff6e7f03', '03ccf87e300bbfe6dc5186791a601ec952222f9f', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('270', '3', '99568', '1554189967', '1', '0', '1bb16016667e6859acbf3736f6ea7c2999423489ab041f375cb1d8305340acb3', '2.jpg', 'default/20190402/f8e0e2583445eb1b143846d85e328e2d.jpg', '1bb16016667e6859acbf3736f6ea7c29', 'c84b36a22edd48a4be7a558c88490f223da979b8', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('271', '3', '107744', '1554189971', '1', '0', 'fabb5828df493ec67931fc96f2e369b0adf038009f36d22743365cb8473b6379', '3.jpg', 'default/20190402/683946ba00a242caaabafe7989b1381d.jpg', 'fabb5828df493ec67931fc96f2e369b0', 'b7a83ad397a9997df5980977fdf8017a0b5d9d0d', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('272', '3', '128420', '1554190078', '1', '0', '9d352d73a331e526edf6e541263bd6ceb0402a7cbdd4b2fcbc27f8208ff5d1b8', '1.jpg', 'default/20190402/47feecdbb4c277e8519f7ea05522480b.jpg', '9d352d73a331e526edf6e541263bd6ce', 'f7e08d1156dc8ecf09395012b980e68610751803', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('273', '3', '84542', '1554190118', '1', '0', '2b17ad07d0886869eefdc3b71996fca6a96766b88c023ae4aede8c5873e5a384', '2.jpg', 'default/20190402/db5058d10f449ff9a5f15ac990f05bf4.jpg', '2b17ad07d0886869eefdc3b71996fca6', 'ab984eaf0837d7482997cd54004571cd13fc0add', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('274', '3', '907615', '1554190205', '1', '0', 'f4d7219f462e5ae0183bf61f060c0a9cbcacfafcc514d552a7dae03c593703fb', '1.jpg', 'default/20190402/dcee8d5b6568b9168799681585d75ca8.jpg', 'f4d7219f462e5ae0183bf61f060c0a9c', 'cccafdf8c8c7adc8f7bb583ed44b9118d254193f', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('275', '3', '860155', '1554190366', '1', '0', 'e24620a14bf9ea9dc87a3e1764f2f3d1a93f17cf8f029a7f34d5b30ff472500f', '1.jpg', 'default/20190402/33b39622349acfb6f5d16e7808876167.jpg', 'e24620a14bf9ea9dc87a3e1764f2f3d1', '97be70547e90bf2db3cc47bcc231debaa3d40fb9', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('276', '3', '220348', '1554190535', '1', '0', 'db75d231d33e48e8c0f4370ae056a6a34d34d13d7b48104064ee1b7f28ffe300', '2.jpg', 'portal/20190402/ff8dc6a4b2273caa315c3955f36ab6e7.jpg', 'db75d231d33e48e8c0f4370ae056a6a3', '856c6f64a2f88a0262b6d684a2147c5e4b82f47e', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('277', '3', '346739', '1554190556', '1', '0', '7dfe5232ede406fbe81b7c43f183c9a4c2d3c2833071fe863c2547b512117406', '2.jpg', 'portal/20190402/14ed18d1824c36025e06fa78dd784203.jpg', '7dfe5232ede406fbe81b7c43f183c9a4', '805502a74bc2af60280365686f4e6f85105cedb8', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('278', '3', '374619', '1554193368', '1', '0', 'c33da76cf6f26be7ef535b40f01a14c8175f3381ac31b65d3077e7b3c81370e8', '3.JPG', 'default/20190402/810d7fb7796eed269dcde5273dd9fe58.jpg', 'c33da76cf6f26be7ef535b40f01a14c8', '7066b4191dba9ca2935f6ec13f5d5bcc1f36ba23', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('279', '3', '308448', '1554193409', '1', '0', 'c62a0df3c7e40d558d1e79ab2af9b4222a18e0c236585d9fa7ae352a5829af20', '4.JPG', 'default/20190402/3245466145eb1f648bae97d37d428085.jpg', 'c62a0df3c7e40d558d1e79ab2af9b422', 'c597bc15716fabda76aadf059b26f75c6d94d3d4', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('280', '3', '233794', '1554193426', '1', '0', '8435aea236daab8f8d0844b58985b5a288fd18a9c80c3bba8729102a1df15dcb', '5.JPG', 'default/20190402/9e489a30c48fefb03c51a3733528ddb7.jpg', '8435aea236daab8f8d0844b58985b5a2', 'caeb87c92a7dce87a12b2bdf2a33176532a64bbf', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('281', '3', '627020', '1554193472', '1', '0', 'b78fd8d7abbcaaca6a251758de0d34c1bfe68bd933b7319dd29efac85210d6e7', '6.jpg', 'default/20190402/07a7c9415cdf05ecf6720629bc46c054.jpg', 'b78fd8d7abbcaaca6a251758de0d34c1', '2d72d16d80c657bff18cf88d8d089eed642bf176', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('282', '3', '83100', '1554195227', '1', '0', '10a0427c61bc09703b577cab6bfdb02fe28a1cd025ff9d13ff7a53045701ca0d', '7.jpg', 'default/20190402/65c3900ac584d924c17062d63d3262e4.jpg', '10a0427c61bc09703b577cab6bfdb02f', 'b1406f61b3c341f1630fb81e9c37bda75e8b2844', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('283', '3', '282655', '1554195236', '1', '0', '87414226035d0f51da65dcd4849c4a3cbc75a609dc172891ac7f4b91de98a399', '8.JPG', 'default/20190402/41e461ceb9366df67eb85e46b93311b6.jpg', '87414226035d0f51da65dcd4849c4a3c', 'a64af6ceaace571469f96365c2cd1af3fffdd9c9', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('284', '3', '434918', '1554195262', '1', '0', '592fd6b4465b33c33a13a727ec45b4efffa1003a25d9f0ed367e6fdc272a53b3', '9.JPG', 'default/20190402/2e622ade052b7d52614aa9b04bdb06b8.jpg', '592fd6b4465b33c33a13a727ec45b4ef', 'bb5028806b1fe5db50c9cd13159b22ab65c3eda1', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('285', '3', '463105', '1554195279', '1', '0', 'e4dee0b76e8d586ca8e6401bb59c2d1036bf906e293e10128ffe3d73c37ff7be', '10.JPG', 'default/20190402/87a2579ded2758c8a1728ab9015a8a09.jpg', 'e4dee0b76e8d586ca8e6401bb59c2d10', '3af665ddd8342533db86b77a4b406caada7858fc', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('286', '3', '163904', '1554195337', '1', '0', '5ff0cef84fb454bd744ae2b8f476d30f32e723775c1f60080ecba4f6bed3679d', '11.JPG', 'default/20190402/e99234eeb9705f196be327160b6d95e0.jpg', '5ff0cef84fb454bd744ae2b8f476d30f', 'b80d4f52d61b56bbb3d4f869e1f69f05d5c91b53', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('287', '3', '263115', '1554195358', '1', '0', 'd7495f44d06b8825e2f5964c632e00a6f4b7c599387f036d8c51581ea8b1aa0c', '12.JPG', 'default/20190402/134009aff657a1fbac9447541c1525db.jpg', 'd7495f44d06b8825e2f5964c632e00a6', 'ef83e4fdf740c78c30c944b7f62d86d9968d5530', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('288', '3', '343087', '1554195415', '1', '0', 'c4d07c5482960541ce2edf339f327fcaddbf39f9a2995ff68bb5855a9f0d5071', '13.JPG', 'default/20190402/4e5c275b6172251ad52c2dd0cab12116.jpg', 'c4d07c5482960541ce2edf339f327fca', 'bb53d5fa4a5395db8bd63657358c8b5a95cc5f9b', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('289', '3', '277853', '1554195431', '1', '0', 'e95b8e9926b34407726d24509a1774f086fce7057a57d2c1f3621d414419f824', '14.JPG', 'default/20190402/38e11ef85c19b97e2b2ee3cc96b525ff.jpg', 'e95b8e9926b34407726d24509a1774f0', '0b727e024460d2b4abbe3eccde278d200d6a0f53', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('290', '3', '482789', '1554195447', '1', '0', 'fc35f17c73a27148128eac327079905016dcfcd7c8d3b61f707fcd4ade9ee01e', '15.JPG', 'default/20190402/5031f86791fc5fddb0f13745fb712f5d.jpg', 'fc35f17c73a27148128eac3270799050', '55d6681567dc14378e6b16e72c95c624d96828b2', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('291', '3', '330346', '1554195472', '1', '0', '741cbf10bf723d9cba64cd4fa0732e028ba7b0cb9771c664c15f893525eeb1ae', '16.JPG', 'default/20190402/073a939ca254600a5b4b27d042779976.jpg', '741cbf10bf723d9cba64cd4fa0732e02', '16d4a9129653a70fa8561509495393ec954c20b5', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('292', '3', '282443', '1554195521', '1', '0', '466ea319ba8b86529c0f08a588196e57052f095f30b8033849ae28f9e61a22bd', '17.JPG', 'default/20190402/ee464312637cbbdcdbca5b72d0559c91.jpg', '466ea319ba8b86529c0f08a588196e57', '106cfaee59c3d8ca5fbda6547ee03adc4b9b49bb', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('293', '3', '274520', '1554195550', '1', '0', '97996a7e114287644fd928a02d75d96953f80f26ef7fc448f4bd1985d49aab41', '18.JPG', 'default/20190402/e6b63478fb687a63f43f8c926ac66e28.jpg', '97996a7e114287644fd928a02d75d969', '78c3b620f47699a86239e43f7867fe2067db3c6b', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('294', '3', '291451', '1554195568', '1', '0', '29d8b7b7aea019aee64f4d68417d0a6e43c6b535652c08749e7e20e8915ca2f4', '19.JPG', 'default/20190402/da483d073a6d73b2cf5be7349177d4d5.jpg', '29d8b7b7aea019aee64f4d68417d0a6e', 'f05b746b948af1be452052956113157980d2f33d', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('295', '3', '623408', '1554345472', '1', '0', '1f8e06875384917804ae36f2c24ba20d29529958f9f06ee7385933180e6b0bb0', '6.jpg', 'portal/20190404/1cc99b7fb8ef5714c56e1b160f47d1cc.jpg', '1f8e06875384917804ae36f2c24ba20d', '5ba9cc986295f2ecefd3996250cc84c3a0324823', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('296', '3', '782477', '1554345602', '1', '0', '544aa997a2caaddeae3a27776e1c52acb531271ac9cc4a726af868f392f1b236', '1.jpg', 'default/20190404/58f683d7391524fcc3e406836f3940f9.jpg', '544aa997a2caaddeae3a27776e1c52ac', '18ae52c392b1b0d0681101ed50e8ba268d9ff6d2', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('297', '3', '699302', '1554345645', '1', '0', 'e03abce5f3304ff5af23b173cff644ba6f021348dc3c8ecae8fb9f660ad0ad87', '2.jpg', 'default/20190404/23c9d88ee188822022d4fa537011a1bd.jpg', 'e03abce5f3304ff5af23b173cff644ba', '1177b3b3b7550358ff888cf63887860f216ffd07', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('298', '3', '515635', '1554345678', '1', '0', 'b5b121f4763304907c1d674c59dcccc51b4bcfab54b7ba78a50ee119249c4eca', '7.jpg', 'default/20190404/83b1ab0e0847fb32d8e449a06998b3e8.jpg', 'b5b121f4763304907c1d674c59dcccc5', '89ba95fb5e6805baec0c8e89ddc431616ff0e38f', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('299', '3', '514541', '1554345907', '1', '0', '5813738b5dd7c44628add0ba1211c46c84ca09abee36c71cbb61a26c97f7032f', '5.jpg', 'portal/20190404/435ec8397842bb0bde096eee02449b12.jpg', '5813738b5dd7c44628add0ba1211c46c', '5aeac887aeb43e57036b490ecf73192654408fb7', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('300', '3', '876707', '1554345937', '1', '0', 'dbb331d4fdbdbf3cd7af4f4c657a5998601df61ae8c1426f650a96508893fcd0', '9.jpg', 'default/20190404/8a62066b3e98ecc58f175deb73b11087.jpg', 'dbb331d4fdbdbf3cd7af4f4c657a5998', '01561f230de5247f960a7876c2ecebe2c57f70ef', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('301', '3', '334458', '1554347631', '1', '0', '1bc95130daa91d48fdbfd21c00e56a6646f13e26ed9defa5f0a7cc2c18bc7bea', '1.png', 'default/20190404/f708a8a27bf7d4db2e11e7c163f2c2ac.png', '1bc95130daa91d48fdbfd21c00e56a66', '18532e41311f7b2c7caebba982457f5aecc81f12', 'png', null);
INSERT INTO `ld_asset` VALUES ('302', '3', '424107', '1554347658', '1', '0', 'dc0ebe50fe3c792bba18293e736e934bb510adc25cec630efaf6c82d8319f268', '戏剧周末课（横竖）-02.png', 'portal/20190404/1547b90ff264a4b291beb56098e14d11.png', 'dc0ebe50fe3c792bba18293e736e934b', 'c0837c18b1d6354993b3a6b00c92827e75a4121c', 'png', null);
INSERT INTO `ld_asset` VALUES ('303', '3', '1010201', '1554347707', '1', '0', 'd13ba034dab7665e66eed6f2f44b2a329a5dcd611a4518a3d355e28fe44aff5d', '戏剧周末课（横竖）-01.png', 'default/20190404/68d1e30f16d7bf174fc40fc7be894197.png', 'd13ba034dab7665e66eed6f2f44b2a32', '8676d171d1ba7562152ceaebe4b7c055121dd76a', 'png', null);
INSERT INTO `ld_asset` VALUES ('304', '3', '255319', '1554347818', '1', '0', 'a6953ed62bfbaf6f59f6ad5978a63f11e3253a79e140ef775cf402425138194a', '1.png', 'default/20190404/1a076738307beb392ccee2255a0672be.png', 'a6953ed62bfbaf6f59f6ad5978a63f11', 'ea6649b9b8c0402d82c8097dd668d1ebdb08e30a', 'png', null);
INSERT INTO `ld_asset` VALUES ('305', '3', '700289', '1554347827', '1', '0', '11ff235b5a9a42deab617048a40205e2fa4dc6ebe00430da6dbb3c465dd31ae7', '2.png', 'default/20190404/b168b862126bb1e21e9300cdf9361b33.png', '11ff235b5a9a42deab617048a40205e2', 'b6de3b34ed659f5e67b0c42e5448d44828a46754', 'png', null);
INSERT INTO `ld_asset` VALUES ('306', '3', '1050618', '1554347848', '1', '0', '19e0c923c9d096c40218063b0defe840a90946444481e96c2b9cec044e37344a', '3.png', 'default/20190404/bf10e99b6a6bfc31c3148406da9fb667.png', '19e0c923c9d096c40218063b0defe840', '97531bf575037f0568f7f0bcea9c66280222fd35', 'png', null);
INSERT INTO `ld_asset` VALUES ('307', '3', '376169', '1554347865', '1', '0', 'c69e1483b806bd732c84fb5b94d9aff8c01de2e883d177026e0f64885dae8424', '5.png', 'default/20190404/4d6118b395fe07de07738df85f182092.png', 'c69e1483b806bd732c84fb5b94d9aff8', '5b29ae75e8f31c62ca408b2d74861fed0e2f9b10', 'png', null);
INSERT INTO `ld_asset` VALUES ('308', '3', '743818', '1554347892', '1', '0', '3312200c27dcb2115611764ec03d63298b43f8d4d9dbabe9b4eba5d9408655b5', '4.png', 'portal/20190404/b517e04f891ae9ed109db67af558ee6d.png', '3312200c27dcb2115611764ec03d6329', '4275ceff5c985496efdefc32c4042d133428d7e6', 'png', null);
INSERT INTO `ld_asset` VALUES ('309', '3', '18051', '1554348184', '1', '0', 'db1817a273b8410ca80adce492a5337eb06eb0909e81e1d19598ffadf50a9b78', '1552706715.jpg', 'portal/20190404/758c5c7da9da7ec2cee3ca7f60c6606a.jpg', 'db1817a273b8410ca80adce492a5337e', '548daa029cbc1ecd0ce249977c269cc56626c423', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('310', '3', '16686', '1554348204', '1', '0', 'c57b61188a5a705fa4674f7e18c5026b0b20438ab4f511d613298622d730ea76', '459327331.jpg', 'portal/20190404/4121011c38c237be1baba6391340797e.jpg', 'c57b61188a5a705fa4674f7e18c5026b', '12b27477196e4639baa4670e1b977b115f6f456d', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('311', '3', '2759510', '1554348650', '1', '0', 'f8698f7345019e15f21239202cf5b3fdbab87b99cb6db13e8dde2899c50fb9db', '1-1.jpg', 'default/20190404/a4e3f8fed743fd57937014a99c79afc7.jpg', 'f8698f7345019e15f21239202cf5b3fd', '14364b3b134295556c0b8aaac57454b92b0cffd6', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('312', '3', '517762', '1554348967', '1', '0', '902f2974b26db30a93a21c738e91a4f2c652b1e90587e860f1b692f5d49427ae', '1-1.jpg', 'default/20190404/19592432057eb56a3b0adb94ad9d5d49.jpg', '902f2974b26db30a93a21c738e91a4f2', '0c632ecc6b58b2cb577bc76784936daa46838ca7', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('313', '3', '551552', '1554348975', '1', '0', '4f9d4f58074509184944dad3d2191df49e003a411ac4139de93ba1205097d8bd', '1-2.jpg', 'default/20190404/baa1a03729ad92fccb90c1b72c5451a7.jpg', '4f9d4f58074509184944dad3d2191df4', '648e4500bf171209cb84619d2cd4d74cbf9eda3d', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('314', '3', '537471', '1554348982', '1', '0', '2578042b47bb814bd892ed39d29afdac791cce5e47c64fec3c8d72f04b5d3143', '1-3.jpg', 'default/20190404/e7d9acd1308d4dcd08ec0088a5bf8c18.jpg', '2578042b47bb814bd892ed39d29afdac', '0cb27e8d9f3e7617f65c9b4b4dc9e02f42954bb7', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('315', '3', '545218', '1554349057', '1', '0', '152beb6a4cb0eaab93edd4cfca1cc91965b2a0c2d463089f860b913d68236cc2', '2-1.jpg', 'default/20190404/486d004da2bbb7bb6f34d8cd8ec75470.jpg', '152beb6a4cb0eaab93edd4cfca1cc919', 'c8161d64b7697930fa7a9bb3db222bf1356678e1', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('316', '3', '548167', '1554349064', '1', '0', '92e184536ffe9184722298d084ddc288e1ce55efd1b364255e9f5d4cf6cf21a3', '2-2.jpg', 'default/20190404/0bbeb82f96755fd3644cb48bf36301bd.jpg', '92e184536ffe9184722298d084ddc288', '9cbd9b2e5f0e5f2137d51d06bc3ffc8da9b9ef65', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('317', '3', '527259', '1554349101', '1', '0', 'fc7c964cb1845eb9e06fe1a5a95290c2cfdafaa3ea0d1a91f0a80a993658aaf0', '3-1.jpg', 'default/20190404/37a17b43f0e10e7b93da85fbfe5096e9.jpg', 'fc7c964cb1845eb9e06fe1a5a95290c2', 'c0c7323657d72626f0611ba3dff9595682c679a6', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('318', '3', '425272', '1554349108', '1', '0', '8e14b089150875e9f41f9ff4d6db51db6d182026e6c42fba9505acce3d789977', '3-2.jpg', 'default/20190404/4688d61261ff81ddf7ba2c2ecd6f001d.jpg', '8e14b089150875e9f41f9ff4d6db51db', '34c814184d272ecf9380bd801a6e20eff30f7a62', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('319', '3', '479255', '1554349133', '1', '0', '6d52296829022fb80ea00fadcac31ed626935990255ccbdc417f7d5fc34ade0b', '4-1.jpg', 'default/20190404/ca70648a6ccd0f5c4ac3a11357517224.jpg', '6d52296829022fb80ea00fadcac31ed6', 'eaf357f0c0cfa6ce6bbb1924959e5a0eacf6ad5e', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('320', '3', '372154', '1554349140', '1', '0', 'f66616dbb655f35a6cc2e035e95e35cf40978908b2aa12cef710c320e0410834', '4-2.jpg', 'default/20190404/9be4aa7891852650b7cbb5d53bcbfe59.jpg', 'f66616dbb655f35a6cc2e035e95e35cf', '2b3f49157a79c5edfe99d81ba92a278be4fa6bcc', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('321', '3', '503650', '1554349164', '1', '0', '86f4a73fb22d09f1924338e1e7228f27e7d63fee4787d8e3d29d714be8f61589', '6-1.jpg', 'default/20190404/0f25263a6ecc47d2e6c59a4dcded43f6.jpg', '86f4a73fb22d09f1924338e1e7228f27', '7864d27652de3957b77851d15416abe2e3b2bcaa', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('322', '3', '682501', '1554349170', '1', '0', 'ec6ab01acb78e52cc25f909d61ef952af12a2d5df3e4476b5c4dd43416cda4d5', '6-2.jpg', 'default/20190404/b977d516e0462063fbc64179083b5c6f.jpg', 'ec6ab01acb78e52cc25f909d61ef952a', 'cbc5105df9106016881a9f70866c41b8cbecb85d', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('323', '3', '84514', '1554359163', '1', '0', '7e092c00b1829f082743a6f73cad0b3dde14bbe4b241c1326377462386bf6c72', '1943929676.jpg', 'default/20190404/d5807a839ea37f3fd053369d97a0e104.jpg', '7e092c00b1829f082743a6f73cad0b3d', '4f499d45a30caef49be914926bbca51a2a4ca68a', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('324', '3', '50172', '1554359980', '1', '0', '640ad17e683738bc7f9699444a3a82b550abafaaa344197740eb7aa4903f72b5', '1565596576.jpg', 'default/20190404/219f91fbb18ba77b6a48f4331c11ba59.jpg', '640ad17e683738bc7f9699444a3a82b5', '768af5f9c5c75091e8c3652b84cf5b835bbefb0f', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('325', '3', '2071252', '1554360203', '1', '0', 'b4192c505502fa949feb5e2e971d92dfd7be57dc51828cccab161763247a8f6f', '1.pdf', 'portal/20190404/7f4595913760aa842233d39aa889bc36.pdf', 'b4192c505502fa949feb5e2e971d92df', 'c68c8192c1157a021362a94e147108a6eb9ced2b', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('326', '3', '2232586', '1554360288', '1', '0', '23850d3a5c36cdc508c4e5a065b8ab0bd27b9154bd5fdedae60cf882106fff5d', '20180207.pdf', 'portal/20190404/a71a33a18046f6f459ea3a2350cc2068.pdf', '23850d3a5c36cdc508c4e5a065b8ab0b', 'c18cab0def151e72ef96adfd2036db7a1e06ac4a', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('327', '3', '778318', '1554360288', '1', '0', '7b307e9ff4f1235706e274279d84a50705d07592bf608baabe05741d73388de2', '微信图片_20190404144350.png', 'portal/20190404/026750889306c9b07a5ad90959d92217.png', '7b307e9ff4f1235706e274279d84a507', 'fc0e1e3ddf1fc46db6335726b2277382846d917b', 'png', null);
INSERT INTO `ld_asset` VALUES ('328', '3', '1882329', '1554360343', '1', '0', '8d8117a3e61f76c84cf56fee2d0544804cd3c94eb760e154c9149b9c34291443', '20180304.pdf', 'portal/20190404/3eaa8379385d8e4583df922384b209d7.pdf', '8d8117a3e61f76c84cf56fee2d054480', '40666cff8e1ce15318c28c1c41cb8e0945c56b46', 'pdf', null);
INSERT INTO `ld_asset` VALUES ('329', '3', '758418', '1554362558', '1', '0', '270bb578a102b928cd88b7f2e67e5d4d91ddf764903df49969745192c67aa9c3', '微信图片_20190404152203.png', 'portal/20190404/745995b2c291883e2b159b095d59c080.png', '270bb578a102b928cd88b7f2e67e5d4d', '55090ad6a371315354cb3c774dfda66c1ec0c65b', 'png', null);
INSERT INTO `ld_asset` VALUES ('330', '2', '15173', '1560911397', '1', '0', '85499227eb405f74a4c28ed733c3337a3df9a13199f4abaa4b0beb7422f7f923', 'hehuo1.png', 'admin/20190619/fa7a4632b9f35f2496924844fbccfdd4.png', '85499227eb405f74a4c28ed733c3337a', 'a3d46afc4d54be52c6ea81585a99af273fbe03f2', 'png', null);
INSERT INTO `ld_asset` VALUES ('331', '2', '11390', '1560911437', '1', '0', '9fb298484df59ee466b996b486a494090df1f8aefb61db3776cece27e8dbcdd9', 'hehuo2.png', 'admin/20190619/622cae97f571440d299501c8cdfca156.png', '9fb298484df59ee466b996b486a49409', '7d2fea83960076c1e095b23647a3cbea2d6217a5', 'png', null);
INSERT INTO `ld_asset` VALUES ('332', '2', '114454', '1560912055', '1', '0', '811f8119681aa5804eca794694aeac583ddf59465b734f8adaa230feba5e3d24', 'banner_bg.jpg', 'admin/20190619/a8ccedd784717e501395a34d7d583a25.jpg', '811f8119681aa5804eca794694aeac58', '2b3a44312b80463c0322aed13b91d74b83d79998', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('333', '2', '18791', '1560914678', '1', '0', '3ff16c0571df36b7e48f7dfd7c959a4b5b356f029612936417f94132f0d673a9', 'erweima.jpg', 'admin/20190619/4925ebc8ff7e7c7f943c71b170f82c2e.jpg', '3ff16c0571df36b7e48f7dfd7c959a4b', '37f7209923801358d0cd69499e8fd4869175643a', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('334', '2', '157232', '1560924757', '1', '0', '18ba0bbbd887318960a9b60f409a2d51334cf582cf86f8c292effa0a9f607abb', 'fazhong1.png', 'portal/20190619/6eba09a12f1054f1e47bd81029a6e3c0.png', '18ba0bbbd887318960a9b60f409a2d51', '5651cce31231525d976cbcd8cd710fef925f8cfc', 'png', null);
INSERT INTO `ld_asset` VALUES ('335', '2', '63661', '1560925871', '1', '0', '15cc07af5730603283aa1e6793b9a0355dbd71f48d9aa4ba414611ccb97dcf05', 'main1.png', 'portal/20190619/65bae78170e47d5dc8d310262f397622.png', '15cc07af5730603283aa1e6793b9a035', '3da33e6ae45e54c61b1b1cecaa44b70f839a4988', 'png', null);
INSERT INTO `ld_asset` VALUES ('336', '2', '11337', '1560931651', '1', '0', '60525227bac8590b8335b21b171872343f62dbdcf43ce8c793bdef12acbf14fd', 'ma1.png', 'portal/20190619/fcac691ed7b7c9a0f7aa3c83139ac30b.png', '60525227bac8590b8335b21b17187234', '9d9571d11298566bd5900669c97fb086ce0af885', 'png', null);
INSERT INTO `ld_asset` VALUES ('337', '2', '17142', '1560933793', '1', '0', 'c65fe98b1d2bc0525e0f3f1d458cea19d23f2d3a6ed233f5e9db4a32553e960e', 'erjiyi1.png', 'portal/20190619/5705b713bd614030d97837dd22cb7449.png', 'c65fe98b1d2bc0525e0f3f1d458cea19', '7ce5d172b3a78e4cc53d262d661c617ae28130a7', 'png', null);
INSERT INTO `ld_asset` VALUES ('338', '2', '18161', '1560935923', '1', '0', 'ffc4e3661240599b7b5bb1548b2bb43534e5044891ff525e06d8d1f9dafe1c80', 'man1.png', 'portal/20190619/fdccb59035c777bc81e7081818657423.png', 'ffc4e3661240599b7b5bb1548b2bb435', 'edf978c0b1828ae5c6f54f3659185e5c068a22c5', 'png', null);
INSERT INTO `ld_asset` VALUES ('339', '2', '7662', '1560935961', '1', '0', '292f322d8475dbe07203ee47d8b8d8ca2b7613ed26a0a5d4a37eee323c2d960c', 'ma3.png', 'portal/20190619/01949f2a8d7a541ab30221704f861e19.png', '292f322d8475dbe07203ee47d8b8d8ca', '1875ec20b3f3e3c972ff19a13227d0ba598b0957', 'png', null);
INSERT INTO `ld_asset` VALUES ('340', '2', '8537', '1560936660', '1', '0', 'f1f2674a166d4aec3cbe39fc880bb56d390efdb3f29d3479d31c630586b65d6b', 'ma4.png', 'portal/20190619/e4d18eb1ef03834408fc6ed49409c1c5.png', 'f1f2674a166d4aec3cbe39fc880bb56d', '2cc2bf27893126b340489fe836acda111cad726a', 'png', null);
INSERT INTO `ld_asset` VALUES ('341', '2', '6638', '1560995190', '1', '0', '05810bb5078f1a878d2e438817f1fe464827453aa1859398635418250b55da39', 'hehuo5.png', 'admin/20190620/9c468d0f735f391785e826cd57b7c0bc.png', '05810bb5078f1a878d2e438817f1fe46', '1139c5d38516a5bf22458ef02698025bc0766fe3', 'png', null);
INSERT INTO `ld_asset` VALUES ('342', '2', '16491', '1560995268', '1', '0', 'd800f09242906b94db9e31c5bb10cddf0cf95b2fe8af758ffab24e34160da91c', 'hehuo4.png', 'admin/20190620/74faeb30cc6bf5d1ef1e76c4d7fbe8c2.png', 'd800f09242906b94db9e31c5bb10cddf', '84ed468180876be89c13b2a9bad4097f243302ae', 'png', null);
INSERT INTO `ld_asset` VALUES ('343', '2', '10720', '1560995298', '1', '0', '2955ff2a2097b67759af71b2c821ba315fe8d39d52202ffb82e7e6ac9460a564', 'hehuo3.png', 'admin/20190620/bf884fd87deb4ad0a079a351d30db0ab.png', '2955ff2a2097b67759af71b2c821ba31', '4e050566ef65eeb40186891088b743d2544d1d3e', 'png', null);
INSERT INTO `ld_asset` VALUES ('344', '2', '11855', '1561369184', '1', '0', '2c614dcfba08fd4c07387c64a5ca31c8c5e810254439ffae0239fcaf3feac8ac', 'erweima.jpg', 'admin/20190624/6c0dbf5af5d2fc637dba99834e3d36f7.jpg', '2c614dcfba08fd4c07387c64a5ca31c8', '712fbc7bb71d80283fbbd3a8a5e86e94f3ef4bb3', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('345', '2', '49192', '1561425888', '1', '0', '46814f77ec88da7ed06670d0ee1a7d4ecdcf363342399ea5eb27a4842f4684c0', 'lei1.jpg', 'portal/20190625/92b460a85e0b15ccc92073802ccc937b.jpg', '46814f77ec88da7ed06670d0ee1a7d4e', '99288e6ce68d18238285db6a1d32773a1d565b44', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('346', '2', '5288', '1561429322', '1', '0', 'b4ddcffb005fe414672f600cded69e476c9386b8d19af7cccf90af64a157f836', 'xuan1.png', 'portal/20190625/dde3fdaf7c96cf9bf890355925c5774c.png', 'b4ddcffb005fe414672f600cded69e47', '4cde285ff7b547c1949bcbf1cd89411a43fad0f2', 'png', null);
INSERT INTO `ld_asset` VALUES ('347', '2', '6629', '1561429373', '1', '0', '8a9f3bd25cc05e75002a051bf511f2dcdc9f49a271bcebd00fd06bddb69e2f24', 'xuan2.png', 'portal/20190625/6eb89798afa8d84ffe13d3aeaee1ead4.png', '8a9f3bd25cc05e75002a051bf511f2dc', '3ec9c201f479e34717070cc538c7c4fb3103a5e8', 'png', null);
INSERT INTO `ld_asset` VALUES ('348', '2', '6357', '1561429438', '1', '0', '970d7bfe53896c81c9c5fdea38e85ee9091e9c4c77bd389863ca0a6e076485f2', 'xuan3.png', 'portal/20190625/1a5044704676b9026630c1800f06a664.png', '970d7bfe53896c81c9c5fdea38e85ee9', '9ab0bb6068fbd248396c08b57d6f56267de0c8e2', 'png', null);
INSERT INTO `ld_asset` VALUES ('349', '2', '5517', '1561429475', '1', '0', '5619a24c45dc62e8697edbd620d58c763838c3433fc015b9e3c4aabddcddaab4', 'xuan4.png', 'portal/20190625/bf63de6a462f2413dd449ae5b7cfe4e5.png', '5619a24c45dc62e8697edbd620d58c76', '6b411118f7e8c75429da87018d52d6f3a589d7e4', 'png', null);
INSERT INTO `ld_asset` VALUES ('350', '2', '3767', '1561431401', '1', '0', '6ec0decf9e1ff368ab9058a48da01685aa5e482a8093e4e9c8968768cb50b3fc', 'kehu01.jpg', 'portal/20190625/c78d69fc4c04e201a717b2493534e39d.jpg', '6ec0decf9e1ff368ab9058a48da01685', '19ab0c95601190ee1fb5c69f30ff2483c30e1af3', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('351', '2', '3603', '1561431442', '1', '0', 'b6ea7df86f3b377d97cd66668f625e82206636ad21a26feca41bd0e219f4a0c3', 'kehu02.jpg', 'portal/20190625/66ed8800fdc8d45d238cad860302985f.jpg', 'b6ea7df86f3b377d97cd66668f625e82', 'df2792e9714ab3a669b494a5d4205f5ba30c606b', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('352', '2', '74762', '1561433293', '1', '0', 'ee4ee6823c690165218fe708340c2c43871e5ee83159bbe0281449e49bfdf5a6', 'banner22.jpg', 'portal/20190625/ee3e55bb0c5e83e54354d7e15c2adaba.jpg', 'ee4ee6823c690165218fe708340c2c43', 'b058c15aa3032da8694420fb3e80fe7828ca5324', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('353', '2', '82746', '1561434165', '1', '0', 'a481182dacc19890fc165cc8630f742717d1600b003b598ed070b6674cb9bc77', 'banner2.jpg', 'portal/20190625/b62d67e4aaab6119842aadb1052e6e37.jpg', 'a481182dacc19890fc165cc8630f7427', 'd361b693589d9316e5534be3544e1f6654147101', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('354', '2', '323680', '1561436916', '1', '0', '9105f52f3de519c697826681a23553b0837c49b26fd19d6b98f6db2d8c45022f', 'quanxi.png', 'portal/20190625/9508e6028396f697c6559bcf6ae4b200.png', '9105f52f3de519c697826681a23553b0', '3c9ec36139c052ddfb4af6a9a753d52f265605e4', 'png', null);
INSERT INTO `ld_asset` VALUES ('355', '2', '67839', '1561442184', '1', '0', 'd05a76862a014f1f1ba25e9c6fa376a1d27e8168094a79f10a35ba378e12853e', 'gongsi.jpg', 'portal/20190625/b434806129d024e79334e7a21af60f9c.jpg', 'd05a76862a014f1f1ba25e9c6fa376a1', 'babe54d5554146f2965f2381fd747f93ee9ee628', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('356', '2', '251600', '1561442266', '1', '0', 'f2e2acc4d7944c1a1de905f939a1d90502834f3054817ff89189dbbdfa32aeea', 'banner1.jpg', 'admin/20190625/581e1a90081c88c4a2fba9ab318b1c8e.jpg', 'f2e2acc4d7944c1a1de905f939a1d905', 'd27cc19aa4540a8407ae2cf62e05634067f8c433', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('357', '2', '165835', '1561442497', '1', '0', 'ed080a78c961152f29f718c2d06eeb41078707bde9831d3afbb5fc7472602843', 'banner11.jpg', 'admin/20190625/12cf83d7f6d3ed74cf8dd76d17ce0abc.jpg', 'ed080a78c961152f29f718c2d06eeb41', 'a5ca964333630ba0eed02be419a1146ec635907f', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('358', '2', '52676', '1561444712', '1', '0', '4568e4e53d4000c32bfe29dcc5264eaebf9b71f3b7e2bcc644aed9f71b545265', 'anli1.jpg', 'portal/20190625/e81dcf43d972b3da616eed764867e5df.jpg', '4568e4e53d4000c32bfe29dcc5264eae', 'bacfb267474e0f5601df0f92b86178a1fadc15b2', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('359', '2', '35670', '1561445050', '1', '0', '3521668d9fb5fcde930b05f7f8835e2b89d9eedeb57547e9060963eb523af2ed', 'anli2.jpg', 'portal/20190625/3b17ce15e0d3775656139f34ad22366f.jpg', '3521668d9fb5fcde930b05f7f8835e2b', 'c63cef448abd56c14ee4bea00a981618b71d6b6e', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('360', '2', '30805', '1561445120', '1', '0', 'f6f6b71ec3f5eca312ce7b95b4a71a122c171f4f421a20c028c168af04526188', 'anli4.jpg', 'portal/20190625/5fdf4119c314644224347501dd4ae8e2.jpg', 'f6f6b71ec3f5eca312ce7b95b4a71a12', 'c90367e842d7a2b15d672fde62c8729c551ea23e', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('361', '2', '32054', '1561445140', '1', '0', '4493b77208aaf55ea4d60f878176fa03db01d14b779b2a81e1f6dec47c0abcce', 'anli3.jpg', 'portal/20190625/aa47f2102d2d37ee0431fa9aa4f7843e.jpg', '4493b77208aaf55ea4d60f878176fa03', 'de5f1e6d7bfba532e05a5dce3f5d40bf427753e8', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('362', '2', '32586', '1561445186', '1', '0', '8dcc426e305111368a5e55560fb3b171e5bf4df78d24b05ab6a9475912594283', 'anli5.jpg', 'portal/20190625/f80502536a2bf70c08fc1249ddeffc71.jpg', '8dcc426e305111368a5e55560fb3b171', 'c4a7821ce979a0104abce11f25e7450af634745f', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('363', '2', '3378', '1561446872', '1', '0', '63884161a0ff68bf49eb0ad569e546a50b220645e0284a86c648cfce424f9641', 'kehu03.jpg', 'portal/20190625/785419abaca1af50435c8b62e9d58ddd.jpg', '63884161a0ff68bf49eb0ad569e546a5', '5936bb4bf2f85023d6632306579dcb90867e25d3', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('364', '2', '3193', '1561446879', '1', '0', 'db5494c97b055d70de9eaa17609fac9307be2d51034355656a9491348a5d3f7c', 'kehu04.jpg', 'portal/20190625/9cc3c552b129ce2476152458cf68cc70.jpg', 'db5494c97b055d70de9eaa17609fac93', 'f8a598a7e24153226908af7b8488be157c0c8498', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('365', '3', '27489', '1563267229', '1', '0', 'cfe58c2a45d260f3e6ff6a70b5109863ba36cb9d494fc066f9c53c6bb6660732', '二维码.jpg', 'admin/20190716/f3ba018bc974bd89e3433e4fd7f21fac.jpg', 'cfe58c2a45d260f3e6ff6a70b5109863', '4956f57b6d95465a19b57628dd0fe77d31c49891', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('366', '3', '253938', '1563326463', '1', '0', '49ddefac3419ff334f6286bee4f39b25ba5bf006b711c76837b97e046866a9cd', 'guanyuwo1.png', 'portal/20190717/5ad0dc457a884cc5a482bae75cc97050.png', '49ddefac3419ff334f6286bee4f39b25', '12b81cd3f78c6158fabe52d2eb9c53ff7baec0b8', 'png', null);
INSERT INTO `ld_asset` VALUES ('367', '3', '337069', '1563326550', '1', '0', 'd3c80f7e128049d1a8a74fcf7cee28e993ce8e9672a602e502eb7d8c47f87d54', 'guanyuwo2.png', 'portal/20190717/7406132405fa8fcbf693af4a064a2aeb.png', 'd3c80f7e128049d1a8a74fcf7cee28e9', '2d2402391b003ad2216fcc1c058ab5a0651b7fc7', 'png', null);
INSERT INTO `ld_asset` VALUES ('368', '3', '102040', '1563326592', '1', '0', '2b2cc4911fc70b400da32d6fb795cea1145526fc89bf61443f7bffdd06d4c5fc', 'guanyuwo3.jpg', 'portal/20190717/8158a685f92e41c6dfa8d1190ebcfbb1.jpg', '2b2cc4911fc70b400da32d6fb795cea1', '1bdf00560675893d82cbb4f6b0b36577beb78d94', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('369', '3', '13862', '1563330486', '1', '0', '778705d5b36aceabd8e96f63fe8b26286ebe33724978fc295c3db827e45d3638', 'chan1.jpg', 'portal/20190717/3760fd8bfb5683d7369dbaca446ec5a5.jpg', '778705d5b36aceabd8e96f63fe8b2628', '4ba0388f58e737707ce695a6faa6aa1c9d0143e5', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('370', '3', '222382', '1563330813', '1', '0', 'edf9a7524ae6e378e02316e41be209e7cd067a93b16ee122638ade3531e12027', 'linian.jpg', 'portal/20190717/11739f48b7704bf6199ede4f4db2973c.jpg', 'edf9a7524ae6e378e02316e41be209e7', 'c7ce446216e13f99979ba9bef7b5d9944288b31b', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('371', '3', '1251122', '1563331146', '1', '0', '9c689051b2215bb7c6fe5440defc8deab67a1c47704ec2ab60d03feec0912863', 'banner2.png', 'portal/20190717/5dd1f0d93cd65b266a73957e5634fafc.png', '9c689051b2215bb7c6fe5440defc8dea', 'dcd72c9a0600d2f792c53f175def14608f901d9a', 'png', null);
INSERT INTO `ld_asset` VALUES ('372', '3', '309664', '1563332352', '1', '0', 'aa3f0276dee769eac2a628a033c65416708dcb1e70bf074498ec99ed85010114', 'xinwen-xiang.jpg', 'portal/20190717/b54683cfb97d24a2590162df98ca9be3.jpg', 'aa3f0276dee769eac2a628a033c65416', '1b0745ffeb45c7752dc65f99b9e7df01a343cfb8', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('373', '3', '141053', '1563333336', '1', '0', 'ffbe14b7585ff2964d870cb2ca164adf92db0731fd80b57eec695cabfde84939', 'zhongxin1.png', 'portal/20190717/a3875e1fa93bf669d0c66bd952667b27.png', 'ffbe14b7585ff2964d870cb2ca164adf', '37494ba0ce9a47e1aaa38aaa59a3b560117a5d7f', 'png', null);
INSERT INTO `ld_asset` VALUES ('374', '3', '139147', '1563333621', '1', '0', '870033cbf8b2a6f23da9c1fb65fce1465d23084ebe885c4a6222262e572e3891', 'zhognxin2.png', 'portal/20190717/81473ad959e6d4872551edb7742ae1ae.png', '870033cbf8b2a6f23da9c1fb65fce146', 'fcc7c9fe5952f60601657bbeb157e2503f6b44ac', 'png', null);
INSERT INTO `ld_asset` VALUES ('375', '3', '8205', '1563345796', '1', '0', 'bfc3dc6a737f24b5d63b16cd1179e2bfb83cf5edf6279fd7729e35c746328eb7', 'pin3.jpg', 'portal/20190717/3508553212529e84882f6940d484f0cd.jpg', 'bfc3dc6a737f24b5d63b16cd1179e2bf', '38be69b7c112d428d4c340b6ee2d456dfe47cc74', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('376', '3', '15839', '1563345871', '1', '0', '889b98dca1e2895a670611bca77c63a58419d577bc5a41583759a6dac7d27b84', 'pin2.jpg', 'portal/20190717/44c3a295a78c38e52c82865ba1108bb1.jpg', '889b98dca1e2895a670611bca77c63a5', 'd15c3017b499aafb4393f6b70b71858d61b5b7a7', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('377', '3', '90422', '1563354583', '1', '0', 'aab0360de86dd3fa5c3e85990feb971a1a24676b2447d96f81f7710923785823', 'fuwu1.jpg', 'portal/20190717/4d270f6a37fcc8e7b690c86d04ddc790.jpg', 'aab0360de86dd3fa5c3e85990feb971a', 'a5d60d06f6b433de3373ba4c7239da84629e9750', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('378', '3', '119788', '1563354644', '1', '0', 'b6f7d0a06efaf09b84dae57a32a065094c743c1a93739495d521d6db6203df3d', 'fuwu2.jpg', 'portal/20190717/9fe78164dd3c7ff995c87cbcb21a25ad.jpg', 'b6f7d0a06efaf09b84dae57a32a06509', '4d001075172eab669b794c41ff5e44f7c3e5226b', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('379', '3', '99122', '1563354671', '1', '0', 'd28a3785ce13d7f20eb0f801d71a7900f578a04de0fd50cadb55fc4b4e477d4a', 'fuwu3.jpg', 'portal/20190717/cabf96244a0c52200269acb59e98819b.jpg', 'd28a3785ce13d7f20eb0f801d71a7900', '616c126d81d9dcf580b56db6e0600ebe1bd0f247', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('380', '3', '3286', '1563355431', '1', '0', '46e9ddca4eee90fb3af5ba950cc9ed98f6c42836d5319a8130d97fd4b3bcb53d', 'hezuo1.jpg', 'portal/20190717/5055784e3aa5a84c01b643e644b8c907.jpg', '46e9ddca4eee90fb3af5ba950cc9ed98', '9816b866a934c2840230988b84a386fe14991540', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('381', '3', '2807', '1563355444', '1', '0', '1e60d83d0e0d0331b655bfeafd44559503a13e9b6ec9b4dad9fe2a5bf2c3f2c1', 'hezuo2.jpg', 'portal/20190717/99432c28af11a4b7f5d68d05f9893ad3.jpg', '1e60d83d0e0d0331b655bfeafd445595', 'd386d42931e81bc6fa002d0a598aaaa3a921ab01', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('382', '3', '2704', '1563355444', '1', '0', '40bb36646156399bd5cf8b8ae444da3a99f66214473e1f0315c0b52b94348757', 'hezuo3.jpg', 'portal/20190717/920beb610aac84786fa50747bbd7f034.jpg', '40bb36646156399bd5cf8b8ae444da3a', '352ff65d465597c071163b2f7925378ad03f7883', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('383', '3', '3829', '1563355444', '1', '0', '190f5009256c0d64f390bbeba1bcb1ac35df10c318319f000e9624c3453782b1', 'hezuo5.jpg', 'portal/20190717/3de65cf0a8059c03fc6a7eee3eb6358d.jpg', '190f5009256c0d64f390bbeba1bcb1ac', 'a8ce6b5827c1d179a5dbba50e0ac463f8e58278d', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('384', '3', '3629', '1563355444', '1', '0', '93fd5c66aabdcce702a7a4dbba878e9bb522d7602f40d5965e5f76de06afc64f', 'hezuo6.jpg', 'portal/20190717/2ad9a3fdbbb559678fb25aa367cc4cc5.jpg', '93fd5c66aabdcce702a7a4dbba878e9b', '9576c8b3a969de26f235967b135f68a2a2d84256', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('385', '3', '3429', '1563355445', '1', '0', '47e5f412512558cb11ee04f334810417af6c6f9b02346b46e5b45886db691b24', 'hezuo4.jpg', 'portal/20190717/7748806dfeaeb0288cfe3245dd25f900.jpg', '47e5f412512558cb11ee04f334810417', '818cd1f161f31f554ccd5241abf685815c77adfd', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('386', '3', '230105', '1563356477', '1', '0', 'c80bcc6706b303babae3cf254eeeb25d2a0a1fd89736ca0581f91d7e834abace', 'banner1.jpg', 'admin/20190717/2abdc966ec4cf0e5b98c76048641630f.jpg', 'c80bcc6706b303babae3cf254eeeb25d', '15d8e5c9b1de7ac4d3b251167c67ea65034c460e', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('387', '3', '350710', '1563356485', '1', '0', '1d32e4d1aa3e150e76a1947da7cca7a5135dcdff918aa3589aade921009cf334', 'banner11.jpg', 'admin/20190717/ed42cb1c252e04d5e020e562e89f7ce5.jpg', '1d32e4d1aa3e150e76a1947da7cca7a5', '8f49073871b0157076d4eb7daec3372f92e8c163', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('388', '3', '560038', '1563357165', '1', '0', '39769ccf594ff2e141eb2cb2a3f21eac1f3ed754cb2b53719f3ecd2e949df5fd', 'jianjie.png', 'portal/20190717/061676f14852d648f9e15e0b524a5e89.png', '39769ccf594ff2e141eb2cb2a3f21eac', '79f64926d349db1718c49b10ef22eaea2cf3dfdd', 'png', null);
INSERT INTO `ld_asset` VALUES ('389', '3', '4057', '1563359263', '1', '0', '624091824f3d2a0d1a60586fc66e6067a5ce526a477cac9662e8dc02629327a5', 'hezuo7.jpg', 'portal/20190717/298569d2627ecf69f30590f72361c7c7.jpg', '624091824f3d2a0d1a60586fc66e6067', '22e4410012c2825acb8cf205ac3f79326a5b9a9b', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('390', '3', '13413', '1563359645', '1', '0', '19d4df7ccf3f926028ee7754ad13389f540cd12cde30dcd71e6b99bc1a66b6f7', 'chan4.jpg', 'portal/20190717/ded901db5a790e69758101c13a3b59e2.jpg', '19d4df7ccf3f926028ee7754ad13389f', 'a9ec2b0e9c5a7eb231b24d850f0b5c08221ae6bb', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('391', '3', '18226', '1563359676', '1', '0', 'f7d2dd4893192875a39f4c35d80087746dd73d6c70e4069d93be6c6c7be60668', 'chan5.jpg', 'portal/20190717/69e4a67c0337ea483414f04f1885633f.jpg', 'f7d2dd4893192875a39f4c35d8008774', 'f7367dbc70661b086637a82f836d10ebb02b10b8', 'jpg', null);
INSERT INTO `ld_asset` VALUES ('392', '3', '21338', '1563359705', '1', '0', 'f1a688500ab08095aff77c15afc0f7828fc81b0c197b97d898c485ec7128f278', 'chan3.jpg', 'portal/20190717/cbd7f7b6cb8af344fab5cb40fdf9981c.jpg', 'f1a688500ab08095aff77c15afc0f782', 'fa7c7c1e1331b90999b6a12f2a93ee8d214935fc', 'jpg', null);

-- ----------------------------
-- Table structure for ld_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `ld_auth_access`;
CREATE TABLE `ld_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=806 DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of ld_auth_access
-- ----------------------------
INSERT INTO `ld_auth_access` VALUES ('633', '2', 'admin/setting/default', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('634', '2', 'admin/setting/site', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('635', '2', 'admin/setting/sitepost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('636', '2', 'admin/mailer/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('637', '2', 'admin/mailer/indexpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('638', '2', 'admin/mailer/template', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('639', '2', 'admin/mailer/templatepost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('640', '2', 'admin/mailer/test', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('641', '2', 'admin/theme/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('642', '2', 'admin/theme/install', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('643', '2', 'admin/theme/uninstall', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('644', '2', 'admin/theme/installtheme', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('645', '2', 'admin/theme/update', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('646', '2', 'admin/theme/active', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('647', '2', 'admin/theme/files', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('648', '2', 'admin/theme/filesetting', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('649', '2', 'admin/theme/filearraydata', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('650', '2', 'admin/theme/filearraydataedit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('651', '2', 'admin/theme/filearraydataeditpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('652', '2', 'admin/theme/filearraydatadelete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('653', '2', 'admin/theme/settingpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('654', '2', 'admin/theme/datasource', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('655', '2', 'admin/nav/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('656', '2', 'admin/nav/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('657', '2', 'admin/nav/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('658', '2', 'admin/nav/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('659', '2', 'admin/nav/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('660', '2', 'admin/nav/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('661', '2', 'admin/navmenu/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('662', '2', 'admin/navmenu/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('663', '2', 'admin/navmenu/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('664', '2', 'admin/navmenu/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('665', '2', 'admin/navmenu/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('666', '2', 'admin/navmenu/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('667', '2', 'admin/navmenu/listorder', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('668', '2', 'admin/slide/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('669', '2', 'admin/slide/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('670', '2', 'admin/slide/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('671', '2', 'admin/slide/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('672', '2', 'admin/slide/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('673', '2', 'admin/slide/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('674', '2', 'admin/slideitem/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('675', '2', 'admin/slideitem/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('676', '2', 'admin/slideitem/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('677', '2', 'admin/slideitem/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('678', '2', 'admin/slideitem/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('679', '2', 'admin/slideitem/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('680', '2', 'admin/slideitem/ban', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('681', '2', 'admin/slideitem/cancelban', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('682', '2', 'admin/slideitem/listorder', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('683', '2', 'admin/linktype/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('684', '2', 'admin/link/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('685', '2', 'admin/link/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('686', '2', 'admin/link/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('687', '2', 'admin/link/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('688', '2', 'admin/link/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('689', '2', 'admin/link/listorder', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('690', '2', 'admin/link/toggle', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('691', '2', 'admin/menu/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('692', '2', 'admin/menu/lists', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('693', '2', 'admin/menu/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('694', '2', 'admin/menu/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('695', '2', 'admin/menu/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('696', '2', 'admin/menu/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('697', '2', 'admin/menu/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('698', '2', 'admin/menu/listorder', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('699', '2', 'admin/menu/getactions', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('700', '2', 'admin/route/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('701', '2', 'admin/route/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('702', '2', 'admin/route/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('703', '2', 'admin/route/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('704', '2', 'admin/route/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('705', '2', 'admin/route/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('706', '2', 'admin/route/ban', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('707', '2', 'admin/route/open', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('708', '2', 'admin/route/listorder', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('709', '2', 'admin/route/select', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('710', '2', 'admin/setting/password', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('711', '2', 'admin/setting/passwordpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('712', '2', 'admin/setting/upload', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('713', '2', 'admin/setting/uploadpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('714', '2', 'admin/setting/clearcache', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('715', '2', 'admin/storage/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('716', '2', 'admin/storage/settingpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('717', '2', 'user/adminuseraction/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('718', '2', 'user/adminuseraction/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('719', '2', 'user/adminuseraction/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('720', '2', 'user/adminuseraction/sync', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('721', '2', 'portal/adminnaven/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('722', '2', 'user/adminindex/default', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('723', '2', 'admin/user/default', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('724', '2', 'admin/rbac/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('725', '2', 'admin/rbac/roleadd', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('726', '2', 'admin/rbac/roleaddpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('727', '2', 'admin/rbac/roleedit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('728', '2', 'admin/rbac/roleeditpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('729', '2', 'admin/rbac/roledelete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('730', '2', 'admin/rbac/authorize', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('731', '2', 'admin/rbac/authorizepost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('732', '2', 'admin/user/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('733', '2', 'admin/user/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('734', '2', 'admin/user/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('735', '2', 'admin/user/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('736', '2', 'admin/user/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('737', '2', 'admin/user/userinfo', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('738', '2', 'admin/user/userinfopost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('739', '2', 'admin/user/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('740', '2', 'admin/user/ban', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('741', '2', 'admin/user/cancelban', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('742', '2', 'user/adminindex/default1', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('743', '2', 'user/adminindex/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('744', '2', 'user/adminindex/ban', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('745', '2', 'user/adminindex/cancelban', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('746', '2', 'user/adminoauth/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('747', '2', 'user/adminoauth/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('748', '2', 'portal/adminindex/default', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('749', '2', 'portal/adminarticle/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('750', '2', 'portal/adminarticle/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('751', '2', 'portal/adminarticle/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('752', '2', 'portal/adminarticle/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('753', '2', 'portal/adminarticle/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('754', '2', 'portal/adminarticle/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('755', '2', 'portal/adminarticle/publish', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('756', '2', 'portal/adminarticle/top', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('757', '2', 'portal/adminarticle/recommend', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('758', '2', 'portal/adminarticle/listorder', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('759', '2', 'portal/admincategory2/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('760', '2', 'portal/admincategory/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('761', '2', 'portal/admincategory/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('762', '2', 'portal/admincategory/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('763', '2', 'portal/admincategory/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('764', '2', 'portal/admincategory/select', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('765', '2', 'portal/admincategory/listorder', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('766', '2', 'portal/admincategory/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('767', '2', 'portal/adminpage/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('768', '2', 'portal/adminpage/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('769', '2', 'portal/adminpage/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('770', '2', 'portal/adminpage/edit', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('771', '2', 'portal/adminpage/editpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('772', '2', 'portal/adminpage/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('773', '2', 'portal/admintag/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('774', '2', 'portal/admintag/add', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('775', '2', 'portal/admintag/addpost', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('776', '2', 'portal/admintag/upstatus', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('777', '2', 'portal/admintag/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('778', '2', 'portal/adminmessage1/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('779', '2', 'portal/adminposition/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('780', '2', 'portal/adminproduct/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('781', '2', 'portal/adminabout/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('782', '2', 'portal/adminres/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('783', '2', 'portal/adminproducts/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('784', '2', 'portal/adminsource/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('785', '2', 'portal/adminconwe/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('786', '2', 'portal/admindownload/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('787', '2', 'admin/recyclebin/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('788', '2', 'admin/recyclebin/restore', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('789', '2', 'admin/recyclebin/delete', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('790', '2', 'portal/adminpicture/default', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('791', '2', 'portal/adminarticleen/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('792', '2', 'portal/adminabouten/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('793', '2', 'portal/adminsourceen/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('794', '2', 'portal/adminresen/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('795', '2', 'portal/adminproductsen/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('796', '2', 'portal/adminconween/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('797', '2', 'portal/admindownloaden/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('798', '2', 'portal/adminpositionen/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('799', '2', 'portal/adminconst/default', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('800', '2', 'portal/adminmessage/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('801', '2', 'portal/adminmsg/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('802', '2', 'portal/adminsign/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('803', '2', 'portal/admincategory1/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('804', '2', 'portal/admincategory/index', 'admin_url');
INSERT INTO `ld_auth_access` VALUES ('805', '2', 'portal/admincategoryen/index', 'admin_url');

-- ----------------------------
-- Table structure for ld_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ld_auth_rule`;
CREATE TABLE `ld_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

-- ----------------------------
-- Records of ld_auth_rule
-- ----------------------------
INSERT INTO `ld_auth_rule` VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `ld_auth_rule` VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `ld_auth_rule` VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `ld_auth_rule` VALUES ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO `ld_auth_rule` VALUES ('5', '1', 'admin', 'admin_url', 'admin/LinkType/index', '', '友情链接', '');
INSERT INTO `ld_auth_rule` VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `ld_auth_rule` VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `ld_auth_rule` VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `ld_auth_rule` VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `ld_auth_rule` VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `ld_auth_rule` VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `ld_auth_rule` VALUES ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `ld_auth_rule` VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `ld_auth_rule` VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `ld_auth_rule` VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `ld_auth_rule` VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `ld_auth_rule` VALUES ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `ld_auth_rule` VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `ld_auth_rule` VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `ld_auth_rule` VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `ld_auth_rule` VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `ld_auth_rule` VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `ld_auth_rule` VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `ld_auth_rule` VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `ld_auth_rule` VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `ld_auth_rule` VALUES ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `ld_auth_rule` VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '中文导航', '');
INSERT INTO `ld_auth_rule` VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `ld_auth_rule` VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `ld_auth_rule` VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `ld_auth_rule` VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `ld_auth_rule` VALUES ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `ld_auth_rule` VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `ld_auth_rule` VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `ld_auth_rule` VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `ld_auth_rule` VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `ld_auth_rule` VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `ld_auth_rule` VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `ld_auth_rule` VALUES ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `ld_auth_rule` VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件中心', '');
INSERT INTO `ld_auth_rule` VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `ld_auth_rule` VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `ld_auth_rule` VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO `ld_auth_rule` VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `ld_auth_rule` VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `ld_auth_rule` VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `ld_auth_rule` VALUES ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `ld_auth_rule` VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO `ld_auth_rule` VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `ld_auth_rule` VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `ld_auth_rule` VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `ld_auth_rule` VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `ld_auth_rule` VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `ld_auth_rule` VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `ld_auth_rule` VALUES ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `ld_auth_rule` VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `ld_auth_rule` VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `ld_auth_rule` VALUES ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `ld_auth_rule` VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `ld_auth_rule` VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `ld_auth_rule` VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `ld_auth_rule` VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `ld_auth_rule` VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `ld_auth_rule` VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `ld_auth_rule` VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `ld_auth_rule` VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `ld_auth_rule` VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `ld_auth_rule` VALUES ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `ld_auth_rule` VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '网站设置', '');
INSERT INTO `ld_auth_rule` VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO `ld_auth_rule` VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `ld_auth_rule` VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `ld_auth_rule` VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `ld_auth_rule` VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `ld_auth_rule` VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `ld_auth_rule` VALUES ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `ld_auth_rule` VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '轮播管理', '');
INSERT INTO `ld_auth_rule` VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `ld_auth_rule` VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `ld_auth_rule` VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `ld_auth_rule` VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `ld_auth_rule` VALUES ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `ld_auth_rule` VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `ld_auth_rule` VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `ld_auth_rule` VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `ld_auth_rule` VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `ld_auth_rule` VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `ld_auth_rule` VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `ld_auth_rule` VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `ld_auth_rule` VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `ld_auth_rule` VALUES ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `ld_auth_rule` VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `ld_auth_rule` VALUES ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `ld_auth_rule` VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `ld_auth_rule` VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `ld_auth_rule` VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `ld_auth_rule` VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `ld_auth_rule` VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `ld_auth_rule` VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `ld_auth_rule` VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `ld_auth_rule` VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `ld_auth_rule` VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `ld_auth_rule` VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `ld_auth_rule` VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `ld_auth_rule` VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `ld_auth_rule` VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `ld_auth_rule` VALUES ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `ld_auth_rule` VALUES ('108', '1', 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO `ld_auth_rule` VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO `ld_auth_rule` VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO `ld_auth_rule` VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `ld_auth_rule` VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `ld_auth_rule` VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `ld_auth_rule` VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `ld_auth_rule` VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `ld_auth_rule` VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `ld_auth_rule` VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `ld_auth_rule` VALUES ('118', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `ld_auth_rule` VALUES ('119', '1', 'portal', 'admin_url', 'portal/AdminArticle/index', '', '关于我们', '');
INSERT INTO `ld_auth_rule` VALUES ('120', '1', 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', '');
INSERT INTO `ld_auth_rule` VALUES ('121', '1', 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', '');
INSERT INTO `ld_auth_rule` VALUES ('122', '1', 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', '');
INSERT INTO `ld_auth_rule` VALUES ('123', '1', 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', '');
INSERT INTO `ld_auth_rule` VALUES ('124', '1', 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', '');
INSERT INTO `ld_auth_rule` VALUES ('125', '1', 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', '');
INSERT INTO `ld_auth_rule` VALUES ('126', '1', 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', '');
INSERT INTO `ld_auth_rule` VALUES ('127', '1', 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', '');
INSERT INTO `ld_auth_rule` VALUES ('128', '1', 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', '');
INSERT INTO `ld_auth_rule` VALUES ('129', '1', 'portal', 'admin_url', 'portal/AdminCategory2/index', '', '分类管理', '');
INSERT INTO `ld_auth_rule` VALUES ('130', '1', 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', '');
INSERT INTO `ld_auth_rule` VALUES ('131', '1', 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', '');
INSERT INTO `ld_auth_rule` VALUES ('132', '1', 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', '');
INSERT INTO `ld_auth_rule` VALUES ('133', '1', 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', '');
INSERT INTO `ld_auth_rule` VALUES ('134', '1', 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', '');
INSERT INTO `ld_auth_rule` VALUES ('135', '1', 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', '');
INSERT INTO `ld_auth_rule` VALUES ('136', '1', 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', '');
INSERT INTO `ld_auth_rule` VALUES ('137', '1', 'portal', 'admin_url', 'portal/AdminIndex/default', '', '内容管理', '');
INSERT INTO `ld_auth_rule` VALUES ('138', '1', 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO `ld_auth_rule` VALUES ('139', '1', 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', '');
INSERT INTO `ld_auth_rule` VALUES ('140', '1', 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO `ld_auth_rule` VALUES ('141', '1', 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', '');
INSERT INTO `ld_auth_rule` VALUES ('142', '1', 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', '');
INSERT INTO `ld_auth_rule` VALUES ('143', '1', 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', '');
INSERT INTO `ld_auth_rule` VALUES ('144', '1', 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', '');
INSERT INTO `ld_auth_rule` VALUES ('145', '1', 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', '');
INSERT INTO `ld_auth_rule` VALUES ('146', '1', 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', '');
INSERT INTO `ld_auth_rule` VALUES ('147', '1', 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO `ld_auth_rule` VALUES ('148', '1', 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', '');
INSERT INTO `ld_auth_rule` VALUES ('149', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `ld_auth_rule` VALUES ('150', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `ld_auth_rule` VALUES ('151', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', '');
INSERT INTO `ld_auth_rule` VALUES ('152', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO `ld_auth_rule` VALUES ('153', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO `ld_auth_rule` VALUES ('154', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `ld_auth_rule` VALUES ('155', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `ld_auth_rule` VALUES ('156', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO `ld_auth_rule` VALUES ('157', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `ld_auth_rule` VALUES ('158', '1', 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', '');
INSERT INTO `ld_auth_rule` VALUES ('159', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO `ld_auth_rule` VALUES ('160', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO `ld_auth_rule` VALUES ('161', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO `ld_auth_rule` VALUES ('162', '1', 'portal', 'admin_url', 'portal/AdminMessage1/index', '', '了', '');
INSERT INTO `ld_auth_rule` VALUES ('163', '1', 'portal', 'admin_url', 'portal/AdminPosition/index', '', '推荐位管理', '');
INSERT INTO `ld_auth_rule` VALUES ('164', '1', 'portal', 'admin_url', 'portal/AdminPoster/index', '', '广告列表', '');
INSERT INTO `ld_auth_rule` VALUES ('165', '1', 'portal', 'admin_url', 'portal/AdminPoster/default', '', '广告管理', '');
INSERT INTO `ld_auth_rule` VALUES ('166', '1', 'gii', 'admin_url', 'gii/AdminIndex/default', '', '模块生成', '');
INSERT INTO `ld_auth_rule` VALUES ('167', '1', 'gii', 'admin_url', 'gii/AdminIndex/index', '', '模块生成', '');
INSERT INTO `ld_auth_rule` VALUES ('168', '1', 'portal', 'admin_url', 'portal/AdminInquiry/index', '', '小黑', '');
INSERT INTO `ld_auth_rule` VALUES ('169', '1', 'portal', 'admin_url', 'portal/AdminPicture/default', '', '内容管理(英)', '');
INSERT INTO `ld_auth_rule` VALUES ('170', '1', 'portal', 'admin_url', 'portal/AdminPicture/index', '', '招聘类型', '');
INSERT INTO `ld_auth_rule` VALUES ('171', '1', 'portal', 'admin_url', 'portal/AdminArticleen/index', '', '关于我们', '');
INSERT INTO `ld_auth_rule` VALUES ('172', '1', 'portal', 'admin_url', 'portal/AdminAbouten/index', '', '新闻中心', '');
INSERT INTO `ld_auth_rule` VALUES ('173', '1', 'portal', 'admin_url', 'portal/AdminSourceen/index', '', '合作伙伴', '');
INSERT INTO `ld_auth_rule` VALUES ('174', '1', 'portal', 'admin_url', 'portal/AdminResen/index', '', '产品展示', '');
INSERT INTO `ld_auth_rule` VALUES ('175', '1', 'portal', 'admin_url', 'portal/AdminProduct/index', '', '招聘类型', '');
INSERT INTO `ld_auth_rule` VALUES ('176', '1', 'portal', 'admin_url', 'portal/AdminProductsen/index', '', '服务与支持', '');
INSERT INTO `ld_auth_rule` VALUES ('177', '1', 'portal', 'admin_url', 'portal/Adminconst/default', '', '表单申请', '');
INSERT INTO `ld_auth_rule` VALUES ('178', '1', 'portal', 'admin_url', 'portal/AdminMessage/index', '', '预约参观 ', '');
INSERT INTO `ld_auth_rule` VALUES ('179', '1', 'portal', 'admin_url', 'portal/AdminAbouts/default', '', '课程系统', '');
INSERT INTO `ld_auth_rule` VALUES ('180', '1', 'portal', 'admin_url', 'portal/AdminRes/index', '', '产品展示', '');
INSERT INTO `ld_auth_rule` VALUES ('181', '1', 'portal', 'admin_url', 'portal/AdminProducts/index', '', '服务与支持', '');
INSERT INTO `ld_auth_rule` VALUES ('182', '1', 'portal', 'admin_url', 'portal/AdminSource/index', '', '合作伙伴', '');
INSERT INTO `ld_auth_rule` VALUES ('183', '1', 'portal', 'admin_url', 'portal/AdminConwe/index', '', '联系我们', '');
INSERT INTO `ld_auth_rule` VALUES ('184', '1', 'portal', 'admin_url', 'portal/AdminCategory1/index', '', '栏目管理', '');
INSERT INTO `ld_auth_rule` VALUES ('185', '1', 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', '');
INSERT INTO `ld_auth_rule` VALUES ('186', '1', 'portal', 'admin_url', 'portal/AdminDown/default', '', '相关下载', '');
INSERT INTO `ld_auth_rule` VALUES ('187', '1', 'portal', 'admin_url', 'portal/AdminDownload/index', '', '加入我们', '');
INSERT INTO `ld_auth_rule` VALUES ('188', '1', 'portal', 'admin_url', 'portal/AdminCategoryen/index', '', '英文分类', '');
INSERT INTO `ld_auth_rule` VALUES ('189', '1', 'portal', 'admin_url', 'portal/AdminConween/index', '', '联系我们', '');
INSERT INTO `ld_auth_rule` VALUES ('190', '1', 'portal', 'admin_url', 'portal/AdminDownloaden/index', '', '加入我们', '');
INSERT INTO `ld_auth_rule` VALUES ('191', '1', 'portal', 'admin_url', 'portal/AdminAbout/index', '', '新闻中心', '');
INSERT INTO `ld_auth_rule` VALUES ('192', '1', 'portal', 'admin_url', 'portal/AdminFuwu/index', '', '咨询服务', '');
INSERT INTO `ld_auth_rule` VALUES ('193', '1', 'portal', 'admin_url', 'portal/AdminMsg/index', '', '在线留言', '');
INSERT INTO `ld_auth_rule` VALUES ('194', '1', 'portal', 'admin_url', 'portal/AdminSign/index', '', '报名申请', '');
INSERT INTO `ld_auth_rule` VALUES ('195', '1', 'portal', 'admin_url', 'portal/AdminPositionen/index', '', '推荐位管理', '');
INSERT INTO `ld_auth_rule` VALUES ('196', '1', 'portal', 'admin_url', 'portal/Adminnaven/index', '', '英文导航', '');
INSERT INTO `ld_auth_rule` VALUES ('197', '1', 'portal', 'admin_url', 'portal/AdminCategoryfa/index', '', '法文分类', '');
INSERT INTO `ld_auth_rule` VALUES ('198', '1', 'portal', 'admin_url', 'portal/AdminIndexfa/default', '', '内容管理(法)', '');
INSERT INTO `ld_auth_rule` VALUES ('199', '1', 'portal', 'admin_url', 'portal/AdminArticlefa/index', '', '特别计划', '');
INSERT INTO `ld_auth_rule` VALUES ('200', '1', 'portal', 'admin_url', 'portal/AdminAboutfa/index', '', '平台服务', '');
INSERT INTO `ld_auth_rule` VALUES ('201', '1', 'portal', 'admin_url', 'portal/AdminSourcefa/index', '', '博物要闻', '');
INSERT INTO `ld_auth_rule` VALUES ('202', '1', 'portal', 'admin_url', 'portal/AdminResfa/index', '', '走出去', '');
INSERT INTO `ld_auth_rule` VALUES ('203', '1', 'portal', 'admin_url', 'portal/AdminProductsfa/index', '', '引进来', '');

-- ----------------------------
-- Table structure for ld_case_list
-- ----------------------------
DROP TABLE IF EXISTS `ld_case_list`;
CREATE TABLE `ld_case_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `cid` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `creatime` int(10) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned DEFAULT '10000',
  `content` text,
  `thumbnail_m` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_case_list
-- ----------------------------
INSERT INTO `ld_case_list` VALUES ('1', '无人矿卡系统(机群)', '机群', 'portal/20181217/b2824bf5b93dbc10d873981dd3084314.png', '1545012780', '10000', '&lt;p&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;慧拓以平行驾驶理论为依托，攻克复杂环境下组合导航定位技术、障碍物检测技术、车辆控制技术、信息管理与通信技术和系统集成等技术，为矿山开采与运输提供无人化运输系统解决方案。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;慧拓优势和创新：&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;1、慧拓无人矿卡基于多传感器融合方案实现露天矿山遮挡下的精准定位以及高粉尘等恶劣环境下的障碍物检测，通过接收无线指令的方式完成自动行驶和自动作业两大核心功能。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;2、慧拓无人矿卡运输平台的感知子系统通过激光雷达、毫米波雷达、工业相机感知矿山环境信息，连同惯导系统提供的定位信息，为无人矿卡的决策规划子系统和控制子系统提供决策支持。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;3、慧拓无人矿卡运输平台还包括状态检测子系统与模式切换子系统，可在人工模式与自动模式间切换。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;4、慧拓无人矿卡系统可以增强矿山作业的安全性，减少工作意外、降低运营成本，具有巨大的市场潜力。&lt;/span&gt;&lt;/p&gt;', null);
INSERT INTO `ld_case_list` VALUES ('2', '无人矿卡系统(重卡)', '重卡', 'portal/20181217/b2824bf5b93dbc10d873981dd3084314.png', '1545012900', '10000', '&lt;p&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;慧拓以平行驾驶理论为依托，攻克复杂环境下组合导航定位技术、障碍物检测技术、车辆控制技术、信息管理与通信技术和系统集成等技术，为矿山开采与运输提供无人化运输系统解决方案。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;慧拓优势和创新：&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;1、慧拓无人矿卡基于多传感器融合方案实现露天矿山遮挡下的精准定位以及高粉尘等恶劣环境下的障碍物检测，通过接收无线指令的方式完成自动行驶和自动作业两大核心功能。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;2、慧拓无人矿卡运输平台的感知子系统通过激光雷达、毫米波雷达、工业相机感知矿山环境信息，连同惯导系统提供的定位信息，为无人矿卡的决策规划子系统和控制子系统提供决策支持。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;3、慧拓无人矿卡运输平台还包括状态检测子系统与模式切换子系统，可在人工模式与自动模式间切换。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;4、慧拓无人矿卡系统可以增强矿山作业的安全性，减少工作意外、降低运营成本，具有巨大的市场潜力。&lt;/span&gt;&lt;/p&gt;', null);
INSERT INTO `ld_case_list` VALUES ('3', '无人矿卡系统(挖机)', '挖机', 'portal/20181217/b2824bf5b93dbc10d873981dd3084314.png', '1545013920', '10000', '&lt;p&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;慧拓以平行驾驶理论为依托，攻克复杂环境下组合导航定位技术、障碍物检测技术、车辆控制技术、信息管理与通信技术和系统集成等技术，为矿山开采与运输提供无人化运输系统解决方案。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;慧拓优势和创新：&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;1、慧拓无人矿卡基于多传感器融合方案实现露天矿山遮挡下的精准定位以及高粉尘等恶劣环境下的障碍物检测，通过接收无线指令的方式完成自动行驶和自动作业两大核心功能。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;2、慧拓无人矿卡运输平台的感知子系统通过激光雷达、毫米波雷达、工业相机感知矿山环境信息，连同惯导系统提供的定位信息，为无人矿卡的决策规划子系统和控制子系统提供决策支持。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;3、慧拓无人矿卡运输平台还包括状态检测子系统与模式切换子系统，可在人工模式与自动模式间切换。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;4、慧拓无人矿卡系统可以增强矿山作业的安全性，减少工作意外、降低运营成本，具有巨大的市场潜力。&lt;/span&gt;&lt;/p&gt;', null);
INSERT INTO `ld_case_list` VALUES ('4', '无人矿卡系统(矿卡)', '矿卡', 'portal/20181217/b2824bf5b93dbc10d873981dd3084314.png', '1545013980', '10000', '&lt;p&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;慧拓以平行驾驶理论为依托，攻克复杂环境下组合导航定位技术、障碍物检测技术、车辆控制技术、信息管理与通信技术和系统集成等技术，为矿山开采与运输提供无人化运输系统解决方案。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;慧拓优势和创新：&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;1、慧拓无人矿卡基于多传感器融合方案实现露天矿山遮挡下的精准定位以及高粉尘等恶劣环境下的障碍物检测，通过接收无线指令的方式完成自动行驶和自动作业两大核心功能。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;2、慧拓无人矿卡运输平台的感知子系统通过激光雷达、毫米波雷达、工业相机感知矿山环境信息，连同惯导系统提供的定位信息，为无人矿卡的决策规划子系统和控制子系统提供决策支持。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;3、慧拓无人矿卡运输平台还包括状态检测子系统与模式切换子系统，可在人工模式与自动模式间切换。&lt;/span&gt;&lt;br style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;color: rgb(112, 112, 112); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);&quot;&gt;4、慧拓无人矿卡系统可以增强矿山作业的安全性，减少工作意外、降低运营成本，具有巨大的市场潜力。&lt;/span&gt;&lt;/p&gt;', null);

-- ----------------------------
-- Table structure for ld_comment
-- ----------------------------
DROP TABLE IF EXISTS `ld_comment`;
CREATE TABLE `ld_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of ld_comment
-- ----------------------------

-- ----------------------------
-- Table structure for ld_hook
-- ----------------------------
DROP TABLE IF EXISTS `ld_hook`;
CREATE TABLE `ld_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

-- ----------------------------
-- Records of ld_hook
-- ----------------------------
INSERT INTO `ld_hook` VALUES ('1', '1', '0', '应用初始化', 'app_init', 'cmf', '应用初始化');
INSERT INTO `ld_hook` VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `ld_hook` VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `ld_hook` VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `ld_hook` VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `ld_hook` VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `ld_hook` VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `ld_hook` VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `ld_hook` VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `ld_hook` VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `ld_hook` VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `ld_hook` VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `ld_hook` VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `ld_hook` VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `ld_hook` VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `ld_hook` VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `ld_hook` VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `ld_hook` VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `ld_hook` VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `ld_hook` VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `ld_hook` VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `ld_hook` VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO `ld_hook` VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO `ld_hook` VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `ld_hook` VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `ld_hook` VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `ld_hook` VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `ld_hook` VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `ld_hook` VALUES ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO `ld_hook` VALUES ('30', '2', '0', '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前');
INSERT INTO `ld_hook` VALUES ('31', '2', '0', '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后');
INSERT INTO `ld_hook` VALUES ('32', '2', '1', '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面');
INSERT INTO `ld_hook` VALUES ('33', '3', '0', '主要内容之前', 'before_content', 'cmf', '主要内容之前');
INSERT INTO `ld_hook` VALUES ('34', '1', '0', '日志写入完成', 'log_write_done', 'cmf', '日志写入完成');
INSERT INTO `ld_hook` VALUES ('35', '1', '1', '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换');

-- ----------------------------
-- Table structure for ld_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `ld_hook_plugin`;
CREATE TABLE `ld_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of ld_hook_plugin
-- ----------------------------
INSERT INTO `ld_hook_plugin` VALUES ('1', '10000', '1', 'footer_start', 'Wxlogin');

-- ----------------------------
-- Table structure for ld_link
-- ----------------------------
DROP TABLE IF EXISTS `ld_link`;
CREATE TABLE `ld_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `type_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `post_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

-- ----------------------------
-- Records of ld_link
-- ----------------------------
INSERT INTO `ld_link` VALUES ('1', '1', '1', '0', '10000', '5中国国家文物局（简称SACH）是文物和博物馆事业的监管机构，主要职能是负责拟订文物和博物馆事业发展规划、协调和指导文物保护工作、推动完善文物和博物馆公共服务体系建设、管理和指导文物和博物馆外事工作等。', 'http://www.baidu.com', 'mc', '1560911340', 'admin/20190620/9c468d0f735f391785e826cd57b7c0bc.png', '_blank', '');
INSERT INTO `ld_link` VALUES ('2', '1', '1', '0', '10000', '4中国国家文物局（简称SACH）是文物和博物馆事业的监管机构，主要职能是负责拟订文物和博物馆事业发展规划、协调和指导文物保护工作、推动完善文物和博物馆公共服务体系建设、管理和指导文物和博物馆外事工作等。', '/', '中国博物馆协会', '1560911400', 'admin/20190620/74faeb30cc6bf5d1ef1e76c4d7fbe8c2.png', '_blank', '');
INSERT INTO `ld_link` VALUES ('3', '1', '1', '0', '10000', '3中国国家文物局（简称SACH）是文物和博物馆事业的监管机构，主要职能是负责拟订文物和博物馆事业发展规划、协调和指导文物保护工作、推动完善文物和博物馆公共服务体系建设、管理和指导文物和博物馆外事工作等。', '/', '三', '1560995276', 'admin/20190620/bf884fd87deb4ad0a079a351d30db0ab.png', '_blank', '');
INSERT INTO `ld_link` VALUES ('4', '1', '1', '0', '10000', '2中国国家文物局（简称SACH）是文物和博物馆事业的监管机构，主要职能是负责拟订文物和博物馆事业发展规划、协调和指导文物保护工作、推动完善文物和博物馆公共服务体系建设、管理和指导文物和博物馆外事工作等。', '/', 'fpi', '1560995321', 'admin/20190619/622cae97f571440d299501c8cdfca156.png', '_blank', '');
INSERT INTO `ld_link` VALUES ('5', '1', '1', '0', '10000', '1中国国家文物局（简称SACH）是文物和博物馆事业的监管机构，主要职能是负责拟订文物和博物馆事业发展规划、协调和指导文物保护工作、推动完善文物和博物馆公共服务体系建设、管理和指导文物和博物馆外事工作等。', '/', '国家文物局', '1560995348', 'admin/20190619/fa7a4632b9f35f2496924844fbccfdd4.png', '_blank', '');
INSERT INTO `ld_link` VALUES ('6', '1', '2', '0', '10000', '5L’Administration nationale du patrimoine culturel (SACH) est l’organisme de supervision du secteur du musée en Chine. Elle a pour vocation de concevoir les plannings de développement, piloter les actions de protection et rénovation, construire le système', '/', 'mc', '1561079452', 'admin/20190620/9c468d0f735f391785e826cd57b7c0bc.png', '_blank', '');
INSERT INTO `ld_link` VALUES ('7', '1', '2', '0', '10000', '4L’Administration nationale du patrimoine culturel (SACH) est l’organisme de supervision du secteur du musée en Chine. Elle a pour vocation de concevoir les plannings de développement, piloter les actions de protection et rénovation, construire le système', '/', '博物馆协会', '1561079636', 'admin/20190620/74faeb30cc6bf5d1ef1e76c4d7fbe8c2.png', '_blank', '');
INSERT INTO `ld_link` VALUES ('8', '1', '2', '0', '10000', '3L’Administration nationale du patrimoine culturel (SACH) est l’organisme de supervision du secteur du musée en Chine. Elle a pour vocation de concevoir les plannings de développement, piloter les actions de protection et rénovation, construire le système', '/', '图三', '1561079682', 'admin/20190620/bf884fd87deb4ad0a079a351d30db0ab.png', '_blank', '');
INSERT INTO `ld_link` VALUES ('9', '1', '2', '0', '10000', '2L’Administration nationale du patrimoine culturel (SACH) est l’organisme de supervision du secteur du musée en Chine. Elle a pour vocation de concevoir les plannings de développement, piloter les actions de protection et rénovation, construire le système', '/', 'fp1', '1561079712', 'admin/20190619/622cae97f571440d299501c8cdfca156.png', '_blank', '');
INSERT INTO `ld_link` VALUES ('10', '1', '2', '0', '10000', '1L’Administration nationale du patrimoine culturel (SACH) est l’organisme de supervision du secteur du musée en Chine. Elle a pour vocation de concevoir les plannings de développement, piloter les actions de protection et rénovation, construire le système', '/', '国家文物局', '1561079732', 'admin/20190619/fa7a4632b9f35f2496924844fbccfdd4.png', '_blank', '');

-- ----------------------------
-- Table structure for ld_link_type
-- ----------------------------
DROP TABLE IF EXISTS `ld_link_type`;
CREATE TABLE `ld_link_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(30) NOT NULL COMMENT '名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接类型';

-- ----------------------------
-- Records of ld_link_type
-- ----------------------------
INSERT INTO `ld_link_type` VALUES ('1', '中文合作伙伴');
INSERT INTO `ld_link_type` VALUES ('2', '英文合作伙伴');
INSERT INTO `ld_link_type` VALUES ('3', '法文合作伙伴');

-- ----------------------------
-- Table structure for ld_mark
-- ----------------------------
DROP TABLE IF EXISTS `ld_mark`;
CREATE TABLE `ld_mark` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `cid` int(10) unsigned DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `creatime` int(10) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned DEFAULT '10000',
  `content` text,
  `thumbnail_m` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_mark
-- ----------------------------
INSERT INTO `ld_mark` VALUES ('1', '预约确认', null, 'portal/20181203/49a2b97729f4e5dc70a0479cbb797de3.png', '1543805460', '10000', '尊敬的女士，您好！后台已经帮您处理好，帮您预约了今天晚上 6点的体验课程！希望您和宝宝准时参加', 'portal/20181203/0a527d6163d5366e2ff78983bbe4828b.png');
INSERT INTO `ld_mark` VALUES ('2', '消费提醒', null, 'portal/20181203/8823a612f93a5d34f04a81e68627f0c2.png', '1543805520', '10000', '温馨提示：您好！09月28日星期三14：09消费了71 剩余金额391，累计196积分', 'portal/20181203/6d8d105558a695b2f046a7b07a72f486.png');
INSERT INTO `ld_mark` VALUES ('3', '会员通知', null, 'portal/20181130/4dde4ad7b1dcb41557dbcb35d71baae1.png', '1543805580', '10000', '尊敬的客户你好，今天是您的生日，全体员工祝您生日快乐', 'portal/20181203/8b6e4140458d8f04cc2644c90983f38a.png');
INSERT INTO `ld_mark` VALUES ('4', '优惠促销', null, 'portal/20181203/b105f3bb5e1bb19a2c118edc1582fc6f.png', '1543805640', '10000', '十一七天乐国庆优惠大促销', 'portal/20181203/51b47107aa21d0c5d92cf96a3c32dbcd.png');

-- ----------------------------
-- Table structure for ld_merber
-- ----------------------------
DROP TABLE IF EXISTS `ld_merber`;
CREATE TABLE `ld_merber` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `cid` int(10) unsigned DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `creatime` int(10) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned DEFAULT '10000',
  `content` text,
  `thumbnail_m` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_merber
-- ----------------------------

-- ----------------------------
-- Table structure for ld_message
-- ----------------------------
DROP TABLE IF EXISTS `ld_message`;
CREATE TABLE `ld_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(200) DEFAULT NULL COMMENT '姓名',
  `birthday` int(10) unsigned DEFAULT NULL COMMENT '生日',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话',
  `year` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT '' COMMENT '信息',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_message
-- ----------------------------
INSERT INTO `ld_message` VALUES ('1', '周一', '1551974400', '15236235412', '大四', '北京大学', '1552011639', null);
INSERT INTO `ld_message` VALUES ('3', '测试1', '1553184000', '15365236523', '四年级', '北京', '1553509596', '男');

-- ----------------------------
-- Table structure for ld_mine
-- ----------------------------
DROP TABLE IF EXISTS `ld_mine`;
CREATE TABLE `ld_mine` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `cid` int(10) unsigned DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `creatime` int(10) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned DEFAULT '10000',
  `name_en` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `thumbnail_m` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_mine
-- ----------------------------
INSERT INTO `ld_mine` VALUES ('1', '重卡', null, null, '1545009300', '10000', 'Heavy Truck', null);
INSERT INTO `ld_mine` VALUES ('2', '挖机', null, null, '1545009420', '10000', 'Excavator', null);
INSERT INTO `ld_mine` VALUES ('3', '矿卡', null, null, '1545009522', '10000', 'Mine card', null);
INSERT INTO `ld_mine` VALUES ('4', '机群', null, null, '1545009538', '10000', 'Cluster', null);

-- ----------------------------
-- Table structure for ld_msg
-- ----------------------------
DROP TABLE IF EXISTS `ld_msg`;
CREATE TABLE `ld_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(200) DEFAULT NULL COMMENT '姓名',
  `birthday` int(20) unsigned NOT NULL COMMENT '生日',
  `tel` int(255) unsigned DEFAULT NULL COMMENT '电话',
  `year` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT '' COMMENT '信息',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_msg
-- ----------------------------
INSERT INTO `ld_msg` VALUES ('1', '今天天气不错', '1551974400', '4294967295', '恩恩，是的', '北京大学', '1552011639');
INSERT INTO `ld_msg` VALUES ('2', 'ceshi', '0', null, 'Who are  you', '', '1553656824');

-- ----------------------------
-- Table structure for ld_msg1
-- ----------------------------
DROP TABLE IF EXISTS `ld_msg1`;
CREATE TABLE `ld_msg1` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_favorites` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_title_en` varchar(100) NOT NULL DEFAULT '' COMMENT '英文标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) DEFAULT '' COMMENT '缩略图',
  `thumbrecomm` varchar(100) DEFAULT '' COMMENT '推荐图',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  `post_url` tinyint(255) unsigned DEFAULT '0' COMMENT '是否长期;1:长期;0:不长期',
  `post_email` varchar(255) DEFAULT NULL,
  `post_phone` varchar(255) DEFAULT NULL,
  `post_huojiang` varchar(255) DEFAULT NULL COMMENT '获奖日期',
  `post_miaoshu` text,
  `list_order` varchar(255) DEFAULT '10000',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用下载表';

-- ----------------------------
-- Records of ld_msg1
-- ----------------------------
INSERT INTO `ld_msg1` VALUES ('1', '0', '1', '1', '0', '1', '1', '0', '0', '0', '0', '0', '0', '1545709560', '0', '0', '0', '联系我们', '', '', '', '', '', '', null, null, null, '0', null, null, null, null, '10000');

-- ----------------------------
-- Table structure for ld_nav
-- ----------------------------
DROP TABLE IF EXISTS `ld_nav`;
CREATE TABLE `ld_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';

-- ----------------------------
-- Records of ld_nav
-- ----------------------------
INSERT INTO `ld_nav` VALUES ('1', '1', '首页导航', '');

-- ----------------------------
-- Table structure for ld_nav_menu
-- ----------------------------
DROP TABLE IF EXISTS `ld_nav_menu`;
CREATE TABLE `ld_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `catid` tinyint(3) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';

-- ----------------------------
-- Records of ld_nav_menu
-- ----------------------------
INSERT INTO `ld_nav_menu` VALUES ('1', '1', '0', '1', '10000', '公司概况', '31', '', '{\"action\":\"portal\\/List\\/index\",\"param\":{\"id\":31}}', '', '');
INSERT INTO `ld_nav_menu` VALUES ('2', '1', '0', '1', '10000', '校长寄语', '32', '', '{\"action\":\"portal\\/List\\/index\",\"param\":{\"id\":32}}', '', '');
INSERT INTO `ld_nav_menu` VALUES ('3', '1', '0', '1', '10000', '校园课堂', '17', '', '{\"action\":\"portal\\/List\\/index\",\"param\":{\"id\":17}}', '', '');
INSERT INTO `ld_nav_menu` VALUES ('4', '1', '0', '1', '10000', '学生作品', '18', '', '{\"action\":\"portal\\/List\\/index\",\"param\":{\"id\":18}}', '', '');
INSERT INTO `ld_nav_menu` VALUES ('5', '1', '0', '1', '10000', '教育团队', '13', '', '{\"action\":\"portal\\/List\\/index\",\"param\":{\"id\":13}}', '', '');
INSERT INTO `ld_nav_menu` VALUES ('6', '1', '0', '1', '10000', '教学成果', '14', '', '{\"action\":\"portal\\/List\\/index\",\"param\":{\"id\":14}}', '', '');
INSERT INTO `ld_nav_menu` VALUES ('7', '1', '0', '1', '10000', 'PEC校报', '35', '', '{\"action\":\"portal\\/List\\/index\",\"param\":{\"id\":35}}', '', '');
INSERT INTO `ld_nav_menu` VALUES ('8', '1', '0', '1', '10000', '预约参观 ', '6', '', '{\"action\":\"portal\\/List\\/index\",\"param\":{\"id\":6}}', '', '');

-- ----------------------------
-- Table structure for ld_option
-- ----------------------------
DROP TABLE IF EXISTS `ld_option`;
CREATE TABLE `ld_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of ld_option
-- ----------------------------
INSERT INTO `ld_option` VALUES ('1', '1', 'site_info', '{\"site_name\":\"\\u5317\\u4eac\\u6c38\\u521b\\u5408\\u5229\\u4f53\\u80b2\\u53d1\\u5c55\\u6709\\u9650\\u516c\\u53f8\",\"site_seo_title\":\"\\u5317\\u4eac\\u6c38\\u521b\\u5408\\u5229\\u4f53\\u80b2\\u53d1\\u5c55\\u6709\\u9650\\u516c\\u53f8\",\"site_seo_keywords\":\"\\u5317\\u4eac\\u6c38\\u521b\\u5408\\u5229\\u4f53\\u80b2\\u53d1\\u5c55\\u6709\\u9650\\u516c\\u53f8\",\"site_seo_description\":\"\\u5317\\u4eac\\u6c38\\u521b\\u5408\\u5229\\u4f53\\u80b2\\u53d1\\u5c55\\u6709\\u9650\\u516c\\u53f8\",\"site_icp\":\"\\u4eacICP\\u5907046464\\u53f7\",\"site_gwa\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\",\"site_login\":\"http:\\/\\/www.baidu.com\",\"site_regi\":\"http:\\/\\/www.baidu.com\"}');
INSERT INTO `ld_option` VALUES ('2', '1', 'cmf_settings', '{\"open_registration\":\"0\",\"banned_usernames\":\"\"}');
INSERT INTO `ld_option` VALUES ('3', '1', 'cdn_settings', '{\"cdn_static_root\":\"\"}');
INSERT INTO `ld_option` VALUES ('4', '1', 'admin_settings', '{\"admin_password\":\"ldadmin\",\"admin_style\":\"flatadmin\"}');
INSERT INTO `ld_option` VALUES ('5', '1', 'smtp_setting', '{\"from_name\":\"i_strive@126.com\",\"from\":\"i_strive@126.com\",\"host\":\"smtp.126.com\",\"smtp_secure\":\"\",\"port\":\"25\",\"username\":\"i_strive@126.com\",\"password\":\"20298875q\"}');
INSERT INTO `ld_option` VALUES ('6', '1', 'server_settings', '{\"k_email\":\"yongchuang@holy-sport.com\",\"k_tel\":\"010-87358007\",\"q_email\":\"\\u5317\\u4eac\\u5e02\\u4e30\\u53f0\\u533a\\u5357\\u4e09\\u73af\\u897f\\u8def\\u641c\\u5b9d\\u5546\\u52a1\\u4e2d\\u5fc32\\u53f7\\u697c2606\\u5ba4\",\"q_tel\":\"010-81508365\",\"thumbnail\":\"http:\\/\\/www.ychl.com:8080\\/upload\\/admin\\/20190716\\/f3ba018bc974bd89e3433e4fd7f21fac.jpg\",\"q_banquan\":\"Copyright \\u00a9 2019 \\u5317\\u4eac\\u6c38\\u521b\\u5408\\u5229\\u4f53\\u80b2\\u53d1\\u5c55\\u6709\\u9650\\u516c\\u53f8 All Rights Reserved\",\"k_zhichi\":\"\\u9f99\\u9f0e\\u7f51\\u7edc\",\"q_emailen\":\"Company Brief Introduction Room 2606, Building 2, Sobao Business Center, West South Third Ring Road, Fengtai District, Beijing\",\"q_banquanen\":\"Copyright Beijing Yongchuang Heli Sports Development Co., Ltd. All Rights Reserved\",\"q_weibo\":\"http:\\/\\/www.baidu.com\",\"task_url\":\"admin\\/20190325\\/5862f15e2b1e038edefb59d680036be7.pdf\",\"task_name\":\"ceshi.pdf\"}');
INSERT INTO `ld_option` VALUES ('7', '1', 'sms_setting', '{\"sms_appid\":\"sy0685\",\"sms_secret\":\"sy0685123456\",\"wx_appid\":\"\",\"wx_secret\":\"\",\"sms_sign\":\"\\u9a8c\\u8bc1\\u7801\"}');
INSERT INTO `ld_option` VALUES ('8', '1', 'mark_setting', '{\"is_mark\":\"0\",\"width\":\"150\",\"height\":\"150\",\"mark\":\"mark.png\",\"transparency\":\"100\",\"location\":\"5\"}');
INSERT INTO `ld_option` VALUES ('9', '1', 'upload_setting', '{\"max_files\":\"20\",\"chunk_size\":\"512\",\"file_types\":{\"image\":{\"upload_max_filesize\":\"10240\",\"extensions\":\"jpg,jpeg,png,gif,bmp4,pdf\"},\"video\":{\"upload_max_filesize\":\"10240\",\"extensions\":\"mp4,avi,wmv,rm,rmvb,mkv\"},\"audio\":{\"upload_max_filesize\":\"10240\",\"extensions\":\"mp3,wma,wav\"},\"file\":{\"upload_max_filesize\":\"102400\",\"extensions\":\"txt,pdf,doc,docx,xls,xlsx,ppt,pptx,zip,rar,mp4\"}}}');

-- ----------------------------
-- Table structure for ld_picture
-- ----------------------------
DROP TABLE IF EXISTS `ld_picture`;
CREATE TABLE `ld_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `cid` int(10) unsigned DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `creatime` int(10) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned DEFAULT '10000',
  `content` text,
  `thumbnail_m` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_picture
-- ----------------------------
INSERT INTO `ld_picture` VALUES ('1', '多年行业短信经验', null, 'portal/20181130/8521162f5662faa6223216612f739fdd.png', '1543537980', '10006', '', 'portal/20181130/b52acb45e66d2e0d6f8649418fa3e076.png');

-- ----------------------------
-- Table structure for ld_plugin
-- ----------------------------
DROP TABLE IF EXISTS `ld_plugin`;
CREATE TABLE `ld_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

-- ----------------------------
-- Records of ld_plugin
-- ----------------------------
INSERT INTO `ld_plugin` VALUES ('1', '1', '0', '1', '0', 'Wxlogin', '微信登录', '', '', 'Tangchao', '', '1.2', '微信登录', '{\"appid\":\"\",\"appkey\":\"\"}');

-- ----------------------------
-- Table structure for ld_portal_category
-- ----------------------------
DROP TABLE IF EXISTS `ld_portal_category`;
CREATE TABLE `ld_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` longtext NOT NULL COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  `name_en` varchar(255) DEFAULT NULL COMMENT '英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 数据中心分类表';

-- ----------------------------
-- Records of ld_portal_category
-- ----------------------------
INSERT INTO `ld_portal_category` VALUES ('1', '0', '0', '1', '0', '10000', '关于我们', '', '0-1', '', '', '', 'list_about', 'article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('2', '0', '0', '1', '0', '10000', '新闻中心', '', '0-2', '', '', '', 'list', 'article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('3', '0', '0', '1', '0', '10000', '产品展示', '为您提供优质的体育器材。我们永远将创新放在第一位，将大量精力用来研发新产品', '0-3', '', '', '', 'list', 'article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('4', '0', '0', '1', '0', '10000', '服务与支持', '', '0-4', '', '', '', 'list_museum', 'article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('5', '0', '0', '1', '0', '10000', '合作伙伴', '', '0-5', '', '', '', 'list_hezuo', 'article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('6', '0', '0', '1', '0', '10000', '联系我们', '', '0-6', '', '', '', 'list_contact', 'article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('7', '0', '0', '1', '0', '10000', '加入我们', '', '0-7', '', '', '', 'list_join', 'article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('8', '1', '0', '1', '0', '10000', '公司简介', '北京永创合利体育发展有限公司于2016年2月成立于北京，是一家致力于体育信息系统信息化与体育产业活动发展的企业，整个团队已组织并圆满完成了各项国际国内比赛的赛事服务，发展至今已能为羽毛球、乒乓球、击剑、滑雪、跆拳道、铁人三项、马拉松、赛艇等其它多项体育项目提供专业的电子计时记分、成绩处理和录像回放等信息化解决方案。\r\n永创合利本着打造国内顶尖服务团队的原则，自成立至今已成功参与了多次世界及洲际大赛的赛事服务工作。通过不懈地努力，我们自主研发的系统也已得到国际组织的官方认可，已经和国内部分体育局，中国各单项协会，乃至世界部分体育单项联合会等机构有密切的业务往来。', '0-1-8', '', '', '', 'list_about', 'article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('9', '1', '0', '1', '0', '10000', '公司理念', '专业是根本，创新是途径”，我们一直致力于使用专业的人才、专业的设备以及专业的运作模式，永创合利意味着我们永远将创新放在第一位，时刻将大量精力用来研发新产品，拓展新领域及改进已经获得国际组织认证的产品。', '0-1-9', '', '', '', 'list', 'article', '{\"thumbnail\":\"portal\\/20190717\\/11739f48b7704bf6199ede4f4db2973c.jpg\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('10', '1', '0', '1', '0', '10000', '公司业绩', '北京永创合利体育发展有限公司于2016年2月成立于北京，是一家致力于体育信息系统信息化与体育产业活动发展的企业，整个团队已组织并圆满完成了各项国际国内比赛的赛事服务，发展至今已能为羽毛球、乒乓球、击剑、滑雪、跆拳道、铁人三项、马拉松、赛艇等其它多项体育项目提供专业的电子计时记分、成绩处理和录像回放等信息化解决方案。', '0-1-10', '', '', '', 'list', 'article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('11', '2', '0', '1', '0', '10000', '新闻资讯', '', '0-2-11', '', '', '', 'list', 'article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('12', '2', '0', '1', '0', '10000', '最新活动', '', '0-2-12', '', '', '', 'list', 'article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('13', '3', '0', '1', '0', '10000', '高压氧太空舱 Phoenix O2', '', '0-3-13', '', '', '', 'list_product', 'article_sale', '{\"thumbnail\":\"portal\\/20190717\\/3760fd8bfb5683d7369dbaca446ec5a5.jpg\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('14', '3', '0', '1', '0', '10000', 'Polar Team Pro运动装备', '', '0-3-14', '', '', '', 'list_product', 'article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('15', '3', '0', '1', '0', '10000', 'Leon paul击剑器材', '', '0-3-15', '', '', '', 'list_product', 'article_sale', '{\"thumbnail\":\"portal\\/20190717\\/69e4a67c0337ea483414f04f1885633f.jpg\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('16', '3', '0', '1', '0', '10000', 'ALGE滑雪计时系统', '', '0-3-16', '', '', '', 'list_product', 'article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('17', '3', '0', '1', '0', '10000', 'BIO-SWIMBENCH游泳拉力器', '', '0-3-17', '', '', '', 'list_product', 'article_sale', '{\"thumbnail\":\"portal\\/20190717\\/cbd7f7b6cb8af344fab5cb40fdf9981c.jpg\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('18', '3', '0', '1', '0', '10000', 'Polar Team Pro心率表V800', '', '0-3-18', '', '', '', 'list_product', 'article_sale', '{\"thumbnail\":\"portal\\/20190717\\/ded901db5a790e69758101c13a3b59e2.jpg\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('19', '3', '0', '1', '0', '10000', '迈高E-100型高原低氧发生器', '', '0-3-19', '', '', '', 'list_product', 'article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('20', '3', '0', '1', '0', '10000', 'Polar Team Pro心率表A300', '', '0-3-20', '', '', '', 'list_product', 'article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('21', '3', '0', '1', '0', '10000', 'Pronto-7血红蛋白抽样检查', '', '0-3-21', '', '', '', 'list_product', 'article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_category` VALUES ('22', '4', '0', '1', '0', '10000', '计时记分系统解决方案', '为多项体育项目提供专业的电子计时记分、成绩处理和录像回放等信息化解决方案。', '0-4-22', '', '', '', 'list_museum', 'article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', 'xe68b');
INSERT INTO `ld_portal_category` VALUES ('23', '4', '0', '1', '0', '10000', '成绩处理系统解决方案', '为多项体育项目提供专业的电子计时记分、成绩处理和录像回放等信息化解决方案。', '0-4-23', '', '', '', 'list_museum', 'article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', 'xe607');
INSERT INTO `ld_portal_category` VALUES ('24', '4', '0', '1', '0', '10000', '仲裁录像系统解决', '为多项体育项目提供专业的电子计时记分、成绩处理和录像回放等信息化解决方案。', '0-4-24', '', '', '', 'list_museum', 'article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', 'xe672');

-- ----------------------------
-- Table structure for ld_portal_categoryen
-- ----------------------------
DROP TABLE IF EXISTS `ld_portal_categoryen`;
CREATE TABLE `ld_portal_categoryen` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` longtext NOT NULL COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  `name_en` varchar(255) DEFAULT NULL COMMENT '英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 数据中心分类表';

-- ----------------------------
-- Records of ld_portal_categoryen
-- ----------------------------
INSERT INTO `ld_portal_categoryen` VALUES ('1', '0', '0', '1', '0', '10000', 'About  Us', '', '0-1', '', '', '', 'eng/list', 'eng/article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('2', '0', '0', '1', '0', '10000', 'News  center', '', '0-2', '', '', '', 'eng/list', 'eng/article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('3', '0', '0', '1', '0', '10000', 'Product show', '', '0-3', '', '', '', 'eng/list', 'eng/article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('4', '0', '0', '1', '0', '10000', 'Service and support', '', '0-4', '', '', '', 'eng/list', 'eng/article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('5', '0', '0', '1', '0', '10000', 'Partners', '', '0-5', '', '', '', 'eng/list_hezuo', 'eng/article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('6', '0', '0', '1', '0', '10000', 'Contact us', '', '0-6', '', '', '', 'eng/list_contact', 'eng/article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('7', '0', '0', '1', '0', '10000', 'Join us', '', '0-7', '', '', '', 'eng/list_join', 'eng/article', '{\"thumbnail\":\"portal\\/20190717\\/5dd1f0d93cd65b266a73957e5634fafc.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('8', '1', '0', '1', '0', '10000', 'Company profile', '北京永创合利体育发展有限公司于2016年2月成立于北京，是一家致力于体育信息系统信息化与体育产业活动发展的企业，整个团队已组织并圆满完成了各项国际国内比赛的赛事服务，发展至今已能为羽毛球、乒乓球、击剑、滑雪、跆拳道、铁人三项、马拉松、赛艇等其它多项体育项目提供专业的电子计时记分、成绩处理和录像回放等信息化解决方案。\r\n永创合利本着打造国内顶尖服务团队的原则，自成立至今已成功参与了多次世界及洲际大赛的赛事服务工作。通过不懈地努力，我们自主研发的系统也已得到国际组织的官方认可，已经和国内部分体育局，中国各单项协会，乃至世界部分体育单项联合会等机构有密切的业务往来。', '0-1-8', '', '', '', 'eng/list_about', 'eng/article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('9', '1', '0', '1', '0', '10000', 'Philosophy', '专业是根本，创新是途径”，我们一直致力于使用专业的人才、专业的设备以及专业的运作模式，永创合利意味着我们永远将创新放在第一位，时刻将大量精力用来研发新产品，拓展新领域及改进已经获得国际组织认证的产品。', '0-1-9', '', '', '', 'eng/list_about', 'eng/article', '{\"thumbnail\":\"portal\\/20190717\\/11739f48b7704bf6199ede4f4db2973c.jpg\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('10', '1', '0', '1', '0', '10000', 'Achievements', '', '0-1-10', '', '', '', 'eng/list_about', 'eng/article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('11', '2', '0', '1', '0', '10000', 'News', '', '0-2-11', '', '', '', 'eng/list', 'eng/article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('12', '2', '0', '1', '0', '10000', 'Latest activities', '', '0-2-12', '', '', '', 'eng/list', 'eng/article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('13', '3', '0', '1', '0', '10000', 'Phoenix O 2 in hyperbaric oxygen capsule', '', '0-3-13', '', '', '', 'eng/list_product', 'eng/article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('14', '3', '0', '1', '0', '10000', 'Polar Team Pro Sports equipment', '', '0-3-14', '', '', '', 'eng/list_product', 'eng/article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('15', '3', '0', '1', '0', '10000', 'Leon paul fencing apparatus', '', '0-3-15', '', '', '', 'eng/list', 'eng/article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('16', '3', '0', '1', '0', '10000', 'ALGE Skiing Timing System', '', '0-3-16', '', '', '', 'eng/list_product', 'eng/article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('17', '3', '0', '1', '0', '10000', 'BIO-SWIMBENCH Swimming tensioner', '', '0-3-17', '', '', '', 'eng/list_product', 'eng/article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('18', '3', '0', '1', '0', '10000', 'Polar Team Pro Heart Rate Meter V800', '', '0-3-18', '', '', '', 'eng/list_product', 'eng/article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('19', '3', '0', '1', '0', '10000', 'Maigao E-100 Plateau Hypoxia Generator', '', '0-3-19', '', '', '', 'eng/list_product', 'eng/article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('20', '3', '0', '1', '0', '10000', 'Polar Team Pro Heart Rate Meter A300', '', '0-3-20', '', '', '', 'eng/list', 'eng/article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('21', '3', '0', '1', '0', '10000', 'Sampling of Pronto-7 Hemoglobin', '', '0-3-21', '', '', '', 'eng/list_product', 'eng/article_sale', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryen` VALUES ('22', '4', '0', '1', '0', '10000', 'The Solution of Timing Scoring System', '', '0-4-22', '', '', '', 'eng/list_museum', 'eng/article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', 'xe68b');
INSERT INTO `ld_portal_categoryen` VALUES ('23', '4', '0', '1', '0', '10000', 'The Solution of Achievement Processing System', '', '0-4-23', '', '', '', 'eng/list_museum', 'eng/article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', 'xe607');
INSERT INTO `ld_portal_categoryen` VALUES ('24', '4', '0', '1', '0', '10000', 'Arbitration Video System Solution', '', '0-4-24', '', '', '', 'eng/list_museum', 'eng/article', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', 'xe672');

-- ----------------------------
-- Table structure for ld_portal_categoryen_post
-- ----------------------------
DROP TABLE IF EXISTS `ld_portal_categoryen_post`;
CREATE TABLE `ld_portal_categoryen_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of ld_portal_categoryen_post
-- ----------------------------
INSERT INTO `ld_portal_categoryen_post` VALUES ('1', '5', '8', '10000', '1');
INSERT INTO `ld_portal_categoryen_post` VALUES ('2', '6', '8', '10000', '1');
INSERT INTO `ld_portal_categoryen_post` VALUES ('3', '7', '8', '10000', '1');

-- ----------------------------
-- Table structure for ld_portal_categoryfa
-- ----------------------------
DROP TABLE IF EXISTS `ld_portal_categoryfa`;
CREATE TABLE `ld_portal_categoryfa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  `name_en` varchar(255) DEFAULT NULL COMMENT '英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 数据中心分类表';

-- ----------------------------
-- Records of ld_portal_categoryfa
-- ----------------------------
INSERT INTO `ld_portal_categoryfa` VALUES ('1', '0', '0', '1', '0', '10000', 'NOS ACTIONS TRANSVERSALES', 'Nous proposons aux musées des services dans :', '0-1', '', '', '', 'fa/list', '', '{\"thumbnail\":\"portal\\/20190619\\/fcac691ed7b7c9a0f7aa3c83139ac30b.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryfa` VALUES ('2', '0', '0', '1', '0', '10000', 'EXPORT', 'Fortement soutenus par les autorités françaises, nous organisons des hyper-expositions de haute qualité à l’étranger pour les musées chinois tout en intégrant les nouvelles technologies, les équipes d’élites et des fonds d’investissements. Notre objectif ', '0-2', '', '', '', 'fa/list_museum', '', '{\"thumbnail\":\"portal\\/20190619\\/fdccb59035c777bc81e7081818657423.png\",\"thumbnail_m\":\"\"}', 'Exposition');
INSERT INTO `ld_portal_categoryfa` VALUES ('3', '0', '0', '1', '0', '10000', 'IMPORT', 'Nous introduisons, à travers nos forts réseaux dans les musées en France et en Europe, notamment dans les incubateurs et accélérateurs, les meilleurs technologies et services pour les musées et le marché culturel en Chine.', '0-3', '', '', '', 'fa/list_museum', '', '{\"thumbnail\":\"portal\\/20190619\\/01949f2a8d7a541ab30221704f861e19.png\",\"thumbnail_m\":\"\"}', 'L’idée · La technologie · Équipe');
INSERT INTO `ld_portal_categoryfa` VALUES ('4', '0', '0', '1', '0', '10000', 'PROGRAMME SPÉCIAL', '', '0-4', '', '', '', 'fa/list', '', '{\"thumbnail\":\"portal\\/20190619\\/e4d18eb1ef03834408fc6ed49409c1c5.png\",\"thumbnail_m\":\"\"}', 'À VENIR...');
INSERT INTO `ld_portal_categoryfa` VALUES ('5', '0', '0', '1', '0', '10000', 'Musée des nouvelles', '', '0-5', '', '', '', '', '', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryfa` VALUES ('6', '0', '0', '1', '0', '10000', 'NOS SYSTÈMES', 'Nous sommes une équipe de jeunes, passionnés par le musée et le secteur culturel, accrochés aux nouveaux dispositifs technologique, qui se motive de réaliser des projets innovants et de haute qualité dans la coopération culturelle entre la France et la Ch', '0-6', '', '', '', '', '', '{\"thumbnail\":\"portal\\/20190619\\/65bae78170e47d5dc8d310262f397622.png\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryfa` VALUES ('7', '1', '0', '1', '0', '10000', 'la formation professionnelle', '', '0-1-7', '', '', '', 'fa/list', '', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryfa` VALUES ('8', '1', '0', '1', '0', '10000', 'l’éducation publique', '', '0-1-8', '', '', '', 'fa/list', '', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryfa` VALUES ('9', '1', '0', '1', '0', '10000', 'le design artistique', '', '0-1-9', '', '', '', 'fa/list', '', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryfa` VALUES ('10', '1', '0', '1', '0', '10000', 'le conseil stratégique', '', '0-1-10', '', '', '', 'fa/list', '', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryfa` VALUES ('11', '1', '0', '1', '0', '10000', 'les échanges sectoriels', '', '0-1-11', '', '', '', 'fa/list', '', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');
INSERT INTO `ld_portal_categoryfa` VALUES ('12', '1', '0', '1', '0', '10000', 'le soutiens en ressources', '', '0-1-12', '', '', '', 'fa/list', '', '{\"thumbnail\":\"\",\"thumbnail_m\":\"\"}', '');

-- ----------------------------
-- Table structure for ld_portal_categoryfa_post
-- ----------------------------
DROP TABLE IF EXISTS `ld_portal_categoryfa_post`;
CREATE TABLE `ld_portal_categoryfa_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of ld_portal_categoryfa_post
-- ----------------------------
INSERT INTO `ld_portal_categoryfa_post` VALUES ('1', '1', '5', '10000', '1');

-- ----------------------------
-- Table structure for ld_portal_category_post
-- ----------------------------
DROP TABLE IF EXISTS `ld_portal_category_post`;
CREATE TABLE `ld_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of ld_portal_category_post
-- ----------------------------
INSERT INTO `ld_portal_category_post` VALUES ('1', '1', '5', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('3', '3', '13', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('4', '4', '20', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('5', '5', '25', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('7', '7', '11', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('8', '8', '8', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('9', '9', '8', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('10', '10', '8', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('11', '2', '12', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('12', '6', '13', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('13', '11', '22', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('14', '12', '22', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('15', '13', '22', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('16', '14', '8', '10000', '1');
INSERT INTO `ld_portal_category_post` VALUES ('17', '15', '11', '10000', '1');

-- ----------------------------
-- Table structure for ld_portal_post
-- ----------------------------
DROP TABLE IF EXISTS `ld_portal_post`;
CREATE TABLE `ld_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_favorites` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_title_en` varchar(100) NOT NULL DEFAULT '' COMMENT '英文标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) DEFAULT '' COMMENT '缩略图',
  `thumbrecomm` varchar(100) DEFAULT '' COMMENT '推荐图',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  `post_url` varchar(255) DEFAULT '' COMMENT '学历要求',
  `post_email` varchar(255) DEFAULT NULL COMMENT '薪资要求',
  `post_phone` varchar(255) DEFAULT NULL COMMENT '工作地点',
  `post_huojiang` varchar(255) DEFAULT NULL COMMENT '获奖日期',
  `post_miaoshu` text,
  `list_order` int(255) unsigned DEFAULT '10000',
  `post_year` varchar(255) DEFAULT NULL COMMENT '年龄要求',
  `post_sex` varchar(255) DEFAULT NULL COMMENT '性别要求',
  `post_china` varchar(255) DEFAULT NULL COMMENT '语言要求',
  `post_case` longtext COMMENT '课程详情',
  `post_xing` longtext COMMENT '行程安排',
  `post_time` longtext COMMENT '开营时间',
  `post_pay` longtext COMMENT '付款方式',
  `post_apply` longtext COMMENT '家长评价',
  `post_baoming` longtext COMMENT '报名须知',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

-- ----------------------------
-- Records of ld_portal_post
-- ----------------------------
INSERT INTO `ld_portal_post` VALUES ('1', '0', '1', '1', '2', '1', '1', '0', '0', '9', '0', '0', '0', '1561425890', '1563359265', '1561425840', '0', '合作伙伴', '', '', '', '', 'portal/20190625/92b460a85e0b15ccc92073802ccc937b.jpg', '', null, null, '{\"thumbnail\":\"\",\"thumbrecomm\":\"\",\"template\":\"\",\"photos\":[{\"url\":\"portal\\/20190717\\/5055784e3aa5a84c01b643e644b8c907.jpg\",\"name\":\"hezuo1.jpg\"},{\"url\":\"portal\\/20190717\\/99432c28af11a4b7f5d68d05f9893ad3.jpg\",\"name\":\"hezuo2.jpg\"},{\"url\":\"portal\\/20190717\\/920beb610aac84786fa50747bbd7f034.jpg\",\"name\":\"hezuo3.jpg\"},{\"url\":\"portal\\/20190717\\/7748806dfeaeb0288cfe3245dd25f900.jpg\",\"name\":\"hezuo4.jpg\"},{\"url\":\"portal\\/20190717\\/3de65cf0a8059c03fc6a7eee3eb6358d.jpg\",\"name\":\"hezuo5.jpg\"},{\"url\":\"portal\\/20190717\\/2ad9a3fdbbb559678fb25aa367cc4cc5.jpg\",\"name\":\"hezuo6.jpg\"},{\"url\":\"portal\\/20190717\\/298569d2627ecf69f30590f72361c7c7.jpg\",\"name\":\"hezuo7.jpg\"}]}', '', '', '', null, null, '10000', '', null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('2', '0', '1', '1', '2', '1', '1', '0', '0', '4', '0', '0', '0', '1561426136', '1563358555', '1561426080', '0', '永创合利顺利完成哥伦比亚 2018 中美洲—加勒比海运动会羽毛球赛', '', '', '永创合利顺利完成2018年7月28日-8月2日在哥伦比亚为2018 中美洲—加勒比海运动会羽毛球赛提供计时记分、实时成绩、大屏展示、成绩处理服务等服务。永创合利顺利完成2018年7月28日-8月2日在哥伦比亚为2018 中美洲—加勒比海运动会羽毛球赛提供计时记分、实时成绩、大屏展示、成绩处理服务等服务。', '', 'portal/20190717/81473ad959e6d4872551edb7742ae1ae.png', '', '', null, '{\"thumbnail\":\"portal\\/20190717\\/81473ad959e6d4872551edb7742ae1ae.png\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', '', '', null, null, '10000', '', null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('3', '0', '1', '1', '2', '1', '1', '0', '0', '20', '0', '0', '0', '1561427044', '1563414968', '1563345900', '0', 'FIE推荐重剑', '', '', '\n1、击剑介绍\n击剑比赛时运动员穿戴专业击剑服装和护具，在击剑场地上运动员单手持剑互相刺击，先击中对方身体有效部位的一方得分。击剑有多种进攻技术和防守技术，运动员应在规则许可的范围内运用各种战术取胜。比赛项目男子有花剑、重剑、佩剑，女子花剑、重剑、佩剑。均有个人赛和团体赛。团体赛为每队3人的队际相遇赛。个人赛先采用分组循环赛，然后根据组内成绩击剑成绩处理系统指数排位，进行单败淘汰赛。循环组赛为4分', '', 'portal/20190717/3508553212529e84882f6940d484f0cd.jpg', '', '\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 15px; line-height: 28px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt;1、击剑介绍&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 15px; line-height: 28px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt;击剑比赛时运动员穿戴专业击剑服装和护具，在击剑场地上运动员单手持剑互相刺击，先击中对方身体有效部位的一方得分。击剑有多种进攻技术和防守技术，运动员应在规则许可的范围内运用各种战术取胜。比赛项目男子有花剑、重剑、佩剑，女子花剑、重剑、佩剑。均有个人赛和团体赛。团体赛为每队3人的队际相遇赛。个人赛先采用分组循环赛，然后根据组内成绩击剑成绩处理系统指数排位，进行单败淘汰赛。循环组赛为4分钟内先击中5剑者为胜。单败淘汰赛为每局3分钟，击中剑数累计，先击中15剑者获胜，最多打3局，每局之间休息1分钟。团体赛则根据个人赛成绩，直接进行单败淘汰赛。&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 15px; line-height: 28px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt; &lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 15px; line-height: 28px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt;2、 击剑比赛规则&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 15px; line-height: 28px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt;根据不同的项目采取劈刺或刺击的方式，击中对手有效部位得分。花剑和重剑都是完全的刺击方式，佩剑为劈刺方式。对于佩剑来说，在比赛中劈中对手得分多。击中对手由金属衣裹覆的有效部位后，电子裁判器便可以接收到信息，一侧显示为绿色信号，一侧显示为红色信号。当击中无效部位时，两侧信号均为白色。当剑的不绝缘部分接触到导电背心的时候，裁判器显示黄色信号。击剑比赛的判罚分为：黄牌警告、红牌处罚一剑、黑牌罚出比赛三种。&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 15px; line-height: 28px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 15px; line-height: 28px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt;3、击剑记分系统：根据击剑比赛规则，当运动员刺中对手时，会接通电路将信息传输给裁判器，高速单片机主控模块即可收到从裁判器采集到的信息。裁判员根据比赛交锋情况,判断得分方,技术人员会根据裁判员的判罚手动遥控裁判器使比分变化。同时剑道显示牌控制器将裁判器的信息读出，传输控制裁判灯驱动模块，使得裁判灯亮起，将运动员的姓名、国籍、国旗、比分等信息传递给等离子屏（单面两块，双面四块），最终在显示牌上显示。因为击剑比赛的特殊性，观众不容易判断运动员得分情况，而本系统可以及时为观众提供比赛信息，增加比赛的可观赏性。&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 15px; line-height: 28px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"portal\\/20190717\\/3508553212529e84882f6940d484f0cd.jpg\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', '', '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('4', '0', '1', '1', '2', '1', '1', '0', '0', '0', '0', '0', '0', '1561430265', '1561430450', '1561430040', '0', '关于虚视界 | 创意无处不在', '', '', '北京虚视界科技有限公司于 2016 年成立，注册资金 500 万元。简称虚视界，网址 （www.5vrvision.com），作为一家以视觉为主导的 VR内容提供商，不断升级创作品质，用作品说话，业务领域包含 VR 艺术与VR 生活，累计大量 VR 样板间，VR 景观、VR 家居馆、概念体验店 VR、商业应用类及 VR 汽车展馆、VR 游戏开发、VR 军工类作品。同时，在房产销售 APP 系统、', '', '', '', '\n&lt;p&gt;北京虚视界科技有限公司于 2016 年成立，注册资金 500 万元。简称虚视界，网址 （www.5vrvision.com），作为一家以视觉为主导的 VR内容提供商，不断升级创作品质，用作品说话，业务领域包含 VR 艺术与VR 生活，累计大量 VR 样板间，VR 景观、VR 家居馆、概念体验店 VR、商业应用类及 VR 汽车展馆、VR 游戏开发、VR 军工类作品。同时，在房产销售 APP 系统、三维影视动画，以及软件类开发，展览展示项目等领域保持业内一流水准，不断超越。&lt;/p&gt;\n&lt;p&gt; &lt;/p&gt;\n&lt;p&gt;目前公司正与杭州、上海、长沙、广州、西安等地洽谈发展城市合伙人战略，根据自身在当地市场资源优势，利用北京品牌影响力与技术优势发展VR 事业，服务于大市场！ 虚视界团队均在行业摸爬滚打 5 年以上，经验丰富，且团结和谐有爱，也是产品立于一线品牌质量的强有力保证。&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 14px; line-height: 25px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 14px; line-height: 25px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/themes/index/public/assets/images/default/jieshao.jpg&quot; style=&quot;margin: 0px; padding: 0px; box-sizing: border-box; border: none; display: inline-block; max-width: 100%; max-height: 100%;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', null, '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('5', '0', '1', '1', '2', '1', '1', '0', '0', '0', '0', '0', '0', '1561431445', '1561446881', '1561430640', '0', '服务客户', '', '', '', '', '', '', null, null, '{\"thumbnail\":\"\",\"thumbrecomm\":\"\",\"template\":\"\",\"photos\":[{\"url\":\"portal\\/20190625\\/c78d69fc4c04e201a717b2493534e39d.jpg\",\"name\":\"kehu01.jpg\"},{\"url\":\"portal\\/20190625\\/66ed8800fdc8d45d238cad860302985f.jpg\",\"name\":\"kehu02.jpg\"},{\"url\":\"portal\\/20190625\\/785419abaca1af50435c8b62e9d58ddd.jpg\",\"name\":\"kehu03.jpg\"},{\"url\":\"portal\\/20190625\\/9cc3c552b129ce2476152458cf68cc70.jpg\",\"name\":\"kehu04.jpg\"}]}', '', null, '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('6', '0', '1', '1', '2', '1', '1', '0', '0', '7', '0', '0', '0', '1561442189', '1563345902', '1561441980', '0', 'FIE可拆护舌重剑护面', '', '', '', '', 'portal/20190717/44c3a295a78c38e52c82865ba1108bb1.jpg', '', '', null, '{\"thumbnail\":\"portal\\/20190717\\/44c3a295a78c38e52c82865ba1108bb1.jpg\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', null, '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('7', '0', '1', '1', '2', '1', '1', '0', '0', '10', '0', '0', '0', '1561448542', '1563333647', '1561448520', '0', '永创合利顺利完成哥伦比亚 2019 中美洲—加勒比海运动会羽毛球赛', '', '', '永创合利顺利完成2018年7月28日-8月2日在哥伦比亚为2018 中美洲—加勒比海运动会羽毛球赛提供计时记分、实时成绩、大屏展示、成绩处理服务等服务。永创合利顺利完成2018年7月28日-8月2日在哥伦比亚为2018 中美洲—加勒比海运动会羽毛球赛提供计时记分、实时成绩、大屏展示、成绩处理服务等服务。', '', 'portal/20190717/a3875e1fa93bf669d0c66bd952667b27.png', '', null, null, '{\"thumbnail\":\"portal\\/20190717\\/a3875e1fa93bf669d0c66bd952667b27.png\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', '', '', null, null, '10000', '', null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('8', '0', '1', '1', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1563326467', '1563328234', '1563327000', '0', '左一', '', '', '“专业是根本，创新是途径”，我们一直致力于使用专业的人才、专业的设备以及专业的运作模式，永创合利意味着我们永远将创新放在第一位，时刻将大量精力用来研发新产品，拓展新领域及改进已经获得国际组织认证的产品。', '', 'portal/20190717/5ad0dc457a884cc5a482bae75cc97050.png', '', '&lt;p&gt;“专业是根本，创新是途径”，我们一直致力于使用专业的人才、专业的设备以及专业的运作模式，永创合利意味着我们永远将创新放在第一位，时刻将大量精力用来研发新产品，拓展新领域及改进已经获得国际组织认证的产品。&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20190717\\/5ad0dc457a884cc5a482bae75cc97050.png\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', null, '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('9', '0', '1', '1', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1563326553', '1563328283', '1563326580', '0', '中间', '', '', '公司近年来开始从事体育产业资源与IP资源的整合、开发，推出体育场馆智能化，用以达到体育场馆无线网络全覆盖、移动APP完成场馆查询、预定、付费、运动康复、在线课程、VR（虚拟现实）、AR（增强现实）、体育赛事等功能服务，开拓体育产业“O2O”新模式覆盖大中城市，开展线上线下活动，为体育专业提供完整的一站式服务。', '', 'portal/20190717/7406132405fa8fcbf693af4a064a2aeb.png', '', '&lt;p&gt;公司近年来开始从事体育产业资源与IP资源的整合、开发，推出体育场馆智能化，用以达到体育场馆无线网络全覆盖、移动APP完成场馆查询、预定、付费、运动康复、在线课程、VR（虚拟现实）、AR（增强现实）、体育赛事等功能服务，开拓体育产业“O2O”新模式覆盖大中城市，开展线上线下活动，为体育专业提供完整的一站式服务。&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20190717\\/7406132405fa8fcbf693af4a064a2aeb.png\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', null, '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('10', '0', '1', '1', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1563326608', '1563326608', '1563326557', '0', '右一', '', '', '永创合利拥有体育项目专业器材及设备的销售经验，与国家体育总局及国内体育协会有密切的合作关系，具备举办各类体育赛事经验与强大的市场开发能力，技术全面的售后保障团队。', '', 'portal/20190717/8158a685f92e41c6dfa8d1190ebcfbb1.jpg', '', '&lt;p&gt;永创合利拥有体育项目专业器材及设备的销售经验，与国家体育总局及国内体育协会有密切的合作关系，具备举办各类体育赛事经验与强大的市场开发能力，技术全面的售后保障团队。&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20190717\\/8158a685f92e41c6dfa8d1190ebcfbb1.jpg\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', null, '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('11', '0', '1', '1', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1563354591', '1563354591', '1563354513', '0', '击剑', '', '', '击剑比赛时运动员穿戴专业击剑服装和护具，在击剑场地上运动员单手持剑互相刺击，先击中对方身体有效部', '', 'portal/20190717/4d270f6a37fcc8e7b690c86d04ddc790.jpg', '', null, null, '{\"thumbnail\":\"portal\\/20190717\\/4d270f6a37fcc8e7b690c86d04ddc790.jpg\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', '', '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('12', '0', '1', '1', '3', '1', '1', '0', '0', '1', '0', '0', '0', '1563354648', '1563354705', '1563354600', '0', '龙舟', '', '', '3月19日，由海尔与山东省淄博市周村区政府等共同打造的海尔家居产业园开工仪式正式在周村启动', '', 'portal/20190717/9fe78164dd3c7ff995c87cbcb21a25ad.jpg', '', null, null, '{\"thumbnail\":\"portal\\/20190717\\/9fe78164dd3c7ff995c87cbcb21a25ad.jpg\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', '', '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('13', '0', '1', '1', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1563354681', '1563354681', '1563354652', '0', '啦啦操、技巧、排舞', '', '', '啦啦操来源于早期部落社会的仪式。为激励外出打仗或打猎的战士们，他们通常会举行一种仪式，仪式中有族', '', 'portal/20190717/cabf96244a0c52200269acb59e98819b.jpg', '', null, null, '{\"thumbnail\":\"portal\\/20190717\\/cabf96244a0c52200269acb59e98819b.jpg\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', '', '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('14', '0', '1', '1', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1563357181', '1563357358', '1563326400', '0', '首页公司简介', '', '', '2016年2月成立于北京，是一家致力于体育信息系统信息化与体育产业活动发展的企业，整个团队已组织并圆满完成了各项国际国内比赛的赛事服务，发展至今已能为羽毛球、乒乓球、击剑、滑雪、跆拳道、铁人三项、马拉松、赛艇等其它多项体育项目提供专业的电子计时记分、成绩处理和录像回放等信息化解决方案。\r\n \r\n永创合利本着打造国内顶尖服务团队的原则，自成立至今已成功参与了多次世界及洲际大赛的赛事服务工作。通过不懈地', '', 'portal/20190717/061676f14852d648f9e15e0b524a5e89.png', '', '\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 15px; line-height: 24px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(50, 118, 187);&quot;&gt;2016年2月成立于北京&lt;/span&gt;，是一家致力于体育信息系统信息化与体育产业活动发展的企业，整个团队已组织并圆满完成了各项国际国内比赛的赛事服务，发展至今已能为羽毛球、乒乓球、击剑、滑雪、跆拳道、铁人三项、马拉松、赛艇等其它多项体育项目提供专业的电子计时记分、成绩处理和录像回放等信息化解决方案。&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 15px; line-height: 24px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt; &lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; box-sizing: border-box; font-family: syht; font-size: 15px; line-height: 24px; color: rgb(112, 112, 112); white-space: normal;&quot;&gt;永创合利本着打造国内顶尖服务团队的原则，自成立至今已成功参与了多次世界及洲际大赛的赛事服务工作。通过不懈地努力，我们自主研发的系统也已得到国际组织的官方认可，已经和国内部分体育局，中国各单项协会，乃至世界部分体育单项联合会等机构有密切的业务往来。&lt;/p&gt;\n', null, '{\"thumbnail\":\"portal\\/20190717\\/061676f14852d648f9e15e0b524a5e89.png\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', null, '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_post` VALUES ('15', '0', '1', '1', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1563358617', '1563358890', '1563358560', '0', '永创合利将为2018年全国羽毛球单项锦标赛服务', '', '', '我们将为此次比赛提供计时记分、实时成绩、大屏展示、成绩处理服务。', '', '', '', '', null, '{\"thumbnail\":\"\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', '', '', null, null, '10000', '', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ld_portal_posten
-- ----------------------------
DROP TABLE IF EXISTS `ld_portal_posten`;
CREATE TABLE `ld_portal_posten` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_favorites` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_title_en` varchar(100) NOT NULL DEFAULT '' COMMENT '英文标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) DEFAULT '' COMMENT '缩略图',
  `thumbrecomm` varchar(100) DEFAULT '' COMMENT '推荐图',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  `post_url` varchar(255) DEFAULT '',
  `post_email` varchar(255) DEFAULT NULL,
  `post_phone` varchar(255) DEFAULT NULL,
  `post_huojiang` varchar(255) DEFAULT NULL COMMENT '获奖日期',
  `post_miaoshu` text,
  `list_order` int(255) unsigned DEFAULT '10000',
  `post_year` varchar(255) DEFAULT NULL,
  `post_sex` varchar(255) DEFAULT NULL,
  `post_china` varchar(255) DEFAULT NULL,
  `post_case` longtext,
  `post_xing` longtext,
  `post_time` longtext,
  `post_pay` longtext,
  `post_apply` longtext,
  `post_baoming` longtext,
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用下载表';

-- ----------------------------
-- Records of ld_portal_posten
-- ----------------------------
INSERT INTO `ld_portal_posten` VALUES ('1', '0', '1', '1', '2', '1', '1', '0', '0', '0', '0', '0', '0', '1561020502', '1561088038', '1561020240', '0', 'special plan', 'Coming soon', '', '', '', '', '', '', null, '{\"thumbnail\":\"\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', null, '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_posten` VALUES ('2', '0', '1', '1', '2', '1', '1', '0', '0', '0', '0', '0', '0', '1561024421', '1561024435', '1561024380', '0', 'new1', '', '', 'Considérant que lors de la visite du Président de la République française de janvier 2018, Liu Yuzhu, Directeur de l\'Administration Nationale de l’Heritage Culturel de Chine, et Jean- Maurice Ripert, ', '', 'portal/20190619/6eba09a12f1054f1e47bd81029a6e3c0.png', '', '&lt;p&gt;Considérant que lors de la visite du Président de la République française de janvier 2018, Liu Yuzhu, Directeur de l\'Administration Nationale de l’Heritage Culturel de Chine, et Jean- Maurice Ripert, Ambassadeur de France en Chine ont signé l’«Accord administratif entre le Directeur de l\'Administration Nationale de l’Heritage Culturel de Chine et le Ministre de la culture de la France sur la coopération dans le domaine du patrimoine culturel ».&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20190619\\/6eba09a12f1054f1e47bd81029a6e3c0.png\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', '', '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_posten` VALUES ('3', '0', '1', '1', '2', '1', '1', '0', '0', '0', '0', '0', '0', '1561081474', '1561081474', '1561081421', '0', 'la formation  professionnelle', '', '', 'The Sino-French Museum Cooperation Platform is an innovative platform jointly sponsored by the China Museum Association and the French Foundation for Prospect and Innovation, which focuses on all-roun', '', '', '', '&lt;p&gt;The Sino-French Museum Cooperation Platform is an innovative platform jointly sponsored by the China Museum Association and the French Foundation for Prospect and Innovation, which focuses on all-round cooperation in the field of Sino-French museums. It aims to promote substantial and in-depth cooperation between Chinese and French museums by establishing a long-term and stable platform mechanism, highly integrating industry resources, high-tech and financial capital&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', '', '', null, null, '10000', '', null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_posten` VALUES ('4', '0', '1', '1', '2', '1', '1', '0', '0', '0', '0', '0', '0', '1561081749', '1561081749', '1561081659', '0', 'EXPORT', 'Exposition', '', 'Fortement soutenus par les autorités françaises, nous organisons des hyper-expositions de haute qualité à l’étranger pour les musées chinois tout en intégrant les nouvelles technologies, les équipes d’élites et des fonds d’investissements. Notre objectif est de créer un nouveau modèle d’exposition pour les musées chinois afin de promouvoir la culture chinoise dans le monde.', '', 'portal/20190619/5705b713bd614030d97837dd22cb7449.png', '', '&lt;p&gt;Fortement soutenus par les autorités françaises, nous organisons des hyper-expositions de haute qualité à l’étranger pour les musées chinois tout en intégrant les nouvelles technologies, les équipes d’élites et des fonds d’investissements. Notre objectif est de créer un nouveau modèle d’exposition pour les musées chinois afin de promouvoir la culture chinoise dans le monde.&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20190619\\/5705b713bd614030d97837dd22cb7449.png\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', '', '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_posten` VALUES ('5', '0', '1', '1', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1563430616', '1563430616', '1563430547', '0', '右1', '', '', '永创合利拥有体育项目专业器材及设备的销售经验，与国家体育总局及国内体育协会有密切的合作关系，具备举办各类体育赛事经验与强大的市场开发能力，技术全面的售后保障团队。', '', 'portal/20190717/ded901db5a790e69758101c13a3b59e2.jpg', '', '&lt;p&gt;永创合利拥有体育项目专业器材及设备的销售经验，与国家体育总局及国内体育协会有密切的合作关系，具备举办各类体育赛事经验与强大的市场开发能力，技术全面的售后保障团队。&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20190717\\/ded901db5a790e69758101c13a3b59e2.jpg\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', null, '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_posten` VALUES ('6', '0', '1', '1', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1563430670', '1563430670', '1563430630', '0', '中间', '', '', '公司近年来开始从事体育产业资源与IP资源的整合、开发，推出体育场馆智能化，用以达到体育场馆无线网络全覆盖、移动APP完成场馆查询、预定、付费、运动康复、在线课程、VR（虚拟现实）、AR（增强现实）、体育赛事等功能服务，开拓体育产业“O2O”新模式覆盖大中城市，开展线上线下活动，为体育专业提供完整的一站式服务。', '', 'portal/20190717/7406132405fa8fcbf693af4a064a2aeb.png', '', '&lt;p&gt;公司近年来开始从事体育产业资源与IP资源的整合、开发，推出体育场馆智能化，用以达到体育场馆无线网络全覆盖、移动APP完成场馆查询、预定、付费、运动康复、在线课程、VR（虚拟现实）、AR（增强现实）、体育赛事等功能服务，开拓体育产业“O2O”新模式覆盖大中城市，开展线上线下活动，为体育专业提供完整的一站式服务。&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20190717\\/7406132405fa8fcbf693af4a064a2aeb.png\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', null, '', null, null, '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `ld_portal_posten` VALUES ('7', '0', '1', '1', '3', '1', '1', '0', '0', '0', '0', '0', '0', '1563430743', '1563430743', '1563430689', '0', '左1', '', '', '“专业是根本，创新是途径”，我们一直致力于使用专业的人才、专业的设备以及专业的运作模式，永创合利意味着我们永远将创新放在第一位，时刻将大量精力用来研发新产品，拓展新领域及改进已经获得国际组织认证的产品。', '', 'portal/20190717/5ad0dc457a884cc5a482bae75cc97050.png', '', '&lt;p&gt;“专业是根本，创新是途径”，我们一直致力于使用专业的人才、专业的设备以及专业的运作模式，永创合利意味着我们永远将创新放在第一位，时刻将大量精力用来研发新产品，拓展新领域及改进已经获得国际组织认证的产品。&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20190717\\/5ad0dc457a884cc5a482bae75cc97050.png\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', null, '', null, null, '10000', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ld_portal_postfa
-- ----------------------------
DROP TABLE IF EXISTS `ld_portal_postfa`;
CREATE TABLE `ld_portal_postfa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_favorites` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_title_en` varchar(100) NOT NULL DEFAULT '' COMMENT '英文标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) DEFAULT '' COMMENT '缩略图',
  `thumbrecomm` varchar(100) DEFAULT '' COMMENT '推荐图',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  `post_url` varchar(255) DEFAULT '',
  `post_email` varchar(255) DEFAULT NULL,
  `post_phone` varchar(255) DEFAULT NULL,
  `post_huojiang` varchar(255) DEFAULT NULL COMMENT '获奖日期',
  `post_miaoshu` text,
  `list_order` int(255) unsigned DEFAULT '10000',
  `post_year` varchar(255) DEFAULT NULL,
  `post_sex` varchar(255) DEFAULT NULL,
  `post_china` varchar(255) DEFAULT NULL,
  `post_case` longtext,
  `post_xing` longtext,
  `post_time` longtext,
  `post_pay` longtext,
  `post_apply` longtext,
  `post_baoming` longtext,
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用下载表';

-- ----------------------------
-- Records of ld_portal_postfa
-- ----------------------------
INSERT INTO `ld_portal_postfa` VALUES ('1', '0', '1', '1', '2', '1', '1', '0', '0', '0', '0', '0', '0', '1561087889', '1561087889', '1561087806', '0', 'new1', '', '', 'Considérant que lors de la visite du Président de la République française de janvier 2018, Liu Yuzhu, Directeur de l\'Administration Nationale de l’Heritage Culturel de Chine, et Jean- Maurice Ripert, ', '', 'portal/20190619/6eba09a12f1054f1e47bd81029a6e3c0.png', '', '&lt;p&gt;Considérant que lors de la visite du Président de la République française de janvier 2018, Liu Yuzhu, Directeur de l\'Administration Nationale de l’Heritage Culturel de Chine, et Jean- Maurice Ripert, Ambassadeur de France en Chine ont signé l’«Accord administratif entre le Directeur de l\'Administration Nationale de l’Heritage Culturel de Chine et le Ministre de la culture de la France sur la coopération dans le domaine du patrimoine culturel ».&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20190619\\/6eba09a12f1054f1e47bd81029a6e3c0.png\",\"thumbrecomm\":\"\",\"template\":\"\"}', '', '', '', null, null, '10000', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ld_portal_tag
-- ----------------------------
DROP TABLE IF EXISTS `ld_portal_tag`;
CREATE TABLE `ld_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';

-- ----------------------------
-- Records of ld_portal_tag
-- ----------------------------
INSERT INTO `ld_portal_tag` VALUES ('1', '1', '0', '0', 'Founder’s Note');
INSERT INTO `ld_portal_tag` VALUES ('2', '1', '0', '0', 'Established in Beiji');
INSERT INTO `ld_portal_tag` VALUES ('3', '1', '0', '0', 'Prestige Education C');
INSERT INTO `ld_portal_tag` VALUES ('4', '1', '0', '0', 'we have grown into a');
INSERT INTO `ld_portal_tag` VALUES ('5', '1', '0', '0', 'confident and creati');
INSERT INTO `ld_portal_tag` VALUES ('6', '1', '0', '0', 'challenging and crea');
INSERT INTO `ld_portal_tag` VALUES ('7', '1', '0', '0', 'searching for extra ');
INSERT INTO `ld_portal_tag` VALUES ('8', '1', '0', '0', 'or seeking to enrich');
INSERT INTO `ld_portal_tag` VALUES ('9', '1', '0', '0', 'PEC can provide the ');
INSERT INTO `ld_portal_tag` VALUES ('10', '1', '0', '0', 'Established in Beiji');
INSERT INTO `ld_portal_tag` VALUES ('11', '1', '0', '0', 'Prestige Education C');
INSERT INTO `ld_portal_tag` VALUES ('12', '1', '0', '0', 'Established in Beiji');
INSERT INTO `ld_portal_tag` VALUES ('13', '1', '0', '0', 'Prestige Education C');
INSERT INTO `ld_portal_tag` VALUES ('14', '1', '0', '0', 'Integrity:          ');
INSERT INTO `ld_portal_tag` VALUES ('15', '1', '0', '0', 'kind and forgiving. ');
INSERT INTO `ld_portal_tag` VALUES ('16', '1', '0', '0', 'do not give up');
INSERT INTO `ld_portal_tag` VALUES ('17', '1', '0', '0', 'always do your best.');
INSERT INTO `ld_portal_tag` VALUES ('18', '1', '0', '0', 'try new things');
INSERT INTO `ld_portal_tag` VALUES ('19', '1', '0', '0', 'do things your way. ');
INSERT INTO `ld_portal_tag` VALUES ('20', '1', '0', '0', 'make things happen y');
INSERT INTO `ld_portal_tag` VALUES ('21', '1', '0', '0', 'be proactive.');
INSERT INTO `ld_portal_tag` VALUES ('22', '1', '0', '0', 'Established in Beiji');
INSERT INTO `ld_portal_tag` VALUES ('23', '1', '0', '0', 'Prestige Education C');
INSERT INTO `ld_portal_tag` VALUES ('24', '1', '0', '0', 'we use the new Engli');
INSERT INTO `ld_portal_tag` VALUES ('25', '1', '0', '0', 'and expertly tailors');
INSERT INTO `ld_portal_tag` VALUES ('26', '1', '0', '0', 'Dear parents and stu');
INSERT INTO `ld_portal_tag` VALUES ('27', '1', '0', '0', 'I am delighted to we');
INSERT INTO `ld_portal_tag` VALUES ('28', '1', '0', '0', 'continually updated ');
INSERT INTO `ld_portal_tag` VALUES ('29', '1', '0', '0', 'to think independent');
INSERT INTO `ld_portal_tag` VALUES ('30', '1', '0', '0', 'at work or play');
INSERT INTO `ld_portal_tag` VALUES ('31', '1', '0', '0', 'we give students mor');
INSERT INTO `ld_portal_tag` VALUES ('32', '1', '0', '0', 'both at home and abr');
INSERT INTO `ld_portal_tag` VALUES ('33', '1', '0', '0', 'for its education ex');
INSERT INTO `ld_portal_tag` VALUES ('34', '1', '0', '0', 'PEC has obtained a f');
INSERT INTO `ld_portal_tag` VALUES ('35', '1', '0', '0', 'work hard and commit');

-- ----------------------------
-- Table structure for ld_portal_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `ld_portal_tag_post`;
CREATE TABLE `ld_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- ----------------------------
-- Records of ld_portal_tag_post
-- ----------------------------
INSERT INTO `ld_portal_tag_post` VALUES ('26', '26', '26', '1');
INSERT INTO `ld_portal_tag_post` VALUES ('27', '27', '26', '1');
INSERT INTO `ld_portal_tag_post` VALUES ('28', '28', '26', '1');
INSERT INTO `ld_portal_tag_post` VALUES ('29', '29', '26', '1');
INSERT INTO `ld_portal_tag_post` VALUES ('30', '30', '26', '1');
INSERT INTO `ld_portal_tag_post` VALUES ('31', '31', '26', '1');
INSERT INTO `ld_portal_tag_post` VALUES ('32', '32', '26', '1');
INSERT INTO `ld_portal_tag_post` VALUES ('33', '33', '26', '1');
INSERT INTO `ld_portal_tag_post` VALUES ('34', '34', '26', '1');
INSERT INTO `ld_portal_tag_post` VALUES ('35', '35', '26', '1');

-- ----------------------------
-- Table structure for ld_position
-- ----------------------------
DROP TABLE IF EXISTS `ld_position`;
CREATE TABLE `ld_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `catid` int(10) unsigned NOT NULL COMMENT '推荐位所属栏目',
  `name` varchar(255) NOT NULL COMMENT '推荐位名字',
  `maxnum` smallint(5) NOT NULL COMMENT '最大保存条数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='推荐位表';

-- ----------------------------
-- Records of ld_position
-- ----------------------------
INSERT INTO `ld_position` VALUES ('1', '2', '首页新闻', '20');

-- ----------------------------
-- Table structure for ld_positionen
-- ----------------------------
DROP TABLE IF EXISTS `ld_positionen`;
CREATE TABLE `ld_positionen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `catid` int(10) unsigned NOT NULL COMMENT '推荐位所属栏目',
  `name` varchar(255) NOT NULL COMMENT '推荐位名字',
  `maxnum` smallint(5) NOT NULL COMMENT '最大保存条数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='推荐位表';

-- ----------------------------
-- Records of ld_positionen
-- ----------------------------
INSERT INTO `ld_positionen` VALUES ('1', '2', '首页新闻', '20');

-- ----------------------------
-- Table structure for ld_positionen_data
-- ----------------------------
DROP TABLE IF EXISTS `ld_positionen_data`;
CREATE TABLE `ld_positionen_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `catid` int(10) unsigned NOT NULL COMMENT '文章所属栏目',
  `posid` int(10) unsigned NOT NULL COMMENT '推荐位ID',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章iD',
  `listorder` int(10) unsigned NOT NULL DEFAULT '10000' COMMENT '排序ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='推荐位数据表';

-- ----------------------------
-- Records of ld_positionen_data
-- ----------------------------

-- ----------------------------
-- Table structure for ld_position_data
-- ----------------------------
DROP TABLE IF EXISTS `ld_position_data`;
CREATE TABLE `ld_position_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `catid` int(10) unsigned NOT NULL COMMENT '文章所属栏目',
  `posid` int(10) unsigned NOT NULL COMMENT '推荐位ID',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章iD',
  `listorder` int(10) unsigned NOT NULL DEFAULT '10000' COMMENT '排序ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='推荐位数据表';

-- ----------------------------
-- Records of ld_position_data
-- ----------------------------
INSERT INTO `ld_position_data` VALUES ('1', '12', '1', '2', '10000');
INSERT INTO `ld_position_data` VALUES ('2', '11', '1', '15', '10000');

-- ----------------------------
-- Table structure for ld_poster
-- ----------------------------
DROP TABLE IF EXISTS `ld_poster`;
CREATE TABLE `ld_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `number` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '广告数',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '版位描述',
  `width` int(10) unsigned NOT NULL COMMENT '宽',
  `height` int(10) unsigned NOT NULL COMMENT '高',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='广告位';

-- ----------------------------
-- Records of ld_poster
-- ----------------------------

-- ----------------------------
-- Table structure for ld_poster_click
-- ----------------------------
DROP TABLE IF EXISTS `ld_poster_click`;
CREATE TABLE `ld_poster_click` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ip` varchar(20) NOT NULL COMMENT '访问IP',
  `data_id` int(10) unsigned NOT NULL COMMENT '广告id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '访问地址',
  `pid` int(10) unsigned NOT NULL COMMENT '广告位ID',
  `refer` varchar(300) NOT NULL DEFAULT '' COMMENT '访问来源',
  `time` int(10) unsigned NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='广告点击表';

-- ----------------------------
-- Records of ld_poster_click
-- ----------------------------

-- ----------------------------
-- Table structure for ld_poster_data
-- ----------------------------
DROP TABLE IF EXISTS `ld_poster_data`;
CREATE TABLE `ld_poster_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int(10) unsigned NOT NULL COMMENT '广告位ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1启用，0不启用',
  `createtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  `listorder` int(10) unsigned NOT NULL DEFAULT '10000' COMMENT '排序',
  `starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `img` varchar(200) NOT NULL COMMENT '图片',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT 'url',
  `title` varchar(50) NOT NULL COMMENT '广告标题',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_poster_data
-- ----------------------------

-- ----------------------------
-- Table structure for ld_price
-- ----------------------------
DROP TABLE IF EXISTS `ld_price`;
CREATE TABLE `ld_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '名称',
  `post_excerpt` text,
  `funt` varchar(255) DEFAULT NULL,
  `post_adu` text,
  `content` longtext,
  `thumbnail` text,
  `thumbnail_m` text,
  `creatime` int(10) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned DEFAULT '10000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_price
-- ----------------------------
INSERT INTO `ld_price` VALUES ('1', '无人矿山系统概述', ' 基于平行驾驶的端到端无人矿山系统是由北京慧拓无限科技有限公司所研发的，针对露天矿场景的矿山开采，运输的智能化解决方案，可实现半自主挖掘，无人化装载、运输、卸载，集群调度与管理等功能。系统包括无人矿卡，半自主挖掘机及集群管理平台。', '整个无人矿山的运营管理是在机群管理与调度系统的统一远程指挥下运作的。在露天矿山由无人矿卡车队承担了矿山的全部自动运输作业任务；自主式辅助挖掘机负责与无人矿卡协同作业，完成物料（矿石、土石方）装载作业任务；如果无人矿卡在作业现场出现故障等突发情况，可通过远程遥控系统应急接管无人矿卡，避免交通混乱', '无人矿山系统主要由平行无人矿山管控中心、无人矿卡（宽体自卸车或者重卡）、自主式辅助挖掘机、远程遥控等组成。', '', 'portal/20181217/a6961b16bee39be1960eb67e53238a00.png', 'portal/20181217/7ba123a6c78e8f167e469e65f6b41447.png', '1543819320', '10000');
INSERT INTO `ld_price` VALUES ('4', '虚拟平行矿山', '在管控中心接收实时采集矿山地理数据，车辆状态信息，任务信息等，构建含有高精度地图的实时性人工矿山，并根据执行策略做计算实验，依靠中心端的强大算力，对车辆、矿山的未来状态进行预测，从而引导车辆及系统更可靠的运行。', 'F', '', null, '', '', '1545027433', '10000');
INSERT INTO `ld_price` VALUES ('5', '管控中心', '为整个无人矿山的机群管理与调度系统中心。实时监控系统内矿卡，挖掘机，重卡的工作状态；控制管理矿卡、挖掘机等之间的协同作业过程；对无人矿卡车队进行管理与调度，负责矿卡车队所有的作业管理过程。', 'E', '', null, '', '', '1545027514', '10000');
INSERT INTO `ld_price` VALUES ('6', '货运火车站', '此区域为贮存无人重卡短倒物流运输过来的矿物，并装载到货运火车，发往全国各地。', 'D', '', null, '', '', '1545027542', '10000');
INSERT INTO `ld_price` VALUES ('7', '传输带卸矿点', '\r\n在该区接收已经进行粗加工的新采掘的矿物并将矿物装载到无人重卡，实现短倒物流。', 'C', '', null, '', '', '1545027573', '10000');
INSERT INTO `ld_price` VALUES ('8', '卸矿点', '无人矿卡（宽体自卸车或者重卡）自动运输来自采矿点A的矿物（或者土石方），将其暂时存放于卸矿点（破碎场、贮存场）。无人矿卡具有障碍物识别，自动变道，紧急制动，远程遥控等功能。', 'B', '', null, '', '', '1545027590', '10000');
INSERT INTO `ld_price` VALUES ('9', '采矿点', '在该区域，挖掘机实现半自主挖掘，并与无人矿卡协同作业完成矿物（或者土石方）的装载作业。', 'A', '', null, '', '', '1545027624', '10000');

-- ----------------------------
-- Table structure for ld_product
-- ----------------------------
DROP TABLE IF EXISTS `ld_product`;
CREATE TABLE `ld_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `cid` int(10) unsigned DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `creatime` int(10) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned DEFAULT '10000',
  `content` text,
  `thumbnail_m` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_product
-- ----------------------------
INSERT INTO `ld_product` VALUES ('1', '兼职', null, 'portal/20181203/58f6c9cd828d422a9204ecc5e8b10dc9.png', '1544771820', '10000', '全天候客服, 365天，7*24小时在线客服和技术支持，节假日亦10分钟内响应', '');
INSERT INTO `ld_product` VALUES ('2', '全职', null, 'portal/20181203/bbf268ffc641a9f17168909a234882e0.png', '1544772000', '10000', '三网合一, 三网覆盖，拥有移动、联通、电三大运营商总部级合作关系，各地150余条优质通道资源', '');

-- ----------------------------
-- Table structure for ld_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `ld_recycle_bin`;
CREATE TABLE `ld_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';

-- ----------------------------
-- Records of ld_recycle_bin
-- ----------------------------
INSERT INTO `ld_recycle_bin` VALUES ('13', '24', '1553656027', 'portal_post', '测试一', '3');
INSERT INTO `ld_recycle_bin` VALUES ('14', '13', '1553757613', 'portal_post', '测试二', '3');
INSERT INTO `ld_recycle_bin` VALUES ('15', '12', '1553757624', 'portal_post', '测试一', '3');
INSERT INTO `ld_recycle_bin` VALUES ('16', '14', '1553758078', 'portal_post', '测试内容', '3');
INSERT INTO `ld_recycle_bin` VALUES ('17', '98', '1553758229', 'portal_post', '校园设施', '3');
INSERT INTO `ld_recycle_bin` VALUES ('18', '96', '1553758239', 'portal_post', '校园设施', '3');
INSERT INTO `ld_recycle_bin` VALUES ('19', '97', '1553758239', 'portal_post', '校园设施', '3');
INSERT INTO `ld_recycle_bin` VALUES ('20', '42', '1553849673', 'portal_posten', 'Environment', '3');
INSERT INTO `ld_recycle_bin` VALUES ('21', '17', '1554172229', 'portal_post', 'Mr Gobat2—', '3');
INSERT INTO `ld_recycle_bin` VALUES ('22', '1', '1554172233', 'portal_post', 'Mr Gobat —', '3');
INSERT INTO `ld_recycle_bin` VALUES ('23', '114', '1554192967', 'portal_post', 'PEC 2018 英国夏令营', '3');
INSERT INTO `ld_recycle_bin` VALUES ('24', '4', '1554346368', 'portal_post', '成果荣誉', '3');
INSERT INTO `ld_recycle_bin` VALUES ('25', '5', '1554346390', 'portal_post', '企业资质', '3');
INSERT INTO `ld_recycle_bin` VALUES ('26', '10', '1554349595', 'portal_posten', 'Mr Gobat2—', '3');
INSERT INTO `ld_recycle_bin` VALUES ('27', '6', '1554349599', 'portal_posten', 'Mr Gobat1—', '3');
INSERT INTO `ld_recycle_bin` VALUES ('28', '3', '1554350155', 'portal_posten', 'ceshi', '3');
INSERT INTO `ld_recycle_bin` VALUES ('29', '13', '1561081005', 'portal_categoryen', 'le soutiens en ressources', '0');
INSERT INTO `ld_recycle_bin` VALUES ('30', '3', '1561442231', 'slide', '首页法文轮播', '0');
INSERT INTO `ld_recycle_bin` VALUES ('31', '2', '1561442240', 'slide', '首页英文轮播', '0');

-- ----------------------------
-- Table structure for ld_role
-- ----------------------------
DROP TABLE IF EXISTS `ld_role`;
CREATE TABLE `ld_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of ld_role
-- ----------------------------
INSERT INTO `ld_role` VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `ld_role` VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '普通管理员', '权限由最高管理员分配！');

-- ----------------------------
-- Table structure for ld_role_user
-- ----------------------------
DROP TABLE IF EXISTS `ld_role_user`;
CREATE TABLE `ld_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of ld_role_user
-- ----------------------------
INSERT INTO `ld_role_user` VALUES ('6', '1', '2');
INSERT INTO `ld_role_user` VALUES ('7', '2', '3');

-- ----------------------------
-- Table structure for ld_route
-- ----------------------------
DROP TABLE IF EXISTS `ld_route`;
CREATE TABLE `ld_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';

-- ----------------------------
-- Records of ld_route
-- ----------------------------
INSERT INTO `ld_route` VALUES ('1', '5000', '1', '2', 'admin/Index/index', 'ldadmin$');

-- ----------------------------
-- Table structure for ld_shoplist
-- ----------------------------
DROP TABLE IF EXISTS `ld_shoplist`;
CREATE TABLE `ld_shoplist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `list_order` int(255) unsigned DEFAULT '10000',
  `url` text,
  `thumbnail_we` text,
  `post_content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_shoplist
-- ----------------------------
INSERT INTO `ld_shoplist` VALUES ('1', 'Company', '1553486576', '10008', '/portal/listen/index/id/30.html', null, null);
INSERT INTO `ld_shoplist` VALUES ('2', 'FAQ', '1553510875', '10007', '/portal/listen/index/id/16.html', null, null);
INSERT INTO `ld_shoplist` VALUES ('3', 'Campus', '1553510975', '10006', '/portal/listen/index/id/10.html', null, null);
INSERT INTO `ld_shoplist` VALUES ('4', 'Application', '1553511031', '10005', '/portal/listen/index/id/15.html', null, null);
INSERT INTO `ld_shoplist` VALUES ('5', 'News', '1553511075', '10004', '/portal/listen/index/id/25.html', null, null);
INSERT INTO `ld_shoplist` VALUES ('6', 'PEC Alumni', '1553511211', '10003', '/portal/listen/index/id/23.html', null, null);
INSERT INTO `ld_shoplist` VALUES ('7', 'Newsletter', '1553511252', '10002', '/portal/listen/index/id/36.html', null, null);
INSERT INTO `ld_shoplist` VALUES ('8', 'Guest Book', '1553511303', '10000', '/portal/listen/index/id/37.html', null, null);

-- ----------------------------
-- Table structure for ld_sign
-- ----------------------------
DROP TABLE IF EXISTS `ld_sign`;
CREATE TABLE `ld_sign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(200) DEFAULT NULL COMMENT '姓名',
  `birthday` int(20) unsigned NOT NULL COMMENT '生日',
  `tel` varchar(100) DEFAULT NULL COMMENT '电话',
  `year` varchar(255) DEFAULT NULL,
  `catid` int(10) unsigned DEFAULT NULL COMMENT '分类id',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ld_sign
-- ----------------------------
INSERT INTO `ld_sign` VALUES ('1', '晴天', '0', '13210231450', '20', '9', '1553650985');

-- ----------------------------
-- Table structure for ld_slide
-- ----------------------------
DROP TABLE IF EXISTS `ld_slide`;
CREATE TABLE `ld_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';

-- ----------------------------
-- Records of ld_slide
-- ----------------------------
INSERT INTO `ld_slide` VALUES ('1', '1', '0', '首页中文轮播', '');
INSERT INTO `ld_slide` VALUES ('2', '1', '1561442240', '首页英文轮播', '');
INSERT INTO `ld_slide` VALUES ('3', '1', '1561442231', '首页法文轮播', '');

-- ----------------------------
-- Table structure for ld_slide_item
-- ----------------------------
DROP TABLE IF EXISTS `ld_slide_item`;
CREATE TABLE `ld_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `image_m` varchar(300) NOT NULL DEFAULT '' COMMENT '手机图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of ld_slide_item
-- ----------------------------
INSERT INTO `ld_slide_item` VALUES ('1', '1', '1', '10000', 'banner1', 'admin/20190717/2abdc966ec4cf0e5b98c76048641630f.jpg', 'admin/20190717/ed42cb1c252e04d5e020e562e89f7ce5.jpg', '', '', '', '', null);
INSERT INTO `ld_slide_item` VALUES ('6', '1', '1', '10000', 'banner2', 'admin/20190717/2abdc966ec4cf0e5b98c76048641630f.jpg', 'admin/20190717/ed42cb1c252e04d5e020e562e89f7ce5.jpg', '', '', '', '', null);

-- ----------------------------
-- Table structure for ld_theme
-- ----------------------------
DROP TABLE IF EXISTS `ld_theme`;
CREATE TABLE `ld_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ld_theme
-- ----------------------------
INSERT INTO `ld_theme` VALUES ('2', '0', '0', '0', '0', 'index', 'ld', '1.0.2', 'http://mydear.vip', '', '龙鼎', 'http://mydear.vip', 'zh-cn', '龙鼎模板', '龙鼎模板');

-- ----------------------------
-- Table structure for ld_theme_file
-- ----------------------------
DROP TABLE IF EXISTS `ld_theme_file`;
CREATE TABLE `ld_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ld_theme_file
-- ----------------------------
INSERT INTO `ld_theme_file` VALUES ('1', '0', '10', 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);
INSERT INTO `ld_theme_file` VALUES ('2', '0', '10', 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO `ld_theme_file` VALUES ('3', '0', '5', 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `ld_theme_file` VALUES ('4', '0', '10', 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `ld_theme_file` VALUES ('5', '0', '10', 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `ld_theme_file` VALUES ('6', '0', '10', 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO `ld_theme_file` VALUES ('7', '1', '0', 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', null);
INSERT INTO `ld_theme_file` VALUES ('8', '1', '1', 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);
INSERT INTO `ld_theme_file` VALUES ('24', '0', '10', 'index', '新闻文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '[]', '[]', null);
INSERT INTO `ld_theme_file` VALUES ('25', '0', '10', 'index', '新闻列表页', 'portal/List/index', 'portal/list', '新闻列表模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('26', '0', '10', 'index', '单页', 'portal/Page/index', 'portal/page', '单页模板', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('43', '0', '10', 'index', '产品展示页', 'portal/Article/index', 'portal/article_sale', '产品展示模板文件', '[]', '[]', null);
INSERT INTO `ld_theme_file` VALUES ('50', '0', '10', 'index', '服务与支持页', 'portal/List/index', 'portal/list_museum', '服务与支持模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('52', '0', '10', 'index', '关于我们页', 'portal/List/index', 'portal/list_about', '关于我们模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('53', '0', '10', 'index', '产品展示页', 'portal/List/index', 'portal/list_product', '产品展示模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('54', '0', '10', 'index', '联系我们页', 'portal/List/index', 'portal/list_contact', '联系我们模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('55', '0', '10', 'index', '合作伙伴页', 'portal/List/index', 'portal/list_hezuo', '合作伙伴模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('56', '0', '10', 'index', '加入我们页', 'portal/List/index', 'portal/list_join', '加入我们模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('57', '0', '10', 'index', '新闻文章页', 'portal/Articleen/index', 'portal/eng/article', '文章页模板文件', '[]', '[]', null);
INSERT INTO `ld_theme_file` VALUES ('58', '0', '10', 'index', '产品展示页', 'portal/Articleen/index', 'portal/eng/article_sale', '产品展示模板文件', '[]', '[]', null);
INSERT INTO `ld_theme_file` VALUES ('59', '0', '10', 'index', '新闻列表页', 'portal/Listen/index', 'portal/eng/list', '新闻列表模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('60', '0', '10', 'index', '关于我们页', 'portal/Listen/index', 'portal/eng/list_about', '关于我们模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('61', '0', '10', 'index', '联系我们页', 'portal/Listen/index', 'portal/eng/list_contact', '联系我们模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('62', '0', '10', 'index', '合作伙伴页', 'portal/Listen/index', 'portal/eng/list_hezuo', '合作伙伴模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('63', '0', '10', 'index', '加入我们页', 'portal/Listen/index', 'portal/eng/list_join', '加入我们模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('64', '0', '10', 'index', '服务与支持页', 'portal/Listen/index', 'portal/eng/list_museum', '服务与支持模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('65', '0', '10', 'index', '产品展示页', 'portal/Listen/index', 'portal/eng/list_product', '产品展示模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('66', '0', '10', 'index', '单页', 'portal/Page/index', 'portal/eng/page', '单页模板', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);
INSERT INTO `ld_theme_file` VALUES ('67', '0', '10', 'index', '关于我们业绩页', 'portal/List/index', 'portal/list_about_yejie', '关于我们业绩模板文件', '{\"vars\":[],\"widgets\":[]}', '{\"vars\":[],\"widgets\":[]}', null);

-- ----------------------------
-- Table structure for ld_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `ld_third_party_user`;
CREATE TABLE `ld_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';

-- ----------------------------
-- Records of ld_third_party_user
-- ----------------------------

-- ----------------------------
-- Table structure for ld_user
-- ----------------------------
DROP TABLE IF EXISTS `ld_user`;
CREATE TABLE `ld_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of ld_user
-- ----------------------------
INSERT INTO `ld_user` VALUES ('1', '1', '0', '0', '1543570305', '0', '0', '0.00', '1533524534', '1', 'wz010', '###299ec6bec5ea386f1dec5b1151144dd0', 'wz010', '858174095@qq.com', '', '', '', '127.0.0.1', '', '', null);
INSERT INTO `ld_user` VALUES ('2', '1', '0', '0', '1563264817', '0', '0', '0.00', '0', '1', 'admin', '###cb39128d82274f80018dc1d48a212ba0', '', '111111@qq.com', '', '', '', '127.0.0.1', '', '', null);
INSERT INTO `ld_user` VALUES ('3', '1', '0', '0', '1563412499', '0', '0', '0.00', '0', '1', 'ld2009', '###803d04dc3a58161383c39a3f0462ce1c', '', '1@qq.com', '', '', '', '127.0.0.1', '', '', null);

-- ----------------------------
-- Table structure for ld_user_action
-- ----------------------------
DROP TABLE IF EXISTS `ld_user_action`;
CREATE TABLE `ld_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';

-- ----------------------------
-- Records of ld_user_action
-- ----------------------------
INSERT INTO `ld_user_action` VALUES ('1', '1', '1', '1', '2', '1', '用户登录', 'login', 'user', '');

-- ----------------------------
-- Table structure for ld_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `ld_user_action_log`;
CREATE TABLE `ld_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';

-- ----------------------------
-- Records of ld_user_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for ld_user_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `ld_user_balance_log`;
CREATE TABLE `ld_user_balance_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户余额变更日志表';

-- ----------------------------
-- Records of ld_user_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for ld_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `ld_user_favorite`;
CREATE TABLE `ld_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，JSON格式',
  `description` text COMMENT '收藏内容的描述',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';

-- ----------------------------
-- Records of ld_user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for ld_user_like
-- ----------------------------
DROP TABLE IF EXISTS `ld_user_like`;
CREATE TABLE `ld_user_like` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容原来的主键id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '内容以前所在表,不带前缀',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容的原文地址，不带域名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` text COMMENT '内容的描述',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户点赞表';

-- ----------------------------
-- Records of ld_user_like
-- ----------------------------

-- ----------------------------
-- Table structure for ld_user_login_attempt
-- ----------------------------
DROP TABLE IF EXISTS `ld_user_login_attempt`;
CREATE TABLE `ld_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- ----------------------------
-- Records of ld_user_login_attempt
-- ----------------------------

-- ----------------------------
-- Table structure for ld_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `ld_user_score_log`;
CREATE TABLE `ld_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';

-- ----------------------------
-- Records of ld_user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for ld_user_token
-- ----------------------------
DROP TABLE IF EXISTS `ld_user_token`;
CREATE TABLE `ld_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of ld_user_token
-- ----------------------------
INSERT INTO `ld_user_token` VALUES ('1', '1', '1549076552', '1533524552', 'ffbcaa9f38e1859a0c5f655bd898e2f5ffbcaa9f38e1859a0c5f655bd898e2f5', 'web');
INSERT INTO `ld_user_token` VALUES ('2', '2', '1576402427', '1560850427', 'd8559ec6556eaec365230090c243f872456a543c2f27d1e0c8a4d522667d88a6', 'web');
INSERT INTO `ld_user_token` VALUES ('3', '3', '1568857895', '1553305895', 'bd051adc1cc882ce915091844d663d59bd1b44d892f68c49f5e9db2b7ff701ed', 'web');

-- ----------------------------
-- Table structure for ld_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `ld_verification_code`;
CREATE TABLE `ld_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';

-- ----------------------------
-- Records of ld_verification_code
-- ----------------------------
INSERT INTO `ld_verification_code` VALUES ('1', '3', '1539326629', '1539327229', '542089', '15639398695');
INSERT INTO `ld_verification_code` VALUES ('2', '1', '1539326487', '1539327087', '684884', '15138514580');
