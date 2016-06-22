-- --------------------------------------------------------
-- 主机:                           testidpaydb01.mysql.rds.aliyuncs.com
-- 服务器版本:                        5.6.16-log - Source distribution
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 testbaserowdb 的数据库结构
DROP DATABASE IF EXISTS `search`;
CREATE DATABASE IF NOT EXISTS `search` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `search`;


-- 导出  表 testbaserowdb.account 结构
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

-- 正在导出表  testbaserowdb.account 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `account_name`, `name`, `password`, `phone_number`, `email`, `type`, `description`, `group_id`, `create_time`, `last_login_time`) VALUES
	(1, 'root', 'root', 'e10adc3949ba59abbe56e057f20f883e', '13763033450', 'abc@123.com', NULL, NULL, 1, '2016-05-09 18:14:25', '2016-04-18 17:08:13'),
	(2, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '13763033450', 'lzw@ginoee.com', NULL, NULL, 1, '2016-04-15 11:16:53', '2016-06-14 16:29:55'),
	(35, 'lzw', '赖志文', '4607e782c4d86fd5364d7e4508bb10d9', '12345678910', 'lzw@ginoee.com', NULL, NULL, 1, '2016-05-09 18:14:30', '2016-05-10 13:44:41'),
	(41, 'liuyb', '刘艳波', 'e10adc3949ba59abbe56e057f20f883e', '', '', NULL, NULL, 1, '2016-04-18 17:09:22', '2016-05-10 11:52:20');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


