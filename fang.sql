# Host: localhost  (Version: 5.7.17)
# Date: 2019-12-13 23:12:58
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

INSERT INTO `adminer` VALUES (1,'admin','96e79218965eb72c92a549dd5a330112','Amdin',1,1,1,'admin12sdf','127.0.0.1',1576244308,22,'2018-10-23 13:54:17'),(2,'guest','96e79218965eb72c92a549dd5a330112','guest',1,2,0,'guest','127.0.0.1',1542330568,5,'2018-10-23 15:16:25'),(3,'tests','96e79218965eb72c92a549dd5a330112','Test',1,2,0,'TEST',NULL,NULL,0,'2018-11-14 13:13:10');

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
INSERT INTO `banner` VALUES (1,'服务内容','',2,'/uploads/20191212/5df1ed7696af0.jpg',2,'2019-12-12 15:34:17'),(2,'合作项目',NULL,3,'/uploads/20191212/5df1f95cc1688.jpg',2,'2019-12-12 15:47:41'),(3,'最新动态',NULL,4,'/uploads/20191212/5df1ed7696af0.jpg',2,'2019-12-12 15:48:04'),(4,NULL,NULL,6,'/uploads/20191212/5df1ed7696af0.jpg',3,'2019-12-12 15:48:53'),(5,NULL,NULL,8,'/uploads/20191212/5df1ed7696af0.jpg',3,'2019-12-12 15:49:52'),(6,NULL,NULL,9,'/uploads/20191212/5df1ed7696af0.jpg',3,'2019-12-12 15:50:13'),(7,NULL,NULL,10,'/uploads/20191212/5df1ed7696af0.jpg',3,'2019-12-12 15:50:50'),(8,NULL,NULL,11,'/uploads/20191212/5df1ed7696af0.jpg',3,'2019-12-12 15:51:10'),(9,'施工现场 & 项目管理系统方案解决商','A Bootstrap 4 Responsive multi-purpose Theme for the Business, Web agency and more!',1,'/uploads/20191212/5df1ed7696af0.jpg',1,'2019-12-12 15:55:05'),(10,'施工现场 & 项目管理系统方案解决商','A Bootstrap 4 Responsive multi-purpose Theme for the Business, Web agency and more!',1,'/uploads/20191212/5df1ed7696af0.jpg',1,'2019-12-12 15:59:29'),(11,'施工现场 & 项目管理系统方案解决商','A Bootstrap 4 Responsive multi-purpose Theme for the Business, Web agency and more!',1,'/uploads/20191212/5df1ed7696af0.jpg',1,'2019-12-12 15:59:48'),(12,'施工现场 & 项目管理系统方案解决商','A Bootstrap 4 Responsive multi-purpose Theme for the Business, Web agency and more!',1,'/uploads/20191212/5df1ed7696af0.jpg',1,'2019-12-12 16:00:14'),(13,'企业展示','',5,'/uploads/20191212/5df1f3b66a018.jpg',1,'2019-12-12 16:00:56'),(14,'企业展示',NULL,5,'/uploads/20191212/5df1f3b66a018.jpg',1,'2019-12-12 16:01:31'),(15,'企业展示',NULL,5,'/uploads/20191212/5df1f3b66a018.jpg',1,'2019-12-12 16:01:42'),(16,'企业展示',NULL,5,'/uploads/20191212/5df1f3b66a018.jpg',1,'2019-12-12 16:01:51'),(17,'金大地','',7,'/uploads/20191212/5df1f418d33b0.png',1,'2019-12-12 16:02:34'),(18,'怡富',NULL,7,'/uploads/20191212/5df1f418d33b0.png',1,'2019-12-12 16:02:55'),(19,'绿地',NULL,7,'/uploads/20191212/5df1f418d33b0.png',1,'2019-12-12 16:03:12');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;

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
# Structure for table "params"
#

