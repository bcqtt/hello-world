-- --------------------------------------------------------
-- 主机:                           18.8.6.139
-- 服务器版本:                        5.5.49-0ubuntu0.14.04.1 - (Ubuntu)
-- 服务器操作系统:                      debian-linux-gnu
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 search 的数据库结构
DROP DATABASE IF EXISTS `search`;
CREATE DATABASE IF NOT EXISTS `search` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `search`;


-- 导出  表 search.account 结构
DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(50) NOT NULL COMMENT '账号名，用于登陆',
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `type` int(11) DEFAULT NULL COMMENT '1::管理员；0:超级管理员/普通用户',
  `description` varchar(200) DEFAULT NULL COMMENT '账户描述',
  `group_id` int(11) DEFAULT NULL COMMENT '分组id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='用户账号表';

-- 正在导出表  search.account 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `account_name`, `name`, `password`, `phone_number`, `email`, `type`, `description`, `group_id`, `create_time`, `last_login_time`) VALUES
	(1, 'root', 'root', 'e10adc3949ba59abbe56e057f20f883e', '13763033450', 'abc@123.com', NULL, NULL, 1, '2016-05-09 18:14:25', '2016-04-18 17:08:13'),
	(2, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '18218089328', 'laizhiwen@ginoee.com', NULL, NULL, 1, NULL, '2017-01-04 10:24:54'),
	(35, 'lzw', '赖志文', '4607e782c4d86fd5364d7e4508bb10d9', '12345678910', 'lzw@ginoee.com', NULL, NULL, 1, '2016-05-09 18:14:30', '2016-05-10 13:44:41'),
	(41, 'liuyb', '刘艳波', 'e10adc3949ba59abbe56e057f20f883e', '', '', NULL, NULL, 1, '2016-04-18 17:09:22', '2016-05-10 11:52:20');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


