/*
 Navicat Premium Data Transfer

 Source Server         : LDERP
 Source Server Type    : SQL Server
 Source Server Version : 12002000
 Source Host           : 192.168.9.250\SQL2014:1433
 Source Catalog        : bbs
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 12002000
 File Encoding         : 65001

 Date: 05/11/2025 15:48:09
*/


-- ----------------------------
-- Table structure for ez_Admin
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ez_Admin]') AND type IN ('U'))
	DROP TABLE [dbo].[ez_Admin]
GO

CREATE TABLE [dbo].[ez_Admin] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [admin] varchar(12) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [password] varchar(16) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[ez_Admin] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ez_Admin
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ez_Admin] ON
GO

INSERT INTO [dbo].[ez_Admin] ([id], [admin], [password]) VALUES (N'1', N'admin', N'admin')
GO

SET IDENTITY_INSERT [dbo].[ez_Admin] OFF
GO


-- ----------------------------
-- Table structure for ez_Author
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ez_Author]') AND type IN ('U'))
	DROP TABLE [dbo].[ez_Author]
GO

CREATE TABLE [dbo].[ez_Author] (
  [authorId] int  IDENTITY(1,1) NOT NULL,
  [name] varchar(16) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [password] varchar(16) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [sex] smallint DEFAULT 0 NOT NULL,
  [birthday] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [regTime] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[ez_Author] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ez_Author
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ez_Author] ON
GO

INSERT INTO [dbo].[ez_Author] ([authorId], [name], [password], [sex], [birthday], [regTime]) VALUES (N'1', N'accp', N'accp', N'1', N'2011-08-08', N'2011-08-08')
GO

INSERT INTO [dbo].[ez_Author] ([authorId], [name], [password], [sex], [birthday], [regTime]) VALUES (N'2', N'benet', N'benet', N'0', N'2011-08-08', N'2011-08-07')
GO

SET IDENTITY_INSERT [dbo].[ez_Author] OFF
GO


-- ----------------------------
-- Table structure for ez_News
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ez_News]') AND type IN ('U'))
	DROP TABLE [dbo].[ez_News]
GO

CREATE TABLE [dbo].[ez_News] (
  [nid] int  IDENTITY(1,1) NOT NULL,
  [classId] int  NOT NULL,
  [title] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [newsContent] text COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [description] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [postTime] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [authorId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ez_News] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ez_News
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ez_News] ON
GO

INSERT INTO [dbo].[ez_News] ([nid], [classId], [title], [newsContent], [description], [postTime], [authorId]) VALUES (N'1', N'1', N'Java分类发帖测试', N'Java分类发帖测试,Java分类发帖测试', N'Java分类发帖', N'2011-07-09', N'1')
GO

INSERT INTO [dbo].[ez_News] ([nid], [classId], [title], [newsContent], [description], [postTime], [authorId]) VALUES (N'3', N'4', N'去掉 tppabs 标签 ', N'去掉 tppabs 标签  <br />正则表达式<br />  \btppabs="h[^"]*"', N'正则表达式<br />  \btppabs="h[^"]*"', N'2011-07-17', N'1')
GO

SET IDENTITY_INSERT [dbo].[ez_News] OFF
GO


-- ----------------------------
-- Table structure for ez_NewsClass
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ez_NewsClass]') AND type IN ('U'))
	DROP TABLE [dbo].[ez_NewsClass]
GO

CREATE TABLE [dbo].[ez_NewsClass] (
  [classId] int  IDENTITY(1,1) NOT NULL,
  [name] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '未分类' NOT NULL,
  [sort] int DEFAULT 9 NULL,
  [type] int DEFAULT 0 NOT NULL,
  [url] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[ez_NewsClass] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ez_NewsClass
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ez_NewsClass] ON
GO

INSERT INTO [dbo].[ez_NewsClass] ([classId], [name], [sort], [type], [url]) VALUES (N'1', N'Java', N'1', N'0', NULL)
GO

INSERT INTO [dbo].[ez_NewsClass] ([classId], [name], [sort], [type], [url]) VALUES (N'2', N'DotNet', N'2', N'0', NULL)
GO

INSERT INTO [dbo].[ez_NewsClass] ([classId], [name], [sort], [type], [url]) VALUES (N'3', N'PHP', N'5', N'0', NULL)
GO

INSERT INTO [dbo].[ez_NewsClass] ([classId], [name], [sort], [type], [url]) VALUES (N'4', N'Html', N'3', N'0', NULL)
GO

INSERT INTO [dbo].[ez_NewsClass] ([classId], [name], [sort], [type], [url]) VALUES (N'5', N'交流论坛', N'9', N'1', N'/bbs')
GO

SET IDENTITY_INSERT [dbo].[ez_NewsClass] OFF
GO


-- ----------------------------
-- Table structure for ez_Notice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ez_Notice]') AND type IN ('U'))
	DROP TABLE [dbo].[ez_Notice]
GO

CREATE TABLE [dbo].[ez_Notice] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [title] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [notice] text COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [postTime] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[ez_Notice] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ez_Notice
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ez_Notice] ON
GO

