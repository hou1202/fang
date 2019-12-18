# Host: localhost  (Version: 5.5.53)
# Date: 2019-12-18 19:05:19
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "adminer"
#

DROP TABLE IF EXISTS `adminer`;
CREATE TABLE `adminer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL DEFAULT '' COMMENT '帐号',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：1=》正常；0=》禁用',
  `permissions_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限组ID',
  `is_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是超级管理员：1=》是；0=》非',
  `remark` text COMMENT '备注说明',
  `last_ip` varchar(255) DEFAULT NULL COMMENT '最后登录IP地址',
  `last_at` int(10) unsigned DEFAULT NULL COMMENT '最后登录时间（时间戳）',
  `count` int(11) unsigned DEFAULT '0' COMMENT '登录总次数',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `adminer_key` (`id`,`account`,`permissions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理员表';

#
# Data for table "adminer"
#

INSERT INTO `adminer` VALUES (1,'admin','96e79218965eb72c92a549dd5a330112','Amdin',1,1,1,'admin12sdf','127.0.0.1',1576644368,28,'2018-10-23 13:54:17'),(2,'guest','96e79218965eb72c92a549dd5a330112','guest',1,2,0,'guest','127.0.0.1',1542330568,5,'2018-10-23 15:16:25'),(3,'tests','96e79218965eb72c92a549dd5a330112','Test',1,2,0,'TEST',NULL,NULL,0,'2018-11-14 13:13:10');

#
# Structure for table "banner"
#

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `info` text COMMENT '说明',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型：1=》首页滚动；2=》服务内容；3=》合作项目；4=》最新动态；5=》首页企业展示；6=》首页商务服务；7=》合作伙伴；8=》头部Logo；9=》底部LOGO;10=》关于我们Logo；11=》二维码',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '是否自定义：1=》全定义；2=》半定义；3=》不定义',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Banner图';

#
# Data for table "banner"
#

/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'服务','',2,'/uploads/20191218/5df9b1d6101d0.jpg',2,'2019-12-12 15:34:17'),(2,'合作项目',NULL,3,'/uploads/20191218/5df9e8b6109a0.jpg',2,'2019-12-12 15:47:41'),(3,'最新动态',NULL,4,'/uploads/20191212/5df1ed7696af0.jpg',2,'2019-12-12 15:48:04'),(4,NULL,NULL,6,'/uploads/20191212/5df1ed7696af0.jpg',3,'2019-12-12 15:48:53'),(5,NULL,NULL,8,'/uploads/20191217/5df88cebd8360.png',3,'2019-12-12 15:49:52'),(6,NULL,NULL,9,'/uploads/20191217/5df88d0659fd8.png',3,'2019-12-12 15:50:13'),(7,NULL,NULL,10,'/uploads/20191217/5df88d513dab8.png',3,'2019-12-12 15:50:50'),(8,NULL,NULL,11,'/uploads/20191217/5df88d3b8d810.png',3,'2019-12-12 15:51:10'),(9,'施工现场 &amp; 项目管理系统方案解决商','A Bootstrap 4 Responsive multi-purpose Theme for the Business, Web agency and more!',1,'/uploads/20191217/5df88f9212f20.jpg',1,'2019-12-12 15:55:05'),(10,'施工现场 &amp; 项目管理系统方案解决商','A Bootstrap 4 Responsive multi-purpose Theme for the Business, Web agency and more!',1,'/uploads/20191217/5df8934ea4358.jpg',1,'2019-12-12 15:59:29'),(11,'施工现场 &amp; 项目管理系统方案解决商','A Bootstrap 4 Responsive multi-purpose Theme for the Business, Web agency and more!',1,'/uploads/20191217/5df897c3a89a8.jpg',1,'2019-12-12 15:59:48'),(12,'施工现场 & 项目管理系统方案解决商','A Bootstrap 4 Responsive multi-purpose Theme for the Business, Web agency and more!',1,'/uploads/20191212/5df1ed7696af0.jpg',1,'2019-12-12 16:00:14'),(13,'企业展示','',5,'/uploads/20191212/5df1f3b66a018.jpg',1,'2019-12-12 16:00:56'),(14,'企业展示',NULL,5,'/uploads/20191212/5df1f3b66a018.jpg',1,'2019-12-12 16:01:31'),(15,'企业展示',NULL,5,'/uploads/20191212/5df1f3b66a018.jpg',1,'2019-12-12 16:01:42'),(16,'企业展示',NULL,5,'/uploads/20191212/5df1f3b66a018.jpg',1,'2019-12-12 16:01:51'),(17,'金大地','',7,'/uploads/20191212/5df1f418d33b0.png',1,'2019-12-12 16:02:34'),(18,'怡富',NULL,7,'/uploads/20191212/5df1f418d33b0.png',1,'2019-12-12 16:02:55'),(19,'绿地',NULL,7,'/uploads/20191212/5df1f418d33b0.png',1,'2019-12-12 16:03:12');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;

#
# Structure for table "cases"
#

DROP TABLE IF EXISTS `cases`;
CREATE TABLE `cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `classify_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `img` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `address` varchar(255) DEFAULT NULL COMMENT '位置',
  `projects` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `find_time` date DEFAULT NULL COMMENT '完成时间',
  `leader` varchar(30) DEFAULT NULL COMMENT '项目经理',
  `content` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='案例';

#
# Data for table "cases"
#

