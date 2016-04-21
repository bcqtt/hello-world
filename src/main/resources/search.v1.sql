-- --------------------------------------------------------
-- 主机:                           18.8.10.53
-- 服务器版本:                        5.5.35-1ubuntu1 - (Ubuntu)
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
  `type` int(11) DEFAULT NULL COMMENT '1::管理员；0::超级管理员/普通用户',
  `description` varchar(200) DEFAULT NULL COMMENT '账户描述',
  `group_id` int(11) DEFAULT NULL COMMENT '分组id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='用户账号表';

-- 正在导出表  search.account 的数据：~28 rows (大约)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `account_name`, `name`, `password`, `phone_number`, `email`, `type`, `description`, `group_id`, `create_time`, `last_login_time`) VALUES
	(1, 'root', 'root', 'e10adc3949ba59abbe56e057f20f883e', '13763033450', 'abc@123.com', NULL, NULL, 3, '2016-04-18 17:09:06', '2016-04-18 17:08:13'),
	(2, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '13763033450', 'lzw@ginoee.com', NULL, NULL, 1, '2016-04-15 11:16:53', '2016-04-20 09:53:13'),
	(3, 'zhubajie', '猪八戒', 'e10adc3949ba59abbe56e057f20f883e', '13763033450', 'lzw@ginoee.com', NULL, NULL, 3, '2016-04-18 17:09:07', '2016-04-18 17:08:13'),
	(4, 'shaseng', '沙僧', 'e10adc3949ba59abbe56e057f20f883e', '12345678910', 'abc@123.com', NULL, NULL, 3, '2016-04-18 17:09:07', '2016-04-18 17:08:13'),
	(5, 'tangseng', '唐三藏', 'e10adc3949ba59abbe56e057f20f883e', '18823317039', 'lzw@ginoee.com', 3, NULL, 3, '2016-04-18 17:09:08', '2016-04-18 17:08:13'),
	(15, 'laizhiwen', '赖志Wen', 'e10adc3949ba59abbe56e057f20f883e', '12345678910', 'laizhiwen@ginoee.com', NULL, NULL, 3, '2016-04-18 17:09:09', '2016-04-18 17:08:13'),
	(17, 'gionee', '金立公司', 'e10adc3949ba59abbe56e057f20f883e', '0755-3383438', 'lzw@ginoee.com', NULL, NULL, 3, '2016-04-18 17:09:09', '2016-04-18 17:08:13'),
	(18, 'gionee2', '金立', 'e10adc3949ba59abbe56e057f20f883e', '', '', 3, NULL, 3, '2016-04-19 11:44:05', '2016-04-18 17:08:13'),
	(19, 'gionee3', '金立', 'e10adc3949ba59abbe56e057f20f883e', '', '', 3, NULL, 3, '2016-04-19 11:44:07', '2016-04-18 17:08:13'),
	(20, 'renren', '人人', 'e10adc3949ba59abbe56e057f20f883e', '', '', NULL, NULL, 3, '2016-04-18 17:09:11', '2016-04-18 17:08:13'),
	(21, 'renren2', '人人', 'e10adc3949ba59abbe56e057f20f883e', '', '', 3, NULL, 3, '2016-04-19 11:44:10', '2016-04-18 17:08:13'),
	(22, 'baidu', 'baidu', 'e10adc3949ba59abbe56e057f20f883e', '', '', 3, NULL, 3, '2016-04-18 17:09:14', '2016-04-18 17:08:13'),
	(23, 'baidu2', 'baidu', 'e10adc3949ba59abbe56e057f20f883e', '', '', 3, NULL, 3, '2016-04-19 11:44:13', '2016-04-18 17:08:13'),
	(24, 'sina', 'sina', 'e10adc3949ba59abbe56e057f20f883e', '', '', 3, NULL, 3, '2016-04-18 17:09:15', '2016-04-18 17:08:13'),
	(25, 'sina2', 'sina', 'e10adc3949ba59abbe56e057f20f883e', '', '', NULL, NULL, 4, '2016-04-19 11:44:16', '2016-04-18 17:08:13'),
	(27, 'abc', 'abc', 'e10adc3949ba59abbe56e057f20f883e', '', '', 3, NULL, 3, '2016-04-18 17:09:16', '2016-04-18 17:08:13'),
	(28, '55555', '55555', 'e10adc3949ba59abbe56e057f20f883e', '', '', 3, NULL, 3, '2016-04-18 17:09:16', '2016-04-18 17:08:13'),
	(29, '555552', '55555', 'e10adc3949ba59abbe56e057f20f883e', '', '', 3, NULL, 3, '2016-04-19 11:44:19', '2016-04-18 17:08:13'),
	(30, 'bbb', 'bbb', 'e10adc3949ba59abbe56e057f20f883e', '', '', 3, NULL, 3, '2016-04-18 17:09:18', '2016-04-18 17:08:13'),
	(31, 'ccc', 'ccc', 'e10adc3949ba59abbe56e057f20f883e', '', '', NULL, NULL, 3, '2016-04-18 17:09:18', '2016-04-18 17:08:13'),
	(32, 'Test6', 'Test6', 'e10adc3949ba59abbe56e057f20f883e', '12345678925', '123@123.com', NULL, NULL, 4, '2016-04-18 17:09:19', '2016-04-18 17:08:13'),
	(33, 'iluo', '我爱罗', 'e10adc3949ba59abbe56e057f20f883e', '13763033450', 'lzw@ginoee.com', NULL, NULL, 3, '2016-04-18 17:09:19', '2016-04-18 17:08:13'),
	(34, 'AAAAAAAAAA', '爱爱爱爱爱爱爱', 'e10adc3949ba59abbe56e057f20f883e', '12345678910', 'abc@123.com', NULL, NULL, 2, '2016-04-18 17:09:20', '2016-04-18 17:08:13'),
	(35, 'lzw', '赖志文', 'e10adc3949ba59abbe56e057f20f883e', '12345678910', 'lzw@ginoee.com', NULL, NULL, 2, '2016-04-18 17:08:37', '2016-04-18 17:09:29'),
	(36, 'abc3', 'abc', '8ddcff3a80f4189ca1c9d4d902c3c909', '12345678910', 'lzw@ginoee.com', NULL, NULL, 2, '2016-04-19 17:02:37', NULL),
	(38, 'angellala', '天使啦啦', 'e10adc3949ba59abbe56e057f20f883e', '12345678910', 'abc@123.com', NULL, NULL, 2, '2016-04-18 17:09:22', '2016-04-18 17:08:13'),
	(39, 'shenma', '什么', 'e10adc3949ba59abbe56e057f20f883e', '12345678910', 'abc@123.com', NULL, NULL, 5, '2016-04-18 17:09:22', '2016-04-18 17:08:13'),
	(40, 'luck', '啦卡', 'e10adc3949ba59abbe56e057f20f883e', '1234567890', 'abc@123.com', NULL, NULL, 5, '2016-04-18 17:09:24', '2016-04-18 17:08:13');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