DROP TABLE IF EXISTS `params`;
CREATE TABLE `params` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `content` text COMMENT '内容',
  `type` tinyint(3) unsigned DEFAULT '0' COMMENT '所属板块:1=》企业介绍；2=》核心理念；3=》客户评价；4=》首页三问；5=》首页服务领域',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='统一参数表';

#
# Data for table "params"
#

/*!40000 ALTER TABLE `params` DISABLE KEYS */;
INSERT INTO `params` VALUES (1,'合肥方科信息技术有限公司',NULL,'2007年虎扑获得晨兴资本A轮融资时，就曾在离岸投资中心英属维尔京群岛创立了公司Hoop SportsBVI，在当时这被解读为为境外上市搭建VIE架构。直到2016年，虎扑才真正在A股递交上市申请书。但上市之路并不顺利，曾想借壳ST亚星上市的虎扑，借壳失败后，在第二年主动撤回IPO申请。个中原因在于，虎扑对广告依赖过重，收入模式单一还直接导致，连续几年业绩波动较大，且经营活动现金流量净额和净利润的差异较大。实际上，早在2009年，应当时的电商热潮，虎扑曾推出“卡路里商城”，但在当时各家疯狂烧钱的模式下，卡路里商城早早夭折。2012年，虎扑将此前虎扑论坛的“鉴定中心”独立，孵化了具有导购及鉴别运动装备功能的“识货App”。',1),(2,'团结就是力量',NULL,'产品MVP落地难道就是要研发出所有核心功能吗？其实这样的研发成本也不低，并不是最节约成本的做法，只要能拿着这个模型让用户完成核心流程体验即可。',2),(3,'科技促进发展',NULL,'产品研发投入成本包含人力成本、时间成本、物力财力等成本，产品MVP可设计极简产品原型，降低成本，避免前期投入成本过大，产品上线后用户并不买单的风险。',2),(4,'数据铸就能力',NULL,'寻找种子用户体验MVP，快速验证产品是否能解决用户痛点，是如产品设想呢，还是有新的发现，均可记录并评估优化，验证及迭代成本也很低，帮助更好定位产品定位和用户需求。',2),(5,'服务护航成功q',NULL,'设想很丰满，如要验证产品，难道就必须研发出完整的产品吗？或者将产品的核心功能都研发出来？产品上线后用户就一定会为产品买单吗？',2),(6,' 我们是谁','/uploads/20191213/5df271f3d9104.jpg','在2018年开年，直播答题引发了全民狂欢热潮，成为2018年第一个风口。当时直播平台打着“知识经济”的旗号，推出的直播答题游戏引发了大规模的用户参与',4),(7,'我们在做什么','/uploads/20191213/5df2722432f3a.jpg','这种平台机制其实是利用了一种平台方与获奖用户方的信息不透明与信息不对称机制来以极低的成本制造轰动效应，它很可能是利用奖金的幻象刺激的手段',4),(8,' 我们能帮你解决什么','/uploads/20191213/5df39566415f1.jpg','因为按照10万奖金均分模式，如果一场答题是10个人答对，但每人就可以均分一万，但这对平台方是10万成本，但是获奖用户多寡是不透明的',4),(9,'建筑智能化',NULL,'盲盒也是利用品牌方与用户方的信息不透明与不对称机制来赚钱，有商家表示盲盒抽中的概率大概为1/140',5),(10,'企业施工项目和现场管理',NULL,'我如果是经销商会先把盲盒走一遍x光把限量版找出来单独卖，再不济一套盲盒通过称重也知道大概是哪一款',5),(12,'信息化物业管理平台',NULL,'每年花20万元~70万元在盲盒潮玩上的大有人在。但是盲盒的产品价值并不稳固，普通消费者也没有能力掌控稀缺版盲盒的价值走向',5),(13,'智能家居及物联网平台',NULL,'隐藏款无疑是“诱人深入的目标”，而盲盒收集可成为谈资与炫耀、标签以及圈层的身份与地位，它无疑就是“一种令人痴迷的社交互动”',5),(14,'我如果是经销','/uploads/20191213/5df3a83e703d0.jpg','我如果是经销商会先把盲盒走一遍x光把限量版找出来单独卖，再不济一套盲盒通过称重也知道大概是哪一款',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='路由规则表';

#
# Data for table "router"
#

INSERT INTO `router` VALUES (1,'/aoogi/main','/','','控制面板','#xe679;',0,0,1,1,1,'2018-10-26 14:44:54'),(2,'','','','系统设置','#xe66a;',0,0,1,1,1,'2018-10-26 16:57:59'),(3,'/aoogi/adminer','/aoogi/adminer','admin/admin/index','管理员设置','#xe653;',2,0,1,1,1,'2018-10-26 16:59:16'),(4,'/aoogi/adminer/data','/aoogi/adminer/data','admin/admin/getData','管理员列表','',3,0,0,1,0,'2018-10-26 17:02:06'),(5,'/aoogi/adminer/create','/aoogi/adminer/create','admin/admin/create','新增管理员','',3,0,0,1,1,'2018-10-26 17:03:30'),(6,'/aoogi/adminer','/aoogi/adminer/save','admin/admin/save','保存管理员','',3,0,0,1,0,'2018-10-26 17:04:09'),(7,'/aoogi/adminer/edit/:id','/aoogi/adminer/edit/*','admin/admin/edit','编辑管理员','',3,0,0,1,1,'2018-10-26 17:05:38'),(8,'/aoogi/adminer/:id','/aoogi/adminer/update/*','admin/admin/update','更新管理员','',3,0,0,1,0,'2018-10-26 17:06:30'),(9,'/aoogi/adminer/:id','/aoogi/adminer/del/*','admin/admin/delete','删除管理员','',3,0,0,1,1,'2018-10-26 17:07:14'),(10,'/aoogi/router','/aoogi/router','admin/router/index','路由设置','#xe653;',2,0,1,1,1,'2018-10-30 10:41:29'),(11,'/aoogi/router/data','/aoogi/router/data','admin/router/getData','路由列表','',10,0,0,1,0,'2018-10-30 10:44:59'),(12,'/aoogi/router/create','/aoogi/router/create','admin/router/create','新增路由','',10,0,0,1,1,'2018-10-30 10:47:36'),(13,'/aoogi/router','/aoogi/router/save','admin/router/save','保存路由','',10,0,0,1,0,'2018-11-05 11:00:01'),(14,'/aoogi/router/edit/:id','/aoogi/router/edit/*','admin/router/edit','编辑路由','',10,0,0,1,1,'2018-11-05 11:44:50'),(15,'/aoogi/router/:id','/aoogi/router/update/*','admin/router/update','更新路由','',10,0,0,1,0,'2018-11-05 11:47:04'),(16,'/aoogi/router/:id','/aoogi/router/del/*','admin/router/delete','删除路由','',10,0,0,1,0,'2018-11-05 11:47:34'),(17,'/aoogi/permission','/aoogi/permission','admin/permission/index','权限设置','#xe653;',2,0,1,1,1,'2018-11-05 15:03:03'),(18,'/aoogi/adminer/status','/aoogi/adminer/status','admin/admin/setStatus','管理员状态','',3,0,0,1,0,'2018-11-07 09:12:01'),(19,'/aoogi/router/status','/aoogi/router/status','admin/router/setStatus','路由状态','',10,0,0,1,0,'2018-11-07 09:12:35'),(20,'/aoogi/permission/data','/aoogi/permission/data','admin/permission/getData','权限组列表','',17,0,0,1,0,'2018-11-07 09:14:05'),(21,'/aoogi/permission/status','/aoogi/permission/status','admin/permission/setStatus','权限组状态','',17,0,0,1,0,'2018-11-07 09:15:14'),(22,'/aoogi/permission/create','/aoogi/permission/create','admin/permission/create','新增权限组','',17,0,0,1,1,'2018-11-07 09:15:50'),(23,'/aoogi/permission','/aoogi/permission/save','admin/permission/save','保存权限组','',17,0,0,1,0,'2018-11-07 09:16:24'),(24,'/aoogi/permission/edit/:id','/aoogi/permission/edit/*','admin/permission/edit','编辑权限组','',17,0,0,1,1,'2018-11-07 09:16:52'),(25,'/aoogi/permission/:id','/aoogi/permission/update*','admin/permission/update','更新权限组','',17,0,0,1,0,'2018-11-07 09:17:36'),(26,'/aoogi/permission/:id','/aoogi/permission/del/*','admin/permission/delete','删除权限组','',17,0,0,1,0,'2018-11-07 09:18:20'),(27,'/aoogi/router/:id','/aoogi/router/read/*','admin/router/read','查看路由','',10,0,0,1,1,'2018-11-08 10:48:00'),(28,'/aoogi/adminer/:id','/aoogi/adminer/read/*','admin/admin/read','查看管理员','',3,0,0,1,1,'2018-11-09 14:07:38'),(29,'/aoogi/logout','/aoogi/logout','admin/home/logout','退出登录','',1,0,0,1,1,'2018-11-12 14:00:40'),(30,'/aoogi/error','/aoogi/error','admin/error/index','403错误','',1,0,0,1,1,'2018-11-13 14:07:32'),(31,'/aoogi/main','/','admin/home/main','主页','',1,0,0,1,1,'2018-11-15 12:02:01'),(32,'/aoogi/permission/:id','/aoogi/permission/read/*','admin/permission/read','查看权限组','',17,0,0,1,1,'2018-11-15 15:19:31'),(33,'/aoogi/config','/aoogi/config','admin/config/index','参数设置','#xe653;',2,0,1,1,1,'2018-11-15 16:35:12'),(34,'/aoogi/config/create','/aoogi/config/create','admin/config/create','新增参数','',33,0,0,1,1,'2018-11-15 16:44:30'),(35,'/aoogi/config','/aoogi/config/save','admin/config/save','保存参数','',33,0,0,1,0,'2018-11-15 17:05:08'),(36,'/aoogi/config/edit/:id','/aoogi/config/edit/*','admin/config/edit','编辑参数','',33,0,0,1,1,'2018-11-15 17:09:08'),(37,'/aoogi/config/:id','/aoogi/config/update/*','admin/config/update','更新参数','',33,0,0,1,0,'2018-11-16 10:34:21'),(38,'/aoogi/admin/*','/aoogi/admin/del/*','admin/config/delete','删除参数','',33,0,0,1,0,'2018-11-23 11:51:30'),(39,'/aoogi/router/create_modular','/aoogi/router/create_modular','admin/router/createModular','新增模块路由',NULL,10,0,0,1,1,'2019-05-20 21:53:04'),(40,'/aoogi/router/save_modular','/aoogi/router/save_modular','admin/router/saveModular','保存模块路由','',10,0,0,1,0,'2019-05-20 21:54:17'),(41,'','','','基础设置','#xe66a;',0,0,1,1,1,'2019-12-12 13:22:12'),(42,'/aoogi/banner','/aoogi/banner','admin/banner/index','Banner图管理','#xe653;',41,0,1,1,1,'2019-12-12 13:23:34'),(43,'/aoogi/banner/data','/aoogi/banner/data','admin/banner/getData','Banner图管理列表','',42,0,0,1,0,'2019-12-12 13:23:34'),(44,'/aoogi/banner/create','/aoogi/banner/create','admin/banner/create','新增Banner图',NULL,42,0,0,1,1,'2019-12-12 13:23:34'),(45,'/aoogi/banner','/aoogi/banner/save','admin/banner/save','保存Banner图',NULL,42,0,0,1,0,'2019-12-12 13:23:34'),(46,'/aoogi/banner/edit/:id','/aoogi/banner/edit/*','admin/banner/edit','编辑Banner图',NULL,42,0,0,1,1,'2019-12-12 13:23:34'),(47,'/aoogi/banner/:id','/aoogi/banner/update/*','admin/banner/update','更新Banner图',NULL,42,0,0,1,0,'2019-12-12 13:23:34'),(48,'/aoogi/banner/:id','/aoogi/banner/del/*','admin/banner/delete','删除Banner图',NULL,42,0,0,1,0,'2019-12-12 13:23:34'),(49,'','','','关于我们','#xe66a;',0,0,1,1,1,'2019-12-12 16:29:25'),(50,'/aoogi/params/:type','/aoogi/params/*','admin/params/create','创建信息',NULL,49,0,0,1,1,'2019-12-13 00:35:19'),(51,'/aoogi/params/edit/:type/:id','/aoogi/params/edit/*/*','admin/params/edit','编辑信息','',49,0,0,1,1,'2019-12-12 17:15:52'),(52,'/aoogi/params/company','/aoogi/params/company','admin/paramscompany','企业介绍','#xe653;',49,0,1,1,1,'2019-12-12 16:40:28'),(53,'/aoogi/params/idea','/aoogi/params/idea','admin/params/idea','核心理念','#xe653;',49,0,1,1,1,'2019-12-12 23:00:43'),(54,'/aoogi/params/evaluate','/aoogi/params/evaluate','admin/params/evaluate','客户评价','#xe653;',49,0,1,1,1,'2019-12-12 23:10:06'),(55,'/aoogi/team','/aoogi/team','admin/team/index','团队成员设置','#xe653;',49,0,1,1,1,'2019-12-13 22:07:26'),(56,'/aoogi/team/data','/aoogi/team/data','admin/team/getData','团队成员列表',NULL,55,0,0,1,0,'2019-12-13 22:07:26'),(57,'/aoogi/team/create','/aoogi/team/create','admin/team/create','新增团队成员',NULL,55,0,0,1,1,'2019-12-13 22:07:26'),(58,'/aoogi/team','/aoogi/team/save','admin/team/save','保存团队成员',NULL,55,0,0,1,0,'2019-12-13 22:07:26'),(59,'/aoogi/team/edit/:id','/aoogi/team/edit/*','admin/team/edit','编辑团队成员',NULL,55,0,0,1,1,'2019-12-13 22:07:26'),(60,'/aoogi/team/:id','/aoogi/team/update/*','admin/team/update','更新团队成员',NULL,55,0,0,1,0,'2019-12-13 22:07:26'),(61,'/aoogi/team/:id','/aoogi/team/del/*','admin/team/delete','删除团队成员',NULL,55,0,0,1,0,'2019-12-13 22:07:26'),(62,'/aoogi/team/:id','/aoogi/team/read/*','admin/team/read','查看团队成员',NULL,55,0,0,1,1,'2019-12-13 22:07:26'),(63,'','','','Home首页','#xe66a;',0,0,1,1,1,'2019-12-13 22:34:59'),(64,'/aoogi/params/question','/aoogi/params/question','admin/params/question','首页三问','#xe653;',63,0,1,1,1,'2019-12-13 22:42:55'),(65,'/aoogi/params/realm','/aoogi/params/realm','admin/params/realm','服务领域','#xe653;',63,0,1,1,1,'2019-12-13 22:55:40'),(66,'/aoogi/params/term','/aoogi/params/term','admin/params/term','领域四项','#xe653;',63,0,1,1,1,'2019-12-13 23:06:06');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团队';

#
# Data for table "team"
#

INSERT INTO `team` VALUES (1,'赵玉通','智能化总工程师','清华大学','/uploads/20191213/5df39d92f1caa.jpg','比如我们想设计一款校园社交电商平台，专注于为大学生提供多块好省的消费体验，招募大学生成为合伙人，并构建合伙人会员体系，用户平台下单后由合伙人快速送货到寝。',1,'2019-12-13 22:11:28'),(3,'赵玉通','智能化总工程师','清华大学','/uploads/20191213/5df39d9892d29.jpg','比如我们想设计一款校园社交电商平台，专注于为大学生提供多块好省的消费体验，招募大学生成为合伙人，并构建合伙人会员体系，用户平台下单后由合伙人快速送货到寝。',1,'2019-12-13 22:12:12');

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