INSERT INTO `cases` VALUES (1,'竞品分析：插旗打卡 VS 小打卡1',3,'/uploads/20191218/5df9ee46105b8.jpg','/uploads/20191215/5df50995c0075.jpg','浙江.杭州1','绿地国际花都二期项目1','2019-12-19','朱信友1','<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t11月是最繁忙的时间，你是否突然被前男/女友、小学同学、失散多年的朋友、忽然热络起来的同事们联系着？\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t不过放心，他们不是开始做微商、卖保险了，也不是结婚要份子钱，而是双11来来来啦！\n</p>\n<p>\n\t<img src=\"/uploads/20191214/5df5067ee4c2f.jpg\" alt=\"\" /> \n</p>\n<p>\n\t<br />\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t双11之后，一直想写篇关于运营人的专访。无奈这期间，大家都忙着冲年底业绩，问谁都被拒绝，所以今天就转下笔锋聊下那些年电商带火的裂变套路。\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t2016年，拼多多这个电商界的怪物，让我们第一次见到了裂变真正的威力。自此，裂变已经成为考量运营人的一个重要标准之一。\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t当下的裂变主要围绕微信生态，做裂变的人群有个很高级的词称其为“流量池思维”，它强调的是如何让流量更有效地转化，用一批已有用户找到更多的新用户。而要获得成本最低的流量，途径也很简单，那就是“裂变”。\n</p>\n<img src=\"/uploads/20191214/5df506a317d9e.jpg\" alt=\"\" /> \n<p>\n\t<br />\n</p>\n<p>\n\t<br />\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t<strong><span style=\"font-size:18px;\">因为裂变</span></strong>，拼多多3年就获得了<strong><span style=\"font-size:18px;\">3亿</span></strong>的用户，市值接近<strong><span style=\"font-size:18px;\">400亿美元</span></strong>！\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t趣头条不到24个月就收获了1.8亿用户，日活高达1000万+！\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t薄荷阅读发起100天读完3本英文原版书活动，2个月营收就达到5000万！\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t网易刷屏课程把朋友圈染成红彤彤一片，上线12小时吸引13万人报名付费，最终学习人数突破21万！\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t连咖啡在小程序中上线“1元新品拼团”功能，1天斩获500万PV，3小时就把一个月的原材料库存消耗完毕，只得临时下线！\n</p>\n<p>\n\t<img src=\"/uploads/20191215/5df50974a5e60.jpg\" alt=\"\" />\n</p>','2019-12-14 23:59:14'),(3,'竞品分析：插旗打卡 VS 小打卡',5,'/uploads/20191215/5df509cd93c9e.jpg','/uploads/20191215/5df509c95d6c1.jpg','浙江.杭州','绿地国际花都二期项目','2019-12-04','朱信友','<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t因为裂变，拼多多3年就获得了3亿的用户，市值接近400亿美元！\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t趣头条不到24个月就收获了1.8亿用户，日活高达1000万+！\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t薄荷阅读发起100天读完3本英文原版书活动，2个月营收就达到5000万！\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t网易刷屏课程把朋友圈染成红彤彤一片，上线12小时吸引13万人报名付费，最终学习人数突破21万！\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t连咖啡在小程序中上线“1元新品拼团”功能，1天斩获500万PV，3小时就把一个月的原材料库存消耗完毕，只得临时下线！\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t数据说明一切，裂变正在成为新一代运营的核心竞争力。\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t于是乎，身为运营人的你是否也开始有样学样，或拼团裂变，或助力裂变，或邀请裂变，或分享裂变，万变不离其宗，基本都属于这四类玩法。\n</p>','2019-12-15 00:11:59');

#
# Structure for table "classify"
#

DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `labels` varchar(30) DEFAULT NULL COMMENT '标签',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='案例分类';

#
# Data for table "classify"
#

INSERT INTO `classify` VALUES (1,'智能化','zhinenghua',2,'2019-12-14 22:58:28'),(2,'物业','wuyel',2,'2019-12-14 22:58:40'),(3,'工地','gongdi',3,'2019-12-14 22:58:48'),(5,'家居','jiaju',4,'2019-12-14 23:00:59');

#
# Structure for table "config"
#

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '参数标题',
  `param` varchar(255) DEFAULT NULL COMMENT '参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

#
# Data for table "config"
#

INSERT INTO `config` VALUES (1,'平台标识','方科官网管理后台'),(2,'应用名称','方科信息');

#
# Structure for table "news"
#

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `info` text COMMENT '简介',
  `thumbnail` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `author` varchar(100) NOT NULL DEFAULT 'Admin' COMMENT '作者',
  `labels` varchar(100) DEFAULT NULL COMMENT '标签',
  `content` text COMMENT '内容',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='动态';

#
# Data for table "news"
#

INSERT INTO `news` VALUES (1,'竞品分析：插旗打卡 VS 小打卡','绿地国际花都二期项目棋','/uploads/20191215/5df5bea570947.jpg','/uploads/20191215/5df5b9f5f3f39.jpg','朱信友','浙江','<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t前段时间，我经常收到招商银行信贷部的电话，本来我都是直接挂掉的，但是有一天打了好几次，我终于忍不了了，接起来问：“能不能不要再给我打了？说了不需要不需要！“\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t对方的回答却让我有些惊讶，甚至有被羞辱的感觉:：“真的不需要吗？真的不需要吗？“。\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t我再次强调：“真的不需要！“\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t然后对方说：“我这里看到你最近在招行 APP 里浏览了e招贷页面，猜想您可能有资金方面的需要，我们现在有xxx优惠，最高给您开到xx万，都是随借随还的…… “\n</p>\n<p style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t我：“……”\n</p>\n<div>\n\t<br />\n</div>\n<img src=\"/uploads/20191215/5df5ba045d4f2.jpg\" alt=\"\" />','2019-12-15 12:43:50'),(3,'竞品分析：插旗打卡 VS 小打卡','绿地国际花都二期项目','/uploads/20191215/5df5d2b9b17b8.jpg','/uploads/20191215/5df5d2bbd26e6.jpg','李自然','安全','顶戴村','2019-12-15 14:29:19');

#
# Structure for table "params"
#