INSERT INTO [dbo].[ez_Notice] ([id], [title], [notice], [postTime]) VALUES (N'1', N'寄语关注EZCMS的朋友们！', N'“风雨同行，众木成林”，让我们坚守理想，执着追求，在国产软件自主创新这条注定泥泞和布满荆棘的道路上越走越好。', N'2011-07-10')
GO

INSERT INTO [dbo].[ez_Notice] ([id], [title], [notice], [postTime]) VALUES (N'2', N'公告测试', N'内容测试', N'')
GO

INSERT INTO [dbo].[ez_Notice] ([id], [title], [notice], [postTime]) VALUES (N'3', N'公告测试2', N'内容测试', N'2011-07-09 17:44:40')
GO

SET IDENTITY_INSERT [dbo].[ez_Notice] OFF
GO


-- ----------------------------
-- Table structure for ez_SiteInfo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ez_SiteInfo]') AND type IN ('U'))
	DROP TABLE [dbo].[ez_SiteInfo]
GO

CREATE TABLE [dbo].[ez_SiteInfo] (
  [siteName] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [builder] varchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [url] varchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [company] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [id] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ez_SiteInfo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ez_SiteInfo
-- ----------------------------

-- ----------------------------
-- Table structure for TBL_BBSINFO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_BBSINFO]') AND type IN ('U'))
	DROP TABLE [dbo].[TBL_BBSINFO]
GO

CREATE TABLE [dbo].[TBL_BBSINFO] (
  [name] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '简单JSP论坛' NOT NULL,
  [version] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT 'v1.0.1' NOT NULL,
  [template] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT 'default' NOT NULL,
  [url] varchar(120) COLLATE Chinese_PRC_CI_AS DEFAULT 'http://023sc.info' NOT NULL
)
GO

ALTER TABLE [dbo].[TBL_BBSINFO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of TBL_BBSINFO
-- ----------------------------
INSERT INTO [dbo].[TBL_BBSINFO] ([name], [version], [template], [url]) VALUES (N'简单JSP论坛', N'v1.0.1', N'default', N'Powered By <a href="http://023sc.info" target="_blank">源码网</a>')
GO


-- ----------------------------
-- Table structure for TBL_BOARD
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_BOARD]') AND type IN ('U'))
	DROP TABLE [dbo].[TBL_BOARD]
GO

CREATE TABLE [dbo].[TBL_BOARD] (
  [boardId] int  IDENTITY(1,1) NOT NULL,
  [boardName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [parentId] int  NOT NULL,
  [boardIcon] int  NULL
)
GO

ALTER TABLE [dbo].[TBL_BOARD] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of TBL_BOARD
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TBL_BOARD] ON
GO

INSERT INTO [dbo].[TBL_BOARD] ([boardId], [boardName], [parentId], [boardIcon]) VALUES (N'1', N'java基础', N'1', N'1')
GO

INSERT INTO [dbo].[TBL_BOARD] ([boardId], [boardName], [parentId], [boardIcon]) VALUES (N'2', N'C#基础', N'3', N'2')
GO

INSERT INTO [dbo].[TBL_BOARD] ([boardId], [boardName], [parentId], [boardIcon]) VALUES (N'3', N'.net基础', N'2', N'3')
GO

INSERT INTO [dbo].[TBL_BOARD] ([boardId], [boardName], [parentId], [boardIcon]) VALUES (N'4', N'数据库基础', N'4', N'4')
GO

INSERT INTO [dbo].[TBL_BOARD] ([boardId], [boardName], [parentId], [boardIcon]) VALUES (N'5', N'asp.net学习', N'2', N'5')
GO

INSERT INTO [dbo].[TBL_BOARD] ([boardId], [boardName], [parentId], [boardIcon]) VALUES (N'6', N'JSP学习技巧', N'1', N'6')
GO

INSERT INTO [dbo].[TBL_BOARD] ([boardId], [boardName], [parentId], [boardIcon]) VALUES (N'7', N'灌水乐园', N'5', N'7')
GO

SET IDENTITY_INSERT [dbo].[TBL_BOARD] OFF
GO


-- ----------------------------
-- Table structure for TBL_MESSAGE
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_MESSAGE]') AND type IN ('U'))
	DROP TABLE [dbo].[TBL_MESSAGE]
GO

CREATE TABLE [dbo].[TBL_MESSAGE] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [note] varchar(250) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [sendUname] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [receiveUname] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [postTime] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT getdate() NOT NULL,
  [readSign] smallint DEFAULT 0 NOT NULL
)
GO

ALTER TABLE [dbo].[TBL_MESSAGE] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of TBL_MESSAGE
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TBL_MESSAGE] ON
GO

INSERT INTO [dbo].[TBL_MESSAGE] ([id], [note], [sendUname], [receiveUname], [postTime], [readSign]) VALUES (N'1', N'测试测试', N'accp', N's449599639', N'2011-05-01 20:12:12', N'1')
GO

INSERT INTO [dbo].[TBL_MESSAGE] ([id], [note], [sendUname], [receiveUname], [postTime], [readSign]) VALUES (N'3', N'可以说一下    我的妈呀', N's449599639', N's449599639', N'2001-07-09 18:07:37', N'1')
GO