-- 导出  表 testbaserowdb.account_role 结构
DROP TABLE IF EXISTS `account_role`;
CREATE TABLE IF NOT EXISTS `account_role` (
  `account_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`,`role_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  testbaserowdb.account_role 的数据：~11 rows (大约)
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


-- 导出  表 testbaserowdb.ad_control 结构
DROP TABLE IF EXISTS `ad_control`;
CREATE TABLE IF NOT EXISTS `ad_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `show_flag` int(11) DEFAULT '0',
  `position_id` int(11) DEFAULT NULL,
  `ad_img` varchar(300) DEFAULT NULL,
  `ad_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告信息表';

-- 正在导出表  testbaserowdb.ad_control 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `ad_control` DISABLE KEYS */;
INSERT INTO `ad_control` (`id`, `name`, `show_flag`, `position_id`, `ad_img`, `ad_url`) VALUES
	(1, '广告1', 1, 1, 'https://ss0.bdstatic.com/-0U0bnSm1A5BphGlnYG/tam-ogel/0d845e56a93b5e60021d6f607808564b_255_96.jpg', 'http://www.jd.com'),
	(2, '广告2', 1, 2, 'https://ss0.bdstatic.com/-0U0bnSm1A5BphGlnYG/tam-ogel/0169ebcd5fa93fd4fa80ad46c7709916_255_96.jpg', 'https://www.baidu.com/'),
	(3, '广告3', 1, 3, 'https://ss0.bdstatic.com/-0U0bnSm1A5BphGlnYG/tam-ogel/5b8fc714908dc97378d52a5dda15e472_255_96.jpg', 'https://www.baidu.com/');
/*!40000 ALTER TABLE `ad_control` ENABLE KEYS */;


-- 导出  表 testbaserowdb.card 结构
DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT '排序号',
  `show_enable` int(11) DEFAULT NULL COMMENT '0:显示在首页，1:不显示在首页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  testbaserowdb.card 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` (`id`, `name`, `order_id`, `show_enable`) VALUES
	(1, '看点新闻', 1, 1),
	(2, '生活服务', 2, 1),
	(3, '网址导航', 3, 1);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;


-- 导出  表 testbaserowdb.config 结构
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

-- 正在导出表  testbaserowdb.config 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` (`id`, `code`, `name`, `value`, `status`, `description`) VALUES
	(1, 'hotkey_eachrow_number', '热词每行个数', '2', 1, NULL),
	(2, 'sitenav_eachrow_number', '网址导航每行个数', '4', 1, NULL),
	(3, 'hotkey_open_url', '热词链接', 'http://m.baidu.com/s?from=1008021x&word=', 1, ''),
	(4, 'keyword_open_url', '关键字链接', 'http://m.baidu.com/s?from=1008021y&word=', 1, '');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;


-- 导出  表 testbaserowdb.group_info 结构
DROP TABLE IF EXISTS `group_info`;
CREATE TABLE IF NOT EXISTS `group_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分组信息表';

-- 正在导出表  testbaserowdb.group_info 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `group_info` DISABLE KEYS */;
INSERT INTO `group_info` (`id`, `group_name`) VALUES
	(1, '产品组'),
	(2, '运营组'),
	(3, '开发组'),
	(4, '测试组');
/*!40000 ALTER TABLE `group_info` ENABLE KEYS */;


-- 导出  表 testbaserowdb.hotkey_source 结构
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

-- 正在导出表  testbaserowdb.hotkey_source 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `hotkey_source` DISABLE KEYS */;
INSERT INTO `hotkey_source` (`id`, `source_code`, `source_name`, `url`, `enable_status`, `type`) VALUES
	(1, 'haosouDataExtract', '好搜热词接口', 'http://m.haosou.com/mhtml/app_index/app_news.json', 0, 1),
	(2, 'baiduDataExtract', '百度热词接口', 'http://top.baidu.com/gen_json?b=1', 0, 1),
	(3, 'sougouDataExtract', '搜狗热词接口', 'http://ts.mobile.sogou.com/query?pid=sogou-mobp-eeea8c180c5dff16&num=50&length=15&select=1,2,5,6,10,11,13,20', 1, 1),
	(4, 'defaultAssociateWordsSource', '默认联想词接口', 'http://3g.gionee.com/api/desktop/searchLikeWords?keyword=', 0, 2),
	(5, 'sougouAssociateWordsSource', '搜狗联想词接口', 'http://api.sugg.sogou.com/su?type=wap&fmt=1&ie=utf8&key=', 1, 2);
/*!40000 ALTER TABLE `hotkey_source` ENABLE KEYS */;


-- 导出  表 testbaserowdb.hot_keys 结构
DROP TABLE IF EXISTS `hot_keys`;
CREATE TABLE IF NOT EXISTS `hot_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) DEFAULT NULL,
  `hot_key` varchar(50) DEFAULT NULL,
  `stats` int(11) DEFAULT '0' COMMENT '1:表示new;0:不表示new，默认0',
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=612296 DEFAULT CHARSET=utf8 COMMENT='热词表';

-- 正在导出表  testbaserowdb.hot_keys 的数据：~50 rows (大约)
/*!40000 ALTER TABLE `hot_keys` DISABLE KEYS */;
INSERT INTO `hot_keys` (`id`, `url`, `hot_key`, `stats`, `sort_id`) VALUES
	(612246, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%94%B7%E5%AD%90%E9%95%BF4%E4%B8%AA%E8%82%BE&pid=sogou-mobp-eeea8c180c5dff16&v=5', '男子长4个肾', 0, NULL),
	(612247, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B0%B4%E5%BA%93%E7%82%B8%E5%87%BA1%E5%90%A8%E5%B7%A8%E8%9F%92&pid=sogou-mobp-eeea8c180c5dff16&v=5', '水库炸出1吨巨蟒', 0, NULL),
	(612248, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%91%A3%E6%B4%81%E9%A6%96%E8%B0%88%E7%A6%BB%E5%A9%9A&pid=sogou-mobp-eeea8c180c5dff16&v=5', '董洁首谈离婚', 1, NULL),
	(612249, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%97%A56.5%E4%B8%87%E4%BA%BA%E8%B5%B6%E7%BE%8E%E5%86%9B&pid=sogou-mobp-eeea8c180c5dff16&v=5', '日6.5万人赶美军', 0, NULL),
	(612250, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%B6%85%E6%A8%A1%E6%8B%BC%E4%BA%BA%E4%BD%93%E8%8A%B1%E6%9C%B5&pid=sogou-mobp-eeea8c180c5dff16&v=5', '超模拼人体花朵', 0, NULL),
	(612251, 'https://wap.sogou.com/web/searchList.jsp?keyword=iphone6%E4%BE%B5%E6%9D%83&pid=sogou-mobp-eeea8c180c5dff16&v=5', 'iphone6侵权', 0, NULL),
	(612252, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A5%B3%E5%AD%90%E5%B8%A6%E5%89%8D%E5%A4%AB%E6%94%B9%E5%AB%81&pid=sogou-mobp-eeea8c180c5dff16&v=5', '女子带前夫改嫁', 0, NULL),
	(612253, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%AD%94%E5%85%BD%E7%A5%A8%E6%88%BF%E8%B6%8512%E4%BA%BF&pid=sogou-mobp-eeea8c180c5dff16&v=5', '魔兽票房超12亿', 0, NULL),
	(612254, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%BF%84%E7%BD%97%E6%96%AF%E4%B8%BB%E5%B8%85%E8%BE%9E%E8%81%8C&pid=sogou-mobp-eeea8c180c5dff16&v=5', '俄罗斯主帅辞职', 1, NULL),
	(612255, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B6%88%E9%98%B2%E5%91%98%E6%95%91%E5%96%B5%E6%98%9F%E4%BA%BA&pid=sogou-mobp-eeea8c180c5dff16&v=5', '消防员救喵星人', 0, NULL),
	(612256, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9D%8E%E5%85%8B%E5%BC%BA%E5%BB%BA%E8%A1%8C%E8%80%83%E5%AF%9F&pid=sogou-mobp-eeea8c180c5dff16&v=5', '李克强建行考察', 0, NULL),
	(612257, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9C%80%E6%9C%89%E6%89%8D%E5%8D%8E%E8%BE%9E%E8%81%8C%E4%BF%A1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '最有才华辞职信', 0, NULL),
	(612258, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%A5%9E%E5%A8%81%E8%AE%A1%E7%AE%97%E6%9C%BA%E5%A4%BA%E5%86%A0&pid=sogou-mobp-eeea8c180c5dff16&v=5', '神威计算机夺冠', 0, NULL),
	(612259, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B3%95%E5%9B%BD%E5%8B%92%E8%8A%92%E8%80%90%E5%8A%9B%E8%B5%9B&pid=sogou-mobp-eeea8c180c5dff16&v=5', '法国勒芒耐力赛', 0, NULL),
	(612260, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A5%B3%E5%AD%90%E6%82%AC%E6%8C%823%E6%A5%BC%E8%A2%AB%E7%A0%B8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '女子悬挂3楼被砸', 1, NULL),
	(612261, 'https://wap.sogou.com/web/searchList.jsp?keyword=5%E5%85%B7%E5%B0%B8%E9%AA%B8%E8%97%8F6%E5%B9%B4&pid=sogou-mobp-eeea8c180c5dff16&v=5', '5具尸骸藏6年', 0, NULL),
	(612262, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B1%9F%E8%A5%BF%E6%B2%B3%E5%A0%A4%E6%BA%83%E5%8F%A3&pid=sogou-mobp-eeea8c180c5dff16&v=5', '江西河堤溃口', 0, NULL),
	(612263, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%85%89%E5%A4%B4%E6%9D%A8%E5%B9%82%E7%BE%8E%E7%BF%BB&pid=sogou-mobp-eeea8c180c5dff16&v=5', '光头杨幂美翻', 0, NULL),
	(612264, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%8F%91%E7%8E%B080%E5%85%AC%E6%96%A4%E5%A4%AA%E5%B2%81&pid=sogou-mobp-eeea8c180c5dff16&v=5', '发现80公斤太岁', 0, NULL),
	(612265, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%B6%85%E5%A5%B3%E6%80%BB%E5%86%B3%E8%B5%9B%E5%B0%86%E5%90%AF&pid=sogou-mobp-eeea8c180c5dff16&v=5', '超女总决赛将启', 0, NULL),
	(612266, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%90%B4%E5%AE%97%E5%AE%AA%E8%A2%AB%E5%88%A4%E5%88%91&pid=sogou-mobp-eeea8c180c5dff16&v=5', '吴宗宪被判刑', 1, NULL),
	(612267, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%8D%95%E9%B1%BC%E4%B8%8B%E5%88%86&pid=sogou-mobp-eeea8c180c5dff16&v=5', '捕鱼下分', 0, NULL),
	(612268, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%9C%9F%E4%BA%BA%E6%8D%95%E9%B1%BC%E8%B5%A2%E9%92%B1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '真人捕鱼赢钱', 0, NULL),
	(612269, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A9%9A%E7%BA%B1%E6%91%84%E5%BD%B1%E4%BB%B7%E6%A0%BC%E8%A1%A8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '婚纱摄影价格表', 0, NULL),
	(612270, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B8%8A%E6%B5%B7%E6%90%AC%E5%AE%B6%E5%85%AC%E5%8F%B8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '上海搬家公司', 0, NULL),
	(612271, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B8%80%E5%AE%B6%E4%BA%94%E5%8F%A3%E8%B4%A9%E5%A9%B4&pid=sogou-mobp-eeea8c180c5dff16&v=5', '一家五口贩婴', 0, NULL),
	(612272, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%8C%BB%E7%94%9F%E9%80%80%E4%BC%91%E5%BD%93%E4%BA%BA%E8%B4%A9&pid=sogou-mobp-eeea8c180c5dff16&v=5', '医生退休当人贩', 1, NULL),
	(612273, 'https://wap.sogou.com/web/searchList.jsp?keyword=2016%E6%B3%95%E5%9B%BD%E6%AC%A7%E6%B4%B2%E6%9D%AF&pid=sogou-mobp-eeea8c180c5dff16&v=5', '2016法国欧洲杯', 0, NULL),
	(612274, 'https://wap.sogou.com/web/searchList.jsp?keyword=94%E5%B2%81%E7%BA%B3%E7%B2%B9%E8%8E%B7%E5%88%91&pid=sogou-mobp-eeea8c180c5dff16&v=5', '94岁纳粹获刑', 0, NULL),
	(612275, 'https://wap.sogou.com/web/searchList.jsp?keyword=45%E5%B0%8F%E6%97%B6%E8%B7%91%E5%AE%8C%E5%85%AD%E7%8E%AF&pid=sogou-mobp-eeea8c180c5dff16&v=5', '45小时跑完六环', 0, NULL),
	(612276, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%BC%8A%E8%83%BD%E9%9D%99%E5%BD%95%E5%88%B6%E8%83%8E%E5%8A%A8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '伊能静录制胎动', 0, NULL),
	(612277, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A5%B3%E6%98%9F%E6%95%B4%E5%BD%A2%E8%B6%8550%E6%AC%A1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '女星整形超50次', 0, NULL),
	(612278, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%93%B6%E8%A1%8C%E5%A5%87%E8%91%A9%E8%80%83%E6%A0%B8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '银行奇葩考核', 1, NULL),
	(612279, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9D%9C%E6%B5%B7%E6%B6%9B%E8%B0%88%E5%90%B4%E6%98%95&pid=sogou-mobp-eeea8c180c5dff16&v=5', '杜海涛谈吴昕', 0, NULL),
	(612280, 'https://wap.sogou.com/web/searchList.jsp?keyword=4%E5%A4%A9%E6%8D%9510%E5%A4%B4%E9%B2%A8%E9%B1%BC&pid=sogou-mobp-eeea8c180c5dff16&v=5', '4天捕10头鲨鱼', 0, NULL),
	(612281, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A4%A7%E6%9A%B4%E9%9B%A8%E8%A2%AD%E5%87%BB%E5%90%88%E8%82%A5&pid=sogou-mobp-eeea8c180c5dff16&v=5', '大暴雨袭击合肥', 0, NULL),
	(612282, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%89%8D%E9%A9%BB%E6%B3%95%E5%A4%A7%E4%BD%BF%E5%8E%BB%E4%B8%96&pid=sogou-mobp-eeea8c180c5dff16&v=5', '前驻法大使去世', 0, NULL),
	(612283, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%BC%A0%E5%AE%B6%E7%95%8C%E6%B5%B7%E5%B8%82%E8%9C%83%E6%A5%BC&pid=sogou-mobp-eeea8c180c5dff16&v=5', '张家界海市蜃楼', 0, NULL),
	(612284, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%89%AF%E9%95%87%E9%95%BF%E5%BC%80%E7%BD%91%E7%BA%A6%E8%BD%A6&pid=sogou-mobp-eeea8c180c5dff16&v=5', '副镇长开网约车', 1, NULL),
	(612285, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B1%AA%E5%B0%8F%E8%8F%B2%E8%A2%AB%E6%89%B9&pid=sogou-mobp-eeea8c180c5dff16&v=5', '汪小菲被批', 0, NULL),
	(612286, 'https://wap.sogou.com/web/searchList.jsp?keyword=3%E5%B0%91%E5%A5%B3%E8%A2%AB%E5%BC%BA%E8%A1%8C%E5%B8%A6%E8%B5%B0&pid=sogou-mobp-eeea8c180c5dff16&v=5', '3少女被强行带走', 0, NULL),
	(612287, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%A9%AC%E8%88%AA370%E9%81%97%E7%89%A9%E7%85%A7&pid=sogou-mobp-eeea8c180c5dff16&v=5', '马航370遗物照', 0, NULL),
	(612288, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%AE%89%E5%BE%BD%E5%AE%BF%E6%9D%BE%E6%9A%B4%E9%9B%A8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '安徽宿松暴雨', 0, NULL),
	(612289, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%A4%9A%E7%9C%81%E9%BC%93%E5%8A%B12.5%E5%A4%A9%E5%81%87&pid=sogou-mobp-eeea8c180c5dff16&v=5', '多省鼓励2.5天假', 0, NULL),
	(612290, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9F%B3%E5%B2%A9%E6%B7%B1%E5%A4%9C%E5%8F%91%E5%86%99%E7%9C%9F&pid=sogou-mobp-eeea8c180c5dff16&v=5', '柳岩深夜发写真', 1, NULL),
	(612291, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%8C%83%E5%86%B0%E5%86%B0%E5%BC%9F%E5%BC%9F%E5%BA%86%E7%94%9F&pid=sogou-mobp-eeea8c180c5dff16&v=5', '范冰冰弟弟庆生', 0, NULL),
	(612292, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%BF%A1%E7%94%A8%E5%8D%A1%E7%BD%91%E4%B8%8A%E7%94%B3%E8%AF%B7&pid=sogou-mobp-eeea8c180c5dff16&v=5', '信用卡网上申请', 0, NULL),
	(612293, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%BE%BE%E5%86%85%E5%9F%B9%E8%AE%AD&pid=sogou-mobp-eeea8c180c5dff16&v=5', '达内培训', 0, NULL),
	(612294, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B1%87%E9%80%9A%E8%B4%A2%E7%BB%8F%E7%9B%B4%E6%92%AD%E5%AE%A4&pid=sogou-mobp-eeea8c180c5dff16&v=5', '汇通财经直播室', 0, NULL),
	(612295, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B8%89%E4%BA%9A%E5%A9%9A%E7%BA%B1%E7%85%A7&pid=sogou-mobp-eeea8c180c5dff16&v=5', '三亚婚纱照', 0, NULL);
/*!40000 ALTER TABLE `hot_keys` ENABLE KEYS */;


-- 导出  表 testbaserowdb.life_service 结构
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

-- 正在导出表  testbaserowdb.life_service 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `life_service` DISABLE KEYS */;
INSERT INTO `life_service` (`id`, `site_name`, `site_des`, `show_enable`, `sort_id`, `site_url`, `icon_url`) VALUES
	(1, '查快递', '快捷查询，实时追踪', 1, 1, 'http://m.kuaidi100.com/', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/kuaidi.png'),
	(2, '家政服务', '干净无死角', 1, 2, 'http://m.nuomi.com/sz/927/0-0/0-0-0-0-0', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/jiazheng.png'),
	(3, '预约挂号', '在线预约，无需排队', 1, 3, 'http://yi.baidu.com/wise/search/index?zt=wxpz', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/guahao.png'),
	(4, '查公交', '给你最全的出行方案', 1, 4, 'http://zuoche.com/touch', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/gongjiao.png'),
	(5, '休闲娱乐', '玩的多，省的更多', 1, 5, 'http://m.nuomi.com/sz/320/0-0/0-0-0-0-0', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/yule.png'),
	(6, '查违章', '自动提醒，省时省心', 1, 6, 'http://light.weiche.me/', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/weizhang.png');
/*!40000 ALTER TABLE `life_service` ENABLE KEYS */;


-- 导出  表 testbaserowdb.resources 结构
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='资源信息表';

-- 正在导出表  testbaserowdb.resources 的数据：~38 rows (大约)
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
	(51, '联想词采集源', 'menu_associatewords_manage', 'search/assoSourceList', 'framework/images/menu.png', 2, 2, '*-1*0*2*51*', NULL, '联想词采集源', '', 'navTab', NULL, NULL, '', '');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;


-- 导出  表 testbaserowdb.resources_role 结构
DROP TABLE IF EXISTS `resources_role`;
CREATE TABLE IF NOT EXISTS `resources_role` (
  `role_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  testbaserowdb.resources_role 的数据：~53 rows (大约)
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
	(2, 48);
/*!40000 ALTER TABLE `resources_role` ENABLE KEYS */;


-- 导出  表 testbaserowdb.role 结构
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enable` int(11) DEFAULT '0' COMMENT '0:禁用，1:启用',
  `role_name` varchar(100) DEFAULT NULL,
  `role_key` varchar(100) DEFAULT NULL COMMENT '权限关键字，默认ROLE_ADMIN',
  `description` varchar(200) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 正在导出表  testbaserowdb.role 的数据：~7 rows (大约)
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


-- 导出  表 testbaserowdb.site_navigation 结构
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

-- 正在导出表  testbaserowdb.site_navigation 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `site_navigation` DISABLE KEYS */;
INSERT INTO `site_navigation` (`id`, `site_name`, `site_url`, `sort_id`, `show_enable`, `icon_url`, `icon`, `type`) VALUES
	(1, '淘宝热卖', 'http://gou.gionee.com/index/redirect?url_id=2461', 1, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/taobao.png', NULL, 0),
	(2, '唯品会', 'http://gou.gionee.com/index/redirect?url_id=2462', 2, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/weipinhui.png', NULL, 0),
	(3, '蘑菇街', 'http://gou.gionee.com/index/redirect?url_id=2463', 3, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/mogujie.png', NULL, 0),
	(4, '瓷肌', 'http://gou.gionee.com/index/redirect?url_id=2464', 4, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/ciji.png', NULL, 0),
	(5, '京东', 'http://gou.gionee.com/index/redirect?url_id=2465', 5, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/jingdong.png', NULL, 0),
	(6, '1号店', 'http://gou.gionee.com/index/redirect?url_id=2466', 6, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/yihaodian.png', NULL, 0),
	(7, '美丽说', 'http://gou.gionee.com/index/redirect?url_id=2467', 7, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/meilishuo.png', NULL, 0),
	(8, '美团', 'http://gou.gionee.com/index/redirect?url_id=2468', 8, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/meituan.png', NULL, 0),
	(9, '亚马逊', 'http://gou.gionee.com/index/redirect?url_id=2469', 9, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/yamaxun.png', NULL, 0),
	(10, '当当', 'http://gou.gionee.com/index/redirect?url_id=2470', 10, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/dangdang.png', NULL, 0),
	(11, '聚划算', 'http://gou.gionee.com/index/redirect?url_id=2471', 11, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/juhuasuan.png', NULL, 1),
	(12, '9块9', 'http://gou.gionee.com/index/redirect?url_id=2472', 12, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/9kuai9.png', NULL, 1),
	(16, '百度', 'https://www.baidu.com/', 13, 1, 'http://pic.chinasspp.com/quan/News/image/20131023/20131023084622_8281.jpg', NULL, 1);
/*!40000 ALTER TABLE `site_navigation` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