DROP TABLE IF EXISTS `params`;
CREATE TABLE `params` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `content` text COMMENT '内容',
  `type` tinyint(3) unsigned DEFAULT '0' COMMENT '所属板块:1=》企业介绍；2=》核心理念；3=》客户评价；4=》首页三问；5=》首页服务领域；6=》领域四项；7=》首页公司简介；8=》首页公司标签；9=》服务内容页面简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='统一参数表';

#
# Data for table "params"
#

/*!40000 ALTER TABLE `params` DISABLE KEYS */;
INSERT INTO `params` VALUES (1,'合肥方科信息技术有限公司1',NULL,'2007年虎扑获得晨兴资本A轮融资时，就曾在离岸投资中心英属维尔京群岛创立了公司Hoop SportsBVI，在当时这被解读为为境外上市搭建VIE架构。直到2016年，虎扑才真正在A股递交上市申请书。但上市之路并不顺利，曾想借壳ST亚星上市的虎扑，借壳失败后，在第二年主动撤回IPO申请。个中原因在于，虎扑对广告依赖过重，收入模式单一还直接导致，连续几年业绩波动较大，且经营活动现金流量净额和净利润的差异较大。实际上，早在2009年，应当时的电商热潮，虎扑曾推出“卡路里商城”，但在当时各家疯狂烧钱的模式下，卡路里商城早早夭折。2012年，虎扑将此前虎扑论坛的“鉴定中心”独立，孵化了具有导购及鉴别运动装备功能的“识货App”。',1),(2,'团结就是力量',NULL,'产品MVP落地难道就是要研发出所有核心功能吗？其实这样的研发成本也不低，并不是最节约成本的做法，只要能拿着这个模型让用户完成核心流程体验即可。',2),(3,'科技促进发展',NULL,'产品研发投入成本包含人力成本、时间成本、物力财力等成本，产品MVP可设计极简产品原型，降低成本，避免前期投入成本过大，产品上线后用户并不买单的风险。',2),(4,'数据铸就能力',NULL,'寻找种子用户体验MVP，快速验证产品是否能解决用户痛点，是如产品设想呢，还是有新的发现，均可记录并评估优化，验证及迭代成本也很低，帮助更好定位产品定位和用户需求。',2),(5,'服务护航成功',NULL,'设想很丰满，如要验证产品，难道就必须研发出完整的产品吗？或者将产品的核心功能都研发出来？产品上线后用户就一定会为产品买单吗？',2),(6,' 我们是谁12','/uploads/20191213/5df271f3d9104.jpg','在2018年开年，直播答题引发了全民狂欢热潮，成为2018年第一个风口。当时直播平台打着“知识经济”的旗号，推出的直播答题游戏引发了大规模的用户参与',4),(7,'我们在做什么','/uploads/20191213/5df2722432f3a.jpg','这种平台机制其实是利用了一种平台方与获奖用户方的信息不透明与信息不对称机制来以极低的成本制造轰动效应，它很可能是利用奖金的幻象刺激的手段',4),(8,' 我们能帮你解决什么','/uploads/20191213/5df39566415f1.jpg','因为按照10万奖金均分模式，如果一场答题是10个人答对，但每人就可以均分一万，但这对平台方是10万成本，但是获奖用户多寡是不透明的',4),(9,'我们的服务领域',NULL,'再看盲盒。所谓盲盒，即用不透明的密封盒售卖系列玩具，里面通常是一款内装一款人偶玩具或动漫剧中卡通玩具的盒子，它最大的特点是设计了隐藏款，买到了就相当于中奖，消费者购买时并不知道里面装的到底是哪一款，只有打开后才知道。盲盒营销就是类似于一种抽奖游戏的商品营销手法，能够大大刺激用户的复购率。',5),(10,'建筑智能化',NULL,'盲盒也是利用品牌方与用户方的信息不透明与不对称机制来赚钱，有商家表示盲盒抽中的概率大概为1/140',6),(11,'企业施工项目和现场管理',NULL,'我如果是经销商会先把盲盒走一遍x光把限量版找出来单独卖，再不济一套盲盒通过称重也知道大概是哪一款',6),(12,'信息化物业管理平台',NULL,'每年花20万元~70万元在盲盒潮玩上的大有人在。但是盲盒的产品价值并不稳固，普通消费者也没有能力掌控稀缺版盲盒的价值走向',6),(13,'智能家居及物联网平台',NULL,'隐藏款无疑是“诱人深入的目标”，而盲盒收集可成为谈资与炫耀、标签以及圈层的身份与地位，它无疑就是“一种令人痴迷的社交互动”',6),(14,'合肥方科信息技术 有限公司12',NULL,'这种互相种草的社交互动其实就对应了“斯金纳箱”原理：在一个密闭的箱子里放一只白鸽，箱子内有一个开关，只要踩它，就能掉落不同的食物，鸽子会通过不同的摸索掌握踩开关获取食物的本领，但是箱子内换成老鼠，且按箱子的次数与投喂食物无关之后，老鼠就会持续不断的按下按钮。',7),(16,'参与项目',NULL,'99',8),(17,'服务用户',NULL,'1200',8),(18,'服务团队',NULL,'60',8),(19,'信息化服务专业 解决方案 供应商1',NULL,'网上有很多关于图文结合设计的讨论 ，各大产品的用法也不尽相同，但又符合各自产品的定位。在产品模块中只要有Feed流都会涉及到图文结合的设计，图文到底怎么设计更合理。讨论最多就是用户的阅读顺序，这确实是非常关键的理由，但如果都用阅读顺序来解释的话，不符合顺序的设计岂不是都没有道理',9),(20,'公司名称',NULL,'合肥方科信息技术有限公司',10),(21,'商务邮箱',NULL,'service@fangke.com',11),(22,'联系电话1',NULL,'0551-2545 8524',12),(23,'联系电话2',NULL,'0551 - 5658 5210',13),(24,'办公地址',NULL,'安徽省 . 合肥市 . 包河区加侨国际广场A座22层',14),(25,'网址',NULL,'www.fangke.com',15),(26,'版权说明',NULL,'2019 © Copyright 方科信息. All rights Reserved.',16),(27,'尾部简介',NULL,'专注于为企业提供信息化管理、应用、实施方案解决措施.',17),(28,'联系我们简介',NULL,'完成MVP落地后，给用户体验并收集反馈，难道是要拿给所有用户体验吗？当然不是，产品MVP本身就是不成熟的产品，只是快速验证想法的工具，也是一种敏捷的思维方式。123',18),(29,'幸瑞物业管理有限公司','/uploads/20191218/5df9b05a61698.jpg','说到底，两者的本质上都是抓住了人性的贪欲——人们喜欢即时反馈，多数有赌徒心理，无论是盲盒，还是答题模式本质上是迎合人们的赌博心理，放大了人性的贪欲与赌性。',3),(30,'国泰置业','/uploads/20191218/5df9b06164578.jpg','盲盒的经营秩序容易涉及对交易不透明的经营行为、涉嫌违规的炒作行为以及发布虚假广告、欺骗误导消费者的倾向问题，它与直播答题类似，也是涉及到诚信经营的核心价值观问题。\n\t\t\t\t\t\t\t\t\t\t',3);
/*!40000 ALTER TABLE `params` ENABLE KEYS */;