INSERT INTO [dbo].[TBL_MESSAGE] ([id], [note], [sendUname], [receiveUname], [postTime], [readSign]) VALUES (N'4', N'asd24a6s5d456as4da1啊实打实的 是大时代阿斯顿阿斯顿马丁', N's449599639', N's449599639', N'2001-07-09 18:09:50', N'1')
GO

INSERT INTO [dbo].[TBL_MESSAGE] ([id], [note], [sendUname], [receiveUname], [postTime], [readSign]) VALUES (N'5', N'akdfjasl;dfj;asdflasldjfowejflasjdflasdjfasd;fjlasdjflasdjf;alsdjflasdjfa;lsldfalskdjfl;asdflkjasldfjlaskdjfla;sdf', N's449599639', N's449599639', N'2001-07-10 12:44:10', N'1')
GO

SET IDENTITY_INSERT [dbo].[TBL_MESSAGE] OFF
GO


-- ----------------------------
-- Table structure for TBL_PARENT
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_PARENT]') AND type IN ('U'))
	DROP TABLE [dbo].[TBL_PARENT]
GO

CREATE TABLE [dbo].[TBL_PARENT] (
  [parentId] int  IDENTITY(1,1) NOT NULL,
  [parentName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[TBL_PARENT] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of TBL_PARENT
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TBL_PARENT] ON
GO

INSERT INTO [dbo].[TBL_PARENT] ([parentId], [parentName]) VALUES (N'1', N'JAVA技术')
GO

INSERT INTO [dbo].[TBL_PARENT] ([parentId], [parentName]) VALUES (N'2', N'.NET技术')
GO

INSERT INTO [dbo].[TBL_PARENT] ([parentId], [parentName]) VALUES (N'3', N'C#技术')
GO

INSERT INTO [dbo].[TBL_PARENT] ([parentId], [parentName]) VALUES (N'4', N'数据库技术')
GO

INSERT INTO [dbo].[TBL_PARENT] ([parentId], [parentName]) VALUES (N'5', N'娱乐')
GO

SET IDENTITY_INSERT [dbo].[TBL_PARENT] OFF
GO


-- ----------------------------
-- Table structure for TBL_REPLY
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_REPLY]') AND type IN ('U'))
	DROP TABLE [dbo].[TBL_REPLY]
GO