-- 导出  表 search.account_role 结构
DROP TABLE IF EXISTS `account_role`;
CREATE TABLE IF NOT EXISTS `account_role` (
  `account_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`,`role_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  search.account_role 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` (`account_id`, `role_id`) VALUES
	(2, 1),
	(5, 8),
	(32, 4),
	(35, 2),
	(36, 2),
	(38, 2),
	(39, 5),
	(40, 5);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 正在导出表  search.card 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` (`id`, `name`, `order_id`, `show_enable`) VALUES
	(1, '卡片1', 1, 0),
	(2, '卡片2', 2, 1),
	(3, '卡片3', 3, 1),
	(4, '卡片4', 4, 1),
	(5, '卡片5', 5, 0),
	(6, '卡片6', 6, 0),
	(7, '卡片7', 7, 1),
	(8, '卡片8', 8, 0),
	(9, '卡片9', 9, 1),
	(10, '卡片10', 10, 0),
	(11, '卡片11', 11, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- 正在导出表  search.config 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` (`id`, `code`, `name`, `value`, `status`, `description`) VALUES
	(1, 'hotkey_eachrow_number', '热词每行个数', '2', 1, NULL),
	(2, 'sitenav_eachrow_number', '网址导航每行个数', '4', 1, NULL),
	(3, 'hotkey_open_url', '关键字链接', 'http://m.haosou.com/s?src=home&srcg=zl_jlxt_1&q=', 1, ''),
	(4, 'hotkey_source_url', '热搜词来源链接', 'http://m.haosou.com/mhtml/app_index/app_news.json', 1, NULL),
	(15, 'config6', '金立', '1', 1, '地方'),
	(16, 'test', 'asdfa f', 'adf', 1, 'asdf a');
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
  `enable_status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='热门资源表';

-- 正在导出表  search.hotkey_source 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `hotkey_source` DISABLE KEYS */;
INSERT INTO `hotkey_source` (`id`, `source_code`, `source_name`, `enable_status`) VALUES
	(1, 'haosouDataExtract', '好搜热词接口', 0),
	(2, 'baiduDataExtract', '百度热词接口', 1);
/*!40000 ALTER TABLE `hotkey_source` ENABLE KEYS */;


-- 导出  表 search.hot_keys 结构
DROP TABLE IF EXISTS `hot_keys`;
CREATE TABLE IF NOT EXISTS `hot_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) DEFAULT NULL,
  `hot_key` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=521917 DEFAULT CHARSET=utf8 COMMENT='热词表';