#
# Structure for table "permissions"
#

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '权限组名称',
  `router_id` text COMMENT '权限组权限集',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1=》正常；0=》禁用',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `permission-index` (`id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='权限组表';

#
# Data for table "permissions"
#

INSERT INTO `permissions` VALUES (1,'超级管理员组','1-29-30-31-2-3-4-5-6-7-8-9-18-28-10-11-12-13-14-15-16-19-27-17-20-21-22-23-24-25-26-32',1,'2018-11-06 16:15:51'),(2,'GUEST','1-29-30-31-2-3-4-5-6-7-8-33-34-35-36',1,'2018-11-07 16:04:06');

#
# Structure for table "router"
#

DROP TABLE IF EXISTS `router`;
CREATE TABLE `router` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `router` varchar(255) DEFAULT NULL COMMENT '系统路由',
  `menu` varchar(255) DEFAULT NULL COMMENT '菜单路由',
  `path` varchar(255) DEFAULT NULL COMMENT '系统控制器/方法 路径',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(255) DEFAULT NULL COMMENT 'icon图标',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级路由ID（一根目录路由为0）',
  `open` tinyint(3) unsigned DEFAULT '0' COMMENT '是否展开；默认为1=>true【展开】，0=>false【不展开】',
  `main` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为主目录：0【非】，1【是】',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '路由状态;0=>禁用；1=>启用',
  `opts` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为配置项路由：1=>是；0=>否',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `router_key` (`id`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='路由规则表';

#
# Data for table "router"
#