CREATE TABLE [dbo].[TBL_REPLY] (
  [replyId] int  IDENTITY(1,1) NOT NULL,
  [content] varchar(1000) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [publishTime] datetime  NOT NULL,
  [modifyTime] datetime  NOT NULL,
  [uid] int  NOT NULL,
  [topicId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[TBL_REPLY] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of TBL_REPLY
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TBL_REPLY] ON
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'1', N'有只青蛙跳落水！                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'2009-06-08 02:41:58.000', N'2009-06-08 02:41:58.000', N'2', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'2', N'真的难做', N'2009-06-13 18:42:54.000', N'2009-06-13 18:23:43.000', N'7', N'8')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'3', N'好极了', N'2009-06-13 00:00:00.000', N'2009-06-13 18:23:43.000', N'4', N'9')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'4', N'我对C语言不精通', N'2009-06-13 18:23:43.000', N'2009-06-13 18:23:43.000', N'9', N'2')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'5', N'哦啦啦哦也也', N'2009-06-13 18:52:41.000', N'2009-06-13 18:52:41.000', N'6', N'1')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'6', N'我也来学习C语言', N'2009-06-16 00:13:37.000', N'2009-06-16 00:13:37.000', N'6', N'2')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'7', N'C语言，一个字：难', N'2009-06-16 00:15:20.000', N'2009-06-16 00:15:20.000', N'5', N'2')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'8', N'龊死他。', N'2009-06-16 00:27:08.000', N'2009-06-16 00:27:08.000', N'8', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'9', N'灌水有咩好玩咖？', N'2009-06-16 00:48:15.000', N'2009-06-16 00:48:15.000', N'3', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'10', N'真晕啊你', N'2009-06-16 00:48:37.000', N'2009-06-16 00:48:37.000', N'3', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'11', N'我学过一点点，学得一点都不精！！！', N'2009-06-16 00:54:11.000', N'2009-06-16 00:54:11.000', N'3', N'5')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'12', N'哈哈，她真的很笨，哈哈，简直笨到家了！！！', N'2009-06-16 14:29:50.000', N'2009-06-16 14:29:50.000', N'4', N'7')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'13', N'java好玩啊java好玩啊', N'2009-06-17 00:54:15.000', N'2009-06-17 00:54:15.000', N'4', N'9')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'14', N'嗯，是的，一点也不难学,但要多花功夫', N'2009-06-17 12:15:56.000', N'2009-06-18 00:29:22.000', N'2', N'10')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'15', N'哈哈，我又实现了一个更改的功能,论坛更完善了！', N'2009-06-17 14:28:08.000', N'2009-06-18 00:25:49.000', N'2', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'16', N'不要学数据结构啊，难死了，要我教你几招，可以，除非你不选 数据结构,哈哈吸头', N'2009-06-17 14:34:49.000', N'2009-06-17 15:06:34.000', N'1', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'17', N'JSP好学啊', N'2009-06-17 23:30:38.000', N'2009-06-17 23:30:38.000', N'1', N'19')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'18', N'为什么呢？', N'2009-06-17 23:36:31.000', N'2009-06-17 23:36:31.000', N'9', N'21')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'19', N'aaa', N'2009-06-19 00:46:19.000', N'2009-06-19 00:46:19.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'20', N'bbb', N'2009-06-19 00:46:26.000', N'2009-06-19 00:46:26.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'21', N'ccc', N'2009-06-19 00:46:26.000', N'2009-06-19 00:46:26.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'22', N'eee', N'2009-06-19 00:46:39.000', N'2009-06-19 00:46:39.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'23', N'fff', N'2009-06-19 00:46:46.000', N'2009-06-19 00:46:46.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'24', N'ggg', N'2009-06-19 00:46:53.000', N'2009-06-19 00:46:53.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'25', N'hhh', N'2009-06-19 00:46:59.000', N'2009-06-19 00:46:59.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'26', N'iii', N'2009-06-19 00:47:05.000', N'2009-06-19 00:47:05.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'27', N'jjj', N'2009-06-19 00:47:11.000', N'2009-06-19 00:47:11.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'28', N'kkk', N'2009-06-19 00:47:18.000', N'2009-06-19 00:47:18.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'29', N'lll', N'2009-06-19 00:47:27.000', N'2009-06-19 00:47:27.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'30', N'nnn', N'2009-06-19 00:47:37.000', N'2009-06-19 00:47:37.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'31', N'mmm---mmm                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'2009-06-19 00:47:44.000', N'2009-06-23 12:45:52.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'32', N'ooo', N'2009-06-19 00:47:53.000', N'2009-06-19 00:47:53.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'33', N'ppp', N'2009-06-19 00:48:00.000', N'2009-06-19 00:48:00.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'34', N'qqq', N'2009-06-19 00:48:08.000', N'2009-06-19 00:48:08.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'35', N'rrr', N'2009-06-19 00:48:15.000', N'2009-06-19 00:48:15.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'36', N'sss', N'2009-06-19 00:48:22.000', N'2009-06-19 00:48:22.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'37', N'ttt', N'2009-06-19 00:48:28.000', N'2009-06-19 00:48:28.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'38', N'uuu', N'2009-06-19 00:48:37.000', N'2009-06-19 00:48:37.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'39', N'vvv', N'2009-06-19 00:48:44.000', N'2009-06-19 00:48:44.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'40', N'www', N'2009-06-19 00:48:53.000', N'2009-06-19 00:48:53.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'41', N'xxx', N'2009-06-19 00:49:02.000', N'2009-06-19 00:49:02.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'42', N'yyy', N'2009-06-19 00:49:08.000', N'2009-06-19 00:49:08.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'43', N'zzz', N'2009-06-19 00:49:15.000', N'2009-06-19 00:49:15.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'44', N'aaaaaaaaaaaaaaaa', N'2009-06-20 23:28:31.000', N'2009-06-20 23:28:31.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'45', N'ggggggggggggggg', N'2009-06-20 23:28:50.000', N'2009-06-20 23:28:50.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'46', N'rrrrrrrrrrrrrr', N'2009-06-20 23:28:58.000', N'2009-06-20 23:28:58.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'47', N'eeeeeeeeeeeeeeeeeeee', N'2009-06-20 23:29:07.000', N'2009-06-20 23:29:07.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'48', N'yyyyyyyyyyyyyyyyyyy', N'2009-06-20 23:29:14.000', N'2009-06-20 23:29:14.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'49', N'qqqqqqqqqqqqqqqqqqqqqqqqqq', N'2009-06-20 23:29:23.000', N'2009-06-20 23:29:23.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'50', N'tttttttttttttttttt', N'2009-06-20 23:29:31.000', N'2009-06-20 23:29:31.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'51', N'ooooooooooooooo', N'2009-06-20 23:29:39.000', N'2009-06-20 23:29:39.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'53', N'wewwewew', N'2009-06-20 23:29:56.000', N'2009-06-20 23:29:56.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'54', N'nnnnnnnnnnnnnnnn', N'2009-06-20 23:30:04.000', N'2009-06-20 23:30:04.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'55', N'mmmmmmmmmmmmmmmmmmmmmmmmmm', N'2009-06-20 23:30:12.000', N'2009-06-20 23:30:12.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'56', N'wwwwwwwwwwwwwwwwwwwwww', N'2009-06-20 23:30:22.000', N'2009-06-20 23:30:22.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'57', N'还是有一条回复帖子取不出来，为什么呢？', N'2009-06-21 17:00:39.000', N'2009-06-21 17:00:39.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'58', N'还是有一条回复取不出来，唉，真绝望                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'2009-06-22 00:53:14.000', N'2009-06-22 00:53:14.000', N'1', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'59', N'哈哈，终于全部搞定了，哈哈哈哈，可以交作业啰                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'2009-06-22 08:42:09.000', N'2009-06-22 08:42:09.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'60', N'还有一个小小的问题，就是……呃，好像又没有                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'2009-06-22 08:44:24.000', N'2009-06-22 08:44:24.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'61', N'我的楼怎么都不增高啊，果然是有个小问题                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'2009-06-22 08:49:52.000', N'2009-06-22 08:49:52.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'62', N'说些什么呢？忙中偷闲真的好玩，所以我去灌水了，在一个主题里，我贴了几十条回复，爽歪了                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'2009-06-22 10:25:19.000', N'2009-06-22 10:27:51.000', N'1', N'48')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'63', N'奶奶的，想弄个显示楼层的却不懂做，唉，水平有限啊                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'2009-06-22 15:33:26.000', N'2009-06-22 15:33:26.000', N'9', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'64', N'java有什么好谈的，看到就烦，唉，谁叫我吃这一碗饭的呢？                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'2009-06-22 15:43:41.000', N'2009-06-22 15:45:28.000', N'13', N'18')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'65', N'我进来了，但我不是无聊人士，哈哈                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'2009-06-23 12:06:42.000', N'2009-06-23 12:06:42.000', N'2', N'49')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'66', N'tgtgtg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'2009-06-28 02:01:24.000', N'2009-06-28 02:01:24.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'67', N'dfdfdfdf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'2009-06-28 02:02:44.000', N'2009-06-28 02:02:44.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'68', N'kjjjjjjjjjjjjjjjjjjjjjj                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'2009-06-28 02:03:28.000', N'2009-06-28 02:03:28.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'69', N'fffffffffffffffffffffffffffddddddd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'2009-06-28 02:04:00.000', N'2009-06-28 02:04:00.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'70', N'ggggggggggggggggggg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', N'2009-06-28 02:04:31.000', N'2009-06-28 02:04:31.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'71', N'ggggggggggggggggggggggg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'2009-06-28 02:05:04.000', N'2009-06-28 02:05:04.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'72', N'ffffffffffffffffffff                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'2009-06-28 02:05:41.000', N'2009-06-28 02:05:41.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'73', N'jjjjjjjjjjjjjjjjjjjjj                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', N'2009-06-28 02:06:23.000', N'2009-06-28 02:06:23.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'74', N'fgggggggggggggggggggggggggg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'2009-06-28 02:06:56.000', N'2009-06-28 02:06:56.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'75', N'fffffffffffffffffffffffffffff                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'2009-06-28 02:07:29.000', N'2009-06-28 02:07:29.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'76', N'ttttttttttttttttttttttttt                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'2009-06-28 02:07:59.000', N'2009-06-28 02:07:59.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'77', N'fffffffffffffffffffffffffffffffffffffff                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'2009-06-28 02:08:35.000', N'2009-06-28 02:08:35.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'78', N'fffffffffffsdfsadf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'2009-06-28 02:09:06.000', N'2009-06-28 02:09:06.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'79', N'kkkkkkkkkkkkkkkkkk                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'2009-06-28 02:09:38.000', N'2009-06-28 02:09:38.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'80', N'日日日日                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'2009-06-28 02:10:35.000', N'2009-06-28 02:10:35.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'81', N'日日日日                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'2009-06-28 02:10:37.000', N'2009-06-28 02:10:37.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'82', N'日日日日一一一一一一                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'2009-06-28 02:12:10.000', N'2009-06-28 02:12:10.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'83', N'哦啦啦哦也也，全部功能都实现了，哈哈                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'2009-06-28 03:33:47.000', N'2009-06-28 03:33:47.000', N'5', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'84', N'是.net平台中的一个', N'2011-07-03 15:26:33.000', N'2011-07-03 15:26:33.000', N'15', N'50')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'86', N'假设是测试', N'2011-07-03 16:53:30.000', N'2011-07-03 16:53:30.000', N'15', N'15')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'87', N'测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下测试一下下', N'2011-07-06 16:17:00.000', N'2011-07-06 16:29:19.000', N'15', N'6')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'88', N' XXOO', N'2012-07-13 14:34:01.000', N'2012-07-13 14:34:01.000', N'17', N'18')
GO

