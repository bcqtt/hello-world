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
	(2, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '18218089328', 'laizhiwen@ginoee.com', NULL, NULL, 1, NULL, '2016-11-23 17:08:52'),
	(35, 'lzw', '赖志文', '4607e782c4d86fd5364d7e4508bb10d9', '12345678910', 'lzw@ginoee.com', NULL, NULL, 1, '2016-05-09 18:14:30', '2016-05-10 13:44:41'),
	(41, 'liuyb', '刘艳波', 'e10adc3949ba59abbe56e057f20f883e', '', '', NULL, NULL, 1, '2016-04-18 17:09:22', '2016-05-10 11:52:20');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


-- 导出  表 search.account_role 结构
DROP TABLE IF EXISTS `account_role`;
CREATE TABLE IF NOT EXISTS `account_role` (
  `account_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`,`role_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='广告信息表';

-- 正在导出表  search.ad_control 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `ad_control` DISABLE KEYS */;
INSERT INTO `ad_control` (`id`, `name`, `show_flag`, `position_id`, `ad_img`, `ad_url`) VALUES
	(1, '广告1', 1, 2, 'https://ss0.bdstatic.com/-0U0bnSm1A5BphGlnYG/tam-ogel/0d845e56a93b5e60021d6f607808564b_255_96.jpg', 'youku://play?vid=12345&source=bdhz-jinli&pkg=com.youku.phone.jinli&minVersion=5.2.21&action=android.intent.action.VIEW'),
	(2, '广告2', 1, 5, 'https://ss0.bdstatic.com/-0U0bnSm1A5BphGlnYG/tam-ogel/0169ebcd5fa93fd4fa80ad46c7709916_255_96.jpg', 'https://www.baidu.com/'),
	(3, '广告3', 1, 3, 'https://ss0.bdstatic.com/-0U0bnSm1A5BphGlnYG/tam-ogel/5b8fc714908dc97378d52a5dda15e472_255_96.jpg', 'gioneeTing://openFind?pkg=com.ximalaya.ting.android.gionee&title=你好&content=最熟悉的“暖”旋律&minVersion=1.4.5'),
	(4, '易粉嘉年华', 1, 1, 'http://t-baserom.gionee.com/images/banner1.png', 'http://www.jd.com'),
	(5, '换了斗地主', 1, 4, 'http://t-baserom.gionee.com/images/banner4.png', 'http://www.3g.gionee.com');
/*!40000 ALTER TABLE `ad_control` ENABLE KEYS */;


-- 导出  表 search.app_uri 结构
DROP TABLE IF EXISTS `app_uri`;
CREATE TABLE IF NOT EXISTS `app_uri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '1:youku;2:gioneeTing;3:http;4:https',
  `uri` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='打开第三方应用的uri';

-- 正在导出表  search.app_uri 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `app_uri` DISABLE KEYS */;
INSERT INTO `app_uri` (`id`, `type`, `uri`) VALUES
	(1, 'youku', 'youku://play?vid=12345&source=bdhz-jinli&pkg=com.youku.phone.jinli&minVersion=5.2.21&action=android.intent.action.VIEW'),
	(2, 'youku', 'youku://play?vid=XMTc3MTg1ODg4MA&source=bdhz-jinli&pkg=com.youku.phone.jinli&minVersion=5.2.21'),
	(3, 'gioneeTing', 'gioneeTing://openFind?pkg=com.ximalaya.ting.android.gionee&title=你好&content=最熟悉的“暖”旋律&minVersion=1.4.5');
/*!40000 ALTER TABLE `app_uri` ENABLE KEYS */;


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
  KEY `key` (`code`),
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
	(4, 'defaultAssociateWordsSource', '默认联想词接口', 'http://3g.gionee.com/api/desktop/searchLikeWords?keyword=', 0, 2),
	(5, 'sougouAssociateWordsSource', '搜狗联想词接口', 'http://api.sugg.sogou.com/su?type=wap&fmt=1&ie=utf8&key=', 1, 2);
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
) ENGINE=InnoDB AUTO_INCREMENT=616445 DEFAULT CHARSET=utf8 COMMENT='热词表';