INSERT INTO `router` VALUES (1,'/aoogi/main','/','','控制面板','#xe679;',0,0,1,1,1,'2018-10-26 14:44:54'),(2,'','','','系统设置','#xe66a;',0,0,1,1,1,'2018-10-26 16:57:59'),(3,'/aoogi/adminer','/aoogi/adminer','admin/admin/index','管理员设置','#xe653;',2,0,1,1,1,'2018-10-26 16:59:16'),(4,'/aoogi/adminer/data','/aoogi/adminer/data','admin/admin/getData','管理员列表','',3,0,0,1,0,'2018-10-26 17:02:06'),(5,'/aoogi/adminer/create','/aoogi/adminer/create','admin/admin/create','新增管理员','',3,0,0,1,1,'2018-10-26 17:03:30'),(6,'/aoogi/adminer','/aoogi/adminer/save','admin/admin/save','保存管理员','',3,0,0,1,0,'2018-10-26 17:04:09'),(7,'/aoogi/adminer/edit/:id','/aoogi/adminer/edit/*','admin/admin/edit','编辑管理员','',3,0,0,1,1,'2018-10-26 17:05:38'),(8,'/aoogi/adminer/:id','/aoogi/adminer/update/*','admin/admin/update','更新管理员','',3,0,0,1,0,'2018-10-26 17:06:30'),(9,'/aoogi/adminer/:id','/aoogi/adminer/del/*','admin/admin/delete','删除管理员','',3,0,0,1,1,'2018-10-26 17:07:14'),(10,'/aoogi/router','/aoogi/router','admin/router/index','路由设置','#xe653;',2,0,1,1,1,'2018-10-30 10:41:29'),(11,'/aoogi/router/data','/aoogi/router/data','admin/router/getData','路由列表','',10,0,0,1,0,'2018-10-30 10:44:59'),(12,'/aoogi/router/create','/aoogi/router/create','admin/router/create','新增路由','',10,0,0,1,1,'2018-10-30 10:47:36'),(13,'/aoogi/router','/aoogi/router/save','admin/router/save','保存路由','',10,0,0,1,0,'2018-11-05 11:00:01'),(14,'/aoogi/router/edit/:id','/aoogi/router/edit/*','admin/router/edit','编辑路由','',10,0,0,1,1,'2018-11-05 11:44:50'),(15,'/aoogi/router/:id','/aoogi/router/update/*','admin/router/update','更新路由','',10,0,0,1,0,'2018-11-05 11:47:04'),(16,'/aoogi/router/:id','/aoogi/router/del/*','admin/router/delete','删除路由','',10,0,0,1,0,'2018-11-05 11:47:34'),(17,'/aoogi/permission','/aoogi/permission','admin/permission/index','权限设置','#xe653;',2,0,1,1,1,'2018-11-05 15:03:03'),(18,'/aoogi/adminer/status','/aoogi/adminer/status','admin/admin/setStatus','管理员状态','',3,0,0,1,0,'2018-11-07 09:12:01'),(19,'/aoogi/router/status','/aoogi/router/status','admin/router/setStatus','路由状态','',10,0,0,1,0,'2018-11-07 09:12:35'),(20,'/aoogi/permission/data','/aoogi/permission/data','admin/permission/getData','权限组列表','',17,0,0,1,0,'2018-11-07 09:14:05'),(21,'/aoogi/permission/status','/aoogi/permission/status','admin/permission/setStatus','权限组状态','',17,0,0,1,0,'2018-11-07 09:15:14'),(22,'/aoogi/permission/create','/aoogi/permission/create','admin/permission/create','新增权限组','',17,0,0,1,1,'2018-11-07 09:15:50'),(23,'/aoogi/permission','/aoogi/permission/save','admin/permission/save','保存权限组','',17,0,0,1,0,'2018-11-07 09:16:24'),(24,'/aoogi/permission/edit/:id','/aoogi/permission/edit/*','admin/permission/edit','编辑权限组','',17,0,0,1,1,'2018-11-07 09:16:52'),(25,'/aoogi/permission/:id','/aoogi/permission/update*','admin/permission/update','更新权限组','',17,0,0,1,0,'2018-11-07 09:17:36'),(26,'/aoogi/permission/:id','/aoogi/permission/del/*','admin/permission/delete','删除权限组','',17,0,0,1,0,'2018-11-07 09:18:20'),(27,'/aoogi/router/:id','/aoogi/router/read/*','admin/router/read','查看路由','',10,0,0,1,1,'2018-11-08 10:48:00'),(28,'/aoogi/adminer/:id','/aoogi/adminer/read/*','admin/admin/read','查看管理员','',3,0,0,1,1,'2018-11-09 14:07:38'),(29,'/aoogi/logout','/aoogi/logout','admin/home/logout','退出登录','',1,0,0,1,1,'2018-11-12 14:00:40'),(30,'/aoogi/error','/aoogi/error','admin/error/index','403错误','',1,0,0,1,1,'2018-11-13 14:07:32'),(31,'/aoogi/main','/','admin/home/main','主页','',1,0,0,1,1,'2018-11-15 12:02:01'),(32,'/aoogi/permission/:id','/aoogi/permission/read/*','admin/permission/read','查看权限组','',17,0,0,1,1,'2018-11-15 15:19:31'),(33,'/aoogi/config','/aoogi/config','admin/config/index','参数设置','#xe653;',2,0,1,1,1,'2018-11-15 16:35:12'),(34,'/aoogi/config/create','/aoogi/config/create','admin/config/create','新增参数','',33,0,0,1,1,'2018-11-15 16:44:30'),(35,'/aoogi/config','/aoogi/config/save','admin/config/save','保存参数','',33,0,0,1,0,'2018-11-15 17:05:08'),(36,'/aoogi/config/edit/:id','/aoogi/config/edit/*','admin/config/edit','编辑参数','',33,0,0,1,1,'2018-11-15 17:09:08'),(37,'/aoogi/config/:id','/aoogi/config/update/*','admin/config/update','更新参数','',33,0,0,1,0,'2018-11-16 10:34:21'),(38,'/aoogi/admin/*','/aoogi/admin/del/*','admin/config/delete','删除参数','',33,0,0,1,0,'2018-11-23 11:51:30'),(39,'/aoogi/router/create_modular','/aoogi/router/create_modular','admin/router/createModular','新增模块路由',NULL,10,0,0,1,1,'2019-05-20 21:53:04'),(40,'/aoogi/router/save_modular','/aoogi/router/save_modular','admin/router/saveModular','保存模块路由','',10,0,0,1,0,'2019-05-20 21:54:17'),(41,'','','','基础设置','#xe66a;',0,0,1,1,1,'2019-12-12 13:22:12'),(42,'/aoogi/banner','/aoogi/banner','admin/banner/index','Banner图管理','#xe653;',41,0,1,1,1,'2019-12-12 13:23:34'),(43,'/aoogi/banner/data','/aoogi/banner/data','admin/banner/getData','Banner图管理列表','',42,0,0,1,0,'2019-12-12 13:23:34'),(44,'/aoogi/banner/create','/aoogi/banner/create','admin/banner/create','新增Banner图',NULL,42,0,0,1,1,'2019-12-12 13:23:34'),(45,'/aoogi/banner','/aoogi/banner/save','admin/banner/save','保存Banner图',NULL,42,0,0,1,0,'2019-12-12 13:23:34'),(46,'/aoogi/banner/edit/:id','/aoogi/banner/edit/*','admin/banner/edit','编辑Banner图',NULL,42,0,0,1,1,'2019-12-12 13:23:34'),(47,'/aoogi/banner/:id','/aoogi/banner/update/*','admin/banner/update','更新Banner图',NULL,42,0,0,1,0,'2019-12-12 13:23:34'),(48,'/aoogi/banner/:id','/aoogi/banner/del/*','admin/banner/delete','删除Banner图',NULL,42,0,0,1,0,'2019-12-12 13:23:34'),(49,'','','','关于我们','#xe66a;',0,0,1,1,1,'2019-12-12 16:29:25'),(50,'/aoogi/params/:type','/aoogi/params/*','admin/params/create','创建信息',NULL,49,0,0,1,1,'2019-12-13 00:35:19'),(51,'/aoogi/params/edit/:type/:id','/aoogi/params/edit/*/*','admin/params/edit','编辑信息','',49,0,0,1,1,'2019-12-12 17:15:52'),(52,'/aoogi/params/company','/aoogi/params/company','admin/paramscompany','企业介绍','#xe653;',49,0,1,1,1,'2019-12-12 16:40:28'),(53,'/aoogi/params/idea','/aoogi/params/idea','admin/params/idea','核心理念','#xe653;',49,0,1,1,1,'2019-12-12 23:00:43'),(54,'/aoogi/params/evaluate','/aoogi/params/evaluate','admin/params/evaluate','客户评价','#xe653;',49,0,1,1,1,'2019-12-12 23:10:06'),(55,'/aoogi/team','/aoogi/team','admin/team/index','团队成员设置','#xe653;',49,0,1,1,1,'2019-12-13 22:07:26'),(56,'/aoogi/team/data','/aoogi/team/data','admin/team/getData','团队成员列表',NULL,55,0,0,1,0,'2019-12-13 22:07:26'),(57,'/aoogi/team/create','/aoogi/team/create','admin/team/create','新增团队成员',NULL,55,0,0,1,1,'2019-12-13 22:07:26'),(58,'/aoogi/team','/aoogi/team/save','admin/team/save','保存团队成员',NULL,55,0,0,1,0,'2019-12-13 22:07:26'),(59,'/aoogi/team/edit/:id','/aoogi/team/edit/*','admin/team/edit','编辑团队成员',NULL,55,0,0,1,1,'2019-12-13 22:07:26'),(60,'/aoogi/team/:id','/aoogi/team/update/*','admin/team/update','更新团队成员',NULL,55,0,0,1,0,'2019-12-13 22:07:26'),(61,'/aoogi/team/:id','/aoogi/team/del/*','admin/team/delete','删除团队成员',NULL,55,0,0,1,0,'2019-12-13 22:07:26'),(62,'/aoogi/team/:id','/aoogi/team/read/*','admin/team/read','查看团队成员',NULL,55,0,0,1,1,'2019-12-13 22:07:26'),(63,'','','','Home首页','#xe66a;',0,0,1,1,1,'2019-12-13 22:34:59'),(64,'/aoogi/params/question','/aoogi/params/question','admin/params/question','首页三问','#xe653;',63,0,1,1,1,'2019-12-13 22:42:55'),(65,'/aoogi/params/realm','/aoogi/params/realm','admin/params/realm','服务领域','#xe653;',63,0,1,1,1,'2019-12-13 22:55:40'),(66,'/aoogi/params/term','/aoogi/params/term','admin/params/term','领域四项','#xe653;',63,0,1,1,1,'2019-12-13 23:06:06'),(67,'/aoogi/params/home_company','/aoogi/params/home_company','admin/params/homeCompany','首页企业简介','#xe653;',63,0,1,1,1,'2019-12-14 21:10:04'),(68,'/aoogi/params/company_label','/aoogi/params/company_label','admin/params/companyLabel','首页企业标签','#xe653;',63,0,1,1,1,'2019-12-14 21:18:11'),(69,'','','','项目合作','#xe66a;',0,0,1,1,1,'2019-12-14 22:14:55'),(70,'/aoogi/classify','/aoogi/classify','admin/classify/index','项目分类设置','#xe653;',69,0,1,1,1,'2019-12-14 22:57:32'),(71,'/aoogi/classify/data','/aoogi/classify/data','admin/classify/getData','项目分类列表',NULL,70,0,0,1,0,'2019-12-14 22:57:32'),(72,'/aoogi/classify/create','/aoogi/classify/create','admin/classify/create','新增项目分类',NULL,70,0,0,1,1,'2019-12-14 22:57:32'),(73,'/aoogi/classify','/aoogi/classify/save','admin/classify/save','保存项目分类',NULL,70,0,0,1,0,'2019-12-14 22:57:32'),(74,'/aoogi/classify/edit/:id','/aoogi/classify/edit/*','admin/classify/edit','编辑项目分类',NULL,70,0,0,1,1,'2019-12-14 22:57:32'),(75,'/aoogi/classify/:id','/aoogi/classify/update/*','admin/classify/update','更新项目分类',NULL,70,0,0,1,0,'2019-12-14 22:57:32'),(76,'/aoogi/classify/:id','/aoogi/classify/del/*','admin/classify/delete','删除项目分类',NULL,70,0,0,1,0,'2019-12-14 22:57:32'),(77,'/aoogi/cases','/aoogi/cases','admin/cases/index','项目案例设置','#xe653;',69,0,1,1,1,'2019-12-14 23:03:45'),(78,'/aoogi/cases/data','/aoogi/cases/data','admin/cases/getData','项目案例列表',NULL,77,0,0,1,0,'2019-12-14 23:03:45'),(79,'/aoogi/cases/create','/aoogi/cases/create','admin/cases/create','新增项目案例',NULL,77,0,0,1,1,'2019-12-14 23:03:45'),(80,'/aoogi/cases','/aoogi/cases/save','admin/cases/save','保存项目案例',NULL,77,0,0,1,0,'2019-12-14 23:03:45'),(81,'/aoogi/cases/edit/:id','/aoogi/cases/edit/*','admin/cases/edit','编辑项目案例',NULL,77,0,0,1,1,'2019-12-14 23:03:45'),(82,'/aoogi/cases/:id','/aoogi/cases/update/*','admin/cases/update','更新项目案例',NULL,77,0,0,1,0,'2019-12-14 23:03:45'),(83,'/aoogi/cases/:id','/aoogi/cases/del/*','admin/cases/delete','删除项目案例',NULL,77,0,0,1,0,'2019-12-14 23:03:45'),(84,'/aoogi/cases/:id','/aoogi/cases/read/*','admin/cases/read','查看项目案例',NULL,77,0,0,1,1,'2019-12-14 23:03:45'),(85,'','','','新闻动态','#xe66a;',0,0,1,1,1,'2019-12-15 11:51:35'),(86,'/aoogi/news','/aoogi/news','admin/news/index','动态设置','#xe653;',85,0,1,1,1,'2019-12-15 12:17:52'),(87,'/aoogi/news/data','/aoogi/news/data','admin/news/getData','动态列表',NULL,86,0,0,1,0,'2019-12-15 12:17:52'),(88,'/aoogi/news/create','/aoogi/news/create','admin/news/create','新增动态',NULL,86,0,0,1,1,'2019-12-15 12:17:52'),(89,'/aoogi/news','/aoogi/news/save','admin/news/save','保存动态',NULL,86,0,0,1,0,'2019-12-15 12:17:52'),(90,'/aoogi/news/edit/:id','/aoogi/news/edit/*','admin/news/edit','编辑动态',NULL,86,0,0,1,1,'2019-12-15 12:17:52'),(91,'/aoogi/news/:id','/aoogi/news/update/*','admin/news/update','更新动态',NULL,86,0,0,1,0,'2019-12-15 12:17:52'),(92,'/aoogi/news/:id','/aoogi/news/del/*','admin/news/delete','删除动态',NULL,86,0,0,1,0,'2019-12-15 12:17:52'),(93,'/aoogi/news/:id','/aoogi/news/read/*','admin/news/read','查看动态',NULL,86,0,0,1,1,'2019-12-15 12:17:52'),(94,'','','','服务内容','#xe66a;',0,0,1,1,1,'2019-12-15 13:08:46'),(95,'','','','用户反馈','#xe66a;',0,0,1,1,1,'2019-12-15 14:00:31'),(96,'/aoogi/tickling','/aoogi/tickling','admin/tickling/index','反馈设置','#xe653;',95,0,1,1,1,'2019-12-15 14:00:59'),(97,'/aoogi/tickling/data','/aoogi/tickling/data','admin/tickling/getData','反馈列表',NULL,96,0,0,1,0,'2019-12-15 14:00:59'),(98,'/aoogi/tickling/status','/aoogi/tickling/status','admin/tickling/setStatus','反馈状态',NULL,96,0,0,1,0,'2019-12-15 14:00:59'),(99,'/aoogi/tickling/edit/:id','/aoogi/tickling/edit/*','admin/tickling/edit','编辑反馈',NULL,96,0,0,1,1,'2019-12-15 14:00:59'),(100,'/aoogi/tickling/:id','/aoogi/tickling/update/*','admin/tickling/update','更新反馈',NULL,96,0,0,1,0,'2019-12-15 14:00:59'),(101,'/aoogi/tickling/:id','/aoogi/tickling/read/*','admin/tickling/read','查看反馈',NULL,96,0,0,1,1,'2019-12-15 14:00:59'),(102,'/aoogi/params/service_info','/aoogi/params/service_info','admin/params/serviceInfo','服务内容页说明','#xe653;',94,0,1,1,1,'2019-12-15 14:39:23'),(103,'/aoogi/services','/aoogi/services','admin/services/index','服务项目设置','#xe653;',94,0,1,1,1,'2019-12-15 23:21:14'),(104,'/aoogi/services/data','/aoogi/services/data','admin/services/getData','服务项目列表',NULL,103,0,0,1,0,'2019-12-15 23:21:14'),(105,'/aoogi/services/create','/aoogi/services/create','admin/services/create','新增服务项目',NULL,103,0,0,1,1,'2019-12-15 23:21:14'),(106,'/aoogi/services','/aoogi/services/save','admin/services/save','保存服务项目',NULL,103,0,0,1,0,'2019-12-15 23:21:14'),(107,'/aoogi/services/edit/:id','/aoogi/services/edit/*','admin/services/edit','编辑服务项目',NULL,103,0,0,1,1,'2019-12-15 23:21:14'),(108,'/aoogi/services/:id','/aoogi/services/update/*','admin/services/update','更新服务项目',NULL,103,0,0,1,0,'2019-12-15 23:21:14'),(109,'/aoogi/services/:id','/aoogi/services/del/*','admin/services/delete','删除服务项目',NULL,103,0,0,1,0,'2019-12-15 23:21:14'),(110,'/aoogi/services/:id','/aoogi/services/read/*','admin/services/read','查看服务项目',NULL,103,0,0,1,1,'2019-12-17 13:47:41'),(111,'/aoogi/params/dispose','/aoogi/params/dispose','admin/params/dispose','配置参数管理','#xe653;',41,0,1,1,1,'2019-12-17 13:57:13');