INSERT INTO [dbo].[TBL_REPLY] ([replyId], [content], [publishTime], [modifyTime], [uid], [topicId]) VALUES (N'89', N'<p> 这是嘛?</p><p>&nbsp;</p><p>界是嘛！！！！</p>', N'2012-07-13 14:35:07.000', N'2012-07-13 14:35:07.000', N'17', N'50')
GO

SET IDENTITY_INSERT [dbo].[TBL_REPLY] OFF
GO


-- ----------------------------
-- Table structure for TBL_TOPIC
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_TOPIC]') AND type IN ('U'))
	DROP TABLE [dbo].[TBL_TOPIC]
GO

CREATE TABLE [dbo].[TBL_TOPIC] (
  [topicId] int  IDENTITY(1,1) NOT NULL,
  [title] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [content] varchar(1000) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [publishTime] datetime  NOT NULL,
  [modifyTime] datetime  NOT NULL,
  [uId] int  NOT NULL,
  [boardId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[TBL_TOPIC] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of TBL_TOPIC
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TBL_TOPIC] ON
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'1', N'初步学习C#', N'C# 还容易学习', N'2009-03-23 08:38:48.000', N'2009-03-23 08:38:48.000', N'1', N'3')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'2', N'C#学习心得', N'C#学起来感觉好', N'2009-03-23 08:40:12.000', N'2009-03-23 08:40:12.000', N'5', N'2')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'3', N'JAVA基本数据类型', N'JAVA有8种数据类型', N'2009-03-26 12:09:19.000', N'2009-03-26 12:09:19.000', N'5', N'1')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'4', N'.net基础学习', N'.net very good', N'2009-03-26 12:36:55.000', N'2009-03-26 12:36:55.000', N'7', N'3')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'5', N'JAVA 基础last', N'学会运用session对象很重要', N'2009-04-05 12:49:36.000', N'2009-04-05 12:49:36.000', N'1', N'1')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'6', N'application对象', N'学会运用application对象', N'2009-04-05 12:49:36.000', N'2009-04-05 12:49:36.000', N'7', N'1')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'7', N'灌水', N'灌水好玩真玩', N'2009-06-08 12:49:36.000', N'2009-06-08 12:49:36.000', N'5', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'8', N'java', N'java,哈哈哈哈', N'2009-06-15 16:48:56.000', N'2009-06-15 16:48:56.000', N'8', N'1')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'9', N'哦啦啦', N'哦啦啦哦也也', N'2009-06-13 19:03:47.000', N'2009-06-13 19:03:47.000', N'6', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'10', N'java难不难？', N'java真好学', N'2009-06-15 17:06:22.000', N'2009-06-15 17:06:22.000', N'8', N'1')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'11', N'C语言好不好学？', N'大家说说C语言好不好学，发表一下自己的看法', N'2009-06-16 00:14:41.000', N'2009-06-16 00:14:41.000', N'8', N'3')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'12', N'.net', N'学习.net呢，其实只要用心学，没什么难的喽！', N'2009-06-16 00:20:09.000', N'2009-06-16 00:20:09.000', N'6', N'2')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'13', N'真龊', N'快点，供应点资源。', N'2009-06-16 00:25:39.000', N'2009-06-16 00:25:39.000', N'4', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'14', N'SQL', N'SQL不难学滴', N'2009-06-16 00:40:13.000', N'2009-06-16 00:40:13.000', N'4', N'4')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'15', N'灌水？我来也', N'大家一起来灌水啊', N'2009-06-16 00:47:24.000', N'2009-06-16 00:47:24.000', N'3', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'16', N'.net好学还是java好学？', N'本人现在只要是学习java方向，.net就没有学过了，但是很想自己学习，有没有人自学过的，可以介绍点经验吗，或者介绍看哪些书对自学效果比较显示。小弟在此先谢了！！！', N'2009-06-16 00:57:04.000', N'2009-06-16 00:57:04.000', N'3', N'2')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'17', N'爪哇java', N'爪哇java好好学好有钱图喔', N'2009-06-17 00:49:55.000', N'2009-06-17 00:49:55.000', N'6', N'1')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'18', N'java浅谈', N'大家都进来发表自己的看法吧', N'2009-06-17 23:00:13.000', N'2009-06-17 23:00:13.000', N'2', N'1')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'19', N'JSP技术', N'这个JSP啊，刚开始学时是有点难，但到后来就不这么觉得了，反而觉得JSP太容易学了，哈哈！！！', N'2009-06-17 23:27:52.000', N'2009-06-17 23:27:52.000', N'2', N'6')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'20', N'SQL的学习方法技巧', N'下面请大家来谈谈自己学习SQL的学习方法', N'2009-06-18 23:15:49.000', N'2009-06-18 23:15:49.000', N'6', N'4')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'21', N'java学习要点有哪些？', N'java学习要点有哪些？大家谈谈', N'2009-06-20 14:03:38.000', N'2009-06-20 14:03:38.000', N'2', N'3')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'22', N'aa', N'aa', N'2009-06-20 18:47:12.000', N'2009-06-20 18:47:12.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'23', N'bb', N'bb', N'2009-06-20 18:47:19.000', N'2009-06-20 18:47:19.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'24', N'cc', N'cc', N'2009-06-20 18:47:27.000', N'2009-06-20 18:47:27.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'25', N'dd', N'dd', N'2009-06-20 18:47:33.000', N'2009-06-20 18:47:33.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'26', N'ee', N'ee', N'2009-06-20 18:47:40.000', N'2009-06-20 18:47:40.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'27', N'ff', N'ff', N'2009-06-20 18:47:50.000', N'2009-06-20 18:47:50.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'28', N'gg', N'gg', N'2009-06-20 18:48:00.000', N'2009-06-20 18:48:00.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'29', N'hh', N'hh', N'2009-06-20 18:48:13.000', N'2009-06-20 18:48:13.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'30', N'ii', N'ii', N'2009-06-20 18:48:23.000', N'2009-06-20 18:48:23.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'31', N'jj', N'jj', N'2009-06-20 18:48:31.000', N'2009-06-20 18:48:31.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'32', N'kk', N'kk', N'2009-06-20 18:48:39.000', N'2009-06-20 18:48:39.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'33', N'll', N'll', N'2009-06-20 18:48:49.000', N'2009-06-20 18:48:49.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'34', N'mm', N'mm', N'2009-06-20 18:48:58.000', N'2009-06-20 18:48:58.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'35', N'nn', N'nn', N'2009-06-20 18:49:10.000', N'2009-06-20 18:49:10.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'36', N'oo', N'oo', N'2009-06-20 18:49:21.000', N'2009-06-20 18:49:21.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'37', N'pp', N'pp', N'2009-06-20 18:49:36.000', N'2009-06-20 18:49:36.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'38', N'qq', N'qq', N'2009-06-20 18:49:46.000', N'2009-06-20 18:49:46.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'39', N'rr', N'rr', N'2009-06-20 18:49:58.000', N'2009-06-20 18:49:58.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'40', N'ss', N'ss', N'2009-06-20 18:50:07.000', N'2009-06-20 18:50:07.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'41', N'tt', N'tt', N'2009-06-20 18:50:17.000', N'2009-06-20 18:50:17.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'42', N'uu', N'uu', N'2009-06-20 18:50:28.000', N'2009-06-20 18:50:28.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'43', N'vv', N'vv', N'2009-06-20 18:50:39.000', N'2009-06-20 18:50:39.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'44', N'ww', N'ww', N'2009-06-20 18:50:50.000', N'2009-06-20 18:50:50.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'45', N'xx', N'xx', N'2009-06-20 18:51:02.000', N'2009-06-20 18:51:02.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'46', N'yy', N'yy', N'2009-06-20 18:51:14.000', N'2009-06-20 18:51:14.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'47', N'zz', N'zz', N'2009-06-20 18:51:25.000', N'2009-06-20 18:51:25.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'48', N'忙中偷闲，哈哈！！！                              ', N'哈哈，彻底完成喽，整整花了我一周时间才把这个论坛做完成，真的是太菜了。看来我还有很大的提升空间喔                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'2009-06-22 10:21:24.000', N'2009-06-22 10:21:24.000', N'1', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'49', N'无聊人士请进                                      ', N'所有无聊的人都进来吧，坐坐，喝杯咖啡，开始谈谈些无聊的话题                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'2009-06-22 15:35:06.000', N'2009-06-22 15:35:06.000', N'9', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'50', N'asp.net是什么东西？                               ', N'三个学：没学过                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'2009-06-23 11:31:52.000', N'2009-06-23 11:31:52.000', N'2', N'5')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'51', N'爱我别走                                          ', N'爱我别走，你总是这样说，唉，终于完成了，爱我别走                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'2009-06-23 12:07:49.000', N'2009-06-23 12:07:49.000', N'2', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'52', N'绘声绘色                                          ', N'绘声绘色绘声绘色                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'2009-06-28 03:31:51.000', N'2009-06-28 03:31:51.000', N'5', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'53', N'测试', N'测试测试测试测试测试', N'2011-07-03 16:41:56.000', N'2011-07-03 16:41:56.000', N'15', N'7')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'54', N'简单的说一下', N'简单的说一下', N'2011-07-06 16:35:47.000', N'2011-07-06 16:35:47.000', N'15', N'1')
GO

