
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14336 DEFAULT CHARSET=utf8;


CREATE TABLE `dataflush` (
  `code_version` int(11) NOT NULL,
  `rate_version` int(11) NOT NULL,
  `rate_update_time` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exchangerate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_currency` varchar(20) NOT NULL,
  `exchange` double NOT NULL,
  `update_time` bigint(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14093 DEFAULT CHARSET=utf8;




insert  into `currency`(`id`,`code`,`name`) values (14273,'CNY','人民币');
insert  into `currency`(`id`,`code`,`name`) values (14274,'JPY','日元');
insert  into `currency`(`id`,`code`,`name`) values (14275,'EUR','欧元');
insert  into `currency`(`id`,`code`,`name`) values (14276,'GBP','英镑');
insert  into `currency`(`id`,`code`,`name`) values (14277,'KRW','韩元');
insert  into `currency`(`id`,`code`,`name`) values (14278,'HKD','港币');
insert  into `currency`(`id`,`code`,`name`) values (14279,'AUD','澳大利亚元');
insert  into `currency`(`id`,`code`,`name`) values (14280,'CAD','加拿大元');
insert  into `currency`(`id`,`code`,`name`) values (14281,'PHP','菲律宾比索');
insert  into `currency`(`id`,`code`,`name`) values (14282,'EGP','埃及镑');
insert  into `currency`(`id`,`code`,`name`) values (14283,'AED','阿联酋迪拉姆');
insert  into `currency`(`id`,`code`,`name`) values (14284,'OMR','阿曼里亚尔');
insert  into `currency`(`id`,`code`,`name`) values (14285,'MOP','澳门元');
insert  into `currency`(`id`,`code`,`name`) values (14286,'BYR','白俄罗斯卢布');
insert  into `currency`(`id`,`code`,`name`) values (14287,'BHD','巴林第纳尔');
insert  into `currency`(`id`,`code`,`name`) values (14288,'BGN','保加利亚列弗');
insert  into `currency`(`id`,`code`,`name`) values (14289,'BRL','巴西雷亚尔');
insert  into `currency`(`id`,`code`,`name`) values (14290,'ISK','冰岛克朗');
insert  into `currency`(`id`,`code`,`name`) values (14291,'PLN','波兰兹罗提');
insert  into `currency`(`id`,`code`,`name`) values (14292,'DKK','丹麦克朗');
insert  into `currency`(`id`,`code`,`name`) values (14293,'RUB','俄罗斯卢布');
insert  into `currency`(`id`,`code`,`name`) values (14294,'PHP','菲律宾比索');
insert  into `currency`(`id`,`code`,`name`) values (14295,'COP','哥伦比亚比索');
insert  into `currency`(`id`,`code`,`name`) values (14296,'CRC','哥斯达黎加科朗');
insert  into `currency`(`id`,`code`,`name`) values (14297,'KHR','柬埔寨瑞尔');
insert  into `currency`(`id`,`code`,`name`) values (14298,'CZK','捷克克朗');
insert  into `currency`(`id`,`code`,`name`) values (14299,'QAR','卡塔尔里亚尔');
insert  into `currency`(`id`,`code`,`name`) values (14300,'HRK','克罗地亚库纳');
insert  into `currency`(`id`,`code`,`name`) values (14301,'KES','肯尼亚先令');
insert  into `currency`(`id`,`code`,`name`) values (14302,'KWD','科威特第纳尔');
insert  into `currency`(`id`,`code`,`name`) values (14303,'LAK','老挝基普');
insert  into `currency`(`id`,`code`,`name`) values (14304,'LBP','黎巴嫩镑');
insert  into `currency`(`id`,`code`,`name`) values (14305,'MYR','林吉特');
insert  into `currency`(`id`,`code`,`name`) values (14306,'RON','罗马尼亚列伊');
insert  into `currency`(`id`,`code`,`name`) values (14307,'BUK','缅甸元');
insert  into `currency`(`id`,`code`,`name`) values (14308,'MAD','摩洛哥道拉姆');
insert  into `currency`(`id`,`code`,`name`) values (14309,'MXN','墨西哥元');
insert  into `currency`(`id`,`code`,`name`) values (14310,'ZAR','南非兰特');
insert  into `currency`(`id`,`code`,`name`) values (14311,'NOK','挪威克朗');
insert  into `currency`(`id`,`code`,`name`) values (14312,'SEK','瑞典克朗');
insert  into `currency`(`id`,`code`,`name`) values (14313,'CHF','瑞士法郎');
insert  into `currency`(`id`,`code`,`name`) values (14314,'RSD','塞尔维亚第纳尔');
insert  into `currency`(`id`,`code`,`name`) values (14315,'SAR','沙特里亚尔');
insert  into `currency`(`id`,`code`,`name`) values (14316,'LKR','斯里兰卡卢比');
insert  into `currency`(`id`,`code`,`name`) values (14317,'THB','泰国铢');
insert  into `currency`(`id`,`code`,`name`) values (14318,'TZS','坦桑尼亚先令');
insert  into `currency`(`id`,`code`,`name`) values (14319,'BND','文莱元');
insert  into `currency`(`id`,`code`,`name`) values (14320,'UGX','乌干达先令');
insert  into `currency`(`id`,`code`,`name`) values (14321,'ZMK','新的赞比亚克瓦查');
insert  into `currency`(`id`,`code`,`name`) values (14322,'SGD','新加坡元');
insert  into `currency`(`id`,`code`,`name`) values (14323,'TWD','新台币');
insert  into `currency`(`id`,`code`,`name`) values (14324,'TRY','新土耳其里拉');
insert  into `currency`(`id`,`code`,`name`) values (14325,'NZD','新西兰元');
insert  into `currency`(`id`,`code`,`name`) values (14326,'HUF','匈牙利福林');
insert  into `currency`(`id`,`code`,`name`) values (14327,'SYP','叙利亚镑');
insert  into `currency`(`id`,`code`,`name`) values (14328,'IQD','伊拉克第纳尔');
insert  into `currency`(`id`,`code`,`name`) values (14329,'INR','印度卢比');
insert  into `currency`(`id`,`code`,`name`) values (14330,'IDR','印尼卢比');
insert  into `currency`(`id`,`code`,`name`) values (14331,'ILS','以色列新锡克尔');
insert  into `currency`(`id`,`code`,`name`) values (14332,'JOD','约旦第纳尔');
insert  into `currency`(`id`,`code`,`name`) values (14333,'VND','越南盾');
insert  into `currency`(`id`,`code`,`name`) values (14334,'CLP','智利比索');
insert  into `currency`(`id`,`code`,`name`) values (14335,'USD','美元');

insert  into `dataflush`(`code_version`,`rate_version`,`rate_update_time`) values (245,245,1451291400004);

insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14031,'CNY',6.486,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14032,'JPY',120.6,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14033,'EUR',0.912,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14034,'GBP',0.6702,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14035,'KRW',1164.63,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14036,'HKD',7.7503,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14037,'AUD',1.3772,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14038,'CAD',1.3857,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14039,'PHP',47.16,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14040,'EGP',7.83,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14041,'AED',3.673,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14042,'OMR',0.385,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14043,'MOP',7.978,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14044,'BYR',18360,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14045,'BHD',0.377,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14046,'BGN',1.7832,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14047,'BRL',3.9475,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14048,'ISK',129.02,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14049,'PLN',3.867,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14050,'DKK',6.8049,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14051,'RUB',70.8975,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14052,'PHP',47.16,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14053,'COP',3184,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14054,'CRC',530.43,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14055,'KHR',4045,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14056,'CZK',24.637,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14057,'QAR',3.641,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14058,'HRK',6.9584,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14059,'KES',102.25,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14060,'KWD',0.3032,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14061,'LAK',8136,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14062,'LBP',1505.5,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14063,'MYR',4.299,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14064,'RON',4.1212,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14065,'BUK',1306,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14066,'MAD',9.8277,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14067,'MXN',17.28,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14068,'ZAR',15.3076,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14069,'NOK',8.6865,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14070,'SEK',8.397,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14071,'CHF',0.988,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14072,'RSD',110.71,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14073,'SAR',3.7501,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14074,'LKR',143.75,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14075,'THB',36.1,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14076,'TZS',2140,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14077,'BND',1.405,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14078,'UGX',3370,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14079,'ZMK',10.95,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14080,'SGD',1.4065,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14081,'TWD',32.8,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14082,'TRY',2.9189,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14083,'NZD',1.4639,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14084,'HUF',287.89,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14085,'SYP',219.8,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14086,'IQD',1097,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14087,'INR',66.13,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14088,'IDR',13650,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14089,'ILS',3.8883,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14090,'JOD',0.708,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14091,'VND',22475,1451291400004);
insert  into `exchangerate`(`id`,`target_currency`,`exchange`,`update_time`) values (14092,'CLP',699.7,1451291400004);