#
# Structure for table "services"
#

DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `info` text COMMENT '简介',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `content` text COMMENT '详情',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='服务内容';

#
# Data for table "services"
#

INSERT INTO `services` VALUES (2,'施工项目 & 现场监控管理解决方案','从这个意义上说，盲盒的价值不在于它的经济价值，而在于它的认同价值，有多少人愿意相信它的价值，那么它就有价值，这本质跟玩区块链的圈子是差不多的。它极易刺激消费者的非理性购买行为，容易引发外界争议、踩到商业诚信与价值观的红线。','/uploads/20191218/5df9b59c4da30.jpg','<h4 style=\"color:#1F1C2F;font-size:24px;font-family:Roboto, sans-serif;background-color:#FFFFFF;\">\n\t实名制考勤实现\n</h4>\n<p class=\"text\" style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t完美日记在小红书上采用了三段式的投放路径，首先与品牌明星和头部KOL合作，短时间内引发大量关注；接着大量投放产出精致深入内容的腰部KOL，通过试色、教程等图文视频内容，引发消费者种草和购买；最后通过购买产品后的素人在平台上分享使用体验，沉淀UGC内容，引发二次传播和声量叠加。\n</p>','2019-12-16 23:11:36'),(3,'施工项目 & 现场监控管理解决方案','从这个意义上说，盲盒的价值不在于它的经济价值，而在于它的认同价值，有多少人愿意相信它的价值，那么它就有价值，这本质跟玩区块链的圈子是差不多的。它极易刺激消费者的非理性购买行为，容易引发外界争议、踩到商业诚信与价值观的红线。','/uploads/20191218/5df9b58e4ce78.jpg','<h4 style=\"color:#1F1C2F;font-size:24px;font-family:Roboto, sans-serif;background-color:#FFFFFF;\">\n\t实名制考勤实现\n</h4>\n<p class=\"text\" style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t完美日记在小红书上采用了三段式的投放路径，首先与品牌明星和头部KOL合作，短时间内引发大量关注；接着大量投放产出精致深入内容的腰部KOL，通过试色、教程等图文视频内容，引发消费者种草和购买；最后通过购买产品后的素人在平台上分享使用体验，沉淀UGC内容，引发二次传播和声量叠加。\n</p>\n<p class=\"text\" style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t<span style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">完美日记的高明之处就在于不死磕品牌明星和头部KOL，而是广泛投放腰部和初级KOL。明星和头部KOL在扩大品牌声量上效果显著，但是对于转化而言成本高，灵活度不高。腰部和初级KOL相对成本较低、配合度高，且通过长期稳定运营，与粉丝建立了良好的信任感，意见更容易被潜在客户接受。</span> \n</p>\n<p class=\"text\" style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t<img src=\"/uploads/20191218/5df9d323606f8.jpg\" alt=\"\" /><img src=\"/uploads/20191218/5df9d32c4f1a0.jpg\" alt=\"\" />\n</p>\n<p class=\"text\" style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\tq wu sk c rhf gc g hxf tve vb r aisg对此，有网友表示，“大连城市LOGO”这款作品中的部分字体，是直接用了“迪士尼LOGO字体转化器”工具，这种抄袭手法真是简单粗暴，把观众当傻子吗?除了字体部分，还有人指出，部分设计元素还抄袭了江苏淮安涟水县的城市logo形象。\n</p>\n<p class=\"text\" style=\"color:#626262;font-family:Roboto, sans-serif;font-size:16px;background-color:#FFFFFF;\">\n\t<br />\n</p>','2019-12-16 23:22:57');

