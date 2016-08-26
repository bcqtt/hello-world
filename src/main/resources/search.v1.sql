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
	(2, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '18218089328', 'laizhiwen@ginoee.com', NULL, NULL, 1, NULL, '2016-08-24 15:40:51'),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告信息表';

-- 正在导出表  search.ad_control 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `ad_control` DISABLE KEYS */;
INSERT INTO `ad_control` (`id`, `name`, `show_flag`, `position_id`, `ad_img`, `ad_url`) VALUES
	(1, '广告1', 1, 1, 'https://ss0.bdstatic.com/-0U0bnSm1A5BphGlnYG/tam-ogel/0d845e56a93b5e60021d6f607808564b_255_96.jpg', 'http://www.jd.com'),
	(2, '广告2', 1, 2, 'https://ss0.bdstatic.com/-0U0bnSm1A5BphGlnYG/tam-ogel/0169ebcd5fa93fd4fa80ad46c7709916_255_96.jpg', 'https://www.baidu.com/'),
	(3, '广告3', 1, 3, 'https://ss0.bdstatic.com/-0U0bnSm1A5BphGlnYG/tam-ogel/5b8fc714908dc97378d52a5dda15e472_255_96.jpg', 'https://www.baidu.com/');
/*!40000 ALTER TABLE `ad_control` ENABLE KEYS */;


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
  `type` int(11) DEFAULT NULL COMMENT '1:表示自主添加；0:表示自动采集',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=614577 DEFAULT CHARSET=utf8 COMMENT='热词表';