-- 正在导出表  search.hot_keys 的数据：~50 rows (大约)
/*!40000 ALTER TABLE `hot_keys` DISABLE KEYS */;
INSERT INTO `hot_keys` (`id`, `url`, `hot_key`, `sort_id`) VALUES
	(521832, NULL, '犯人被患艾滋病', 17),
	(521833, NULL, '房山区2.7级地震', 44),
	(521834, NULL, '甜馨不再上节目', 18),
	(521835, NULL, '阿富汗爆炸', 45),
	(521836, NULL, '宋仲基抱娃照疯传', 19),
	(521837, NULL, '行唐铲车大战', 46),
	(521838, NULL, '长春楼房坍塌', 1),
	(521839, NULL, '中学搬新址受污染', 47),
	(521840, NULL, '居民挖掘工地瓷片', 2),
	(521841, NULL, '厄瓜多尔强震', 48),
	(521842, NULL, '加油过满汽车起火', 3),
	(521843, NULL, '屈臣氏变屈巨氏', 49),
	(521844, NULL, '北京3号线终开工', 4),
	(521845, NULL, 'papi酱疑遭封杀', 10),
	(521846, NULL, '老外痛骂台湾女生', 5),
	(521847, NULL, '越南翻拍花千骨', 11),
	(521848, NULL, '千年木乃伊穿阿迪', 6),
	(521849, NULL, '友谊小船作者崩溃', 12),
	(521850, NULL, '现金被当垃圾扔掉', 7),
	(521851, NULL, '终身监禁不得减刑', 13),
	(521852, NULL, '30元方便面下架', 8),
	(521853, NULL, '杭州美女竹林', 14),
	(521854, NULL, '关晓彤晒长腿街拍', 9),
	(521855, NULL, '神志不清网购牦牛', 15),
	(521856, NULL, '王力宏半夜讲段子', 20),
	(521857, NULL, '张雨绮晒自拍撒娇', 16),
	(521858, NULL, '欧洲最偏远村庄', 21),
	(521859, NULL, '犯人被患艾滋病', 17),
	(521860, NULL, '玻璃渣改玛莎拉蒂', 22),
	(521861, NULL, '甜馨不再上节目', 18),
	(521862, NULL, '反隐身米波雷达', 23),
	(521863, NULL, '宋仲基抱娃照疯传', 19),
	(521864, NULL, '蔡依林戴2亿珠宝', 24),
	(521865, NULL, '长春楼房坍塌', 1),
	(521866, NULL, '美女酒托行骗', 25),
	(521867, NULL, '居民挖掘工地瓷片', 2),
	(521868, NULL, '女教师婚变吸毒', 26),
	(521869, NULL, '加油过满汽车起火', 3),
	(521870, NULL, '空气质量排名出炉', 27),
	(521871, NULL, '北京3号线终开工', 4),
	(521872, NULL, '出售机密被判死刑', 28),
	(521873, NULL, '老外痛骂台湾女生', 5),
	(521874, NULL, '熊本再次地震', 29),
	(521875, NULL, '千年木乃伊穿阿迪', 6),
	(521876, NULL, '马布里拿中国绿卡', 30),
	(521877, NULL, '现金被当垃圾扔掉', 7),
	(521878, NULL, '中军机降落永暑礁', 31),
	(521879, NULL, '30元方便面下架', 8),
	(521880, NULL, '济州打黑工遇害', 32),
	(521881, NULL, '关晓彤晒长腿街拍', 9),
	(521882, NULL, '深圳爷孙疑遭劫杀', 33),
	(521883, NULL, '王力宏半夜讲段子', 20),
	(521884, NULL, '周润发甜蜜接发嫂', 34),
	(521885, NULL, '欧洲最偏远村庄', 21),
	(521886, NULL, '箭毒蛙活体被截获', 35),
	(521887, NULL, '玻璃渣改玛莎拉蒂', 22),
	(521888, NULL, '轿车与120相撞', 36),
	(521889, NULL, '反隐身米波雷达', 23),
	(521890, NULL, '土地使用权到期', 37),
	(521891, NULL, '蔡依林戴2亿珠宝', 24),
	(521892, NULL, '白领夫妇卖房回乡', 38),
	(521893, NULL, '美女酒托行骗', 25),
	(521894, NULL, '顺丰小哥被打', 39),
	(521895, NULL, '女教师婚变吸毒', 26),
	(521896, NULL, '小s被疑怀4胎', 40),
	(521897, NULL, '空气质量排名出炉', 27),
	(521898, NULL, '李念生二胎后复出', 41),
	(521899, NULL, '出售机密被判死刑', 28),
	(521900, NULL, '德云社20年纪念', 42),
	(521901, NULL, '熊本再次地震', 29),
	(521902, NULL, '湖南暴雨受灾严重', 43),
	(521903, NULL, '马布里拿中国绿卡', 30),
	(521904, NULL, '中军机降落永暑礁', 31),
	(521905, NULL, '济州打黑工遇害', 32),
	(521906, NULL, '深圳爷孙疑遭劫杀', 33),
	(521907, NULL, '周润发甜蜜接发嫂', 34),
	(521908, NULL, '箭毒蛙活体被截获', 35),
	(521909, NULL, '轿车与120相撞', 36),
	(521910, NULL, '土地使用权到期', 37),
	(521911, NULL, '白领夫妇卖房回乡', 38),
	(521912, NULL, '顺丰小哥被打', 39),
	(521913, NULL, '小s被疑怀4胎', 40),
	(521914, NULL, '李念生二胎后复出', 41),
	(521915, NULL, '德云社20年纪念', 42),
	(521916, NULL, '湖南暴雨受灾严重', 43);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='生活服务表';