#
# Structure for table "services_label"
#

DROP TABLE IF EXISTS `services_label`;
CREATE TABLE `services_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `services_id` int(11) unsigned DEFAULT NULL,
  `label_title` varchar(255) DEFAULT NULL,
  `label_info` text,
  `label_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='服务标签';

#
# Data for table "services_label"
#

INSERT INTO `services_label` VALUES (6,2,' 现场施工实名制管理','据测算，2019年我国美妆行业市场规模将达到4225亿元，2022年将突破5000亿元','ti-view-list-alt'),(7,3,'企业项目成本三算监控','天猫未来三年交易规模将翻番，完成1亿次新品首发，孵化100个10亿品牌','ti-layout-grid2'),(8,3,'进度、质量形象清算管理','阿里电商从淘宝演化出天猫，带动了淘品牌的崛起，比如御泥坊、阿芙精油、三只松鼠等','ti-layout-column4'),(9,3,'BIM数据综合分析与统计','小红书目前的用户组成可以简单划分为有明星（认证），头部kol（粉丝数>50万），腰部kol（5万<粉丝数<50万）','ti-layout-media-left'),(10,1,'现场施工实名制管理','据测算，2019年我国美妆行业市场规模将达到4225亿元，2022年将突破5000亿元','ti-announcement'),(11,2,' 现场施工实名制管理','据测算，2019年我国美妆行业市场规模将达到4225亿元，2022年将突破5000亿元','ti-view-list-alt'),(12,4,'现场施工实名制管理','据测算，2019年我国美妆行业市场规模将达到4225亿元，2022年将突破5000亿元','ti-announcement');

