/*
 Navicat MySQL Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : dailyfresh

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 13/03/2020 17:00:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 用户', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (26, 'Can change 用户', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 用户', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (28, 'Can view 用户', 7, 'view_user');
INSERT INTO `auth_permission` VALUES (29, 'Can add 地址', 8, 'add_address');
INSERT INTO `auth_permission` VALUES (30, 'Can change 地址', 8, 'change_address');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 地址', 8, 'delete_address');
INSERT INTO `auth_permission` VALUES (32, 'Can view 地址', 8, 'view_address');
INSERT INTO `auth_permission` VALUES (33, 'Can add 订单', 9, 'add_orderinfo');
INSERT INTO `auth_permission` VALUES (34, 'Can change 订单', 9, 'change_orderinfo');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 订单', 9, 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES (36, 'Can view 订单', 9, 'view_orderinfo');
INSERT INTO `auth_permission` VALUES (37, 'Can add 订单商品', 10, 'add_ordergoods');
INSERT INTO `auth_permission` VALUES (38, 'Can change 订单商品', 10, 'change_ordergoods');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 订单商品', 10, 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES (40, 'Can view 订单商品', 10, 'view_ordergoods');
INSERT INTO `auth_permission` VALUES (41, 'Can add 商品SPU', 11, 'add_goods');
INSERT INTO `auth_permission` VALUES (42, 'Can change 商品SPU', 11, 'change_goods');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 商品SPU', 11, 'delete_goods');
INSERT INTO `auth_permission` VALUES (44, 'Can view 商品SPU', 11, 'view_goods');
INSERT INTO `auth_permission` VALUES (45, 'Can add 商品', 12, 'add_goodssku');
INSERT INTO `auth_permission` VALUES (46, 'Can change 商品', 12, 'change_goodssku');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 商品', 12, 'delete_goodssku');
INSERT INTO `auth_permission` VALUES (48, 'Can view 商品', 12, 'view_goodssku');
INSERT INTO `auth_permission` VALUES (49, 'Can add 商品种类', 13, 'add_goodstype');
INSERT INTO `auth_permission` VALUES (50, 'Can change 商品种类', 13, 'change_goodstype');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 商品种类', 13, 'delete_goodstype');
INSERT INTO `auth_permission` VALUES (52, 'Can view 商品种类', 13, 'view_goodstype');
INSERT INTO `auth_permission` VALUES (53, 'Can add 主页促销活动', 14, 'add_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES (54, 'Can change 主页促销活动', 14, 'change_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 主页促销活动', 14, 'delete_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES (56, 'Can view 主页促销活动', 14, 'view_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES (57, 'Can add 主页分类展示商品', 15, 'add_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES (58, 'Can change 主页分类展示商品', 15, 'change_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 主页分类展示商品', 15, 'delete_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES (60, 'Can view 主页分类展示商品', 15, 'view_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES (61, 'Can add 首页轮播商品', 16, 'add_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES (62, 'Can change 首页轮播商品', 16, 'change_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 首页轮播商品', 16, 'delete_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES (64, 'Can view 首页轮播商品', 16, 'view_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES (65, 'Can add 商品图片', 17, 'add_goodsimage');
INSERT INTO `auth_permission` VALUES (66, 'Can change 商品图片', 17, 'change_goodsimage');
INSERT INTO `auth_permission` VALUES (67, 'Can delete 商品图片', 17, 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES (68, 'Can view 商品图片', 17, 'view_goodsimage');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$180000$aOAooakfoQfP$kIevBQvMPg+C5TeGTNKv+YgkHEvmtaIA9tS17s/K+Sc=', '2020-03-13 06:14:30.757147', 1, 'admin', '', '', '295183917@qq.com', 1, 1, '2020-03-13 01:52:18.455368');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for df_address
-- ----------------------------
DROP TABLE IF EXISTS `df_address`;
CREATE TABLE `df_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `addr` varchar(256) NOT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_address_user_id_5e6a5c8a_fk_df_user_id` (`user_id`),
  CONSTRAINT `df_address_user_id_5e6a5c8a_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_address
-- ----------------------------
BEGIN;
INSERT INTO `df_address` VALUES (1, '2020-03-11 09:10:53.813905', '2020-03-11 09:10:53.813940', 0, 'czl', '厦门', '361001', '18950190330', 1, 1);
INSERT INTO `df_address` VALUES (2, '2020-03-11 09:11:09.187240', '2020-03-11 09:11:09.187286', 0, 'czl', '厦门新地址', '361001', '18950190330', 0, 1);
INSERT INTO `df_address` VALUES (3, '2020-03-11 09:11:24.177977', '2020-03-11 09:11:24.178036', 0, 'czl', '厦门新地址', '361001', '18950190330', 0, 1);
INSERT INTO `df_address` VALUES (4, '2020-03-11 09:12:10.446229', '2020-03-11 09:12:10.446285', 0, 'czl', '福建', '361001', '18950190330', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for df_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_goods`;
CREATE TABLE `df_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods
-- ----------------------------
BEGIN;
INSERT INTO `df_goods` VALUES (1, '2020-03-13 06:53:38.247767', '2020-03-13 06:53:38.247871', 0, '草莓', '<p><strong><span style=\"font-size: 10px;\">很不错的草莓</span></strong></p>');
INSERT INTO `df_goods` VALUES (2, '2020-03-13 06:53:53.851616', '2020-03-13 06:53:53.851707', 0, '葡萄', '<p><strong><span style=\"font-size: 10px;\">葡萄</span></strong></p>');
INSERT INTO `df_goods` VALUES (3, '2020-03-13 06:54:01.124424', '2020-03-13 06:54:01.124524', 0, '柠檬', '<p><span style=\"font-size: 10px;\"><strong>柠檬</strong></span></p>');
INSERT INTO `df_goods` VALUES (4, '2020-03-13 06:54:08.536575', '2020-03-13 06:54:08.536609', 0, '奇异果', '<p><span style=\"font-size: 10px;\"><strong>奇异果</strong></span></p>');
INSERT INTO `df_goods` VALUES (5, '2020-03-13 06:54:18.249487', '2020-03-13 06:54:18.249550', 0, '大青虾', '<p><span style=\"font-size: 10px;\"><strong>大青虾</strong></span></p>');
INSERT INTO `df_goods` VALUES (6, '2020-03-13 06:54:27.139187', '2020-03-13 06:54:27.139221', 0, '秋刀鱼', '<p><strong><span style=\"font-size: 10px;\">秋刀鱼</span></strong></p>');
INSERT INTO `df_goods` VALUES (7, '2020-03-13 06:54:34.641035', '2020-03-13 06:54:34.641134', 0, '扇贝', '<p><span style=\"font-size: 10px;\"><strong>扇贝</strong></span></p>');
INSERT INTO `df_goods` VALUES (8, '2020-03-13 06:54:41.710635', '2020-03-13 06:54:41.710666', 0, '基围虾', '<p><span style=\"font-size: 10px;\"><strong>基围虾</strong></span></p>');
INSERT INTO `df_goods` VALUES (9, '2020-03-13 06:54:51.185299', '2020-03-13 06:54:51.185335', 0, '猪肉', '<p><span style=\"font-size: 10px;\"><strong>猪肉</strong></span></p>');
INSERT INTO `df_goods` VALUES (10, '2020-03-13 06:55:00.056211', '2020-03-13 06:55:00.056243', 0, '牛肉', '<p><span style=\"font-size: 10px;\"><strong>牛肉</strong></span></p>');
INSERT INTO `df_goods` VALUES (11, '2020-03-13 06:55:10.748307', '2020-03-13 06:55:10.748345', 0, '羊肉', '<p><span style=\"font-size: 10px;\"><strong>羊肉</strong></span></p>');
INSERT INTO `df_goods` VALUES (12, '2020-03-13 06:56:10.091127', '2020-03-13 06:56:10.091214', 0, '牛排', '<p><span style=\"font-size: 10px;\"><strong>牛排</strong></span></p>');
INSERT INTO `df_goods` VALUES (13, '2020-03-13 06:56:19.149547', '2020-03-13 06:56:19.149584', 0, '鸡蛋', '<p><span style=\"font-size: 10px;\"><strong>鸡蛋</strong></span></p>');
INSERT INTO `df_goods` VALUES (14, '2020-03-13 06:56:28.403002', '2020-03-13 06:56:28.403036', 0, '鸡肉', '<p><span style=\"font-size: 10px;\"><strong>鸡肉</strong></span></p>');
INSERT INTO `df_goods` VALUES (15, '2020-03-13 06:56:34.483720', '2020-03-13 06:56:34.483750', 0, '鸭蛋', '<p><span style=\"font-size: 10px;\"><strong>鸭蛋</strong></span></p>');
INSERT INTO `df_goods` VALUES (16, '2020-03-13 06:56:40.561925', '2020-03-13 06:56:40.561972', 0, '鸡腿', '<p><span style=\"font-size: 10px;\"><strong>鸡腿</strong></span></p>');
INSERT INTO `df_goods` VALUES (17, '2020-03-13 06:56:48.513355', '2020-03-13 06:56:48.513401', 0, '白菜', '<p><span style=\"font-size: 10px;\"><strong>白菜</strong></span></p>');
INSERT INTO `df_goods` VALUES (18, '2020-03-13 06:56:56.256379', '2020-03-13 06:56:56.256412', 0, '芹菜', '<p><span style=\"font-size: 10px;\"><strong>芹菜</strong></span></p>');
INSERT INTO `df_goods` VALUES (19, '2020-03-13 06:57:02.617696', '2020-03-13 06:57:02.617732', 0, '香菜', '<p><span style=\"font-size: 10px;\"><strong>香菜</strong></span></p>');
INSERT INTO `df_goods` VALUES (20, '2020-03-13 06:57:11.647264', '2020-03-13 06:57:11.647299', 0, '冬瓜', '<p><strong><span style=\"font-size: 10px;\">冬瓜</span></strong></p>');
INSERT INTO `df_goods` VALUES (21, '2020-03-13 06:57:18.836699', '2020-03-13 06:57:18.836730', 0, '鱼丸', '<p><span style=\"font-size: 10px;\"><strong>鱼丸</strong></span></p>');
INSERT INTO `df_goods` VALUES (22, '2020-03-13 06:57:27.140095', '2020-03-13 06:57:27.140129', 0, '蟹棒', '<p><strong><span style=\"font-size: 10px;\">蟹棒</span></strong></p>');
INSERT INTO `df_goods` VALUES (23, '2020-03-13 06:57:34.192062', '2020-03-13 06:57:34.192095', 0, '虾丸', '<p><span style=\"font-size: 10px;\"><strong>虾丸</strong></span></p>');
INSERT INTO `df_goods` VALUES (24, '2020-03-13 06:57:40.542713', '2020-03-13 06:57:40.542768', 0, '速冻水饺', '<p><span style=\"font-size: 10px;\"><strong>速冻水饺</strong></span></p>');
INSERT INTO `df_goods` VALUES (25, '2020-03-13 06:57:48.737116', '2020-03-13 06:57:48.737151', 0, '芒果', '<p><span style=\"font-size: 10px;\"><strong>芒果</strong></span></p>');
INSERT INTO `df_goods` VALUES (26, '2020-03-13 06:57:55.273317', '2020-03-13 06:57:55.273352', 0, '鹌鹑蛋', '<p><span style=\"font-size: 10px;\"><strong>鹌鹑蛋</strong></span></p>');
INSERT INTO `df_goods` VALUES (27, '2020-03-13 06:58:01.586741', '2020-03-13 06:58:01.586773', 0, '鹅蛋', '<p><span style=\"font-size: 10px;\"><strong>鹅蛋</strong></span></p>');
INSERT INTO `df_goods` VALUES (28, '2020-03-13 06:58:11.175612', '2020-03-13 06:58:11.175744', 0, '红辣椒', '<p><span style=\"font-size: 10px;\"><strong>红辣椒</strong></span></p>');
COMMIT;

-- ----------------------------
-- Table structure for df_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_image`;
CREATE TABLE `df_goods_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_image_sku_id_f8dc96ea_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_goods_image_sku_id_f8dc96ea_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for df_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_sku`;
CREATE TABLE `df_goods_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `desc` varchar(256) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unite` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_sku_type_id_576de3b4_fk_df_goods_type_id` (`type_id`),
  KEY `df_goods_sku_goods_id_31622280_fk_df_goods_id` (`goods_id`),
  CONSTRAINT `df_goods_sku_goods_id_31622280_fk_df_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods` (`id`),
  CONSTRAINT `df_goods_sku_type_id_576de3b4_fk_df_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `df_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_sku
-- ----------------------------
BEGIN;
INSERT INTO `df_goods_sku` VALUES (1, '2020-03-13 07:14:25.204040', '2020-03-13 07:14:25.204078', 0, '草莓 500g', '草莓简介', 10.00, '500g', 'goods/goods_detail.jpg', 100, 0, 1, 1, 2);
INSERT INTO `df_goods_sku` VALUES (2, '2020-03-13 07:15:49.192771', '2020-03-13 07:15:49.192811', 0, '盒装草莓', '盒装草莓', 20.00, '盒', 'goods/goods003.jpg', 20, 0, 1, 1, 2);
INSERT INTO `df_goods_sku` VALUES (3, '2020-03-13 07:16:33.374589', '2020-03-13 07:16:33.374627', 0, '葡萄', '葡萄简介', 20.00, '500g', 'goods/goods002.jpg', 100, 0, 1, 2, 2);
INSERT INTO `df_goods_sku` VALUES (4, '2020-03-13 07:17:42.343814', '2020-03-13 07:17:42.343854', 0, '柠檬', '柠檬简介', 5.00, '个', 'goods/goods001.jpg', 100, 0, 1, 3, 2);
INSERT INTO `df_goods_sku` VALUES (5, '2020-03-13 07:18:44.048981', '2020-03-13 07:18:44.049055', 0, '扇贝', '扇贝简介', 30.00, '500g', 'goods/goods019.jpg', 100, 0, 1, 7, 2);
INSERT INTO `df_goods_sku` VALUES (6, '2020-03-13 08:40:43.777991', '2020-03-13 08:40:43.778076', 0, '大青虾', '大青虾简介', 50.00, '500g', 'goods/goods021.jpg', 100, 0, 1, 5, 3);
INSERT INTO `df_goods_sku` VALUES (7, '2020-03-13 08:41:18.241647', '2020-03-13 08:41:18.241681', 0, '基围虾', '基围虾简介', 100.00, '500g', 'goods/goods018.jpg', 100, 0, 1, 8, 3);
COMMIT;

-- ----------------------------
-- Table structure for df_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_type`;
CREATE TABLE `df_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_type
-- ----------------------------
BEGIN;
INSERT INTO `df_goods_type` VALUES (2, '2020-03-13 06:07:04.236262', '2020-03-13 06:07:04.236298', 0, '新鲜水果', 'fruit', 'type/banner01.jpg');
INSERT INTO `df_goods_type` VALUES (3, '2020-03-13 06:17:47.887096', '2020-03-13 06:17:47.887135', 0, '海鲜水产', 'seafood', 'type/banner02.jpg');
INSERT INTO `df_goods_type` VALUES (4, '2020-03-13 06:18:16.006237', '2020-03-13 06:18:16.006274', 0, '猪牛羊肉', 'meet', 'type/banner03.jpg');
INSERT INTO `df_goods_type` VALUES (5, '2020-03-13 06:18:31.302129', '2020-03-13 06:18:31.302205', 0, '禽类蛋品', 'egg', 'type/banner04.jpg');
INSERT INTO `df_goods_type` VALUES (6, '2020-03-13 06:18:45.911851', '2020-03-13 06:18:45.911887', 0, '新鲜蔬菜', 'vegetables', 'type/banner05.jpg');
INSERT INTO `df_goods_type` VALUES (7, '2020-03-13 06:18:56.023964', '2020-03-13 06:18:56.024001', 0, '速冻食品', 'ice', 'type/banner06.jpg');
COMMIT;

-- ----------------------------
-- Table structure for df_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `df_index_banner`;
CREATE TABLE `df_index_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_banner_sku_id_57f2798e_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_index_banner_sku_id_57f2798e_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_index_banner
-- ----------------------------
BEGIN;
INSERT INTO `df_index_banner` VALUES (1, '2020-03-13 07:22:03.704618', '2020-03-13 07:22:03.704656', 0, 'banner/slide.jpg', 0, 1);
INSERT INTO `df_index_banner` VALUES (2, '2020-03-13 07:22:13.194905', '2020-03-13 07:22:47.842329', 0, 'banner/slide02.jpg', 1, 3);
INSERT INTO `df_index_banner` VALUES (3, '2020-03-13 07:22:26.952328', '2020-03-13 07:22:26.952364', 0, 'banner/slide03.jpg', 2, 4);
INSERT INTO `df_index_banner` VALUES (4, '2020-03-13 07:22:37.177501', '2020-03-13 07:22:37.177549', 0, 'banner/slide04.jpg', 3, 5);
COMMIT;

-- ----------------------------
-- Table structure for df_index_promotion
-- ----------------------------
DROP TABLE IF EXISTS `df_index_promotion`;
CREATE TABLE `df_index_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_index_promotion
-- ----------------------------
BEGIN;
INSERT INTO `df_index_promotion` VALUES (1, '2020-03-13 08:22:04.170160', '2020-03-13 08:22:04.170197', 0, '吃货暑假趴', 'https://www.jd.com/', 'banner/adv01.jpg', 0);
INSERT INTO `df_index_promotion` VALUES (2, '2020-03-13 08:22:44.262449', '2020-03-13 08:22:44.262487', 0, '零食保健0元抢', 'https://www.suning.com/', 'banner/adv02.jpg', 1);
COMMIT;

-- ----------------------------
-- Table structure for df_index_type_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_index_type_goods`;
CREATE TABLE `df_index_type_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `display_type` smallint(6) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_type_goods_sku_id_0a8a17db_fk_df_goods_sku_id` (`sku_id`),
  KEY `df_index_type_goods_type_id_35192ffd_fk_df_goods_type_id` (`type_id`),
  CONSTRAINT `df_index_type_goods_sku_id_0a8a17db_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`),
  CONSTRAINT `df_index_type_goods_type_id_35192ffd_fk_df_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `df_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_index_type_goods
-- ----------------------------
BEGIN;
INSERT INTO `df_index_type_goods` VALUES (1, '2020-03-13 08:37:05.358034', '2020-03-13 08:37:05.358068', 0, 1, 1, 1, 2);
INSERT INTO `df_index_type_goods` VALUES (2, '2020-03-13 08:37:34.582071', '2020-03-13 08:37:34.582106', 0, 0, 2, 1, 2);
INSERT INTO `df_index_type_goods` VALUES (3, '2020-03-13 08:37:48.911398', '2020-03-13 08:37:48.911437', 0, 1, 1, 5, 3);
INSERT INTO `df_index_type_goods` VALUES (4, '2020-03-13 08:38:04.976099', '2020-03-13 08:38:04.976140', 0, 1, 3, 3, 2);
INSERT INTO `df_index_type_goods` VALUES (5, '2020-03-13 08:38:12.400021', '2020-03-13 08:38:12.400058', 0, 1, 4, 4, 2);
COMMIT;

-- ----------------------------
-- Table structure for df_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_order_goods`;
CREATE TABLE `df_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_goods_order_id_6958ee23_fk_df_order_info_order_id` (`order_id`),
  KEY `df_order_goods_sku_id_b7d6e04e_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_order_goods_order_id_6958ee23_fk_df_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `df_order_info` (`order_id`),
  CONSTRAINT `df_order_goods_sku_id_b7d6e04e_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for df_order_info
-- ----------------------------
DROP TABLE IF EXISTS `df_order_info`;
CREATE TABLE `df_order_info` (
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `pay_method` smallint(6) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `transit_price` decimal(10,2) NOT NULL,
  `order_status` smallint(6) NOT NULL,
  `trade_no` varchar(128) NOT NULL,
  `addr_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `df_order_info_addr_id_70c3726e_fk_df_address_id` (`addr_id`),
  KEY `df_order_info_user_id_ac1e5bf5_fk_df_user_id` (`user_id`),
  CONSTRAINT `df_order_info_addr_id_70c3726e_fk_df_address_id` FOREIGN KEY (`addr_id`) REFERENCES `df_address` (`id`),
  CONSTRAINT `df_order_info_user_id_ac1e5bf5_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for df_user
-- ----------------------------
DROP TABLE IF EXISTS `df_user`;
CREATE TABLE `df_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_user
-- ----------------------------
BEGIN;
INSERT INTO `df_user` VALUES (1, '2020-03-11 03:21:02.217720', '2020-03-11 03:21:02.217765', 0, 'czl1', '123', '', '123');
INSERT INTO `df_user` VALUES (2, '2020-03-11 03:23:36.788990', '2020-03-11 03:23:36.789033', 0, 'czl2', '123', '', '123');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2020-03-13 05:49:13.802231', '1', '新鲜水果', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (2, '2020-03-13 06:06:51.783599', '1', '新鲜水果', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (3, '2020-03-13 06:07:04.238858', '2', '新鲜水果', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (4, '2020-03-13 06:17:47.890857', '3', '海鲜水产', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (5, '2020-03-13 06:18:16.007714', '4', '猪牛羊肉', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (6, '2020-03-13 06:18:31.303892', '5', '禽类蛋品', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (7, '2020-03-13 06:18:45.913343', '6', '新鲜蔬菜', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (8, '2020-03-13 06:18:56.025542', '7', '速冻食品', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (9, '2020-03-13 06:53:38.250003', '1', 'Goods object (1)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (10, '2020-03-13 06:53:53.854765', '2', 'Goods object (2)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (11, '2020-03-13 06:54:01.126674', '3', 'Goods object (3)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (12, '2020-03-13 06:54:08.538471', '4', 'Goods object (4)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (13, '2020-03-13 06:54:18.252041', '5', 'Goods object (5)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (14, '2020-03-13 06:54:27.141399', '6', 'Goods object (6)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (15, '2020-03-13 06:54:34.643272', '7', 'Goods object (7)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (16, '2020-03-13 06:54:41.711456', '8', 'Goods object (8)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (17, '2020-03-13 06:54:51.186178', '9', 'Goods object (9)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (18, '2020-03-13 06:55:00.057089', '10', 'Goods object (10)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (19, '2020-03-13 06:55:10.749283', '11', 'Goods object (11)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (20, '2020-03-13 06:56:10.093706', '12', 'Goods object (12)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (21, '2020-03-13 06:56:19.150565', '13', 'Goods object (13)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (22, '2020-03-13 06:56:28.403929', '14', 'Goods object (14)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (23, '2020-03-13 06:56:34.484562', '15', 'Goods object (15)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (24, '2020-03-13 06:56:40.615161', '16', 'Goods object (16)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (25, '2020-03-13 06:56:48.515049', '17', 'Goods object (17)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (26, '2020-03-13 06:56:56.257292', '18', 'Goods object (18)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (27, '2020-03-13 06:57:02.618869', '19', 'Goods object (19)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (28, '2020-03-13 06:57:11.648460', '20', 'Goods object (20)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (29, '2020-03-13 06:57:18.837452', '21', 'Goods object (21)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (30, '2020-03-13 06:57:27.140974', '22', 'Goods object (22)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (31, '2020-03-13 06:57:34.193036', '23', 'Goods object (23)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (32, '2020-03-13 06:57:40.544855', '24', 'Goods object (24)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (33, '2020-03-13 06:57:48.738980', '25', 'Goods object (25)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (34, '2020-03-13 06:57:55.276145', '26', 'Goods object (26)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (35, '2020-03-13 06:58:01.588612', '27', 'Goods object (27)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (36, '2020-03-13 06:58:11.177869', '28', 'Goods object (28)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (37, '2020-03-13 07:14:25.215056', '1', 'GoodsSKU object (1)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (38, '2020-03-13 07:15:49.195724', '2', 'GoodsSKU object (2)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (39, '2020-03-13 07:16:33.377673', '3', 'GoodsSKU object (3)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (40, '2020-03-13 07:17:42.345624', '4', 'GoodsSKU object (4)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (41, '2020-03-13 07:18:44.051035', '5', 'GoodsSKU object (5)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (42, '2020-03-13 07:22:03.709754', '1', 'IndexGoodsBanner object (1)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (43, '2020-03-13 07:22:13.197753', '2', 'IndexGoodsBanner object (2)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (44, '2020-03-13 07:22:26.954028', '3', 'IndexGoodsBanner object (3)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (45, '2020-03-13 07:22:37.179715', '4', 'IndexGoodsBanner object (4)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (46, '2020-03-13 07:22:47.852769', '2', 'IndexGoodsBanner object (2)', 2, '[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (47, '2020-03-13 08:22:04.173096', '1', 'IndexPromotionBanner object (1)', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (48, '2020-03-13 08:22:44.264389', '2', 'IndexPromotionBanner object (2)', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (49, '2020-03-13 08:37:05.361388', '1', 'IndexTypeGoodsBanner object (1)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (50, '2020-03-13 08:37:34.583100', '2', 'IndexTypeGoodsBanner object (2)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (51, '2020-03-13 08:37:48.914475', '3', 'IndexTypeGoodsBanner object (3)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (52, '2020-03-13 08:38:04.977824', '4', 'IndexTypeGoodsBanner object (4)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (53, '2020-03-13 08:38:12.403386', '5', 'IndexTypeGoodsBanner object (5)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (54, '2020-03-13 08:40:43.780173', '6', '大青虾', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (55, '2020-03-13 08:41:18.243173', '7', '基围虾', 1, '[{\"added\": {}}]', 12, 1);
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (11, 'goods', 'goods');
INSERT INTO `django_content_type` VALUES (17, 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES (12, 'goods', 'goodssku');
INSERT INTO `django_content_type` VALUES (13, 'goods', 'goodstype');
INSERT INTO `django_content_type` VALUES (16, 'goods', 'indexgoodsbanner');
INSERT INTO `django_content_type` VALUES (14, 'goods', 'indexpromotionbanner');
INSERT INTO `django_content_type` VALUES (15, 'goods', 'indextypegoodsbanner');
INSERT INTO `django_content_type` VALUES (10, 'order', 'ordergoods');
INSERT INTO `django_content_type` VALUES (9, 'order', 'orderinfo');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'user', 'address');
INSERT INTO `django_content_type` VALUES (7, 'user', 'user');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-03-10 03:19:11.286887');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-03-10 03:19:11.580975');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-03-10 03:19:12.040786');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-03-10 03:19:12.120112');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-03-10 03:19:12.145729');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-03-10 03:19:12.237908');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-03-10 03:19:12.285113');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-03-10 03:19:12.334479');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-03-10 03:19:12.356403');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-03-10 03:19:12.410697');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-03-10 03:19:12.425496');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-03-10 03:19:12.457438');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-03-10 03:19:12.531847');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-03-10 03:19:12.587399');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-03-10 03:19:12.645159');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-03-10 03:19:12.677125');
INSERT INTO `django_migrations` VALUES (17, 'goods', '0001_initial', '2020-03-10 03:19:13.047747');
INSERT INTO `django_migrations` VALUES (18, 'user', '0001_initial', '2020-03-10 03:19:13.320342');
INSERT INTO `django_migrations` VALUES (19, 'order', '0001_initial', '2020-03-10 03:19:13.484487');
INSERT INTO `django_migrations` VALUES (20, 'sessions', '0001_initial', '2020-03-10 03:19:13.644500');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('4hqyom0wnyjutyyxmkisv5cbcsp16s4d', 'NmE5NTg4ZGE2NWYyZDQ4NDdkNTM2ZDg2OGM5N2VmMWVjNWEyNTEwMDp7InVzZXJuYW1lIjoiY3psMSIsInVzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YWJiMjdkNjk5YTRlYjdhNmQ5Y2RkNTY4MjA0YjRjY2NjZDU3MjA2In0=', '2020-03-27 06:14:30.769770');
INSERT INTO `django_session` VALUES ('fmmjsphgsq0n1ak36tggc7yt6j6fezmw', 'NmE5NTg4ZGE2NWYyZDQ4NDdkNTM2ZDg2OGM5N2VmMWVjNWEyNTEwMDp7InVzZXJuYW1lIjoiY3psMSIsInVzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YWJiMjdkNjk5YTRlYjdhNmQ5Y2RkNTY4MjA0YjRjY2NjZDU3MjA2In0=', '2020-03-27 03:08:14.223750');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