INSERT INTO [dbo].[TBL_TOPIC] ([topicId], [title], [content], [publishTime], [modifyTime], [uId], [boardId]) VALUES (N'55', N'asfdfdasf', N'<p align="center">&nbsp;sdffffffffffffffffff</p>', N'2011-07-06 17:37:10.000', N'2011-07-06 17:37:10.000', N'16', N'1')
GO

SET IDENTITY_INSERT [dbo].[TBL_TOPIC] OFF
GO


-- ----------------------------
-- Table structure for TBL_USER
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_USER]') AND type IN ('U'))
	DROP TABLE [dbo].[TBL_USER]
GO

CREATE TABLE [dbo].[TBL_USER] (
  [uId] int  IDENTITY(1,1) NOT NULL,
  [uName] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [uPass] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [head] varchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [regTime] datetime  NOT NULL,
  [gender] smallint  NOT NULL,
  [uLevel] smallint DEFAULT 1 NOT NULL,
  [uManage] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[TBL_USER] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of TBL_USER
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TBL_USER] ON
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'1', N'mn                  ', N'00                  ', N'2.gif                                                                                               ', N'2009-06-08 02:23:58.000', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'2', N'sb                  ', N'456                 ', N'15.gif                                                                                              ', N'2009-06-03 19:44:08.000', N'1', N'2', NULL)
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'3', N'kk                  ', N'00                  ', N'2.gif                                                                                               ', N'2009-06-08 17:11:07.000', N'1', N'4', NULL)
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'4', N'ggg                 ', N'00                  ', N'2.gif                                                                                               ', N'2009-06-08 02:18:18.000', N'1', N'1', N'版主')
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'5', N'kk                  ', N'123456              ', N'1.gif                                                                                               ', N'2009-06-08 18:35:21.000', N'2', N'2', N'实习版主')
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'6', N'QQQ                 ', N'000                 ', N'15.gif                                                                                              ', N'2009-06-08 18:36:33.000', N'1', N'5', NULL)
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'7', N'ppp                 ', N'000                 ', N'14.gif                                                                                              ', N'2009-06-08 18:37:45.000', N'2', N'3', NULL)
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'8', N'ppp                 ', N'123                 ', N'1.gif                                                                                               ', N'2009-06-08 18:50:54.000', N'2', N'2', NULL)
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'9', N'hjj                 ', N'000                 ', N'1.gif                                                                                               ', N'2009-06-08 18:51:21.000', N'2', N'5', N'超级版主')
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'10', N'ttt', N'00', N'10.gif', N'2009-06-20 09:30:30.000', N'2', N'3', NULL)
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'11', N'av                  ', N'00                  ', N'6.gif                                                                                               ', N'2009-06-21 23:59:08.000', N'1', N'4', NULL)
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'13', N'www                 ', N'www                 ', N'1.gif                                                                                               ', N'2009-06-22 15:38:50.000', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'14', N'nb                  ', N'nb                  ', N'5.gif                                                                                               ', N'2009-06-23 11:05:43.000', N'1', N'2', NULL)
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'15', N's449599639', N'19910912', N'3.gif', N'2011-07-03 15:25:33.000', N'2', N'7', N'管理员')
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'16', N'mapi', N'mapi', N'1.gif', N'2011-07-06 17:36:33.000', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[TBL_USER] ([uId], [uName], [uPass], [head], [regTime], [gender], [uLevel], [uManage]) VALUES (N'17', N'admin', N'admin888', N'2.gif', N'2012-07-13 14:32:50.000', N'2', N'1', NULL)
GO