-- 导出  表 search.account_role 结构
DROP TABLE IF EXISTS `account_role`;
CREATE TABLE IF NOT EXISTS `account_role` (
  `account_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  search.account_role 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` (`account_id`, `role_id`) VALUES
	(2, 1),
	(5, 8),
	(15, 2),
	(31, 3),
	(32, 4),
	(35, 2),
	(36, 2),
	(38, 2),
	(39, 5),
	(40, 4),
	(41, 2);
/*!40000 ALTER TABLE `account_role` ENABLE KEYS */;


-- 导出  表 search.ad_behavior 结构
DROP TABLE IF EXISTS `ad_behavior`;
CREATE TABLE IF NOT EXISTS `ad_behavior` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `behavior` varchar(50) DEFAULT NULL,
  `is_download_app` int(10) unsigned DEFAULT NULL COMMENT '0:不下载应用，1:下载应用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告行为';

-- 正在导出表  search.ad_behavior 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `ad_behavior` DISABLE KEYS */;
INSERT INTO `ad_behavior` (`id`, `behavior`, `is_download_app`) VALUES
	(1, '打开网页', 0),
	(2, '启动应用', 0),
	(3, '下载应用', 1);
/*!40000 ALTER TABLE `ad_behavior` ENABLE KEYS */;


-- 导出  表 search.ad_behavior_todo 结构
DROP TABLE IF EXISTS `ad_behavior_todo`;
CREATE TABLE IF NOT EXISTS `ad_behavior_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_behavior_id` int(11) DEFAULT '0',
  `ad_id` int(11) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `app_name` varchar(100) DEFAULT NULL COMMENT '是下载应用时必填',
  PRIMARY KEY (`id`),
  KEY `FK_ad_behavior_todo_ad_behavior` (`ad_behavior_id`),
  KEY `FK_ad_behavior_todo_ad_info` (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='广告行为的动作';

-- 正在导出表  search.ad_behavior_todo 的数据：~19 rows (大约)
/*!40000 ALTER TABLE `ad_behavior_todo` DISABLE KEYS */;
INSERT INTO `ad_behavior_todo` (`id`, `ad_behavior_id`, `ad_id`, `url`, `app_name`) VALUES
	(1, 1, 1, NULL, NULL),
	(2, 3, 2, NULL, NULL),
	(3, 2, 3, NULL, NULL),
	(4, 1, 13, NULL, NULL),
	(5, 1, 8, NULL, NULL),
	(6, 1, 11, NULL, NULL),
	(7, 1, 4, NULL, NULL),
	(8, 2, NULL, 'http://localhost:8080/search_local/login/login#menu_ad_manage', NULL),
	(9, NULL, NULL, NULL, NULL),
	(10, 1, NULL, 'http://localhost:8080/search_local/login/login#menu_ad_manage', NULL),
	(11, 1, 20, NULL, NULL),
	(12, 3, 5, NULL, NULL),
	(13, 2, 19, NULL, NULL),
	(14, 1, 10, NULL, NULL),
	(15, 3, 9, NULL, NULL),
	(16, 1, 14, NULL, NULL),
	(17, 1, 15, NULL, NULL),
	(18, 2, 18, NULL, NULL),
	(19, 1, NULL, 'http://localhost:8080/search_local/login/login#menu_ad_manage', NULL);
/*!40000 ALTER TABLE `ad_behavior_todo` ENABLE KEYS */;


-- 导出  表 search.ad_classify 结构
DROP TABLE IF EXISTS `ad_classify`;
CREATE TABLE IF NOT EXISTS `ad_classify` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='广告分类';

-- 正在导出表  search.ad_classify 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `ad_classify` DISABLE KEYS */;
INSERT INTO `ad_classify` (`cid`, `cname`) VALUES
	(1, '女装'),
	(2, '汽车'),
	(3, '游戏'),
	(13, '学习用品'),
	(15, '阿里云'),
	(16, '糖果'),
	(17, '电脑'),
	(18, '花卉'),
	(19, '家居'),
	(20, '婚庆'),
	(21, '55'),
	(22, '66'),
	(23, '1111'),
	(24, '22222'),
	(25, '运动鞋');
/*!40000 ALTER TABLE `ad_classify` ENABLE KEYS */;


-- 导出  表 search.ad_control 结构
DROP TABLE IF EXISTS `ad_control`;
CREATE TABLE IF NOT EXISTS `ad_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `show_flag` int(11) DEFAULT '0',
  `position_id` int(11) DEFAULT NULL,
  `ad_img` varchar(300) DEFAULT NULL,
  `ad_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='广告信息表';

-- 正在导出表  search.ad_control 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `ad_control` DISABLE KEYS */;
INSERT INTO `ad_control` (`id`, `name`, `show_flag`, `position_id`, `ad_img`, `ad_url`) VALUES
	(1, '首页广告', 1, 4, 'http://t-baserom.gionee.com/images/banner1.png', 'youku://play?vid=XMTc3MTg1ODg4MA&source=bdhz-jinli&pkg=com.youku.phone.jinli&minVersion=5.2.21'),
	(2, '游戏频道广告', 1, 1, 'http://t-baserom.gionee.com/images/banner2.png', 'http://m.appgionee.com/mobile/soft/detail?fr=gn_search_h5&id=12052'),
	(3, '应用频道广告', 1, 3, 'http://t-baserom.gionee.com/images/banner3.png', 'http://m.appgionee.com/mobile/soft/detail?fr=gn_search_h5&id=140354'),
	(4, '综合搜索页广告', 1, 4, 'http://t-baserom.gionee.com/images/banner4.png', 'http://www.3g.gionee.com'),
	(5, '综合搜索结果页广告', 1, 5, 'http://t-baserom.gionee.com/images/banner5.png', 'youku://play?vid=12345&source=bdhz-jinli&pkg=com.youku.phone.jinli&minVersion=5.2.21&action=android.intent.action.VIEW'),
	(6, '结果页短信广告', 0, 2, 'http://photocdn.sohu.com/20161020/Img470743132.jpg', 'http://digi.it.sohu.com/20161020/n470743129.shtml'),
	(7, '结果页软件商店广告', 1, 2, 'http://d.ifengimg.com/mw978_mh598/p2.ifengimg.com/cmpp/2016/10/23/00/16ef4399-231f-414d-8f89-2783d3dbfa4e_size95_w950_h633.jpg', 'gioneeTing://openFind?pkg=com.ximalaya.ting.android.gionee&title=你好&content=最熟悉的“暖”旋律&minVersion=1.4.5'),
	(8, '结果页游戏大厅广告', 1, 3, 'http://d.ifengimg.com/mw978_mh598/p2.ifengimg.com/cmpp/2016/10/23/00/16ef4399-231f-414d-8f89-2783d3dbfa4e_size95_w950_h633.jpg', 'http://www.3g.gionee.com'),
	(9, '结果页多媒体广告', 1, 7, 'http://d.ifengimg.com/mw978_mh598/p2.ifengimg.com/cmpp/2016/10/23/00/16ef4399-231f-414d-8f89-2783d3dbfa4e_size95_w950_h633.jpg', 'http://www.3g.gionee.com'),
	(10, '结果页联想词广告', 1, 8, 'http://d.ifengimg.com/mw978_mh598/p2.ifengimg.com/cmpp/2016/10/23/00/16ef4399-231f-414d-8f89-2783d3dbfa4e_size95_w950_h633.jpg', 'http://www.3g.gionee.com'),
	(11, '结果页淘宝商搜广告', 1, 9, 'http://d.ifengimg.com/mw978_mh598/p2.ifengimg.com/cmpp/2016/10/23/00/16ef4399-231f-414d-8f89-2783d3dbfa4e_size95_w950_h633.jpg', 'http://www.3g.gionee.com');
/*!40000 ALTER TABLE `ad_control` ENABLE KEYS */;


-- 导出  表 search.ad_display_rule 结构
DROP TABLE IF EXISTS `ad_display_rule`;
CREATE TABLE IF NOT EXISTS `ad_display_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_position` varchar(50) DEFAULT NULL COMMENT '广告位',
  `dic_id` int(11) DEFAULT NULL COMMENT '广告形式(字典数据)',
  `min_weight` int(11) DEFAULT NULL COMMENT '最小权重',
  `max_weight` int(11) DEFAULT NULL COMMENT '最大权重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='展示规则';

-- 正在导出表  search.ad_display_rule 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `ad_display_rule` DISABLE KEYS */;
INSERT INTO `ad_display_rule` (`id`, `ad_position`, `dic_id`, `min_weight`, `max_weight`) VALUES
	(1, '首页广告位', 27, 10, 50),
	(2, '游戏频道广告位', 27, 10, 50),
	(3, '应用频道广告位', 27, 10, 50),
	(4, '综合搜索页广告位', 27, 10, 50),
	(5, '综合搜索结果页广告位', 27, 10, 50),
	(6, '结果页软件商店广告位', 27, 10, 50),
	(7, '结果页游戏大厅广告位', 27, 10, 50),
	(8, '结果页多媒体广告位', 27, 10, 50),
	(9, '结果页联想词广告位', 27, 10, 50),
	(10, '结果页淘宝商搜广告位', 27, 10, 50);
/*!40000 ALTER TABLE `ad_display_rule` ENABLE KEYS */;


-- 导出  表 search.ad_info 结构
DROP TABLE IF EXISTS `ad_info`;
CREATE TABLE IF NOT EXISTS `ad_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_rule_id` int(11) DEFAULT NULL COMMENT '广规则ID(广告规则表)',
  `ad_tittle` varchar(100) DEFAULT NULL COMMENT '广告标题',
  `show_tittle_flag` int(11) DEFAULT '0' COMMENT '0:不显示标题，1:显示标题',
  `cp_name` varchar(100) DEFAULT NULL COMMENT 'CP名称',
  `specification` int(11) DEFAULT NULL COMMENT '广告规格(字典数据)',
  `ad_image_path` varchar(200) DEFAULT NULL COMMENT '广告图链接',
  `ad_behavior_id` int(11) DEFAULT NULL COMMENT '广告行为(广告行为表)',
  `ad_classify_id` int(11) DEFAULT NULL COMMENT '广告分类(广告分类表)',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `keyword_setting` int(11) DEFAULT '0' COMMENT '0:不限(默认)，1:自定义',
  `keyword` varchar(500) DEFAULT NULL COMMENT '关键词(关键词表)',
  `billing_type` int(11) DEFAULT NULL COMMENT '付费方式(字典数据)',
  `unit_price` float DEFAULT NULL COMMENT '单价',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  `version` varchar(300) DEFAULT NULL COMMENT '版本(字典数据)，以","分隔，默认null为不限',
  `mechine_type` varchar(300) DEFAULT NULL COMMENT '机型(字典数据)，以","分隔，默认null为不限',
  PRIMARY KEY (`id`),
  KEY `FK_ad_info_ad_behavior` (`ad_behavior_id`),
  KEY `FK_ad_info_ad_classify` (`ad_classify_id`),
  KEY `FK_ad_info_ad_display_rule` (`ad_rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='广告信息表';

-- 正在导出表  search.ad_info 的数据：~16 rows (大约)
/*!40000 ALTER TABLE `ad_info` DISABLE KEYS */;
INSERT INTO `ad_info` (`id`, `ad_rule_id`, `ad_tittle`, `show_tittle_flag`, `cp_name`, `specification`, `ad_image_path`, `ad_behavior_id`, `ad_classify_id`, `start_time`, `end_time`, `keyword_setting`, `keyword`, `billing_type`, `unit_price`, `weight`, `version`, `mechine_type`) VALUES
	(1, 1, '广告标题已修改5656', 1, '修改修改111', 5, '/upload/2016/12/20/round_corner_image_by_atool.png', 1, 1, '2016-12-16 13:46:20', '2017-01-06 13:46:22', 1, '32,157,137,186', 1, 1.2, 12, '2,3,5', '19,20,21,22,18'),
	(2, 1, '12打发地方214额我的', NULL, '烦烦烦', 4, '/upload/2016/12/20/KV-640x300.jpg', 3, 2, '2016-12-09 09:21:00', '2016-12-20 09:21:03', NULL, '', 1, 12.2, 454, '2,5,6', '19,20,21,22,18'),
	(3, 1, '今天天气很好呀', NULL, '改一下12', 5, '/upload/2016/12/20/banner_shengbei.png', 2, 3, '2016-12-16 13:46:09', '2016-12-24 13:46:11', NULL, '', 1, 0.3, 45, '3,5,6', '19,20,21,22,18'),
	(4, 1, '京东快递，多快好省！', 1, '快递', 5, '/upload/2016/12/20/360video.png', 1, 13, '2016-12-09 11:00:23', '2016-12-13 11:00:25', NULL, '', 1, 1.3, 45, '3,5', '19,20,21,22,18'),
	(5, 1, 'layer官方演示与讲解(jQuery弹出层插件)', NULL, '产品名称', 5, '/upload/2016/12/20/1218-1.jpg', 3, 15, '2016-12-16 13:45:59', '2016-12-31 13:46:01', NULL, '', 1, 0.1, 78, '1,2,3,5,6', '19,20,21,22,18'),
	(8, 1, '5折天天抢，0元抽奖赢手机', NULL, '产品名称', 5, '/upload/2016/12/20/1218-3.jpg', 1, 1, '2016-12-30 11:19:27', '2017-01-04 11:19:29', NULL, '', 1, 1.3, 23, '1,2,3,5,6', '19,20,21,22'),
	(9, 1, '【打开应用】5折天天抢，0元抽奖赢手机', 1, '产品名称', 5, '/upload/2016/12/20/1218-2.jpg', 3, 1, '2016-12-09 10:50:18', '2016-12-15 10:50:20', NULL, '', 1, 1.3, 23, '1,2,3,5,6', '19,20,21,22,18'),
	(10, 1, '标题标题标题标题标题标题标题标题', NULL, '天假广告', 5, '/upload/2016/12/20/1218-5.jpg', 1, 1, '2016-12-09 11:34:37', '2016-12-10 11:34:39', NULL, '', 1, 12.2, 50, '1,2,3,5,6', '19,22,18'),
	(11, 1, '选中版本的测试', NULL, '产品名称', 5, '/upload/2016/12/20/1218-3.jpg', 1, 1, '2016-12-12 11:08:10', '2016-12-25 11:08:11', NULL, '', 12, 0.2, 78, '1,2,3,5,6', '19,20,18'),
	(13, 1, '测试测试', NULL, '测试', 5, '/upload/2016/12/20/1218-4.jpg', 1, 1, '2016-12-13 11:12:35', '2016-12-30 11:12:38', NULL, '', 1, 1.3, 45, '1,2,3,5,6', '19,20'),
	(14, 1, '成为往事', NULL, '产品名称', 4, '/upload/2016/12/20/QQ截图20161220113312.png', 1, 1, '2016-12-12 11:33:39', '2016-12-28 11:33:41', NULL, '', 1, 2.2, 45, '1,2,3,5,6', '19,20,21'),
	(15, 2, '12打发地方214额我的', NULL, '产品名称', 4, '/upload/2016/12/20/CQ_Bug_Info.png', 1, 1, '2016-12-12 11:43:27', '2016-12-15 11:43:29', NULL, '', 1, 0.3, 45, '1,2,3,5,6', '19,20,21'),
	(18, 1, '有关键字的广告  非常昂棒', NULL, '测试', 5, '/upload/2016/12/20/微信截图_20161212160547.png', 2, 1, '2016-12-15 14:12:02', '2016-12-17 14:12:03', 1, '123,126,117,110,113', 1, 0.2, 3, '1,2,3,5,6', '19,20'),
	(19, 1, '测试都不知道啥都不知道啥都不知道啥', 1, '都不知道啥', 5, '/upload/2016/12/20/dog.jpg', 2, 1, '2016-12-16 13:44:19', '2016-12-19 13:44:21', 1, '699', 1, 0.1, 45, '1,2,3,5,6', '20,22'),
	(20, 3, '车道22', NULL, '测试1', 5, '/upload/2016/12/20/拓扑图.png', 1, 1, '2016-12-15 16:47:19', '2016-12-18 16:47:20', 1, '111,122,126,112', 1, 0.1, 3, '3,5', '20'),
	(21, NULL, '测试添加', NULL, '测试添加', NULL, '/upload/2016/12/21/1222-3.jpg', 1, 1, '2016-12-21 15:05:42', '2016-12-23 15:05:43', 1, '29,699,503,32', 1, 0.3, 55, '2,5', '20,21');
/*!40000 ALTER TABLE `ad_info` ENABLE KEYS */;


-- 导出  表 search.ad_keyword 结构
DROP TABLE IF EXISTS `ad_keyword`;
CREATE TABLE IF NOT EXISTS `ad_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(50) NOT NULL COMMENT '关键字唯一',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=708 DEFAULT CHARSET=utf8;

-- 正在导出表  search.ad_keyword 的数据：~846 rows (大约)
/*!40000 ALTER TABLE `ad_keyword` DISABLE KEYS */;
INSERT INTO `ad_keyword` (`id`, `keyword`) VALUES
	(516, '131458信誉查询'),
	(242, '1905电影网'),
	(635, '360团购'),
	(628, '360时空猎人'),
	(528, '51自学网'),
	(29, '51返利网'),
	(699, '800团购'),
	(663, '80s电影网'),
	(366, '85度c'),
	(503, '91时空猎人'),
	(32, 'acca'),
	(182, 'ake小包子'),
	(273, 'alt'),
	(331, 'apple id'),
	(411, 'b2b'),
	(277, 'big笑工坊官网'),
	(157, 'c++'),
	(487, 'coco都可茶饮'),
	(584, 'c语言'),
	(325, 'c语言入门'),
	(80, 'c语言程序设计'),
	(495, 'de洗面奶'),
	(37, 'erp系统'),
	(303, 'eva'),
	(563, 'e代驾'),
	(423, 'e代驾官网'),
	(129, 'gre'),
	(12, 'ios'),
	(171, 'ios7.1.2'),
	(342, 'ios8'),
	(295, 'ios8.0.2'),
	(280, 'ios8.1'),
	(47, 'ios8越狱'),
	(84, 'iso'),
	(151, 'joker'),
	(351, 'led'),
	(28, 'logo设计'),
	(227, 'mba'),
	(653, 'office办公软件'),
	(512, 'p2p'),
	(241, 'p2p是什么意思'),
	(414, 'pos'),
	(553, 'pp租车'),
	(226, 'qq网购商城'),
	(687, 'sat'),
	(551, 'ume国际影城'),
	(144, 'voa慢速英语'),
	(682, 'www.1905电影网'),
	(632, '一嗨租车'),
	(428, '一级建造师'),
	(546, '七天连锁酒店'),
	(488, '万达影城'),
	(145, '万达影城影讯'),
	(354, '三国乱世'),
	(225, '三国志'),
	(419, '上海大巴侧翻'),
	(651, '上海旅游'),
	(630, '上海旅游攻略'),
	(558, '上海旅游景点'),
	(272, '上海欢乐谷'),
	(565, '上海虹桥机场'),
	(573, '专升本'),
	(603, '世界之窗'),
	(586, '东方明珠门票'),
	(684, '两只老虎'),
	(475, '中华会计网'),
	(244, '中华古玩网'),
	(300, '中央空调'),
	(33, '中级经济师'),
	(248, '主公莫慌'),
	(601, '丽江旅游'),
	(311, '乌镇住宿'),
	(332, '乌镇旅游攻略'),
	(649, '九寨沟旅游攻略'),
	(667, '九游时空猎人'),
	(53, '买卖宝'),
	(427, '买卖宝商城'),
	(188, '买卖宝货到付款'),
	(518, '二手手机'),
	(519, '二级建造师'),
	(448, '云南旅游'),
	(660, '云海app'),
	(228, '五粮液'),
	(483, '交大豌豆女神'),
	(275, '交易猫时空猎人'),
	(120, '京东商城手机'),
	(568, '京东商城手机版'),
	(111, '京东手机商城'),
	(121, '京西宾馆'),
	(574, '京都商城'),
	(371, '亲子鉴定'),
	(104, '人力资源管理'),
	(695, '代步车'),
	(694, '代驾'),
	(94, '企业邮箱'),
	(57, '优米'),
	(386, '优米手机'),
	(676, '会计'),
	(613, '会计从业资格证'),
	(318, '会计证'),
	(418, '传张歆艺离婚'),
	(485, '余额宝安全吗'),
	(440, '余额宝怎么用'),
	(468, '余额宝有风险吗'),
	(446, '保保网'),
	(31, '保定独立团'),
	(203, '保险查询'),
	(683, '信用卡'),
	(211, '信用卡申请'),
	(218, '信用卡申请技巧'),
	(259, '信用卡申请条件'),
	(513, '信用卡还款'),
	(258, '信用社'),
	(101, '修仙'),
	(453, '健康之路'),
	(319, '健身器材'),
	(179, '健身女神'),
	(262, '儿童服装'),
	(49, '儿童玩具'),
	(436, '光纤'),
	(580, '全民挂机'),
	(89, '全自动洗衣机'),
	(590, '兰花'),
	(478, '关东煮'),
	(48, '养生堂'),
	(424, '养老保险查询'),
	(678, '冰淇淋'),
	(11, '冰箱'),
	(567, '净水器'),
	(444, '净水器十大名牌'),
	(9, '净水器有用吗'),
	(2, '刀塔传奇巫医'),
	(46, '刀塔传奇猴子'),
	(392, '分组发光字'),
	(152, '初一上册数学'),
	(194, '剑魂之刃辅助'),
	(466, '办公软件'),
	(328, '加拿大'),
	(562, '加湿器'),
	(135, '包子'),
	(363, '化妆品代理'),
	(169, '化妆品批发'),
	(375, '化妆步骤'),
	(433, '化妆的正确步骤'),
	(108, '北京旅游'),
	(313, '北京旅游攻略'),
	(439, '北京旅游景点'),
	(662, '北京欢乐谷'),
	(500, '北大青鸟'),
	(201, '北海旅游'),
	(615, '医疗保险'),
	(159, '医疗保险查询'),
	(322, '十一去哪旅游好'),
	(315, '十六番'),
	(499, '千岛湖'),
	(326, '华山门票'),
	(657, '华强北'),
	(177, '南京旅游'),
	(376, '卤肉的做法'),
	(196, '厂家网商城'),
	(677, '厦门旅游'),
	(607, '厨师'),
	(207, '去吧皮卡丘'),
	(288, '去吧皮卡丘官网'),
	(437, '去哪儿旅行'),
	(324, '去哪网'),
	(510, '友乐园'),
	(638, '反利网'),
	(358, '古装婚纱照'),
	(627, '可乐鸡翅的做法'),
	(637, '可可英语'),
	(164, '台儿庄古城'),
	(335, '台湾旅游'),
	(283, '叶璇宠物狗'),
	(541, '司法考试'),
	(491, '后宫的规条'),
	(490, '吸尘器'),
	(380, '周庄古镇'),
	(624, '咖啡'),
	(66, '咖啡之翼'),
	(407, '哈佛大学'),
	(210, '商业银行'),
	(68, '啤酒'),
	(257, '喜宝'),
	(442, '团购'),
	(688, '团购电影票'),
	(616, '团购网'),
	(398, '团购网站大全'),
	(45, '国美'),
	(23, '国考最火职位'),
	(537, '土豪钱多多'),
	(636, '在职研究生'),
	(544, '垃圾处理器'),
	(481, '埃博拉病毒变异'),
	(406, '壹钱包'),
	(233, '多酷时空猎人'),
	(24, '大q'),
	(608, '大q手机'),
	(204, '大众点评'),
	(56, '大众点评网'),
	(612, '大众点评网团购'),
	(63, '大地数字影院'),
	(496, '大理梧桐客栈'),
	(223, '大金空调'),
	(36, '天台山'),
	(415, '天堂寨'),
	(21, '天天格斗'),
	(508, '天天风之旅官网'),
	(124, '天柱山'),
	(648, '天柱山风景区'),
	(399, '天津之眼'),
	(156, '天津旅游'),
	(74, '太古仙域'),
	(560, '太行山大峡谷'),
	(456, '太阳部落'),
	(73, '奇书网'),
	(110, '奔荒纪'),
	(393, '奢侈品'),
	(404, '奶瓶'),
	(434, '好吃妹团购网'),
	(362, '好奇纸尿裤'),
	(484, '如何学好英语'),
	(582, '如家快捷酒店'),
	(504, '如家酒店'),
	(78, '如家酒店官网'),
	(139, '妮维雅男士'),
	(550, '威锋'),
	(3, '威锋网'),
	(99, '威锋论坛'),
	(647, '婚纱'),
	(361, '婚纱图片'),
	(621, '婚纱摄影'),
	(304, '婚纱照'),
	(5, '婚纱照图片唯美'),
	(556, '婚纱照图片大全'),
	(305, '婚纱礼服'),
	(119, '存款利率'),
	(459, '学习英语'),
	(69, '学英语'),
	(644, '学车技巧'),
	(35, '安徽会计网'),
	(54, '宠物狗'),
	(15, '客车'),
	(247, '宾馆'),
	(457, '寿司的做法'),
	(13, '小刀电动车'),
	(60, '小包子'),
	(317, '小吃'),
	(509, '小吃大全'),
	(236, '小吃车'),
	(679, '小提琴'),
	(70, '小梅沙'),
	(658, '尖锐'),
	(700, '尿不湿'),
	(191, '峨眉山门票'),
	(486, '希尔顿酒店'),
	(245, '常州恐龙园'),
	(105, '平安银行官网'),
	(605, '平板'),
	(431, '平板电脑'),
	(137, '平板电脑推荐'),
	(348, '平面设计'),
	(172, '幻听'),
	(596, '幼儿故事'),
	(656, '广东快乐十分'),
	(489, '广告设计'),
	(263, '广州塔'),
	(346, '广州的士'),
	(100, '广西财政会计网'),
	(629, '康辉旅行社'),
	(81, '康辉旅行社官网'),
	(352, '开锁'),
	(50, '开锁技巧'),
	(321, '开锁技术大全'),
	(149, '张家界旅游'),
	(189, '强生'),
	(571, '彩妆'),
	(410, '影讯'),
	(338, '御泥坊官网'),
	(337, '微云网页版'),
	(356, '微信营销'),
	(350, '心理咨询师'),
	(269, '快乐十分'),
	(296, '快递加盟'),
	(450, '快餐'),
	(671, '怎么变白'),
	(6, '怎么学好英语'),
	(285, '怎么画眼线'),
	(27, '怎么让眼睛变大'),
	(158, '怎样学好英语'),
	(309, '恩施大峡谷'),
	(246, '惠普'),
	(264, '成人高考'),
	(154, '成都到九寨沟'),
	(1, '成都旅游'),
	(538, '成都欢乐谷'),
	(505, '我要自学网'),
	(341, '房贷计算器'),
	(65, '手套'),
	(395, '手机'),
	(690, '手机商城'),
	(650, '手机网'),
	(569, '手机贴膜'),
	(205, '托福报名官网'),
	(642, '投影仪'),
	(391, '投影机'),
	(340, '护照办理流程'),
	(670, '护肤品'),
	(493, '披萨'),
	(155, '披萨的做法'),
	(524, '抱枕'),
	(289, '抽风'),
	(697, '抽风crazy'),
	(460, '拉手网团购网'),
	(58, '拉手网团购美食'),
	(595, '拙政园'),
	(141, '挖土机'),
	(674, '捕鱼'),
	(96, '掌柜钱包'),
	(82, '搬家公司'),
	(617, '搬家吉日查询'),
	(176, '携程'),
	(97, '携程旅行'),
	(566, '携程旅行网'),
	(215, '携程机票'),
	(323, '携程网'),
	(482, '携程网机票查询'),
	(405, '携程网酒店预'),
	(107, '携程网酒店预订'),
	(652, '摄影'),
	(445, '摩托罗拉'),
	(192, '放开那三国'),
	(374, '放开那三国官网'),
	(91, '放开那三国橙卡'),
	(10, '整容天后'),
	(623, '斗鱼tv'),
	(88, '斩赤红之瞳'),
	(625, '斯坦福大学'),
	(133, '新世纪影城'),
	(645, '新东方烹饪学校'),
	(469, '新东方英语'),
	(704, '新加坡'),
	(93, '新加坡旅游攻略'),
	(130, '新概念英语'),
	(16, '新西兰'),
	(180, '旅游'),
	(270, '旅游团购网'),
	(34, '旅游攻略'),
	(639, '旅游景点'),
	(514, '旅游景点推荐'),
	(167, '旅游网'),
	(618, '旅行社'),
	(465, '日语'),
	(8, '日语学习'),
	(626, '时空猎人'),
	(597, '时空猎人360'),
	(372, '时空猎人下载'),
	(572, '时空猎人交易猫'),
	(685, '时空猎人多酷'),
	(545, '时空猎人官方版'),
	(474, '时空猎人破解版'),
	(425, '旺财'),
	(432, '星巴克官网'),
	(284, '晋商贷'),
	(229, '晋城在线'),
	(187, '普吉岛'),
	(266, '普吉岛旅游攻略'),
	(461, '普洱茶'),
	(383, '普特英语听力网'),
	(681, '智能手机'),
	(549, '晾衣架'),
	(536, '暗黑'),
	(271, '暗黑复仇者'),
	(87, '暗黑黎明'),
	(654, '暴风魔镜'),
	(150, '最萌英语试卷'),
	(673, '有利网安全吗'),
	(17, '服装设计'),
	(476, '木瓜'),
	(494, '机场大巴时刻表'),
	(220, '机票'),
	(208, '机票预订'),
	(600, '李阳疯狂英语'),
	(235, '杨幂丰胸秘籍'),
	(90, '杭州旅游'),
	(153, '杭州西湖'),
	(230, '极品钢琴'),
	(701, '林肯'),
	(449, '柠檬tv'),
	(409, '格力空调'),
	(413, '格力空调价格表'),
	(125, '格斗'),
	(462, '桂花'),
	(498, '桂花树'),
	(276, '横店影视城'),
	(502, '横店影视城门票'),
	(470, '樱花'),
	(302, '欢乐谷万圣节'),
	(655, '欢乐谷门票'),
	(594, '欧冠'),
	(274, '欧弟打呼噜'),
	(394, '武汉欢乐谷'),
	(138, '武汉欢乐谷门票'),
	(251, '氢氧化钠'),
	(213, '汇通网'),
	(146, '汉堡'),
	(631, '汉庭'),
	(297, '汉庭快捷酒店'),
	(542, '汉庭酒店官网'),
	(520, '汤臣倍健'),
	(268, '沁园净水器'),
	(14, '沂水地下大峡谷'),
	(43, '沙县小吃'),
	(389, '沙县小吃网'),
	(543, '沙家浜'),
	(239, '法语翻译'),
	(526, '法门寺'),
	(306, '泡芙'),
	(535, '泡芙的做法'),
	(576, '泰国旅游'),
	(308, '泰安太阳部落'),
	(554, '洗衣机'),
	(7, '洗面奶'),
	(98, '浦发银行信用卡'),
	(501, '海南旅游'),
	(184, '海参'),
	(231, '海尔'),
	(168, '海尔冰箱'),
	(464, '海尔商城'),
	(320, '海尔洗衣机'),
	(397, '海尔电视'),
	(216, '海底世界'),
	(591, '海淘'),
	(166, '海贼王中文网'),
	(162, '深圳世界之窗'),
	(219, '深圳欢乐谷'),
	(472, '深圳欢乐谷门票'),
	(420, '深圳海洋世界'),
	(333, '滴滴打车'),
	(602, '漆黑的魅影'),
	(689, '潘多拉'),
	(379, '澳门旅游攻略'),
	(336, '火锅'),
	(691, '炸薯条的做法'),
	(583, '烤箱'),
	(4, '烤箱烤红薯'),
	(589, '烧烤技术'),
	(557, '爆米花手机'),
	(634, '爱拍小包子'),
	(370, '爱拍马桶'),
	(290, '爱拍马桶c'),
	(71, '牛栏奶粉'),
	(26, '牛油果'),
	(702, '牡丹'),
	(109, '特价机票'),
	(593, '特色小吃'),
	(114, '狗粮'),
	(364, '独轮电动车'),
	(143, '猫屎咖啡'),
	(249, '玉石'),
	(165, '王家大院'),
	(79, '王蓉精神病'),
	(334, '玻尿酸原液'),
	(435, '瑜伽'),
	(408, '甜甜圈'),
	(170, '生日礼物'),
	(62, '生日蛋糕'),
	(698, '生育保险'),
	(234, '用手机怎么赚钱'),
	(592, '申请信用卡'),
	(312, '电动车电池'),
	(480, '电商'),
	(412, '电商是什么'),
	(400, '电子烟'),
	(539, '电子琴'),
	(206, '电子秤'),
	(298, '电影票'),
	(588, '电影票团购'),
	(254, '电影网1905'),
	(195, '电影网站'),
	(581, '电暖器'),
	(521, '电池修复'),
	(693, '电热水器'),
	(492, '电竞泡沫'),
	(186, '电脑开不了机'),
	(548, '电饼铛'),
	(181, '男童装秋装'),
	(343, '疾风之刃官网'),
	(115, '白水寨'),
	(438, '白酒'),
	(575, '百度团购'),
	(267, '百度糯米团购'),
	(523, '盐酸西替利嗪片'),
	(703, '监控摄像头'),
	(136, '盘古越狱'),
	(347, '盘锦红海滩'),
	(278, '眼镜'),
	(611, '眼霜'),
	(473, '睡不着怎么办'),
	(388, '短信软件'),
	(310, '硫酸铜'),
	(610, '磷酸'),
	(198, '神州租车'),
	(51, '神州租车网'),
	(86, '神舟租车'),
	(641, '神魔官网'),
	(221, '租车'),
	(286, '租车多少钱一天'),
	(532, '租车网'),
	(622, '秦时明月'),
	(67, '秦时明月官网'),
	(339, '秦时明月手游'),
	(606, '积木盒子'),
	(429, '移动客户端'),
	(387, '稻城亚丁'),
	(142, '空气净化器'),
	(118, '空调'),
	(598, '空调什么牌子好'),
	(507, '空调遥控器'),
	(190, '空间宝app'),
	(529, '窝窝电影网'),
	(430, '窝窝网'),
	(454, '童装'),
	(292, '童装品牌'),
	(185, '童装秋装新款'),
	(570, '童话村电影网'),
	(193, '第一p2p'),
	(77, '第二书包网'),
	(217, '签名设计'),
	(126, '精品书城'),
	(661, '精油'),
	(224, '糯米'),
	(41, '糯米团购网'),
	(22, '糯米手机'),
	(477, '糯米网团购'),
	(345, '糯米网团购下载'),
	(281, '紫薇'),
	(517, '红酒'),
	(559, '红酒品牌'),
	(705, '纳豆'),
	(128, '纸尿裤'),
	(530, '经济学'),
	(327, '结婚'),
	(665, '维多利亚'),
	(401, '网上申请信用卡'),
	(633, '网上订票'),
	(422, '网上购物'),
	(19, '网购网站大全'),
	(396, '网贷天眼'),
	(64, '罗塞塔项目'),
	(552, '羊蝎子'),
	(174, '美团'),
	(511, '美团外卖网'),
	(212, '美团网'),
	(253, '美容师培训'),
	(92, '美的电压力锅'),
	(42, '美的空调'),
	(330, '美瞳'),
	(619, '美素奶粉'),
	(416, '美食天下菜谱'),
	(18, '翡翠'),
	(147, '翻糖蛋糕'),
	(222, '翼支付'),
	(102, '老年代步车'),
	(44, '考研吧'),
	(294, '考研报名'),
	(175, '考研报名时间'),
	(140, '考研网'),
	(534, '职业规划'),
	(686, '聚划算今日团购'),
	(585, '聚划算官网'),
	(209, '聚宝盆'),
	(131, '股票软件'),
	(72, '自助火锅'),
	(522, '自助餐'),
	(587, '自考'),
	(293, '自考本科'),
	(39, '自考本科有用吗'),
	(547, '自驾游'),
	(382, '致爱丽丝'),
	(479, '艺龙网酒店预定'),
	(467, '艺龙网酒店预订'),
	(458, '芍药'),
	(260, '芜湖方特'),
	(20, '花王纸尿裤'),
	(378, '苏宁云商'),
	(564, '苏州乐园'),
	(527, '英语'),
	(61, '英语作文'),
	(173, '英语口语'),
	(261, '英语听力'),
	(279, '英语在线翻译'),
	(402, '英语学习'),
	(76, '英语学习软件'),
	(385, '英魂之刃官网'),
	(123, '茅台酒'),
	(640, '茶叶'),
	(675, '茶道'),
	(240, '草莓'),
	(646, '荒莽记'),
	(349, '荷花'),
	(669, '莫言的个人空间'),
	(265, '莽慌记'),
	(30, '莾荒纪'),
	(561, '营养师'),
	(365, '营养师报考条件'),
	(359, '萨克斯'),
	(692, '葡萄酒'),
	(463, '蘑菇街团购'),
	(59, '虎扑篮球'),
	(200, '虫虫助手'),
	(620, '蛋糕'),
	(55, '蜂蜜'),
	(706, '蟒荒记'),
	(237, '血族bloodline'),
	(106, '血钻野燕麦价格'),
	(578, '血钻野燕麦官网'),
	(377, '裸体相亲'),
	(255, '西塘古镇'),
	(291, '西藏旅游'),
	(243, '西门子冰箱'),
	(202, '西门子洗衣机'),
	(451, '订机票'),
	(360, '订票'),
	(83, '订票电话'),
	(112, '订酒店'),
	(117, '试客联盟'),
	(25, '话费充值'),
	(614, '豆瓣电影'),
	(659, '贝贝'),
	(183, '财经网'),
	(307, '购物网'),
	(75, '购物网站'),
	(282, '购物网站大全'),
	(113, '蹦蹦网'),
	(531, '身上长小红点'),
	(314, '车票查询'),
	(579, '返利网'),
	(417, '返利网可信吗'),
	(238, '返利网怎么返利'),
	(680, '连环夺宝'),
	(515, '迪拜七星级酒店'),
	(577, '邮政信用卡申请'),
	(301, '郑多燕减肥操'),
	(599, '郑多燕小红帽'),
	(353, '郑大一附院'),
	(643, '酒店'),
	(426, '酒店预订'),
	(452, '酸辣粉'),
	(384, '酸辣粉的做法'),
	(256, '金东商城'),
	(199, '金融学'),
	(533, '金融学专业介绍'),
	(455, '金钥匙'),
	(160, '金龙鱼价格'),
	(132, '金龟子女儿早恋'),
	(668, '钢琴'),
	(252, '钱多多'),
	(355, '钱大掌柜'),
	(103, '钻戒'),
	(122, '铁观音'),
	(161, '银杏'),
	(604, '银汉时空猎人'),
	(390, '银行利息'),
	(381, '银行利息怎么算'),
	(497, '银行利率'),
	(369, '银行存款利率'),
	(441, '长沙世界之窗'),
	(85, '长隆水上乐园'),
	(540, '长鹿农庄'),
	(299, '防辐射服'),
	(403, '附近的团购'),
	(609, '附近的酒店'),
	(357, '隐形眼镜'),
	(525, '隐形眼镜的危害'),
	(329, '雅思'),
	(555, '雅思报名官网'),
	(316, '集分宝'),
	(116, '零食'),
	(178, '青鸟'),
	(696, '面包'),
	(214, '韩后'),
	(367, '韩国旅游'),
	(163, '韩国旅游攻略'),
	(421, '韩语入门'),
	(148, '韩语学习'),
	(664, '项链'),
	(471, '顺德长鹿农庄'),
	(506, '风凰网'),
	(344, '飞机票查询官网'),
	(287, '饿了吗订餐'),
	(38, '香格里拉酒店'),
	(40, '香港旅游'),
	(666, '香港旅游攻略'),
	(127, '马云简介'),
	(52, '马尔代夫'),
	(232, '驾校'),
	(707, '高一数学必修1'),
	(197, '高锰酸钾'),
	(95, '鬼屋'),
	(134, '魅影'),
	(250, '鲜花'),
	(672, '麻辣烫'),
	(447, '麻辣烫什么意思'),
	(443, '麻辣香锅'),
	(373, '黄花梨手串'),
	(368, '龙纹三国');
/*!40000 ALTER TABLE `ad_keyword` ENABLE KEYS */;


-- 导出  表 search.ad_news 结构
DROP TABLE IF EXISTS `ad_news`;
CREATE TABLE IF NOT EXISTS `ad_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `img` varchar(200) NOT NULL DEFAULT '0',
  `link` varchar(500) NOT NULL DEFAULT '0',
  `pos` int(11) DEFAULT '0',
  `enable` int(11) DEFAULT NULL COMMENT '1:启用；0:不启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='广告新闻';

-- 正在导出表  search.ad_news 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `ad_news` DISABLE KEYS */;
INSERT INTO `ad_news` (`id`, `name`, `img`, `link`, `pos`, `enable`) VALUES
	(32, '高额取现，免费白金，办卡就来融360！', 'http://baseromcdn.gionee.com/image/search/ad/news/20161222/rong360.png_640x300.jpg', 'http://j.tdbear.cn/Jc-xykck', 0, 0),
	(33, '优信二手车，最实惠放心的二手车交易平台！', 'http://baseromcdn.gionee.com/image/search/ad/news/20161222/youxin.png_640x300.jpg', 'http://j.tdbear.cn/Jc-esc', 0, 0),
	(49, '劳斯莱斯Black Badge致力于满足精英的需求', 'http://baseromcdn.gionee.com/image/search/ad/news/20161226/0103-1.jpg_640x300.jpg', 'http://levect.com/zh/detail/cat/14/img/38436/simg/38436?appid=0&eid=102020 0103-2', 0, 1),
	(50, '宋慧乔妆容精致，黑色抹胸装女王范儿十足', 'http://baseromcdn.gionee.com/image/search/ad/news/20161226/0103-2.jpg_640x300.jpg', 'http://levect.com/zh/detail/tag/19983/img/163270?appid=0&eid=102020', 0, 1),
	(51, 'NBA精彩预告：詹皇大战浓眉哥，谁能更胜一筹？', 'http://baseromcdn.gionee.com/image/search/ad/news/20161226/0103-3.jpg_640x300.jpg', 'http://levect.com/zh/detail/tag/14/img/260541?appid=0&eid=102020 0103-4', 0, 1),
	(52, '点缀大片的花卉插画，让梅谢纳更添迷人魅力', 'http://baseromcdn.gionee.com/image/search/ad/news/20161226/0103-4.jpg_640x300.jpg', 'http://levect.com/zh/detail/tag/19985/img/163281?appid=0&eid=102020', 0, 1),
	(53, '沃格古铜色的肌肤，在阳光的映衬下，性感魅惑', 'http://baseromcdn.gionee.com/image/search/ad/news/20161226/0103-5.jpg_640x300.jpg', 'http://levect.com/zh/detail/cat/16/img/254244/simg/254244?appid=0&eid=102020', 0, 1),
	(54, '劲爆！揭开手机卡顿的秘密', 'http://baseromcdn.gionee.com/image/search/ad/news/20161226/liebao.png_640x300.jpg', 'http://m.appgionee.com/mobile/soft/detail?fr=gn_search_h5&id=27426', 0, 1),
	(56, '去哪儿新年感恩季，省更多，玩儿更多！', 'http://baseromcdn.gionee.com/image/search/ad/news/20161227/banner_quare.png_640x300.jpg', 'http://j.tdbear.cn/Jc-ly', 0, 1),
	(57, '新年特惠，你想要的好货都在这里！', 'http://baseromcdn.gionee.com/image/search/ad/news/20161227/shopping.png_640x300.jpg', 'http://gou.gionee.com/index/redirect?url_id=2461', 0, 1),
	(58, '贷款,找平安,无需抵押,快至1天!', 'http://baseromcdn.gionee.com/image/search/ad/news/20161229/pingan.jpg_640x300.jpg', 'http://gou.gionee.com/index/redirect?url_id=3142', 0, 1),
	(59, '《3D坦克争霸2》预约开启！更有手机等万元福利等你拿！', 'http://baseromcdn.gionee.com/image/search/ad/news/20161229/tanke.jpg_640x300.jpg', 'http://bbs.amigo.cn/thread-158752-1-1.html', 0, 0),
	(60, '【自定义】这款迷你隐形蓝牙耳机卖疯了，99限时抢购！', 'http://baseromcdn.gionee.com/image/search/ad/news/20161230/first.jpg_640x300.jpg', 'http://svc.dsp.ad.levect.com/m/c?q=1482994266764&ns=__IP__&m1a=__ANDROIDID__&m2=__IMEI__&m6=__MAC1__&nn=__APP__', 0, 0),
	(61, '这款浓香铁观音卖疯了，今日99限时秒杀！', 'http://baseromcdn.gionee.com/image/search/ad/news/20161230/second.jpg_640x300.jpg', 'http://svc.dsp.ad.levect.com/m/c?q=1482994351817&ns=__IP__&m1a=__ANDROIDID__&m2=__IMEI__&m6=__MAC1__&nn=__APP__', 0, 0),
	(62, '这款男士冲锋衣卖疯了，今日198限时秒杀！', 'http://baseromcdn.gionee.com/image/search/ad/news/20161230/third.jpg_640x300.jpg', 'http://svc.dsp.ad.levect.com/m/c?q=1482994433409&ns=__IP__&m1a=__ANDROIDID__&m2=__IMEI__&m6=__MAC1__&nn=__APP__', 0, 1);
/*!40000 ALTER TABLE `ad_news` ENABLE KEYS */;


-- 导出  表 search.app_entrance 结构
DROP TABLE IF EXISTS `app_entrance`;
CREATE TABLE IF NOT EXISTS `app_entrance` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `entrance` varchar(50) DEFAULT NULL COMMENT '入口名称',
  `description` varchar(50) DEFAULT NULL COMMENT '入口描述',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  search.app_entrance 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `app_entrance` DISABLE KEYS */;
INSERT INTO `app_entrance` (`eid`, `entrance`, `description`) VALUES
	(1, '通知中心', '通知中心基本信息'),
	(2, '桌面widget', '桌面widget基本信息'),
	(4, '桌面下滑', '桌面下滑基本信息'),
	(5, '长按home', '基本信息'),
	(6, '桌面看看', '桌面看看基本信息');
/*!40000 ALTER TABLE `app_entrance` ENABLE KEYS */;


-- 导出  表 search.app_uri 结构
DROP TABLE IF EXISTS `app_uri`;
CREATE TABLE IF NOT EXISTS `app_uri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '1:youku;2:gioneeTing;3:http;4:https',
  `uri` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='打开第三方应用的uri';

-- 正在导出表  search.app_uri 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `app_uri` DISABLE KEYS */;
INSERT INTO `app_uri` (`id`, `type`, `uri`) VALUES
	(1, 'youku', 'youku://play?vid=12345&source=bdhz-jinli&pkg=com.youku.phone.jinli&minVersion=5.2.21&action=android.intent.action.VIEW'),
	(2, 'youku', 'youku://play?vid=XMTc3MTg1ODg4MA&source=bdhz-jinli&pkg=com.youku.phone.jinli&minVersion=5.2.21'),
	(3, 'gioneeTing', 'gioneeTing://openFind?pkg=com.ximalaya.ting.android.gionee&title=你好&content=最熟悉的“暖”旋律&minVersion=1.4.5');
/*!40000 ALTER TABLE `app_uri` ENABLE KEYS */;


-- 导出  表 search.app_version 结构
DROP TABLE IF EXISTS `app_version`;
CREATE TABLE IF NOT EXISTS `app_version` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(20) DEFAULT NULL COMMENT '版本',
  `description` varchar(200) NOT NULL COMMENT '版本描述',
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  search.app_version 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `app_version` DISABLE KEYS */;
INSERT INTO `app_version` (`vid`, `version`, `description`) VALUES
	(1, '2.0.1', '2.0.1的基本信息'),
	(2, '2.0.5', '2.0.5的基本信息'),
	(3, '2.1.0', '2.1.0的基本信息'),
	(5, '2.1.1', '2.1.1的基本信息'),
	(6, '3.0.0', '3.0.0的基本信息');
/*!40000 ALTER TABLE `app_version` ENABLE KEYS */;


-- 导出  表 search.app_version_entrance 结构
DROP TABLE IF EXISTS `app_version_entrance`;
CREATE TABLE IF NOT EXISTS `app_version_entrance` (
  `app_version_id` int(11) NOT NULL,
  `app_entrance_id` int(11) NOT NULL,
  `dic_id` int(11) NOT NULL,
  PRIMARY KEY (`app_version_id`,`app_entrance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  search.app_version_entrance 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `app_version_entrance` DISABLE KEYS */;
INSERT INTO `app_version_entrance` (`app_version_id`, `app_entrance_id`, `dic_id`) VALUES
	(1, 1, 29),
	(1, 2, 30),
	(1, 4, 30),
	(2, 1, 29),
	(2, 2, 30),
	(3, 1, 29),
	(3, 2, 30),
	(3, 4, 30),
	(3, 5, 29),
	(5, 1, 29),
	(6, 1, 30),
	(6, 2, 29);
/*!40000 ALTER TABLE `app_version_entrance` ENABLE KEYS */;


-- 导出  表 search.card 结构
DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT '排序号',
  `show_enable` int(11) DEFAULT NULL COMMENT '0:显示在首页，1:不显示在首页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  search.card 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` (`id`, `name`, `order_id`, `show_enable`) VALUES
	(1, '看点新闻', 1, 1),
	(2, '生活服务', 2, 1),
	(3, '网址导航', 3, 1);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;


-- 导出  表 search.config 结构
DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '0:停用，1启用',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- 正在导出表  search.config 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` (`id`, `code`, `name`, `value`, `status`, `description`) VALUES
	(1, 'hotkey_eachrow_number', '热词每行个数', '2', 1, NULL),
	(2, 'sitenav_eachrow_number', '网址导航每行个数', '4', 1, NULL),
	(3, 'hotkey_open_url', '热词链接', 'http://m.baidu.com/s?from=1008021x&word=', 1, ''),
	(4, 'keyword_open_url', '关键字链接', 'http://m.baidu.com/s?from=1008021y&word=', 1, '');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;


-- 导出  表 search.entrance 结构
DROP TABLE IF EXISTS `entrance`;
CREATE TABLE IF NOT EXISTS `entrance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0' COMMENT '入口名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入口表';

-- 正在导出表  search.entrance 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `entrance` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrance` ENABLE KEYS */;


-- 导出  表 search.entrance_config 结构
DROP TABLE IF EXISTS `entrance_config`;
CREATE TABLE IF NOT EXISTS `entrance_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrance` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入口配置表';

-- 正在导出表  search.entrance_config 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `entrance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrance_config` ENABLE KEYS */;


-- 导出  表 search.group_info 结构
DROP TABLE IF EXISTS `group_info`;
CREATE TABLE IF NOT EXISTS `group_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分组信息表';

-- 正在导出表  search.group_info 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `group_info` DISABLE KEYS */;
INSERT INTO `group_info` (`id`, `group_name`) VALUES
	(1, '产品组'),
	(2, '运营组'),
	(3, '开发组'),
	(4, '测试组');
/*!40000 ALTER TABLE `group_info` ENABLE KEYS */;


-- 导出  表 search.hotkey_source 结构
DROP TABLE IF EXISTS `hotkey_source`;
CREATE TABLE IF NOT EXISTS `hotkey_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_code` varchar(100) DEFAULT NULL,
  `source_name` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `enable_status` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '1' COMMENT '1:热词采集源，2:联想词源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='热门资源表';

-- 正在导出表  search.hotkey_source 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `hotkey_source` DISABLE KEYS */;
INSERT INTO `hotkey_source` (`id`, `source_code`, `source_name`, `url`, `enable_status`, `type`) VALUES
	(1, 'haosouDataExtract', '好搜热词接口', 'http://m.haosou.com/mhtml/app_index/app_news.json', 0, 1),
	(2, 'baiduDataExtract', '百度热词接口', 'http://top.baidu.com/gen_json?b=1', 0, 1),
	(3, 'sougouDataExtract', '搜狗热词接口', 'http://ts.mobile.sogou.com/query?pid=sogou-mobp-eeea8c180c5dff16&num=50&length=15&select=1,2,5,6,10,11,13,20', 1, 1),
	(4, 'defaultAssociateWordsSource', '默认联想词接口', 'http://3g.gionee.com/api/desktop/searchLikeWords?keyword=', 1, 2),
	(5, 'sougouAssociateWordsSource', '搜狗联想词接口', 'http://api.sugg.sogou.com/su?type=wap&fmt=1&ie=utf8&key=', 0, 2);
/*!40000 ALTER TABLE `hotkey_source` ENABLE KEYS */;


-- 导出  表 search.hot_keys 结构
DROP TABLE IF EXISTS `hot_keys`;
CREATE TABLE IF NOT EXISTS `hot_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) DEFAULT NULL,
  `hot_key` varchar(50) DEFAULT NULL,
  `stats` int(11) DEFAULT '0' COMMENT '1:表示new;0:不表示new，默认0',
  `sort_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0:表示自动采集;1:表示自主添加的保存在自定义热词模块；2:表示自定义热词，跟采集源热词功能一样',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=633355 DEFAULT CHARSET=utf8 COMMENT='热词表';

-- 正在导出表  search.hot_keys 的数据：~44 rows (大约)
/*!40000 ALTER TABLE `hot_keys` DISABLE KEYS */;
INSERT INTO `hot_keys` (`id`, `url`, `hot_key`, `stats`, `sort_id`, `type`) VALUES
	(613460, 'http://www.163.com/special/0077450P/login_frame.html', '#王宝强离婚#', 1, 1, 1),
	(613461, 'http://www.163.com/special/0077450P/login_frame.html', '#马蓉结婚#', 1, 2, 1),
	(613462, 'http://www.163.com/special/0077450P/login_frame.html', '#宋喆出轨#', 1, 3, 1),
	(615461, 'http://localhost:8080/search_local/login/login#menu_hotkey_manage', '双11狂欢抢先购', 1, 1, 2),
	(615462, 'http://localhost:8080/search_local/login/login#menu_hotkey_manage', '#双11来啦#', 1, 4, 1),
	(633316, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9C%8D%E5%8A%A1%E5%8C%BA%E6%94%B6%E4%BA%BA%E5%A4%B4%E8%B4%B9&pid=sogou-mobp-eeea8c180c5dff16&v=5', '服务区收人头费', 0, NULL, 0),
	(633317, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%B0%91%E5%A5%B3%E9%81%AD%E6%9A%B4%E5%8A%9B%E6%AC%BA%E8%BE%B1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '少女遭暴力欺辱', 1, NULL, 0),
	(633318, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9E%97%E5%BF%83%E5%A6%82%E6%99%92%E7%85%A7%E6%84%9F%E6%85%A8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '林心如晒照感慨', 0, NULL, 0),
	(633319, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%81%B6%E6%84%8F%E5%8F%98%E9%81%93%E6%92%9Emini&pid=sogou-mobp-eeea8c180c5dff16&v=5', '恶意变道撞mini', 0, NULL, 0),
	(633320, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%A6%99%E6%B8%AF%E6%9C%8D%E5%8A%A1%E5%8A%A0%E4%BB%B7&pid=sogou-mobp-eeea8c180c5dff16&v=5', '香港服务加价', 0, NULL, 0),
	(633321, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%8E%8B%E6%80%9D%E8%81%AA%E5%8C%85%E5%B2%9B%E8%B7%A8%E5%B9%B4&pid=sogou-mobp-eeea8c180c5dff16&v=5', '王思聪包岛跨年', 0, NULL, 0),
	(633322, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%99%AA%E9%A2%86%E5%AF%BC%E5%90%83%E9%A5%AD%E8%BA%AB%E4%BA%A1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '陪领导吃饭身亡', 0, NULL, 0),
	(633323, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%81%AB%E8%BD%A6%E7%AB%99%E8%AD%A6%E7%8A%AC%E5%B7%A1%E9%80%BB&pid=sogou-mobp-eeea8c180c5dff16&v=5', '火车站警犬巡逻', 1, NULL, 0),
	(633324, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A4%AA%E4%BB%93%E5%89%AF%E5%B8%82%E9%95%BF%E5%9D%A0%E4%BA%A1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '太仓副市长坠亡', 0, NULL, 0),
	(633325, 'https://wap.sogou.com/web/searchList.jsp?keyword=5%E6%97%AC%E5%A5%B3%E5%AD%90%E5%AE%B6%E4%B8%AD%E9%81%87%E5%AE%B3&pid=sogou-mobp-eeea8c180c5dff16&v=5', '5旬女子家中遇害', 0, NULL, 0),
	(633326, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%8F%B8%E6%9C%BA%E8%BF%B7%E6%81%8B%E8%B5%8C%E5%8D%9A&pid=sogou-mobp-eeea8c180c5dff16&v=5', '司机迷恋赌博', 0, NULL, 0),
	(633327, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%99%88%E8%B5%AB%E6%99%92%E5%A5%B3%E5%84%BF%E7%85%A7%E7%89%87&pid=sogou-mobp-eeea8c180c5dff16&v=5', '陈赫晒女儿照片', 0, NULL, 0),
	(633328, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%94%B7%E7%94%9F%E7%A9%BF%E9%BE%99%E8%A2%8D%E4%B8%8A%E8%AF%BE&pid=sogou-mobp-eeea8c180c5dff16&v=5', '男生穿龙袍上课', 0, NULL, 0),
	(633329, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B6%8967%E4%BA%BA%E6%B6%89%E9%BB%91%E5%AE%A3%E5%88%A4&pid=sogou-mobp-eeea8c180c5dff16&v=5', '涉67人涉黑宣判', 1, NULL, 0),
	(633330, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B9%A0%E8%BF%91%E5%B9%B3%E6%96%B0%E5%B9%B4%E8%B4%BA%E8%AF%8D&pid=sogou-mobp-eeea8c180c5dff16&v=5', '习近平新年贺词', 0, NULL, 0),
	(633331, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A4%AE%E4%BC%81%E6%99%92%E5%B9%B4%E8%96%AA&pid=sogou-mobp-eeea8c180c5dff16&v=5', '央企晒年薪', 0, NULL, 0),
	(633332, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9D%8E%E6%99%93%E9%9C%9E%E9%80%80%E5%BD%B9&pid=sogou-mobp-eeea8c180c5dff16&v=5', '李晓霞退役', 0, NULL, 0),
	(633333, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%8E%8B%E5%AE%9D%E5%BC%BA%E7%8E%B0%E8%BA%AB%E8%A5%BF%E5%AE%89&pid=sogou-mobp-eeea8c180c5dff16&v=5', '王宝强现身西安', 0, NULL, 0),
	(633334, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%B7%B4%E8%A5%BF%E7%9B%91%E7%8B%B1%E6%9A%B4%E5%8A%A8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '巴西监狱暴动', 0, NULL, 0),
	(633335, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A5%B3%E5%AD%90%E7%A6%BB%E5%A9%9A%E8%83%8C%E5%B7%A8%E5%80%BA&pid=sogou-mobp-eeea8c180c5dff16&v=5', '女子离婚背巨债', 1, NULL, 0),
	(633336, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%8B%B9%E6%9E%9C%E6%88%96%E5%87%8F%E4%BA%A710%25&pid=sogou-mobp-eeea8c180c5dff16&v=5', '苹果或减产10%', 0, NULL, 0),
	(633337, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%AF%BC%E6%BC%94%E4%BD%95%E7%BE%A4%E5%8E%BB%E4%B8%96&pid=sogou-mobp-eeea8c180c5dff16&v=5', '导演何群去世', 0, NULL, 0),
	(633338, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%99%95%E8%A5%BF%E5%85%AC%E5%8E%95%E7%88%86%E7%82%B8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '陕西公厕爆炸', 0, NULL, 0),
	(633339, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%8F%B0%E6%B9%BE%E5%BA%B7%E5%B8%88%E5%82%85%E8%A7%A3%E6%95%A3&pid=sogou-mobp-eeea8c180c5dff16&v=5', '台湾康师傅解散', 0, NULL, 0),
	(633340, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%BC%A0%E7%BB%A7%E7%A7%91%E6%8A%B1%E8%B5%B5%E4%B8%BD%E9%A2%96&pid=sogou-mobp-eeea8c180c5dff16&v=5', '张继科抱赵丽颖', 0, NULL, 0),
	(633341, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A5%B3%E5%AD%90%E5%81%B7%E4%B8%8A%E5%8D%83%E5%BF%AB%E4%BB%B6&pid=sogou-mobp-eeea8c180c5dff16&v=5', '女子偷上千快件', 1, NULL, 0),
	(633342, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9D%A8%E9%87%87%E5%A6%AE%E6%80%80%E5%AD%955%E4%B8%AA%E6%9C%88&pid=sogou-mobp-eeea8c180c5dff16&v=5', '杨采妮怀孕5个月', 0, NULL, 0),
	(633343, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%83%91%E5%B0%A4%E6%8B%89%E4%B8%B9%E9%BA%A6%E8%A2%AB%E6%8D%95&pid=sogou-mobp-eeea8c180c5dff16&v=5', '郑尤拉丹麦被捕', 0, NULL, 0),
	(633344, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%94%B6%E8%B4%AD%E7%8E%89%E7%B1%B3%E8%A2%AB%E5%88%A4%E5%88%91&pid=sogou-mobp-eeea8c180c5dff16&v=5', '收购玉米被判刑', 0, NULL, 0),
	(633345, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%82%A3%E8%8B%B1%E5%8A%9B%E6%8C%BA%E7%8E%8B%E8%8F%B2&pid=sogou-mobp-eeea8c180c5dff16&v=5', '那英力挺王菲', 0, NULL, 0),
	(633346, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%B0%AD%E6%99%B6%E8%B7%A8%E5%B9%B4%E9%A6%96%E7%A7%80&pid=sogou-mobp-eeea8c180c5dff16&v=5', '谭晶跨年首秀', 0, NULL, 0),
	(633347, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%80%8E%E6%A0%B7%E7%94%B3%E8%AF%B7%E4%BF%A1%E7%94%A8%E5%8D%A1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '怎样申请信用卡', 1, NULL, 0),
	(633348, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%9C%9C%E6%9C%88%E5%A9%9A%E7%BA%B1%E6%91%84%E5%BD%B1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '蜜月婚纱摄影', 0, NULL, 0),
	(633349, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%BE%B3%E9%97%A8%E9%93%B6%E6%B2%B3&pid=sogou-mobp-eeea8c180c5dff16&v=5', '澳门银河', 0, NULL, 0),
	(633350, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%BE%BE%E5%86%85%E5%9F%B9%E8%AE%AD&pid=sogou-mobp-eeea8c180c5dff16&v=5', '达内培训', 0, NULL, 0),
	(633351, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%9B%B6%E8%B7%9D%E7%A6%BB%E7%9B%B4%E6%92%AD&pid=sogou-mobp-eeea8c180c5dff16&v=5', '零距离直播', 0, NULL, 0),
	(633352, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B8%89%E4%BA%9A%E5%A9%9A%E7%BA%B1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '三亚婚纱', 0, NULL, 0),
	(633353, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%B4%A1%E8%8C%B6&pid=sogou-mobp-eeea8c180c5dff16&v=5', '贡茶', 1, NULL, 0),
	(633354, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A9%9A%E7%BA%B1%E6%91%84%E5%BD%B1%E4%BB%B7%E6%A0%BC%E8%A1%A8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '婚纱摄影价格表', 0, NULL, 0);
/*!40000 ALTER TABLE `hot_keys` ENABLE KEYS */;


-- 导出  表 search.images 结构
DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '字典数据',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名',
  `img_path` varchar(200) NOT NULL COMMENT '图片的URI',
  `title` varchar(50) DEFAULT NULL COMMENT '图片标题',
  `description` varchar(400) DEFAULT NULL COMMENT '图片描述',
  `is_ref` int(11) DEFAULT '0' COMMENT '0：没有被引用，1：被引用',
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='图片表';

-- 正在导出表  search.images 的数据：~101 rows (大约)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` (`id`, `type`, `file_name`, `img_path`, `title`, `description`, `is_ref`, `upload_date`) VALUES
	(1, 31, '0101-1.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/0101-1.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:37'),
	(2, 31, '0101-2.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/0101-2.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:38'),
	(3, 31, '0101-3.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/0101-3.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:41'),
	(4, 31, '0101-4.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/0101-4.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:42'),
	(5, 31, '0101-5.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/0101-5.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:44'),
	(6, 31, '0103-1.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/0103-1.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:46'),
	(7, 31, '0103-2.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/0103-2.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:47'),
	(8, 31, '0103-3.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/0103-3.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:49'),
	(9, 31, '0103-4.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/0103-4.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:50'),
	(10, 31, '0103-5.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/0103-5.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:52'),
	(11, 31, '640-330.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/640-330.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:53'),
	(12, 31, '1044-240.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1044-240.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:53'),
	(13, 31, '1216-1.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1216-1.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:55'),
	(14, 31, '1216-2.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1216-2.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:57'),
	(15, 31, '1216-3.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1216-3.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:01:58'),
	(16, 31, '1216-4.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1216-4.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:00'),
	(17, 31, '1216-5.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1216-5.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:02'),
	(18, 31, '1218-1.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1218-1.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:03'),
	(19, 31, '1218-2.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1218-2.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:05'),
	(20, 31, '1218-3.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1218-3.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:08'),
	(21, 31, '1218-4.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1218-4.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:10'),
	(22, 31, '1218-5.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1218-5.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:12'),
	(23, 31, '1220-1.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1220-1.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:13'),
	(24, 31, '1220-2.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1220-2.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:15'),
	(25, 31, '1220-3.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1220-3.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:17'),
	(26, 31, '1220-4.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1220-4.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:18'),
	(27, 31, '1220-5-back-up.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1220-5-back-up.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:19'),
	(28, 31, '1220-5-back-up-first.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1220-5-back-up-first.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:22'),
	(29, 31, '1222-1.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1222-1.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:23'),
	(30, 31, '1222-2.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1222-2.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:25'),
	(31, 31, '1222-3.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1222-3.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:27'),
	(32, 31, '1222-4.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1222-4.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:28'),
	(33, 31, '1222-5.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1222-5.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:30'),
	(34, 31, '1224-1.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1224-1.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:30'),
	(35, 31, '1224-2.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1224-2.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:32'),
	(36, 31, '1224-3.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1224-3.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:34'),
	(37, 31, '1224-4.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1224-4.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:35'),
	(38, 31, '1224-5.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1224-5.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:37'),
	(39, 31, '1226-1.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1226-1.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:39'),
	(40, 31, '1226-2.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1226-2.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:40'),
	(41, 31, '1226-3.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1226-3.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:41'),
	(42, 31, '1226-4.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1226-4.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:43'),
	(43, 31, '1226-5.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1226-5.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:44'),
	(44, 31, '1228-1.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1228-1.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:46'),
	(45, 31, '1228-2.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1228-2.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:47'),
	(46, 31, '1228-3.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1228-3.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:50'),
	(47, 31, '1228-4.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1228-4.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:51'),
	(48, 31, '1228-5.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1228-5.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:53'),
	(49, 31, '1230-1.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1230-1.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:54'),
	(50, 31, '1230-2.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1230-2.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:55'),
	(51, 31, '1230-3.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1230-3.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:56'),
	(52, 31, '1230-4.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1230-4.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:02:58'),
	(53, 31, '1230-5.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/1230-5.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:00'),
	(54, 31, 'banner_didi.png_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/banner_didi.png_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:01'),
	(55, 31, 'banner_quare.png_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/banner_quare.png_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:03'),
	(56, 31, 'banner_shengbei.png_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/banner_shengbei.png_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:04'),
	(57, 31, 'fecond.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/fecond.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:05'),
	(58, 31, 'first.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/first.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:06'),
	(59, 31, 'liebao.png_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/liebao.png_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:07'),
	(60, 31, 'pingan.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/pingan.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:07'),
	(61, 31, 'rong360.png_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/rong360.png_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:08'),
	(62, 31, 'shopping.png_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/shopping.png_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:09'),
	(63, 31, 'third.jpg_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/third.jpg_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:11'),
	(64, 31, 'youxin.png_640x300.jpg', 'http://baseromcdn.gionee.com/image/search/ad/youxin.png_640x300.jpg', NULL, NULL, NULL, '2017-01-03 17:03:12'),
	(104, 32, '9kuai9.png', 'http://baseromcdn.gionee.com/image/search/icon/9kuai9.png', NULL, NULL, NULL, '2017-01-03 17:29:46'),
	(105, 32, '58.png', 'http://baseromcdn.gionee.com/image/search/icon/58.png', NULL, NULL, NULL, '2017-01-03 17:29:46'),
	(106, 32, '96.png', 'http://baseromcdn.gionee.com/image/search/icon/96.png', NULL, NULL, NULL, '2017-01-03 17:29:47'),
	(107, 32, '360video.png', 'http://baseromcdn.gionee.com/image/search/icon/360video.png', NULL, NULL, NULL, '2017-01-03 17:29:47'),
	(108, 32, '1212.png', 'http://baseromcdn.gionee.com/image/search/icon/1212.png', NULL, NULL, NULL, '2017-01-03 17:29:48'),
	(109, 32, 'baidu_news.png', 'http://baseromcdn.gionee.com/image/search/icon/baidu_news.png', NULL, NULL, NULL, '2017-01-03 17:29:49'),
	(110, 32, 'ciji.png', 'http://baseromcdn.gionee.com/image/search/icon/ciji.png', NULL, NULL, NULL, '2017-01-03 17:29:49'),
	(111, 32, 'dangdang.png', 'http://baseromcdn.gionee.com/image/search/icon/dangdang.png', NULL, NULL, NULL, '2017-01-03 17:29:50'),
	(112, 32, 'game.png', 'http://baseromcdn.gionee.com/image/search/icon/game.png', NULL, NULL, NULL, '2017-01-03 17:29:50'),
	(113, 32, 'gongjiao.png', 'http://baseromcdn.gionee.com/image/search/icon/gongjiao.png', NULL, NULL, NULL, '2017-01-03 17:29:51'),
	(114, 32, 'guahao.png', 'http://baseromcdn.gionee.com/image/search/icon/guahao.png', NULL, NULL, NULL, '2017-01-03 17:29:51'),
	(115, 32, 'jiazheng.png', 'http://baseromcdn.gionee.com/image/search/icon/jiazheng.png', NULL, NULL, NULL, '2017-01-03 17:29:52'),
	(116, 32, 'jingdong.png', 'http://baseromcdn.gionee.com/image/search/icon/jingdong.png', NULL, NULL, NULL, '2017-01-03 17:29:53'),
	(117, 32, 'jiudianyuding.png', 'http://baseromcdn.gionee.com/image/search/icon/jiudianyuding.png', NULL, NULL, NULL, '2017-01-03 17:29:54'),
	(118, 32, 'juhuasuan.png', 'http://baseromcdn.gionee.com/image/search/icon/juhuasuan.png', NULL, NULL, NULL, '2017-01-03 17:29:54'),
	(119, 32, 'kuaidi.png', 'http://baseromcdn.gionee.com/image/search/icon/kuaidi.png', NULL, NULL, NULL, '2017-01-03 17:29:55'),
	(120, 32, 'kxxxl.png', 'http://baseromcdn.gionee.com/image/search/icon/kxxxl.png', NULL, NULL, NULL, '2017-01-03 17:29:55'),
	(121, 32, 'lirenguan.png', 'http://baseromcdn.gionee.com/image/search/icon/lirenguan.png', NULL, NULL, NULL, '2017-01-03 17:29:56'),
	(122, 32, 'meilishuo.png', 'http://baseromcdn.gionee.com/image/search/icon/meilishuo.png', NULL, NULL, NULL, '2017-01-03 17:29:56'),
	(123, 32, 'meituan.png', 'http://baseromcdn.gionee.com/image/search/icon/meituan.png', NULL, NULL, NULL, '2017-01-03 17:29:56'),
	(124, 32, 'mogujie.png', 'http://baseromcdn.gionee.com/image/search/icon/mogujie.png', NULL, NULL, NULL, '2017-01-03 17:29:57'),
	(125, 32, 'pinganpuhui.png', 'http://baseromcdn.gionee.com/image/search/icon/pinganpuhui.png', NULL, NULL, NULL, '2017-01-03 17:29:57'),
	(126, 32, 'qingtingFM.png', 'http://baseromcdn.gionee.com/image/search/icon/qingtingFM.png', NULL, NULL, NULL, '2017-01-03 17:29:57'),
	(127, 32, 'ruanjian.png', 'http://baseromcdn.gionee.com/image/search/icon/ruanjian.png', NULL, NULL, NULL, '2017-01-03 17:29:58'),
	(128, 32, 'shouji360.png', 'http://baseromcdn.gionee.com/image/search/icon/shouji360.png', NULL, NULL, NULL, '2017-01-03 17:29:58'),
	(129, 32, 'suning.jpg', 'http://baseromcdn.gionee.com/image/search/icon/suning.jpg', NULL, NULL, NULL, '2017-01-03 17:29:58'),
	(130, 32, 'taobao.png', 'http://baseromcdn.gionee.com/image/search/icon/taobao.png', NULL, NULL, NULL, '2017-01-03 17:29:59'),
	(131, 32, 'tmall.png', 'http://baseromcdn.gionee.com/image/search/icon/tmall.png', NULL, NULL, NULL, '2017-01-03 17:29:59'),
	(132, 32, 'toutiao.png', 'http://baseromcdn.gionee.com/image/search/icon/toutiao.png', NULL, NULL, NULL, '2017-01-03 17:30:00'),
	(133, 32, 'tuniu.png', 'http://baseromcdn.gionee.com/image/search/icon/tuniu.png', NULL, NULL, NULL, '2017-01-03 17:30:00'),
	(134, 32, 'weipinghui.png', 'http://baseromcdn.gionee.com/image/search/icon/weipinghui.png', NULL, NULL, NULL, '2017-01-03 17:30:00'),
	(135, 32, 'weipinhui.png', 'http://baseromcdn.gionee.com/image/search/icon/weipinhui.png', NULL, NULL, NULL, '2017-01-03 17:30:01'),
	(136, 32, 'weizhang.png', 'http://baseromcdn.gionee.com/image/search/icon/weizhang.png', NULL, NULL, NULL, '2017-01-03 17:30:01'),
	(137, 32, 'xinpinhui.png', 'http://baseromcdn.gionee.com/image/search/icon/xinpinhui.png', NULL, NULL, NULL, '2017-01-03 17:30:02'),
	(138, 32, 'yamaxun.png', 'http://baseromcdn.gionee.com/image/search/icon/yamaxun.png', NULL, NULL, NULL, '2017-01-03 17:30:03'),
	(139, 32, 'yihaodian.png', 'http://baseromcdn.gionee.com/image/search/icon/yihaodian.png', NULL, NULL, NULL, '2017-01-03 17:30:03'),
	(140, 32, 'yule.png', 'http://baseromcdn.gionee.com/image/search/icon/yule.png', NULL, NULL, NULL, '2017-01-03 17:30:04');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;


-- 导出  表 search.life_service 结构
DROP TABLE IF EXISTS `life_service`;
CREATE TABLE IF NOT EXISTS `life_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(50) DEFAULT NULL,
  `site_des` varchar(50) DEFAULT NULL,
  `show_enable` int(11) DEFAULT NULL COMMENT '0:不显示，1:显示',
  `sort_id` int(11) DEFAULT NULL,
  `site_url` varchar(500) DEFAULT NULL,
  `icon_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='生活服务表';

-- 正在导出表  search.life_service 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `life_service` DISABLE KEYS */;
INSERT INTO `life_service` (`id`, `site_name`, `site_des`, `show_enable`, `sort_id`, `site_url`, `icon_url`) VALUES
	(1, '查快递', '快捷查询，实时追踪', 1, 1, 'http://m.kuaidi100.com/', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/kuaidi.png'),
	(2, '家政服务', '干净无死角', 1, 2, 'http://m.nuomi.com/sz/927/0-0/0-0-0-0-0', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/jiazheng.png'),
	(3, '预约挂号', '在线预约，无需排队', 1, 3, 'http://yi.baidu.com/wise/search/index?zt=wxpz', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/guahao.png'),
	(4, '查公交', '给你最全的出行方案', 1, 4, 'http://zuoche.com/touch', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/gongjiao.png'),
	(5, '休闲娱乐', '玩的多，省的更多', 1, 5, 'http://m.nuomi.com/sz/320/0-0/0-0-0-0-0', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/yule.png'),
	(6, '查违章', '自动提醒，省时省心', 1, 6, 'http://light.weiche.me/', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/weizhang.png');
/*!40000 ALTER TABLE `life_service` ENABLE KEYS */;


-- 导出  表 search.resources 结构
DROP TABLE IF EXISTS `resources`;
CREATE TABLE IF NOT EXISTS `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `res_key` varchar(100) DEFAULT NULL COMMENT '操作后刷新的标志',
  `res_url` varchar(200) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL COMMENT '图标路径',
  `type` int(11) DEFAULT NULL COMMENT '0:模块，1:目录，2:菜单，3:按钮',
  `parent_id` int(11) DEFAULT NULL,
  `parent_id_list` varchar(200) DEFAULT NULL COMMENT '例如：※1※2※3※',
  `level` int(11) DEFAULT NULL COMMENT '排序号',
  `description` varchar(200) DEFAULT NULL,
  `css_class` varchar(100) DEFAULT NULL COMMENT '是按钮是使用',
  `target` varchar(100) DEFAULT NULL COMMENT 'dialog:弹窗；navTab：选项卡等，具体根绝dwz框架填写',
  `win_width` int(11) DEFAULT NULL COMMENT '弹出窗的宽',
  `win_height` int(11) DEFAULT NULL COMMENT '弹出窗的高',
  `warn` varchar(100) DEFAULT NULL COMMENT '未选择行的操作提示',
  `tittle` varchar(100) DEFAULT NULL COMMENT '删除时的操作提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='资源信息表';

-- 正在导出表  search.resources 的数据：~52 rows (大约)
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` (`id`, `name`, `res_key`, `res_url`, `icon`, `type`, `parent_id`, `parent_id_list`, `level`, `description`, `css_class`, `target`, `win_width`, `win_height`, `warn`, `tittle`) VALUES
	(0, '根目录', 'root', '无', 'framework/zTreeV3/css/zTreeStyle/img/diy/1_close.png', NULL, -1, '*-1*', NULL, '树根', NULL, NULL, NULL, NULL, NULL, '0'),
	(1, '全局搜索管理', 'model_search', '无', 'framework/images/model.png', 0, 0, '*-1*0*1*', NULL, '模块-全局搜索管理', '', '', NULL, NULL, '', '0'),
	(2, '系统管理', 'model_system', '无', 'framework/images/model.png', 0, 0, '*-1*0*2*', NULL, '模块-系统管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(3, '账号管理', 'menu_account_manage', 'account/queryAccountPaper', 'framework/images/menu.png', 2, 2, '*-1*0*2*3*', NULL, '菜单项-账号管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(4, '分组管理', 'menu_role_manage', 'role/queryRolePaper', 'framework/images/menu.png', 2, 2, '*-1*0*2*4*', NULL, '菜单项-分组管理（是按照角色权限的逻辑开发实现）', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(5, '菜单管理', 'menu_manage', 'resources/queryResourcesPaper', 'framework/images/menu.png', 2, 2, '*-1*0*2*5*', NULL, '菜单项-菜单管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(7, '旧版广告管理', 'menu_ad_manage', 'ad/queryAdPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*24*', NULL, '菜单项-广告位管理', '', 'navTab', NULL, NULL, '', '0'),
	(9, '卡片管理', 'menu_card_manager', 'card/queryCardPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*9*', NULL, '菜单项-卡片管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(20, '网址导航管理', 'menu_site_manage', 'site/querySitePaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*20*', NULL, '菜单项-网址导航管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(21, '参数管理', 'menu_config_manage', 'config/queryConfigPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*21*', NULL, '菜单项-擦数管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(22, '添加', 'button_account_add', 'account/addAccountView?editType=add', 'framework/images/button.png', 3, 3, '*-1*0*2*3*22*', NULL, '账号管理-添加按钮', 'add', 'dialog', NULL, NULL, NULL, '0'),
	(23, '修改', 'button_account_update', 'account/editAccountView?editType=update&id={id_account}', 'framework/images/button.png', 3, 3, '*-1*0*2*3*23*', NULL, '账号管理-修改按钮', 'edit', 'dialog', NULL, NULL, '请选择一个记录!', ''),
	(25, '添加', 'button_site_add', 'site/addSiteView?editType=add', 'framework/images/button.png', 3, 20, '*-1*0*1*20*25*', NULL, '网址导航-添加按钮', 'add', 'dialog', 510, 320, NULL, '0'),
	(26, '修改', 'button_site_edit', 'site/editSiteView?editType=update&id={id_site}', 'framework/images/button.png', 3, 20, '*-1*0*1*20*26*', NULL, '网址导航-修改按钮', 'edit', 'dialog', 510, 320, '请选择一个记录!', ''),
	(27, '删除', 'button_site_del', 'site/deleteSites?id={id_site}', 'framework/images/button.png', 3, 20, '*-1*0*1*20*27*', NULL, '网址导航-删除按钮', 'delete', 'selectedTodo', NULL, 320, '', '确实要删除所选记录吗?'),
	(28, '添加', 'button_config_add', 'config/addConfigView?editType=add', 'framework/images/button.png', 3, 21, '*-1*0*1*21*28*', NULL, '参数管理-添加按钮', 'add', 'dialog', 750, 330, NULL, '0'),
	(29, '修改', 'button_config_edit', 'config/editConfigView?editType=update&id={id_config}', 'framework/images/button.png', 3, 21, '*-1*0*1*21*29*', NULL, '参数管理-修改按钮', 'edit', 'dialog', 750, 330, '请选择一个记录!', ''),
	(30, '删除', 'button_config_del', 'config/deleteConfigs?id={id_config}', 'framework/images/button.png', 3, 21, '*-1*0*1*21*30*', NULL, '参数管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, NULL, '确实要删除所选记录吗?'),
	(31, '添加', 'button_ad_add', 'ad/addAdView?editType=add', 'framework/images/button.png', 3, 7, '*-1*0*1*24*7*31*', NULL, '广告位管理-添加按钮', 'add', 'dialog', 515, 370, NULL, '0'),
	(32, '修改', 'button_ad_edit', 'ad/editAdView?editType=update&id={id_ad}', 'framework/images/button.png', 3, 7, '*-1*0*1*24*7*32*', NULL, '广告位管理-修改按钮', 'edit', 'dialog', 515, 370, '请选择一个记录!', ''),
	(34, '删除', 'button_ad_del', 'ad/deleteAds?id={id_ad}', 'framework/images/button.png', 3, 7, '*-1*0*1*24*7*34*', NULL, '广告位管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, NULL, '确实要删除所选记录吗?'),
	(35, '添加', 'button_card_add', 'card/addCardView?editType=add', 'framework/images/button.png', 3, 9, '*-1*0*1*9*35*', NULL, '卡片-添加按钮', 'add', 'dialog', NULL, NULL, NULL, '0'),
	(36, '修改', 'button_card_edit', 'card/editCardView?editType=update&id={id_card}', 'framework/images/button.png', 3, 9, '*-1*0*1*9*36*', NULL, '卡片-修改按钮', 'edit', 'dialog', NULL, NULL, '请选择一个记录!', ''),
	(37, '删除', 'button_card_del', 'card/deleteCards?id={id_card}', 'framework/images/button.png', 3, 9, '*-1*0*1*9*37*', NULL, '卡片-删除按钮', 'delete', 'selectedTodo', NULL, NULL, NULL, '确实要删除所选记录吗?'),
	(38, '删除', 'button_account_del', 'account/deleteAccounts?id={id_account}', 'framework/images/button.png', 3, 3, '*-1*0*2*3*38*', NULL, '账号管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, NULL, '确实要删除所选记录吗?'),
	(39, '添加', 'button_group_add', 'role/addRoleView?editType=add', 'framework/images/button.png', 3, 4, '*-1*0*2*4*39*', NULL, '分组管理-添加按钮', 'add', 'dialog', 750, 255, NULL, '0'),
	(40, '修改', 'button_group_edit', 'role/editRoleView?editType=update&id={id_role}', 'framework/images/button.png', 3, 4, '*-1*0*2*4*40*', NULL, '分组管理-修改按钮', 'edit', 'dialog', 750, 255, '请选择一个记录!', ''),
	(41, '删除', 'button_group_del', 'role/deleteRoles?id={id_role}', 'framework/images/button.png', 3, 4, '*-1*0*2*4*41*', NULL, '分组管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, NULL, '确实要删除所选记录吗?'),
	(42, '分配权限', 'button_group_authority', 'role/assignAuthority?id={id_role}', 'framework/images/button.png', 3, 4, '*-1*0*2*4*42*', NULL, '分组管理-分配权限按钮', 'edit', 'dialog', 300, 500, '请选择一个记录!', ''),
	(43, '添加', 'button_menu_add', 'resources/addResourcesView?editType=add', 'framework/images/button.png', 3, 5, '*-1*0*2*5*43*', NULL, '菜单管理-添加按钮', 'add', 'dialog', 750, 490, NULL, '0'),
	(44, '修改', 'button_menu_edit', 'resources/editResourcesView?editType=update&id={id_res}', 'framework/images/button.png', 3, 5, '*-1*0*2*5*44*', NULL, '菜单管理-修改按钮', 'edit', 'dialog', 750, 490, '请选择一个记录!', ''),
	(45, '删除', 'button_menu_del', 'resources/deleteResources?id={id_res}', 'framework/images/button.png', 3, 5, '*-1*0*2*5*45*', NULL, '菜单管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, '', '确实要删除所选记录吗?'),
	(46, '生活服务管理', 'menu_lifeservice_manage', 'life/queryLifeServicePaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*46*', NULL, '菜单项-生活服务管理', '', 'navTab', NULL, NULL, '', ''),
	(47, '添加', 'button_lifeservice_add', 'life/addLifeServiceView?editType=add', 'framework/images/button.png', 3, 46, '*-1*0*1*46*47*', NULL, '生活服务管理-添加按钮', 'add', 'dialog', 750, 370, '', ''),
	(48, '修改', 'button_lifeservice_edit', 'life/editLifeServiceView?editType=update&id={id_life}', 'framework/images/button.png', 3, 46, '*-1*0*1*46*48*', NULL, '生活服务管理-修改按钮', 'edit', 'dialog', 750, 370, '请选择一个记录!', ''),
	(49, '删除', 'button_lifeservice_del', 'life/deleteLifeServices?id={id_life}', 'framework/images/button.png', 3, 46, '*-1*0*1*46*49*', NULL, '生活服务管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, '', '确实要删除所选记录吗?'),
	(50, '数据采集源', 'menu_data_from', 'search/changeSource', 'framework/images/menu.png', 2, 2, '*-1*0*2*50*', NULL, '切换数据采集源', '', 'navTab', NULL, NULL, '', ''),
	(51, '联想词采集源', 'menu_associatewords_manage', 'search/assoSourceList', 'framework/images/menu.png', 2, 2, '*-1*0*2*51*', NULL, '联想词采集源', '', 'navTab', NULL, NULL, '', ''),
	(52, '自定义热词管理', 'menu_hotkey_manage', 'hk/queryHotkeyPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*52*', NULL, '自定义热词管理用于自定义热词', '', 'navTab', 720, 340, '', '确实要删除所选记录吗?'),
	(53, '添加', 'button_hotkey_add', 'hk/addHotkeyView?editType=add', 'framework/images/button.png', 3, 52, '*-1*0*1*52*53*', NULL, '自定义热词管理-添加按钮', 'add', 'dialog', 720, 340, '', ''),
	(54, '修改', 'button_hotkey_edit', 'hk/editHotkeyView?editType=update&id={id_hk}', 'framework/images/button.png', 3, 52, '*-1*0*1*52*54*', NULL, '自定义热词管理-修改按钮', 'edit', 'dialog', 720, 340, '请选择一个记录!', ''),
	(55, '删除', 'button_hotkey_del', 'hk/deleteHotKeys?id={id_hk}', 'framework/images/button.png', 3, 52, '*-1*0*1*52*55*', NULL, '自定义热词管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, '', '确实要删除所选记录吗?'),
	(56, '名单管理', 'menu_rosters_manage', 'rosters/queryRostersPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*56*', NULL, '名单管理菜单', '', 'navTab', NULL, NULL, '', ''),
	(57, '添加', 'button_rosters_add', 'rosters/addRostersView?editType=add', 'framework/images/button.png', 3, 56, '*-1*0*1*56*57*', NULL, '软件包管理-添加按钮', 'add', 'dialog', 700, 380, '', ''),
	(58, '修改', 'button_rosters_edit', 'rosters/editRostersView?editType=update&id={id_r}', 'framework/images/button.png', 3, 56, '*-1*0*1*56*58*', NULL, '软件包管理-修改按钮', 'edit', 'dialog', 700, 380, '请选择一个记录!', ''),
	(59, '删除', 'button_rosters_del', 'rosters/deleteRosters?id={id_r}', 'framework/images/button.png', 3, 56, '*-1*0*1*56*59*', NULL, '软件包管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, '', '确实要删除所选记录吗?'),
	(60, '广告管理', 'menu_ad_manage', 'adinfo/adManageView', 'framework/images/menu.png', 2, 1, '*-1*0*1*60*', NULL, '广告编辑和投放的相关管理和运营', '', 'navTab', NULL, NULL, '', ''),
	(63, '字典管理', 'menu_dic_manage', 'dic/queryDicPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*63', NULL, '字典管理', '', 'navTab', NULL, NULL, '', ''),
	(64, '新闻广告管理', 'menu_news_manage', 'adNews/queryAdNewsPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*64*', NULL, '新闻广告管理', '', 'navTab', NULL, NULL, '', ''),
	(66, '应用版本管理', 'menu_appversion_manage', 'appVersion/queryAppVersionPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*66*', NULL, '应用版本管理', '', 'navTab', NULL, NULL, '', ''),
	(67, '应用入口管理', 'menu_adentrance_manage', 'appEntrance/queryAppEntrancePaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*67*', NULL, '应用入口管理', '', 'navTab', NULL, NULL, '', ''),
	(68, '图片素材管理', 'menu_images_manage', 'images/queryImagesPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*68*', NULL, '图片素材管理', '', 'navTab', NULL, NULL, '', '');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;


-- 导出  表 search.resources_role 结构
DROP TABLE IF EXISTS `resources_role`;
CREATE TABLE IF NOT EXISTS `resources_role` (
  `role_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  search.resources_role 的数据：~110 rows (大约)
/*!40000 ALTER TABLE `resources_role` DISABLE KEYS */;
INSERT INTO `resources_role` (`role_id`, `res_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 7),
	(1, 9),
	(1, 20),
	(1, 21),
	(1, 22),
	(1, 23),
	(1, 25),
	(1, 26),
	(1, 27),
	(1, 28),
	(1, 29),
	(1, 30),
	(1, 31),
	(1, 32),
	(1, 34),
	(1, 35),
	(1, 36),
	(1, 37),
	(1, 38),
	(1, 39),
	(1, 40),
	(1, 41),
	(1, 42),
	(1, 43),
	(1, 44),
	(1, 45),
	(1, 46),
	(1, 47),
	(1, 48),
	(1, 49),
	(1, 50),
	(1, 51),
	(1, 52),
	(1, 53),
	(1, 54),
	(1, 55),
	(1, 60),
	(1, 63),
	(1, 64),
	(1, 66),
	(1, 67),
	(1, 68),
	(2, 1),
	(2, 7),
	(2, 9),
	(2, 20),
	(2, 21),
	(2, 25),
	(2, 26),
	(2, 28),
	(2, 29),
	(2, 31),
	(2, 32),
	(2, 35),
	(2, 36),
	(2, 46),
	(2, 47),
	(2, 48),
	(4, 1),
	(4, 2),
	(4, 3),
	(4, 4),
	(4, 5),
	(4, 7),
	(4, 9),
	(4, 20),
	(4, 21),
	(4, 22),
	(4, 23),
	(4, 25),
	(4, 26),
	(4, 27),
	(4, 28),
	(4, 29),
	(4, 30),
	(4, 31),
	(4, 32),
	(4, 34),
	(4, 35),
	(4, 36),
	(4, 37),
	(4, 38),
	(4, 39),
	(4, 40),
	(4, 41),
	(4, 42),
	(4, 43),
	(4, 44),
	(4, 45),
	(4, 46),
	(4, 47),
	(4, 48),
	(4, 49),
	(4, 50),
	(4, 51),
	(4, 52),
	(4, 53),
	(4, 54),
	(4, 55),
	(4, 60),
	(4, 63),
	(4, 64),
	(4, 66),
	(4, 67),
	(4, 68);
/*!40000 ALTER TABLE `resources_role` ENABLE KEYS */;


-- 导出  表 search.role 结构
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enable` int(11) DEFAULT '0' COMMENT '0:禁用，1:启用',
  `role_name` varchar(100) DEFAULT NULL,
  `role_key` varchar(100) DEFAULT NULL COMMENT '权限关键字，默认ROLE_ADMIN',
  `description` varchar(200) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 正在导出表  search.role 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `enable`, `role_name`, `role_key`, `description`) VALUES
	(1, 1, 'root', 'ROLE_ADMIN', '根管理员'),
	(2, 1, '产品组', 'ROLE_ADMIN', ''),
	(3, 1, '运营组', 'ROLE_ADMIN', ''),
	(4, 1, '开发组', 'ROLE_ADMIN', ''),
	(5, 1, '测试组', 'ROLE_ADMIN', ''),
	(6, 0, '备用分组1', 'ROLE_ADMIN', '备用'),
	(7, 0, '备用分组2', 'ROLE_ADMIN', '备用');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- 导出  表 search.rosters 结构
DROP TABLE IF EXISTS `rosters`;
CREATE TABLE IF NOT EXISTS `rosters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usertype` varchar(50) NOT NULL COMMENT '用户类型：用户、开发人员、测试人员',
  `packagename` varchar(100) NOT NULL COMMENT '软件包名',
  `status` varchar(50) DEFAULT NULL COMMENT '状态值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='软件包信息';

-- 正在导出表  search.rosters 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `rosters` DISABLE KEYS */;
INSERT INTO `rosters` (`id`, `usertype`, `packagename`, `status`) VALUES
	(1, 'root', '全局搜索', '在线'),
	(2, 'settings_update', '金立翻译', '测试'),
	(3, 'root', '软件商店', '开发中'),
	(4, 'admin', '指南针AAA', '测试5665');
/*!40000 ALTER TABLE `rosters` ENABLE KEYS */;


-- 导出  表 search.site_navigation 结构
DROP TABLE IF EXISTS `site_navigation`;
CREATE TABLE IF NOT EXISTS `site_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dic_id` int(11) DEFAULT NULL COMMENT '机型(字典数据),-1表示没有选择机型，针对的是旧版本机器',
  `site_name` varchar(50) DEFAULT NULL,
  `site_url` varchar(500) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `show_enable` int(11) DEFAULT NULL COMMENT '0:不显示，1:显示',
  `icon_url` varchar(500) DEFAULT NULL,
  `icon` blob,
  `type` int(11) DEFAULT NULL COMMENT '-1:全部；0:常规网址；1:桌面widget网址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='网址导航表';

-- 正在导出表  search.site_navigation 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `site_navigation` DISABLE KEYS */;
INSERT INTO `site_navigation` (`id`, `dic_id`, `site_name`, `site_url`, `sort_id`, `show_enable`, `icon_url`, `icon`, `type`) VALUES
	(1, -1, '软件', 'http://gou.gionee.com/index/redirect?url_id=2461', 1, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/ruanjian.png', NULL, 0),
	(2, -1, '淘宝热卖', 'http://gou.gionee.com/index/redirect?url_id=2461', 2, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/taobao.png', NULL, 0),
	(3, -1, '蘑菇街', 'http://gou.gionee.com/index/redirect?url_id=2468', 3, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/meituan.png', NULL, 0),
	(4, -1, '京东', 'http://gou.gionee.com/index/redirect?url_id=2465', 4, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/jingdong.png', NULL, 0),
	(5, -1, '京东', 'http://gou.gionee.com/index/redirect?url_id=2467', 5, 0, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/meilishuo.png', NULL, 0),
	(6, -1, '蘑菇街', 'http://gou.gionee.com/index/redirect?url_id=2463', 6, 0, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/mogujie.png', NULL, 0),
	(7, -1, '1号店', 'http://gou.gionee.com/index/redirect?url_id=2466', 7, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/yihaodian.png', NULL, 0),
	(8, -1, '美团', 'http://gou.gionee.com/index/redirect?url_id=2469', 8, 0, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/yamaxun.png', NULL, 0),
	(9, -1, '瓷肌', 'https://s.click.taobao.com/t?e=m%3D2%26s%3D0hPiY7lMJ2kcQipKwQzePCperVdZeJviK7Vc7tFgwiFRAdhuF14FMWz1oUabqlT18sviUM61dt2H0mvjMaQR09t%2Bk1l0ozWibx7eyRGA3H82GaBwkk4XkY7LAa3DUrM2zt5vEinufIVAFEHVckI7b445SxkPgGIgiBqx4AoGTRxNtT0rMxO3Gvexx4nJGkU7e3jU0TKK5Ow9BS4QMf4b1LKB3FEXiAr8vB4K%2B06n9C6dzyyO9CIkVdQc6rs1qJwrxg5p7bh%2BFbQ%3D', 9, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/ciji.png', NULL, 0),
	(10, -1, '当当', 'http://gou.gionee.com/index/redirect?url_id=2470', 10, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/dangdang.png', NULL, 0),
	(11, -1, '聚划算', 'http://gou.gionee.com/index/redirect?url_id=2471', 11, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/juhuasuan.png', NULL, 1),
	(12, -1, '9块9', 'http://gou.gionee.com/index/redirect?url_id=2472', 12, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/9kuai9.png', NULL, 1),
	(16, -1, '百度', 'https://www.baidu.com/', 13, 1, 'http://pic.chinasspp.com/quan/News/image/20131023/20131023084622_8281.jpg', NULL, 1),
	(17, -1, '软件', 'http://gou.gionee.com/index/redirect?url_id=2461', 1, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/ruanjian.png', NULL, 0),
	(18, 19, '淘宝热卖', 'http://gou.gionee.com/index/redirect?url_id=2461', 2, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/taobao.png', NULL, 0);
/*!40000 ALTER TABLE `site_navigation` ENABLE KEYS */;


-- 导出  表 search.sys_dictionary 结构
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE IF NOT EXISTS `sys_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cls_id` int(11) DEFAULT NULL,
  `dic_value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sys_dictionary_sys_dictionary_classify` (`cls_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='字典值';

-- 正在导出表  search.sys_dictionary 的数据：~25 rows (大约)
/*!40000 ALTER TABLE `sys_dictionary` DISABLE KEYS */;
INSERT INTO `sys_dictionary` (`id`, `cls_id`, `dic_value`) VALUES
	(1, 3, 'CPC'),
	(2, 3, 'CPM'),
	(3, 3, 'CPA'),
	(4, 1, '无图'),
	(5, 1, '200dp  × 200dp 图片(包括顶部banner广告）'),
	(6, 1, '300dp  × 300dp 图片（包括插屏广告）'),
	(10, 3, 'CPS'),
	(11, 3, 'CPP'),
	(12, 3, 'CPC+CPM'),
	(18, 10, '金刚'),
	(19, 10, 'GN9011'),
	(20, 10, 'GN9012'),
	(21, 10, 'M6'),
	(22, 10, 'M6 Plus'),
	(23, 10, 'F100'),
	(24, 10, 'F103'),
	(25, 11, 'tittle广告'),
	(26, 11, '原生广告'),
	(27, 11, 'banner广告'),
	(28, 11, '短信广告'),
	(29, 12, '首页'),
	(30, 12, '综合搜索页'),
	(31, 13, '新闻'),
	(32, 13, '导航'),
	(33, 13, '广告');
/*!40000 ALTER TABLE `sys_dictionary` ENABLE KEYS */;


-- 导出  表 search.sys_dictionary_classify 结构
DROP TABLE IF EXISTS `sys_dictionary_classify`;
CREATE TABLE IF NOT EXISTS `sys_dictionary_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `dic_key` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='系统配置表，字典类型，用于定义一些有可能动态增减的选择项';

-- 正在导出表  search.sys_dictionary_classify 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `sys_dictionary_classify` DISABLE KEYS */;
INSERT INTO `sys_dictionary_classify` (`id`, `name`, `dic_key`) VALUES
	(1, '广告规格', 'ad_specification'),
	(3, '付费方式', 'billing_type'),
	(10, '机型', 'mechine_type'),
	(11, '广告形式', 'ad_modality'),
	(12, '跳转页面', 'redirect_page'),
	(13, '图片素材类型', 'images_type');
/*!40000 ALTER TABLE `sys_dictionary_classify` ENABLE KEYS */;


-- 导出  表 search.version 结构
DROP TABLE IF EXISTS `version`;
CREATE TABLE IF NOT EXISTS `version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usertype` varchar(50) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  search.version 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` (`id`, `usertype`, `version`) VALUES
	(1, 'root', 3),
	(2, 'settings_update', 2),
	(3, 'admin', 9);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