-- 正在导出表  search.hot_keys 的数据：~41 rows (大约)
/*!40000 ALTER TABLE `hot_keys` DISABLE KEYS */;
INSERT INTO `hot_keys` (`id`, `url`, `hot_key`, `stats`, `sort_id`, `type`) VALUES
	(613460, 'http://www.163.com/special/0077450P/login_frame.html', '王宝强离婚', 1, 1, 1),
	(613461, 'http://www.163.com/special/0077450P/login_frame.html', '马蓉结婚', 1, 2, 1),
	(613462, 'http://www.163.com/special/0077450P/login_frame.html', '宋喆出轨', 1, 3, 1),
	(614539, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%AE%8B%E4%B8%B9%E4%B8%B9%E6%AF%8D%E4%BA%B2%E8%BF%87%E4%B8%96&pid=sogou-mobp-eeea8c180c5dff16&v=5', '宋丹丹母亲过世', 0, NULL, 0),
	(614540, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B8%AD%E5%9B%BD%E5%A5%B3%E6%8E%92%E5%9B%9E%E5%9B%BD&pid=sogou-mobp-eeea8c180c5dff16&v=5', '中国女排回国', 1, NULL, 0),
	(614541, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%89%AB%E4%BA%8C%E7%BB%B4%E7%A0%81%E5%A4%B14.5%E4%B8%87&pid=sogou-mobp-eeea8c180c5dff16&v=5', '扫二维码失4.5万', 0, NULL, 0),
	(614542, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%94%B7%E5%AD%90%E8%A2%AB%E7%AB%B9%E7%AB%BF%E7%A9%BF%E9%A2%88&pid=sogou-mobp-eeea8c180c5dff16&v=5', '男子被竹竿穿颈', 0, NULL, 0),
	(614543, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%B8%94%E6%B0%91%E6%8D%951.5%E5%90%A8%E9%B2%B8%E9%B2%A8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '渔民捕1.5吨鲸鲨', 0, NULL, 0),
	(614544, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B9%A0%E8%BF%91%E5%B9%B3%E9%9D%92%E6%B5%B7%E8%80%83%E5%AF%9F&pid=sogou-mobp-eeea8c180c5dff16&v=5', '习近平青海考察', 0, NULL, 0),
	(614545, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%9C%8D%E5%BB%BA%E5%8D%8E%E5%85%89%E5%A4%B4%E4%BA%AE%E7%9B%B8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '霍建华光头亮相', 0, NULL, 0),
	(614546, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9C%B4%E6%A0%91%E7%BD%95%E8%A7%81%E4%B8%8A%E7%BB%BC%E8%89%BA&pid=sogou-mobp-eeea8c180c5dff16&v=5', '朴树罕见上综艺', 1, NULL, 0),
	(614547, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%87%8D%E5%BA%863.3%E7%BA%A7%E5%9C%B0%E9%9C%87&pid=sogou-mobp-eeea8c180c5dff16&v=5', '重庆3.3级地震', 0, NULL, 0),
	(614548, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E8%8C%83%E5%86%B0%E5%86%B0%E9%81%AD%E5%82%AC%E5%A9%9A&pid=sogou-mobp-eeea8c180c5dff16&v=5', '范冰冰遭催婚', 0, NULL, 0),
	(614549, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9C%9D%E5%8F%91%E5%B0%84%E6%BD%9C%E5%B0%84%E5%AF%BC%E5%BC%B9&pid=sogou-mobp-eeea8c180c5dff16&v=5', '朝发射潜射导弹', 0, NULL, 0),
	(614550, 'https://wap.sogou.com/web/searchList.jsp?keyword=4%E5%85%AC%E9%87%8C%E8%8A%B11728%E5%85%83&pid=sogou-mobp-eeea8c180c5dff16&v=5', '4公里花1728元', 0, NULL, 0),
	(614551, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%B9%BC%E5%A5%B3%E8%A2%AB%E7%81%AB%E9%93%B3%E6%89%93%E4%BC%A4&pid=sogou-mobp-eeea8c180c5dff16&v=5', '幼女被火铳打伤', 0, NULL, 0),
	(614552, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%94%98%E8%96%87%E4%BA%8C%E8%83%8E%E7%94%9F%E5%84%BF%E5%AD%90&pid=sogou-mobp-eeea8c180c5dff16&v=5', '甘薇二胎生儿子', 1, NULL, 0),
	(614553, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%9B%A0%E8%87%AD%E8%A2%9C%E8%A2%AB%E6%89%93%E9%AA%A8%E6%8A%98&pid=sogou-mobp-eeea8c180c5dff16&v=5', '因臭袜被打骨折', 0, NULL, 0),
	(614554, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%93%B6%E6%B2%B3%E5%A8%B1%E4%B9%90%E7%BD%91%E7%AB%99&pid=sogou-mobp-eeea8c180c5dff16&v=5', '银河娱乐网站', 0, NULL, 0),
	(614555, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%BF%A1%E7%94%A8%E5%8D%A1%E7%94%B3%E8%AF%B7%E5%8A%9E%E7%90%86&pid=sogou-mobp-eeea8c180c5dff16&v=5', '信用卡申请办理', 0, NULL, 0),
	(614556, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%90%8D%E9%97%A8%E5%A8%B1%E4%B9%90%E7%BD%91&pid=sogou-mobp-eeea8c180c5dff16&v=5', '名门娱乐网', 0, NULL, 0),
	(614557, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%93%B6%E8%A1%8C%E5%8D%A1%E7%94%B3%E8%AF%B7%E5%8A%9E%E7%90%86&pid=sogou-mobp-eeea8c180c5dff16&v=5', '银行卡申请办理', 0, NULL, 0),
	(614558, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%84%8F%E5%A4%A7%E5%88%A96.4%E7%BA%A7%E5%9C%B0%E9%9C%87&pid=sogou-mobp-eeea8c180c5dff16&v=5', '意大利6.4级地震', 1, NULL, 0),
	(614559, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%A9%AC%E8%93%89%E7%A7%92%E5%88%A0%E5%BE%AE%E5%8D%9A&pid=sogou-mobp-eeea8c180c5dff16&v=5', '马蓉秒删微博', 0, NULL, 0),
	(614560, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%92%9F%E5%98%89%E6%AC%A3%E8%AF%9E%E4%B8%8B%E5%AE%9D%E5%AE%9D&pid=sogou-mobp-eeea8c180c5dff16&v=5', '钟嘉欣诞下宝宝', 0, NULL, 0),
	(614561, 'https://wap.sogou.com/web/searchList.jsp?keyword=23%E5%B2%81%E7%AB%A5%E6%98%9F%E7%BB%93%E5%A9%9A&pid=sogou-mobp-eeea8c180c5dff16&v=5', '23岁童星结婚', 0, NULL, 0),
	(614562, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%BA%AC%E5%89%A7%E8%84%B8%E5%88%97%E8%BD%A6%E4%BA%AE%E7%9B%B8&pid=sogou-mobp-eeea8c180c5dff16&v=5', '京剧脸列车亮相', 0, NULL, 0),
	(614563, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%B4%A2%E8%B5%94%E8%A2%AB%E5%81%9C%E5%8F%91%E5%B7%A5%E8%B5%84&pid=sogou-mobp-eeea8c180c5dff16&v=5', '索赔被停发工资', 0, NULL, 0),
	(614564, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%AF%81%E5%AE%B9%E5%B0%91%E5%A5%B3%E6%99%92%E5%86%99%E7%9C%9F&pid=sogou-mobp-eeea8c180c5dff16&v=5', '毁容少女晒写真', 1, NULL, 0),
	(614565, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%80%AA%E8%90%8D%E6%99%9230%E5%B9%B4%E5%89%8D%E7%85%A7&pid=sogou-mobp-eeea8c180c5dff16&v=5', '倪萍晒30年前照', 0, NULL, 0),
	(614566, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%9D%8E%E6%99%A8%E5%8D%8A%E5%A4%9C%E7%A7%80%E6%81%A9%E7%88%B1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '李晨半夜秀恩爱', 0, NULL, 0),
	(614567, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%AE%98%E5%91%98%E5%A4%A7%E9%97%B9%E6%95%99%E8%82%B2%E5%B1%80&pid=sogou-mobp-eeea8c180c5dff16&v=5', '官员大闹教育局', 0, NULL, 0),
	(614568, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%BC%A0%E9%94%80%E5%86%92%E5%85%85%E6%89%93%E4%BC%A0%E5%8A%9E&pid=sogou-mobp-eeea8c180c5dff16&v=5', '传销冒充打传办', 0, NULL, 0),
	(614569, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%BE%8E%E5%A5%B3%E7%88%B1%E5%A5%BD%E6%8A%93%E9%B3%84%E9%B1%BC&pid=sogou-mobp-eeea8c180c5dff16&v=5', '美女爱好抓鳄鱼', 0, NULL, 0),
	(614570, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E4%B8%8A%E6%B5%B72040%E8%A7%84%E5%88%92&pid=sogou-mobp-eeea8c180c5dff16&v=5', '上海2040规划', 1, NULL, 0),
	(614571, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%8B%9B%E5%8B%9F5%E4%BA%BA%E7%A9%B7%E6%B8%B88%E5%9B%BD&pid=sogou-mobp-eeea8c180c5dff16&v=5', '招募5人穷游8国', 0, NULL, 0),
	(614572, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E9%B3%84%E9%B1%BC30%E7%A7%92%E5%90%9E%E8%A2%8B%E9%BC%A0&pid=sogou-mobp-eeea8c180c5dff16&v=5', '鳄鱼30秒吞袋鼠', 0, NULL, 0),
	(614573, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E5%8E%A6%E9%97%A8%E5%A9%9A%E7%BA%B1%E6%91%84%E5%BD%B1&pid=sogou-mobp-eeea8c180c5dff16&v=5', '厦门婚纱摄影', 0, NULL, 0),
	(614574, 'https://wap.sogou.com/web/searchList.jsp?keyword=eia%E5%8E%9F%E6%B2%B9%E5%BA%93%E5%AD%98%E6%95%B0%E6%8D%AE&pid=sogou-mobp-eeea8c180c5dff16&v=5', 'eia原油库存数据', 0, NULL, 0),
	(614575, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E6%BE%B3%E9%97%A8%E5%A8%81%E5%B0%BC%E6%96%AF&pid=sogou-mobp-eeea8c180c5dff16&v=5', '澳门威尼斯', 0, NULL, 0),
	(614576, 'https://wap.sogou.com/web/searchList.jsp?keyword=%E7%9C%9F%E9%92%B1%E6%8D%95%E9%B1%BC&pid=sogou-mobp-eeea8c180c5dff16&v=5', '真钱捕鱼', 1, NULL, 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='资源信息表';

-- 正在导出表  search.resources 的数据：~42 rows (大约)
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
	(55, '删除', 'button_hotkey_del', 'hk/deleteHotKeys?id={id_hk}', 'framework/images/button.png', 3, 52, '*-1*0*1*52*55*', NULL, '自定义热词管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, '', '确实要删除所选记录吗?');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;


-- 导出  表 search.resources_role 结构
DROP TABLE IF EXISTS `resources_role`;
CREATE TABLE IF NOT EXISTS `resources_role` (
  `role_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  search.resources_role 的数据：~98 rows (大约)
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
	(4, 55);
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
	(9, '瓷肌', 'http://gou.gionee.com/index/redirect?url_id=2464', 9, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/ciji.png', NULL, 0),
	(10, '当当', 'http://gou.gionee.com/index/redirect?url_id=2470', 10, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160419/nav/dangdang.png', NULL, 0),
	(11, '聚划算', 'http://gou.gionee.com/index/redirect?url_id=2471', 11, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/juhuasuan.png', NULL, 1),
	(12, '9块9', 'http://gou.gionee.com/index/redirect?url_id=2472', 12, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/9kuai9.png', NULL, 1),
	(16, '百度', 'https://www.baidu.com/', 13, 1, 'http://pic.chinasspp.com/quan/News/image/20131023/20131023084622_8281.jpg', NULL, 1);
/*!40000 ALTER TABLE `site_navigation` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