SET IDENTITY_INSERT [dbo].[TBL_USER] OFF
GO


-- ----------------------------
-- Auto increment value for ez_Admin
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[ez_Admin]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table ez_Admin
-- ----------------------------
ALTER TABLE [dbo].[ez_Admin] ADD CONSTRAINT [PK_ez_Admin] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for ez_Author
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[ez_Author]', RESEED, 2)
GO


-- ----------------------------
-- Primary Key structure for table ez_Author
-- ----------------------------
ALTER TABLE [dbo].[ez_Author] ADD CONSTRAINT [PK_ez_Author] PRIMARY KEY CLUSTERED ([authorId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for ez_News
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[ez_News]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table ez_News
-- ----------------------------
ALTER TABLE [dbo].[ez_News] ADD CONSTRAINT [PK_ez_news] PRIMARY KEY CLUSTERED ([nid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for ez_NewsClass
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[ez_NewsClass]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table ez_NewsClass
-- ----------------------------
ALTER TABLE [dbo].[ez_NewsClass] ADD CONSTRAINT [PK_ez_newsclass] PRIMARY KEY CLUSTERED ([classId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for ez_Notice
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[ez_Notice]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table ez_Notice
-- ----------------------------
ALTER TABLE [dbo].[ez_Notice] ADD CONSTRAINT [PK_ez_Notice] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table ez_SiteInfo
-- ----------------------------
ALTER TABLE [dbo].[ez_SiteInfo] ADD CONSTRAINT [PK__ez_SiteInfo__6477ECF3] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for TBL_BOARD
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[TBL_BOARD]', RESEED, 7)
GO


-- ----------------------------
-- Primary Key structure for table TBL_BOARD
-- ----------------------------
ALTER TABLE [dbo].[TBL_BOARD] ADD CONSTRAINT [PK_TBL_BOARD] PRIMARY KEY CLUSTERED ([boardId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for TBL_MESSAGE
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[TBL_MESSAGE]', RESEED, 8)
GO


-- ----------------------------
-- Primary Key structure for table TBL_MESSAGE
-- ----------------------------
ALTER TABLE [dbo].[TBL_MESSAGE] ADD CONSTRAINT [PK_TBL_MESSAGE] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for TBL_PARENT
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[TBL_PARENT]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table TBL_PARENT
-- ----------------------------
ALTER TABLE [dbo].[TBL_PARENT] ADD CONSTRAINT [PK_TBL_PARENT] PRIMARY KEY CLUSTERED ([parentId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for TBL_REPLY
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[TBL_REPLY]', RESEED, 89)
GO


-- ----------------------------
-- Primary Key structure for table TBL_REPLY
-- ----------------------------
ALTER TABLE [dbo].[TBL_REPLY] ADD CONSTRAINT [PK_TBL_REPLY] PRIMARY KEY CLUSTERED ([replyId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for TBL_TOPIC
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[TBL_TOPIC]', RESEED, 55)
GO


-- ----------------------------
-- Primary Key structure for table TBL_TOPIC
-- ----------------------------
ALTER TABLE [dbo].[TBL_TOPIC] ADD CONSTRAINT [PK_TBL_TOPIC] PRIMARY KEY CLUSTERED ([topicId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for TBL_USER
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[TBL_USER]', RESEED, 17)
GO


-- ----------------------------
-- Primary Key structure for table TBL_USER
-- ----------------------------
ALTER TABLE [dbo].[TBL_USER] ADD CONSTRAINT [PK_TBL_USER] PRIMARY KEY CLUSTERED ([uId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table ez_News
-- ----------------------------
ALTER TABLE [dbo].[ez_News] ADD CONSTRAINT [FK_ez_News_ez_Author_authorId] FOREIGN KEY ([authorId]) REFERENCES [dbo].[ez_Author] ([authorId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[ez_News] ADD CONSTRAINT [FK_ez_News_ez_NewsClass_classId] FOREIGN KEY ([classId]) REFERENCES [dbo].[ez_NewsClass] ([classId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TBL_MESSAGE
-- ----------------------------
ALTER TABLE [dbo].[TBL_MESSAGE] ADD CONSTRAINT [FK_TBL_MESSAGE_TBL_MESSAGE] FOREIGN KEY ([id]) REFERENCES [dbo].[TBL_MESSAGE] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