-- 正在导出表  search.life_service 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `life_service` DISABLE KEYS */;
INSERT INTO `life_service` (`id`, `site_name`, `site_des`, `show_enable`, `sort_id`, `site_url`, `icon_url`) VALUES
	(1, '查快递', '快捷查询，实时追踪', 1, 1, 'http://m.kuaidi100.com/', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/kuaidi.png'),
	(2, '家政服务', '干净无死角', 1, 2, 'http://m.nuomi.com/sz/927/0-0/0-0-0-0-0', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/jiazheng.png'),
	(3, '预约挂号', '在线预约，无需排队', 1, 3, 'http://yi.baidu.com/wise/search/index?zt=wxpz', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/guahao.png'),
	(4, '查公交', '给你最全的出行方案', 1, 4, 'http://zuoche.com/touch', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/gongjiao.png'),
	(5, '休闲娱乐', '玩的多，省的更多', 1, 5, 'http://m.nuomi.com/sz/320/0-0/0-0-0-0-0', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/yule.png'),
	(6, '查违章', '自动提醒，省时省心', 1, 6, 'http://light.weiche.me/', 'http://baseromcdn.gionee.com/image/search/icon/20160301/life/weizhang.png'),
	(7, '交房租', '便捷为民，足不出户', 0, 8, 'http://m.nuomi.com/sz/927/0-0/0-0-0-0-0', 'http://127.0.0.1:16823/img/ui-header-logo.svg'),
	(8, '充值深圳通', '方便快捷', 0, 9, 'https://www.baidu.com/', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2877268373,68123851&fm=58&s=B0B6359ED5706D905A5D80F20300D0B3');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='资源信息表';

-- 正在导出表  search.resources 的数据：~37 rows (大约)
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` (`id`, `name`, `res_key`, `res_url`, `icon`, `type`, `parent_id`, `parent_id_list`, `level`, `description`, `css_class`, `target`, `win_width`, `win_height`, `warn`, `tittle`) VALUES
	(0, '根目录', 'root', '无', 'framework/zTreeV3/css/zTreeStyle/img/diy/1_close.png', NULL, -1, '*-1*', NULL, '树根', NULL, NULL, NULL, NULL, NULL, '0'),
	(1, '全局搜索管理', 'menu_manage,menu_manage,menu_manage,model_search', '无', 'framework/images/model.png', 0, 0, '*-1*0*1*', NULL, '模块-全局搜索管理', '', '', NULL, NULL, '', '0'),
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
	(25, '添加', 'button_site_add', 'site/addSiteView?editType=add', 'framework/images/button.png', 3, 20, '*-1*0*1*20*25*', NULL, '网址导航-添加按钮', 'add', 'dialog', 510, 280, NULL, '0'),
	(26, '修改', 'button_site_edit', 'site/editSiteView?editType=update&id={id_site}', 'framework/images/button.png', 3, 20, '*-1*0*1*20*26*', NULL, '网址导航-修改按钮', 'edit', 'dialog', 510, 280, '请选择一个记录!', ''),
	(27, '删除', 'menu_manage,button_site_del', 'site/deleteSites?id={id_site}', 'framework/images/button.png', 3, 20, '*-1*0*1*20*27*', NULL, '网址导航-删除按钮', 'delete', 'selectedTodo', NULL, NULL, '', '确实要删除所选记录吗?'),
	(28, '添加', 'button_config_add', 'config/addConfigView?editType=add', 'framework/images/button.png', 3, 21, '*-1*0*1*21*28*', NULL, '参数管理-添加按钮', 'add', 'dialog', 520, 330, NULL, '0'),
	(29, '修改', 'button_config_edit', 'config/editConfigView?editType=update&id={id_config}', 'framework/images/button.png', 3, 21, '*-1*0*1*21*29*', NULL, '参数管理-修改按钮', 'edit', 'dialog', 520, 330, '请选择一个记录!', ''),
	(30, '删除', 'button_config_del', 'config/deleteConfigs?id={id_config}', 'framework/images/button.png', 3, 21, '*-1*0*1*21*30*', NULL, '参数管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, NULL, '确实要删除所选记录吗?'),
	(31, '添加', 'button_ad_add', 'ad/addAdView?editType=add', 'framework/images/button.png', 3, 7, '*-1*0*1*24*7*31*', NULL, '广告位管理-添加按钮', 'add', 'dialog', 515, 370, NULL, '0'),
	(32, '修改', 'button_ad_edit', 'ad/editAdView?editType=update&id={id_ad}', 'framework/images/button.png', 3, 7, '*-1*0*1*24*7*32*', NULL, '广告位管理-修改按钮', 'edit', 'dialog', 515, 370, '请选择一个记录!', ''),
	(34, '删除', 'button_ad_del', 'ad/deleteAds?id={id_ad}', 'framework/images/button.png', 3, 7, '*-1*0*1*24*7*34*', NULL, '广告位管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, NULL, '确实要删除所选记录吗?'),
	(35, '添加', 'button_card_add', 'card/addCardView?editType=add', 'framework/images/button.png', 3, 9, '*-1*0*1*9*9*35*', NULL, '卡片-添加按钮', 'add', 'dialog', NULL, NULL, NULL, '0'),
	(36, '修改', 'button_card_edit', 'card/editCardView?editType=update&id={id_card}', 'framework/images/button.png', 3, 9, '*-1*0*1*9*9*36*', NULL, '卡片-修改按钮', 'edit', 'dialog', NULL, NULL, '请选择一个记录!', ''),
	(37, '删除', 'button_card_del', 'card/deleteCards?id={id_card}', 'framework/images/button.png', 3, 9, '*-1*0*1*9*9*37*', NULL, '卡片-删除按钮', 'delete', 'selectedTodo', NULL, NULL, NULL, '确实要删除所选记录吗?'),
	(38, '删除', 'button_account_del', 'account/deleteAccounts?id={id_account}', 'framework/images/button.png', 3, 3, '*-1*0*2*3*38*', NULL, '账号管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, NULL, '确实要删除所选记录吗?'),
	(39, '添加', 'button_group_add', 'role/addRoleView?editType=add', 'framework/images/button.png', 3, 4, '*-1*0*2*4*39*', NULL, '分组管理-添加按钮', 'add', 'dialog', 750, 255, NULL, '0'),
	(40, '修改', 'button_group_edit', 'role/editRoleView?editType=update&id={id_role}', 'framework/images/button.png', 3, 4, '*-1*0*2*4*40*', NULL, '分组管理-修改按钮', 'edit', 'dialog', 750, 255, '请选择一个记录!', ''),
	(41, '删除', 'button_group_del', 'role/deleteRoles?id={id_role}', 'framework/images/button.png', 3, 4, '*-1*0*2*4*41*', NULL, '分组管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, NULL, '确实要删除所选记录吗?'),
	(42, '分配权限', 'button_group_authority', 'role/assignAuthority?id={id_role}', 'framework/images/button.png', 3, 4, '*-1*0*2*4*42*', NULL, '分组管理-分配权限按钮', 'edit', 'dialog', 300, 500, '请选择一个记录!', ''),
	(43, '添加', 'button_menu_add', 'resources/addResourcesView?editType=add', 'framework/images/button.png', 3, 5, '*-1*0*2*5*43*', NULL, '菜单管理-添加按钮', 'add', 'dialog', 750, 490, NULL, '0'),
	(44, '修改', 'button_menu_edit', 'resources/editResourcesView?editType=update&id={id_res}', 'framework/images/button.png', 3, 5, '*-1*0*2*5*44*', NULL, '菜单管理-修改按钮', 'edit', 'dialog', 750, 490, '请选择一个记录!', ''),
	(45, '删除', 'menu_manage,menu_manage,button_menu_del', 'resources/deleteResources?id={id_res}', 'framework/images/button.png', 3, 5, '*-1*0*2*5*45*', NULL, '菜单管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, '', '确实要删除所选记录吗?'),
	(46, '生活服务管理', 'menu_lifeservice_manage', 'life/queryLifeServicePaper', 'framework/images/menu.png', 2, 1, '*-1*0*1*1*46*', NULL, '菜单项-生活服务管理', '', 'navTab', NULL, NULL, '', ''),
	(47, '添加', 'button_lifeservice_add', 'life/addLifeServiceView?editType=add', 'framework/images/button.png', 3, 46, '*-1*0*1*1*46*47*', NULL, '生活服务管理-添加按钮', 'add', 'dialog', 520, 350, '', ''),
	(48, '修改', 'button_lifeservice_edit', 'life/editLifeServiceView?editType=update&id={id_life}', 'framework/images/button.png', 3, 46, '*-1*0*1*1*46*48*', NULL, '生活服务管理-修改按钮', 'edit', 'dialog', 520, 350, '请选择一个记录!', ''),
	(49, '删除', 'menu_manage,button_lifeservice_del', 'life/deleteLifeServices?id={id_life}', 'framework/images/button.png', 3, 46, '*-1*0*1*1*46*49*', NULL, '生活服务管理-删除按钮', 'delete', 'selectedTodo', NULL, NULL, '', '确实要删除所选记录吗?'),
	(50, '数据采集源', 'menu_data_from', 'search/changeSource', 'framework/images/menu.png', 2, 2, '*-1*0*2*50*', NULL, '切换数据采集源', '', 'navTab', NULL, NULL, '', '');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;


-- 导出  表 search.resources_role 结构
DROP TABLE IF EXISTS `resources_role`;
CREATE TABLE IF NOT EXISTS `resources_role` (
  `role_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  search.resources_role 的数据：~52 rows (大约)
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
	(1, '淘宝热卖', 'http://gou.gionee.com/index/redirect?url_id=2461', 1, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/taobao.png', NULL, 0),
	(2, '唯品会', 'http://gou.gionee.com/index/redirect?url_id=2462', 2, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/weipinhui.png', NULL, 0),
	(3, '蘑菇街', 'http://gou.gionee.com/index/redirect?url_id=2463', 3, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/mogujie.png', NULL, 0),
	(4, '瓷肌', 'http://gou.gionee.com/index/redirect?url_id=2464', 4, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/ciji.png', NULL, 0),
	(5, '京东', 'http://gou.gionee.com/index/redirect?url_id=2465', 5, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/jingdong.png', NULL, 0),
	(6, '1号店', 'http://gou.gionee.com/index/redirect?url_id=2466', 6, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/yihaodian.png', NULL, 0),
	(7, '美丽说', 'http://gou.gionee.com/index/redirect?url_id=2467', 7, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/meilishuo.png', NULL, 0),
	(8, '美团', 'http://gou.gionee.com/index/redirect?url_id=2468', 8, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/meituan.png', NULL, 0),
	(9, '亚马逊', 'http://gou.gionee.com/index/redirect?url_id=2469', 9, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/yamaxun.png', NULL, 0),
	(10, '当当', 'http://gou.gionee.com/index/redirect?url_id=2470', 10, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/dangdang.png', NULL, 0),
	(11, '聚划算', 'http://gou.gionee.com/index/redirect?url_id=2471', 11, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/juhuasuan.png', NULL, 1),
	(12, '9块9', 'http://gou.gionee.com/index/redirect?url_id=2472', 12, 1, 'http://baseromcdn.gionee.com/image/search/icon/20160224/nav/9kuai9.png', NULL, 1),
	(16, '百度', 'https://www.baidu.com/', 13, 1, 'http://pic.chinasspp.com/quan/News/image/20131023/20131023084622_8281.jpg', NULL, 1);
/*!40000 ALTER TABLE `site_navigation` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