#
# Structure for table "team"
#

DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `posts` varchar(255) DEFAULT NULL COMMENT '职位',
  `school` varchar(255) DEFAULT NULL COMMENT '毕业院校',
  `img` varchar(255) DEFAULT NULL,
  `info` text COMMENT '介绍',
  `sort` tinyint(3) unsigned DEFAULT '0' COMMENT '排序',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='团队';

#
# Data for table "team"
#

INSERT INTO `team` VALUES (1,'赵玉通','智能化总工程师','清华大学','/uploads/20191213/5df39d92f1caa.jpg','比如我们想设计一款校园社交电商平台，专注于为大学生提供多块好省的消费体验，招募大学生成为合伙人，并构建合伙人会员体系，用户平台下单后由合伙人快速送货到寝。',1,'2019-12-13 22:11:28'),(3,'郑宇琼','智能化总工程师','清华大学','/uploads/20191213/5df39d9892d29.jpg','比如我们想设计一款校园社交电商平台，专注于为大学生提供多块好省的消费体验，招募大学生成为合伙人，并构建合伙人会员体系，用户平台下单后由合伙人快速送货到寝。',2,'2019-12-13 22:12:12');

#
# Structure for table "tickling"
#

DROP TABLE IF EXISTS `tickling`;
CREATE TABLE `tickling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `company` varchar(100) DEFAULT NULL COMMENT '单位',
  `content` text COMMENT '内容',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '处理状态',
  `remarks` text COMMENT '处理备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户反馈';

#
# Data for table "tickling"
#

INSERT INTO `tickling` VALUES (1,'侯诗书','18297905431','合肥小吉科技有限公司','asdfasfaef',0,NULL,'2019-12-18 17:04:41',NULL);

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'Libai','96e79218965eb72c92a549dd5a330112','18297905432',NULL,'2018-10-10 15:08:34'),(2,'Wangwei','96e79218965eb72c92a549dd5a330112','13564078415',NULL,'2018-10-10 15:08:55'),(3,'Dufu','96e79218965eb72c92a549dd5a330112','17333007330',NULL,'2018-10-10 15:09:11');