-- 正在导出表  search.hot_keys 的数据：~55 rows (大约)
/*!40000 ALTER TABLE `hot_keys` DISABLE KEYS */;
INSERT INTO `hot_keys` (`id`, `url`, `hot_key`, `stats`, `sort_id`, `type`) VALUES
	(613460, 'http://www.163.com/special/0077450P/login_frame.html', '#王宝强离婚#', 1, 1, 1),
	(613461, 'http://www.163.com/special/0077450P/login_frame.html', '#马蓉结婚#', 1, 2, 1),
	(613462, 'http://www.163.com/special/0077450P/login_frame.html', '#宋喆出轨#', 1, 3, 1),
	(615461, 'http://localhost:8080/search_local/login/login#menu_hotkey_manage', '双11狂欢抢先购', 1, 1, 2),
	(615462, 'http://localhost:8080/search_local/login/login#menu_hotkey_manage', '#双11来啦#', 1, 4, 1),
	(616395, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%92%8B%E5%8A%B2%E5%A4%AB%E5%8F%97%E4%BC%A4&pid=sogou-mobp-eeea8c180c5dff16&v=5', '蒋劲夫受伤', 0, NULL, 0),
	(616396, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%96%B0%E8%83%BD%E6%BA%90%E7%A9%BA%E9%93%81%E8%AF%95%E8%B7%91&pid=sogou-mobp-eeea8c180c5dff16&v=5', '新能源空铁试跑', 0, NULL, 0),
	(616397, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%8B%8F%E5%AE%81vs%E6%81%92%E5%A4%A7&pid=sogou-mobp-eeea8c180c5dff16&v=5', '苏宁vs恒大', 1, NULL, 0),
	(616398, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%89%B9%E6%9C%97%E6%99%AE%E7%A7%BB%E6%B0%91%E6%94%BF%E7%AD%96&pid=sogou-mobp-eeea8c180c5dff16&v=5', '特朗普移民政策', 0, NULL, 0),
	(616399, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%AB%8C%E7%8A%AF%E5%96%9D4%E7%93%B6%E9%85%92%E5%A3%AE%E8%83%86&pid=sogou-mobp-eeea8c180c5dff16&v=5', '嫌犯喝4瓶酒壮胆', 0, NULL, 0),
	(616400, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%98%BF%E5%A8%87%E4%B8%BA%E9%98%BFSa%E5%BA%86%E7%94%9F&pid=sogou-mobp-eeea8c180c5dff16&v=5', '阿娇为阿Sa庆生', 0, NULL, 0),
	(616401, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%8F%A4%E7%89%B9%E9%9B%B7%E6%96%AF%E5%B0%86%E8%AE%BF%E5%8D%8E&pid=sogou-mobp-eeea8c180c5dff16&v=5', '古特雷斯将访华', 0, NULL, 0),
	(616402, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%97%A5%E6%9C%AC%E7%A6%8F%E5%B2%9B%E5%9C%B0%E9%9C%87&pid=sogou-mobp-eeea8c180c5dff16&v=5', '日本福岛地震', 0, NULL, 0),
	(616403, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%8A%A0%E5%A4%9A%E5%AE%9D%E7%99%BB%E6%8A%A5%E9%81%93%E6%AD%89&pid=sogou-mobp-eeea8c180c5dff16&v=5', '加多宝登报道歉', 1, NULL, 0),
	(616404, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%A6%99%E6%B8%AF%E5%8F%91%E7%94%9F%E6%8A%A2%E5%8A%AB%E6%A1%88&pid=sogou-mobp-eeea8c180c5dff16&v=5', '香港发生抢劫案', 0, NULL, 0),
	(616405, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B4%AA%E7%A7%80%E6%9F%B1%E8%AF%81%E5%AE%9E%E6%94%B9%E9%80%89&pid=sogou-mobp-eeea8c180c5dff16&v=5', '洪秀柱证实改选', 0, NULL, 0),
	(616406, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9E%97%E5%BF%97%E7%8E%B2%E6%99%92%E5%81%A5%E8%BA%AB%E7%85%A7&pid=sogou-mobp-eeea8c180c5dff16&v=5', '林志玲晒健身照', 0, NULL, 0),
	(616407, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%8D%B0%E5%BA%A6%E7%81%AB%E8%BD%A6%E8%84%B1%E8%BD%A8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '印度火车脱轨', 0, NULL, 0),
	(616408, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9F%94%E6%9C%AF%E7%BE%8E%E5%A5%B3%E5%B1%95%E8%BA%AB%E6%AE%B5&pid=sogou-mobp-eeea8c180c5dff16&v=5', '柔术美女展身段', 0, NULL, 0),
	(616409, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%88%90%E9%83%BD%E7%A9%BA%E9%93%81%E6%8A%95%E8%BF%90&pid=sogou-mobp-eeea8c180c5dff16&v=5', '成都空铁投运', 1, NULL, 0),
	(616410, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%A6%96%E8%8E%B7%E6%88%88%E7%99%BB%E8%B4%9D%E5%B0%94%E5%A5%96&pid=sogou-mobp-eeea8c180c5dff16&v=5', '首获戈登贝尔奖', 0, NULL, 0),
	(616411, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%80%81%E9%B9%B0%E6%8A%93%E6%97%A0%E4%BA%BA%E6%9C%BA&pid=sogou-mobp-eeea8c180c5dff16&v=5', '老鹰抓无人机', 0, NULL, 0),
	(616412, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A4%A9%E4%B8%8B%E7%AC%AC%E4%B8%80%E5%BA%8A%E4%BA%AE%E7%9B%B8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '天下第一床亮相', 0, NULL, 0),
	(616413, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%BD%8E%E5%A4%B4%E6%97%8F%E6%91%94%E4%BC%A4%E7%B4%A2%E8%B5%94&pid=sogou-mobp-eeea8c180c5dff16&v=5', '低头族摔伤索赔', 0, NULL, 0),
	(616414, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%85%B0%E5%B7%9E%E5%8D%95%E5%8F%8C%E5%8F%B7%E9%99%90%E8%A1%8C&pid=sogou-mobp-eeea8c180c5dff16&v=5', '兰州单双号限行', 0, NULL, 0),
	(616415, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B8%89%E6%98%9FS7%E6%89%8B%E6%9C%BA%E7%88%86%E7%82%B8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '三星S7手机爆炸', 1, NULL, 0),
	(616416, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%8E%A6%E9%97%A8%E5%A9%9A%E7%BA%B1%E6%91%84%E5%BD%B1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '厦门婚纱摄影', 0, NULL, 0),
	(616417, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%8B%B1%E8%AF%AD%E5%AD%A6%E4%B9%A0%E7%BD%91&pid=sogou-mobp-eeea8c180c5dff16&v=5', '英语学习网', 0, NULL, 0),
	(616418, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%B0%91%E5%B9%B4%E4%B8%89%E5%9B%BD%E5%BF%97%E5%AE%98%E7%BD%91&pid=sogou-mobp-eeea8c180c5dff16&v=5', '少年三国志官网', 0, NULL, 0),
	(616419, 'https://wap.sogou.com/web/searchList.jsp?keyword=400%E7%94%B5%E8%AF%9D%E6%94%B6%E8%B4%B9%E6%A0%87%E5%87%86&pid=sogou-mobp-eeea8c180c5dff16&v=5', '400电话收费标准', 0, NULL, 0),
	(616420, 'https://wap.sogou.com/web/searchList.jsp?keyword=Ella%E4%B8%8E%E7%88%B1%E7%8A%AC%E5%90%8C%E5%BA%8A&pid=sogou-mobp-eeea8c180c5dff16&v=5', 'Ella与爱犬同床', 0, NULL, 0),
	(616421, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%80%81%E5%A4%AA%E5%80%92%E6%8C%82%E6%99%BE%E8%A1%A3%E6%9E%B6&pid=sogou-mobp-eeea8c180c5dff16&v=5', '老太倒挂晾衣架', 1, NULL, 0),
	(616422, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%A5%9E%E8%88%9F%E5%8D%81%E4%B8%80%E5%8F%B7%E7%9D%80%E9%99%86&pid=sogou-mobp-eeea8c180c5dff16&v=5', '神舟十一号着陆', 0, NULL, 0),
	(616423, 'https://wap.sogou.com/web/searchList.jsp?keyword=500%E5%90%8D%E4%B8%BB%E6%92%AD%E8%A2%AB%E6%AC%A0%E8%96%AA&pid=sogou-mobp-eeea8c180c5dff16&v=5', '500名主播被欠薪', 0, NULL, 0),
	(616424, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%8C%97%E4%BA%AC%E8%BF%8E%E5%88%9D%E9%9B%AA%E9%99%8D%E6%B8%A9&pid=sogou-mobp-eeea8c180c5dff16&v=5', '北京迎初雪降温', 0, NULL, 0),
	(616425, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%BC%85%E7%94%B8%E5%86%9B%E4%BA%8B%E5%86%B2%E7%AA%81&pid=sogou-mobp-eeea8c180c5dff16&v=5', '缅甸军事冲突', 0, NULL, 0),
	(616426, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B9%96%E5%8D%97%E5%8D%96%E6%B7%AB%E6%A1%88%E5%AE%A3%E5%88%A4&pid=sogou-mobp-eeea8c180c5dff16&v=5', '湖南卖淫案宣判', 0, NULL, 0),
	(616427, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%85%92%E9%A9%BE%E8%A2%AB%E6%9F%A5%E6%89%91%E6%B0%91%E8%AD%A6&pid=sogou-mobp-eeea8c180c5dff16&v=5', '酒驾被查扑民警', 1, NULL, 0),
	(616428, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B7%98%E5%AE%9D%E7%BD%91%E5%85%9C%E5%94%AE%E9%87%8E%E9%B8%9F&pid=sogou-mobp-eeea8c180c5dff16&v=5', '淘宝网兜售野鸟', 0, NULL, 0),
	(616429, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%B5%A4%E8%BA%AB%E5%90%8A%E4%BA%A1%E6%A1%88%E5%91%8A%E7%A0%B4&pid=sogou-mobp-eeea8c180c5dff16&v=5', '赤身吊亡案告破', 0, NULL, 0),
	(616430, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B8%AF%E5%AA%92%E5%85%B3%E6%B3%A8%E5%86%9C%E6%B0%91%E5%B7%A5&pid=sogou-mobp-eeea8c180c5dff16&v=5', '港媒关注农民工', 0, NULL, 0),
	(616431, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B9%96%E5%8D%97%E7%94%B7%E5%AD%90%E6%8D%85%E6%9D%803%E4%BA%BA&pid=sogou-mobp-eeea8c180c5dff16&v=5', '湖南男子捅杀3人', 0, NULL, 0),
	(616432, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9E%97%E5%85%81%E8%A2%AB%E4%BA%BA%E8%B7%9F%E8%B8%AA&pid=sogou-mobp-eeea8c180c5dff16&v=5', '林允被人跟踪', 0, NULL, 0),
	(616433, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%8C%9F%E8%B4%A7%E8%A6%815%E5%80%8D%E8%BF%90%E8%B4%B9&pid=sogou-mobp-eeea8c180c5dff16&v=5', '挟货要5倍运费', 1, NULL, 0),
	(616434, 'https://wap.sogou.com/web/searchList.jsp?keyword=37%E8%BD%A6%E8%BF%9E%E7%8E%AF%E7%9B%B8%E6%92%9E&pid=sogou-mobp-eeea8c180c5dff16&v=5', '37车连环相撞', 0, NULL, 0),
	(616435, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B8%AD%E5%9B%BD%E6%B0%94%E8%B1%A1%E5%B1%80%E9%81%93%E6%AD%89&pid=sogou-mobp-eeea8c180c5dff16&v=5', '中国气象局道歉', 0, NULL, 0),
	(616436, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%8C%97%E4%BA%AC%E8%BF%8E%E4%BB%8A%E5%86%AC%E5%88%9D%E9%9B%AA&pid=sogou-mobp-eeea8c180c5dff16&v=5', '北京迎今冬初雪', 0, NULL, 0),
	(616437, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%8B%97%E6%92%9E%E4%BA%BA%E4%B8%BB%E4%BA%BA%E8%B5%94%E5%81%BF&pid=sogou-mobp-eeea8c180c5dff16&v=5', '狗撞人主人赔偿', 0, NULL, 0),
	(616438, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%AD%95%E5%A6%87%E8%B6%85%E9%80%9F%E8%A1%8C%E9%A9%B6&pid=sogou-mobp-eeea8c180c5dff16&v=5', '孕妇超速行驶', 0, NULL, 0),
	(616439, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B8%83%E6%97%AC%E8%80%81%E4%BA%BA%E9%81%AD%E8%AF%88%E9%AA%97&pid=sogou-mobp-eeea8c180c5dff16&v=5', '七旬老人遭诈骗', 1, NULL, 0),
	(616440, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%88%98%E9%8A%AE%E9%9B%84%E6%89%B6%E6%AD%A3%E7%94%98%E6%AF%94&pid=sogou-mobp-eeea8c180c5dff16&v=5', '刘銮雄扶正甘比', 0, NULL, 0),
	(616441, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B8%89%E4%BA%9A%E5%A9%9A%E7%BA%B1%E6%91%84%E5%BD%B1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '三亚婚纱摄影', 0, NULL, 0),
	(616442, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%80%8E%E6%A0%B7%E7%94%B3%E8%AF%B7%E4%BF%A1%E7%94%A8%E5%8D%A1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '怎样申请信用卡', 0, NULL, 0),
	(616443, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%BE%B3%E9%97%A8%E9%93%B6%E6%B2%B3&pid=sogou-mobp-eeea8c180c5dff16&v=5', '澳门银河', 0, NULL, 0),
	(616444, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%AD%A6%E7%94%9F%E4%BF%A1%E7%94%A8%E5%8D%A1%E7%94%B3%E8%AF%B7&pid=sogou-mobp-eeea8c180c5dff16&v=5', '学生信用卡申请', 0, NULL, 0);
/*!40000 ALTER TABLE `hot_keys` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='资源信息表';

-- 正在导出表  search.resources 的数据：~48 rows (大约)
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` (`id`, `name`, `res_key`, `res_url`, `icon`, `type`, `parent_id`, `parent_id_list`, `level`, `description`, `css_class`, `target`, `win_width`, `win_height`, `warn`, `tittle`) VALUES
	(0, '根目录', 'root', '无', 'framework/zTreeV3/css/zTreeStyle/img/diy/1_close.png', NULL, -1, '*-1*', NULL, '树根', NULL, NULL, NULL, NULL, NULL, '0'),
	(1, '全局搜索管理', 'model_search', '无', 'framework/images/model.png', 0, 0, '*-1*0*1*', NULL, '模块-全局搜索管理', '', '', NULL, NULL, '', '0'),
	(2, '系统管理', 'model_system', '无', 'framework/images/model.png', 0, 0, '*-1*0*2*', NULL, '模块-系统管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(3, '账号管理', 'menu_account_manage', 'account/queryAccountPaper', 'framework/images/menu.png', 2, 2, '*-1*0*2*3*', NULL, '菜单项-账号管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(4, '分组管理', 'menu_role_manage', 'role/queryRolePaper', 'framework/images/menu.png', 2, 2, '*-1*0*2*4*', NULL, '菜单项-分组管理（是按照角色权限的逻辑开发实现）', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(5, '菜单管理', 'menu_manage', 'resources/queryResourcesPaper', 'framework/images/menu.png', 2, 2, '*-1*0*2*5*', NULL, '菜单项-菜单管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(7, '广告位管理', 'menu_ad_manage', 'ad/queryAdPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*24*', NULL, '菜单项-广告位管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(9, '卡片管理', 'menu_card_manager', 'card/queryCardPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*9*', NULL, '菜单项-卡片管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(20, '网址导航管理', 'menu_site_manage', 'site/querySitePaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*20*', NULL, '菜单项-网址导航管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(21, '参数管理', 'menu_config_manage', 'config/queryConfigPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*21*', NULL, '菜单项-擦数管理', NULL, 'navTab', NULL, NULL, NULL, '0'),
	(22, '添加', 'button_account_add', 'account/addAccountView?editType=add', 'framework/images/button.png', 3, 3, '*-1*0*2*3*22*', NULL, '账号管理-添加按钮', 'add', 'dialog', NULL, NULL, NULL, '0'),
	(23, '修改', 'button_account_update', 'account/editAccountView?editType=update&id={id_account}', 'framework/images/button.png', 3, 3, '*-1*0*2*3*23*', NULL, '账号管理-修改按钮', 'edit', 'dialog', NULL, NULL, '请选择一个记录!', ''),
	(25, '添加', 'button_site_add', 'site/addSiteView?editType=add', 'framework/images/button.png', 3, 20, '*-1*0*1*20*25*', NULL, '网址导航-添加按钮', 'add', 'dialog', 510, 300, NULL, '0'),
	(26, '修改', 'button_site_edit', 'site/editSiteView?editType=update&id={id_site}', 'framework/images/button.png', 3, 20, '*-1*0*1*20*26*', NULL, '网址导航-修改按钮', 'edit', 'dialog', 510, 300, '请选择一个记录!', ''),
	(27, '删除', 'button_site_del', 'site/deleteSites?id={id_site}', 'framework/images/button.png', 3, 20, '*-1*0*1*20*27*', NULL, '网址导航-删除按钮', 'delete', 'selectedTodo', NULL, NULL, '', '确实要删除所选记录吗?'),
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
	(60, '广告管理', 'menu_ad_manage', 'ad/adManageView', 'framework/images/menu.png', 2, 1, '*-1*0*1*60*', NULL, '广告编辑和投放的相关管理和运营', '', 'navTab', NULL, NULL, '', ''),
	(61, '第三方应用URI', 'menu_uri_manage', 'uri/queryUriPaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*61*', NULL, '第三方uri管理', '', 'navTab', NULL, NULL, '', '');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;


-- 导出  表 search.resources_role 结构
DROP TABLE IF EXISTS `resources_role`;
CREATE TABLE IF NOT EXISTS `resources_role` (
  `role_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  search.resources_role 的数据：~100 rows (大约)
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
	(4, 61);
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
  `site_name` varchar(50) DEFAULT NULL,
  `site_url` varchar(500) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `show_enable` int(11) DEFAULT NULL COMMENT '0:不显示，1:显示',
  `icon_url` varchar(500) DEFAULT NULL,
  `icon` blob,
  `type` int(11) DEFAULT NULL COMMENT '-1:全部；0:常规网址；1:桌面widget网址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='网址导航表';

-- 正在导出表  search.site_navigation 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `site_navigation` DISABLE KEYS */;
INSERT INTO `site_navigation` (`id`, `site_name`, `site_url`, `sort_id`, `show_enable`, `icon_url`, `icon`, `type`) VALUES
	(1, '软件', 'http://m.appgionee.com/?fr=gn_search_h5', 1, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/ruanjian.png', NULL, 0),
	(2, '淘宝热卖', 'http://gou.gionee.com/index/redirect?url_id=2461', 2, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/taobao.png', NULL, 0),
	(3, '蘑菇街', 'http://gou.gionee.com/index/redirect?url_id=2468', 3, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/meituan.png', NULL, 0),
	(4, '京东', 'http://gou.gionee.com/index/redirect?url_id=2465', 4, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/jingdong.png', NULL, 0),
	(5, '京东', 'http://gou.gionee.com/index/redirect?url_id=2467', 5, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/meilishuo.png', NULL, 0),
	(6, '蘑菇街', 'http://gou.gionee.com/index/redirect?url_id=2463', 6, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/mogujie.png', NULL, 0),
	(7, '1号店', 'http://gou.gionee.com/index/redirect?url_id=2466', 7, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/yihaodian.png', NULL, 0),
	(8, '美团', 'http://gou.gionee.com/index/redirect?url_id=2469', 8, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160729/nav/yamaxun.png', NULL, 0),
	(9, '瓷肌', 'https://s.click.taobao.com/t?e=m%3D2%26s%3D0hPiY7lMJ2kcQipKwQzePCperVdZeJviK7Vc7tFgwiFRAdhuF14FMWz1oUabqlT18sviUM61dt2H0mvjMaQR09t%2Bk1l0ozWibx7eyRGA3H82GaBwkk4XkY7LAa3DUrM2zt5vEinufIVAFEHVckI7b445SxkPgGIgiBqx4AoGTRxNtT0rMxO3Gvexx4nJGkU7e3jU0TKK5Ow9BS4QMf4b1LKB3FEXiAr8vB4K%2B06n9C6dzyyO9CIkVdQc6rs1qJwrxg5p7bh%2BFbQ%3D', 9, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/ciji.png', NULL, 0),
	(10, '当当', 'http://gou.gionee.com/index/redirect?url_id=2470', 10, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/dangdang.png', NULL, 0),
	(11, '聚划算', 'http://gou.gionee.com/index/redirect?url_id=2471', 11, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/juhuasuan.png', NULL, 1),
	(12, '9块9', 'http://gou.gionee.com/index/redirect?url_id=2472', 12, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/9kuai9.png', NULL, 1),
	(16, '百度', 'https://www.baidu.com/', 13, 1, 'http://pic.chinasspp.com/quan/News/image/20131023/20131023084622_8281.jpg', NULL, 1);
/*!40000 ALTER TABLE `site_navigation` ENABLE KEYS */;


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
