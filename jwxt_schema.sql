/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : jwxt_schema

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 10/07/2023 15:41:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `CId` char(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程序号，主键',
  `PCId` char(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '先修课',
  `DId` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '开课系编号，外键',
  `CName` char(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程名称',
  `CCredit` int NOT NULL COMMENT '学分',
  `CHour` int NOT NULL COMMENT '学时',
  `CAttr` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程类型',
  `CNum` int NOT NULL COMMENT '选课人数',
  PRIMARY KEY (`CId`) USING BTREE,
  INDEX `FK_Course_Course`(`PCId`) USING BTREE,
  INDEX `FK_Course_Dept`(`DId`) USING BTREE,
  CONSTRAINT `FK_Course_Course` FOREIGN KEY (`PCId`) REFERENCES `course` (`CId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_Course_Dept` FOREIGN KEY (`DId`) REFERENCES `dept` (`DId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '课程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '5', 'CS', '数据库', 4, 72, '必修', 50);
INSERT INTO `course` VALUES ('10', '9', 'EM', '统计与审计', 5, 90, '必修', 90);
INSERT INTO `course` VALUES ('11', NULL, 'EL', '刺绣', 1, 18, '选修', 50);
INSERT INTO `course` VALUES ('12', NULL, 'EL', '家庭保健', 1, 18, '选修', 30);
INSERT INTO `course` VALUES ('2', NULL, 'SD', '数学', 3, 54, '必修', 90);
INSERT INTO `course` VALUES ('3', '1', 'CS', '信息系统与数据库', 3, 54, '必修', 50);
INSERT INTO `course` VALUES ('4', '6', 'CS', '操作系统', 4, 72, '必修', 50);
INSERT INTO `course` VALUES ('5', '7', 'CS', '数据结构', 5, 90, '必修', 50);
INSERT INTO `course` VALUES ('6', NULL, 'CS', '计算机基础', 3, 54, '必修', 70);
INSERT INTO `course` VALUES ('7', '6', 'CS', 'C语言', 2, 36, '必修', 70);
INSERT INTO `course` VALUES ('8', NULL, 'CS', '计算机组成原理', 3, 54, '选修', 120);
INSERT INTO `course` VALUES ('9', '2', 'EM', '会计学原理', 5, 90, '必修', 90);

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `DId` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '部门编号，主键',
  `DName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '部门名称',
  `DAddr` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `DTele` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `DEmail` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`DId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '院系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('CS', '计算机科学与技术系', 'SL604', '87678976', 'cs@nit.com');
INSERT INTO `dept` VALUES ('EL', '外校', NULL, '62765678', NULL);
INSERT INTO `dept` VALUES ('EM', '经济管理系', 'SC302', '87464789', 'em@nit.com');
INSERT INTO `dept` VALUES ('FD', '外语分院', 'SA401', '65656798', 'fd@nit.com');
INSERT INTO `dept` VALUES ('IT', '信息科学与技术系', 'SL704', '88767864', 'it@nit.com');
INSERT INTO `dept` VALUES ('SD', '理学院', 'NB309', '67536387', 'sd@nit.com');

-- ----------------------------
-- Table structure for exercise
-- ----------------------------
DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise`  (
  `EId` int NOT NULL,
  `EContext` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ELevel` int NULL DEFAULT NULL,
  `EAnswer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`EId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exercise
-- ----------------------------
INSERT INTO `exercise` VALUES (1, '显示院系信息表中的所有信息', 1, '');
INSERT INTO `exercise` VALUES (2, '显示院系信息表中的部门编码、部门名称信息', 1, '');
INSERT INTO `exercise` VALUES (3, '显示所有女教师的工号、姓名、性别信息', 1, '');
INSERT INTO `exercise` VALUES (4, '显示CS系的老师所有个人信息', 1, '');
INSERT INTO `exercise` VALUES (5, '显示CS系与IT系所有老师的全部个人信息', 1, '');
INSERT INTO `exercise` VALUES (6, '显示女教授的姓名、性别、职称与部门编号信息', 1, '');
INSERT INTO `exercise` VALUES (7, '显示研究领域为数据库的老师的姓名、研究领域、联系电话、所在部门', 1, '');
INSERT INTO `exercise` VALUES (8, '显示40岁以下老师的姓名、出生日期', 1, '');
INSERT INTO `exercise` VALUES (9, '显示5月份出生的教师姓名、性别、出生日期、联系电话', 1, '');
INSERT INTO `exercise` VALUES (10, '显示姓李的老师的所有信息', 1, '');
INSERT INTO `exercise` VALUES (11, '显示选修了1号课程的同学的学号', 1, '');
INSERT INTO `exercise` VALUES (12, '显示同时选修了1号与2号课程的同学的学号', 2, '');
INSERT INTO `exercise` VALUES (13, '显示012005002号同学选修的课程号', 1, '');
INSERT INTO `exercise` VALUES (14, '显示012005002号同学的全部选修信息', 1, '');
INSERT INTO `exercise` VALUES (15, '显示期末成绩不及格的同学的学号、课程号与期末成绩', 1, '');
INSERT INTO `exercise` VALUES (16, '显示选修了1号课程的人数', 1, '');
INSERT INTO `exercise` VALUES (17, '显示1号课程期末考试成绩的平均分（Avg）,四舍五入包保留两位小数', 1, '');
INSERT INTO `exercise` VALUES (18, '显示012005002同学的期末成绩的最低分', 1, '');
INSERT INTO `exercise` VALUES (19, '显示2008年每门课程期末成绩的平均分（Avg）,四舍五入包保留两位小数，显示课程号与平均分，并按降序排列', 2, '');
INSERT INTO `exercise` VALUES (20, '显示周4有课的教室', 1, '');
INSERT INTO `exercise` VALUES (21, '显示周4有课的老师的工号', 1, '');
INSERT INTO `exercise` VALUES (22, '显示NB222教室排课的情况（全部信息）', 1, '');
INSERT INTO `exercise` VALUES (23, '显示1号课程上课的教室、老师工号、上课时间', 1, '');
INSERT INTO `exercise` VALUES (24, '显示02004号老师上课的教室与时间', 1, '');
INSERT INTO `exercise` VALUES (25, '显示第4节有课的教室、课程号、教师工号', 1, '');
INSERT INTO `exercise` VALUES (26, '统计每位教师每周上课的次数（Num）及总时长（Len，每节课45分钟）', 2, '');
INSERT INTO `exercise` VALUES (27, '统计每个班每周上课的课时数，显示班级编号和课时数，并按课时数降序排列', 2, '');
INSERT INTO `exercise` VALUES (28, '显示无前导课的课程的全部信息', 1, '');
INSERT INTO `exercise` VALUES (29, '显示CS系所开课程的课程号与课程名', 1, '');
INSERT INTO `exercise` VALUES (30, '显示学分大于3的所有课程的课程名与课时', 1, '');
INSERT INTO `exercise` VALUES (31, '按开课院系统计每个院系开课的学分数（Credit），显示院系编号和总学分，并按学分数降序排列', 2, '');
INSERT INTO `exercise` VALUES (32, '显示学生中所有男生的全部信息', 1, '');
INSERT INTO `exercise` VALUES (33, '显示01班所有学生的信息', 1, '');
INSERT INTO `exercise` VALUES (34, '显示03班所有女生的信息', 1, '');
INSERT INTO `exercise` VALUES (35, '显示刘山同学的电话号码', 1, '');
INSERT INTO `exercise` VALUES (36, '显示所有女生的学号、姓名与班级编号', 1, '');
INSERT INTO `exercise` VALUES (37, '统计每个班级的人数，显示班级编号，人数，并按降序排列', 1, '');
INSERT INTO `exercise` VALUES (38, '显示人数5人以上班级的班级编号和人数（Num），并按人数升序排列', 2, '');
INSERT INTO `exercise` VALUES (39, '显示年龄在18岁以下的学生的全部信息', 1, '');
INSERT INTO `exercise` VALUES (40, '统计18岁以下学生的总人数', 1, '');
INSERT INTO `exercise` VALUES (41, '统计每个班小于24岁的学生人数，显示班级编号、人数（Num）', 2, '');
INSERT INTO `exercise` VALUES (42, '统计每个年龄段的人数，按照年龄升序排列', 2, '');
INSERT INTO `exercise` VALUES (43, '显示姓名中有\"白云\"的同学的所有信息', 1, '');
INSERT INTO `exercise` VALUES (44, '显示白姓同学的姓名、性别、班级名称、联系电话', 2, '');
INSERT INTO `exercise` VALUES (45, '显示CS系的班级名称及入学年份', 1, '');
INSERT INTO `exercise` VALUES (46, '显示没有班主任的班级的所有信息', 1, '');
INSERT INTO `exercise` VALUES (47, '显示2008年入学班级的所有信息', 1, '');
INSERT INTO `exercise` VALUES (48, '显示所有学生的详细信息，包括学号、姓名、性别、年龄（Age）、班级名称，入学年份', 2, '');
INSERT INTO `exercise` VALUES (49, '显示信息科学与技术系同学的名单，包括学号、姓名、性别、年龄、班级名称、入学年份', 2, '');
INSERT INTO `exercise` VALUES (50, '显示选修了\"数据库\"课程的所有同学的学号、姓名', 2, '');
INSERT INTO `exercise` VALUES (51, '显示白云同学的班主任老师的姓名、联系电话', 2, '');
INSERT INTO `exercise` VALUES (52, '显示白云同学所在院系的名称、办公地点与联系电话', 2, '');
INSERT INTO `exercise` VALUES (53, '统计计算机科学与技术系每个同学已经修完的学分，显示学号、姓名、学分总数（Credit）', 2, '');
INSERT INTO `exercise` VALUES (54, '显示张飞同学已修课程的课程号，课程名及期末成绩', 2, '');
INSERT INTO `exercise` VALUES (55, '显示计算机科学与技术系、信息科学与技术系的班级名称、入学年份、班主任名称与联系电话', 2, '');
INSERT INTO `exercise` VALUES (56, '显示2008年入学的同学的学号、姓名、班级名称', 2, '');
INSERT INTO `exercise` VALUES (57, '显示已修数据库的同学的学号、姓名及期末成绩', 2, '');
INSERT INTO `exercise` VALUES (58, '显示期末平均成绩75分以上的课程名称与期末平均成绩（Avg，结果保留两位小数）', 2, '');
INSERT INTO `exercise` VALUES (59, '显示期末平均成绩80分以上同学的学号、姓名与期末平均成绩（Avg，结果保留两位小数）', 2, '');
INSERT INTO `exercise` VALUES (60, '显示一周课时数为5节及以上的教师的姓名，研究领域与课时数', 2, '');
INSERT INTO `exercise` VALUES (61, '按照班级统计期末平均成绩，显示班级名称与平均成绩（Avg，结果保留两位小数）', 2, '');
INSERT INTO `exercise` VALUES (62, '按照学期统计计算机科学与技术系学生的期末平均成绩，显示学期名称与平均成绩（Avg，结果保留两位小数）', 2, '');
INSERT INTO `exercise` VALUES (63, '统计每个院系一周的课时数（Hours），显示院系名称与课时数', 2, '');
INSERT INTO `exercise` VALUES (64, '显示没有选修任何课程的学生学号、姓名、班级名称', 2, '');
INSERT INTO `exercise` VALUES (65, '显示上过李飞老师的课的学生的学号、姓名与联系电话', 2, '');
INSERT INTO `exercise` VALUES (66, '显示一周6节课及以上的课程名称、学分', 2, '');
INSERT INTO `exercise` VALUES (67, '显示一周6节课及以上班级名称', 2, '');
INSERT INTO `exercise` VALUES (68, '查询周四上午第3节有课的同学的学号、姓名与班级名称', 3, '');
INSERT INTO `exercise` VALUES (69, '显示期末成绩没有不及格课程的班级的名称', 3, '');
INSERT INTO `exercise` VALUES (70, '显示已修数据库的同学信息，包括学号、姓名、班级名称', 3, '');
INSERT INTO `exercise` VALUES (71, '显示期中成绩不及格1门以上的同学学号、姓名、门数（Num）', 3, '');
INSERT INTO `exercise` VALUES (72, '统计每个班级期末成绩的最高分（Max），显示班级名称、期末最高成绩', 2, '');
INSERT INTO `exercise` VALUES (73, '显示一周8节课及以上的学生的名单，显示学号、姓名、班级名称', 3, '');
INSERT INTO `exercise` VALUES (74, '显示计算机科学与技术1班一周上课的时间（周几，哪几节课）、地点（哪个教室），课程名称', 3, '');
INSERT INTO `exercise` VALUES (75, '统计教授每周上课的课时数（Hours），显示姓名、课时数', 3, '');
INSERT INTO `exercise` VALUES (76, '显示没有班导师的班级名称、院系名称', 2, '');
INSERT INTO `exercise` VALUES (77, '显示指导过两个班级以上的班导的姓名、所指导的班级名称', 3, '');
INSERT INTO `exercise` VALUES (78, '为洪玉飞老师(教师编号：03012)安排软件工程1班(班级编号：04)的数据库课程(课程编号：1)，上课教师为NB201', 1, '');
INSERT INTO `exercise` VALUES (79, '计算机科学与技术3班所有学生都选修了2009-2010-1的操作系统(课程编号为4)，请记录相关信息', 1, '');
INSERT INTO `exercise` VALUES (80, '理学院(SD)新开一门课程“数学建模”，课程编号20, 学分4，学时72，选修课程，最多选课人数为50', 1, '');
INSERT INTO `exercise` VALUES (81, '将李飞同学的联系方式改为660101', 1, '');
INSERT INTO `exercise` VALUES (82, '计算所有学生的总评成绩，公式为：总评=平时*20%+期中*40%+期末*40%', 1, '');
INSERT INTO `exercise` VALUES (83, '将电子信息1班(班级编号：08)的班主任改为李丽青老师(无重名)', 1, '');
INSERT INTO `exercise` VALUES (84, '将课程\"数据库\"(课程编号：1)的上课教室改为NB111，授课教师改为李飞(教师编号：02001)', 1, '');
INSERT INTO `exercise` VALUES (85, '将学号为012005001的学生班级改为计算机科学与技术2班（GId=02）,联系电话置为空值（NULL）', 1, '');
INSERT INTO `exercise` VALUES (86, '删除所有期末成绩小于60分的选课记录', 1, '');
INSERT INTO `exercise` VALUES (87, '删除学号为012005001的所有选课记录', 1, '');
INSERT INTO `exercise` VALUES (88, '删除所有选修了\"数据库\"课程的选课记录', 2, '');
INSERT INTO `exercise` VALUES (89, '删除选修人数小于5的选课记录', 2, '');
INSERT INTO `exercise` VALUES (90, '删除未担任班导师并且未安排课程的教师记录', 2, '');
INSERT INTO `exercise` VALUES (91, '创建一个新的用户，用户名为[admin]，允许该用户拥有通过网络访问教务数据库的全部权限，但不能访问其他数据库', 0, '');
INSERT INTO `exercise` VALUES (92, '授予新建数据库用户[admin]对表student和sc的查询权限', 0, '');
INSERT INTO `exercise` VALUES (93, '创建一个角色，授予对表course的查询和更新权限，并将该角色授权给新建数据库用户[admin]', 0, '');
INSERT INTO `exercise` VALUES (94, '为student表增加约束条件，性别字段可以的取值为‘男’，‘女’', 0, '');
INSERT INTO `exercise` VALUES (95, '为student表增加约束条件：联系方式至少长度为6', 0, '');
INSERT INTO `exercise` VALUES (96, '为dept表增加约束条件：联系电话必须为8位数字', 0, '');
INSERT INTO `exercise` VALUES (99, '编写触发器，使得sc表的新增和更新记录满足下述条件： 公式为：总评=平时*20%+期中*40%+期末*40%', 2, '');
INSERT INTO `exercise` VALUES (100, '编写存储过程，将sc表中总评字段百分制转换为五分制', NULL, '');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `GId` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '班级编号，主键',
  `DId` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '系编号，外键',
  `TId` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '教师工号，外键',
  `GName` char(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '班级名称',
  `GYear` int NULL DEFAULT NULL COMMENT '入学年份',
  PRIMARY KEY (`GId`) USING BTREE,
  INDEX `FK_Grade_Teacher`(`TId`) USING BTREE,
  INDEX `FK_Gradet_Dep`(`DId`) USING BTREE,
  CONSTRAINT `FK_FK_Grade_Teacher` FOREIGN KEY (`TId`) REFERENCES `teacher` (`TId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_FK_Gradet_Dep` FOREIGN KEY (`DId`) REFERENCES `dept` (`DId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '班级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('01', 'CS', '02008', '计算机科学与技术1班', 2006);
INSERT INTO `grade` VALUES ('02', 'CS', '02008', '计算机科学与技术2班', 2006);
INSERT INTO `grade` VALUES ('03', 'CS', '02008', '计算机科学与技术3班', 2006);
INSERT INTO `grade` VALUES ('04', 'CS', '02009', '软件工程1班', 2007);
INSERT INTO `grade` VALUES ('05', 'CS', NULL, '软件工程2班', 2007);
INSERT INTO `grade` VALUES ('06', 'IT', '03014', '自动化1班', 2008);
INSERT INTO `grade` VALUES ('07', 'IT', '03014', '自动化2班', 2008);
INSERT INTO `grade` VALUES ('08', 'IT', '03012', '电子信息1班', 2008);
INSERT INTO `grade` VALUES ('09', 'IT', NULL, '电子信息2班', 2008);
INSERT INTO `grade` VALUES ('10', 'IT', NULL, '电子信息3班', 2008);
INSERT INTO `grade` VALUES ('11', 'EM', '03010', '财务管理', 2006);
INSERT INTO `grade` VALUES ('12', 'EM', '03011', '旅游管理', 2006);
INSERT INTO `grade` VALUES ('13', 'EM', NULL, '营销管理', 2006);
INSERT INTO `grade` VALUES ('14', 'EM', NULL, '信息管理', 2006);
INSERT INTO `grade` VALUES ('15', 'FD', '03012', '日语', 2005);
INSERT INTO `grade` VALUES ('16', 'FD', '03013', '德语1班', 2005);
INSERT INTO `grade` VALUES ('17', 'FD', '03013', '德语2班', 2005);
INSERT INTO `grade` VALUES ('18', 'SD', NULL, '应用数学1班', 2008);
INSERT INTO `grade` VALUES ('20', 'SD', NULL, '选修混合', NULL);

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information`  (
  `IId` int NOT NULL COMMENT '序号，主键',
  `CId` char(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程序号，外键',
  `TId` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '教师编号，外键',
  `GId` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '班级编号，外键',
  `IRoom` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上课教室',
  `IWeek` int NULL DEFAULT NULL COMMENT '周几上课',
  `ITimeseg` char(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '第几节上课',
  `ITerm` char(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '开课学年/学期',
  PRIMARY KEY (`IId`) USING BTREE,
  INDEX `FK_Information_Course`(`CId`) USING BTREE,
  INDEX `FK_Information_Grade`(`GId`) USING BTREE,
  INDEX `FK_Information_Teacher`(`TId`) USING BTREE,
  CONSTRAINT `FK_Information_Course` FOREIGN KEY (`CId`) REFERENCES `course` (`CId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Information_Grade` FOREIGN KEY (`GId`) REFERENCES `grade` (`GId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Information_Teacher` FOREIGN KEY (`TId`) REFERENCES `teacher` (`TId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '课程信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES (1, '1', '02001', '01', 'NB111', 4, '123', '2008-2009-1');
INSERT INTO `information` VALUES (2, '1', '02001', '01', 'NB111', 2, '345', '2008-2009-1');
INSERT INTO `information` VALUES (3, '2', '02003', '03', 'NB222', 1, '34', '2008-2009-1');
INSERT INTO `information` VALUES (4, '3', '02004', '01', 'NB223', 5, '678', '2008-2009-1');
INSERT INTO `information` VALUES (5, '5', '02005', '05', 'NB224', 3, '34', '2008-2009-1');
INSERT INTO `information` VALUES (6, '6', '02006', '05', 'NB225', 1, '67', '2008-2009-1');
INSERT INTO `information` VALUES (7, '7', '02007', '03', 'NB226', 4, '89', '2008-2009-1');
INSERT INTO `information` VALUES (8, '9', '02008', '08', 'NB227', 4, '678', '2008-2009-1');
INSERT INTO `information` VALUES (9, '11', '02009', '09', 'NB228', 2, 'AB', '2008-2009-1');
INSERT INTO `information` VALUES (10, '2', '03010', '02', 'NB229', 1, '123', '2008-2009-1');
INSERT INTO `information` VALUES (11, '4', '02001', '02', 'NB230', 5, '345', '2008-2009-1');
INSERT INTO `information` VALUES (12, '5', '02002', '03', 'NB231', 3, '123', '2008-2009-1');
INSERT INTO `information` VALUES (13, '6', '02003', '09', 'NB222', 1, '89', '2008-2009-1');
INSERT INTO `information` VALUES (14, '7', '02004', '13', 'NB223', 4, '67', '2008-2009-1');
INSERT INTO `information` VALUES (15, '9', '02005', '15', 'NB224', 4, '345', '2008-2009-1');
INSERT INTO `information` VALUES (16, '3', '02006', '13', 'NB225', 2, '89', '2008-2009-1');
INSERT INTO `information` VALUES (17, '4', '02007', '15', 'NB226', 2, '12', '2008-2009-1');
INSERT INTO `information` VALUES (18, '10', '02008', '03', 'NB227', 5, '123', '2008-2009-1');
INSERT INTO `information` VALUES (19, '10', '02009', '20', 'NB228', 3, 'AB', '2008-2009-1');
INSERT INTO `information` VALUES (20, '12', '03010', '20', 'NB229', 1, 'AB', '2008-2009-1');
INSERT INTO `information` VALUES (21, '4', '02001', '12', 'NB230', 2, '34', '2008-2009-1');
INSERT INTO `information` VALUES (22, '3', '02002', '09', 'NB231', 4, '345', '2008-2009-1');
INSERT INTO `information` VALUES (24, '1', '02001', '09', 'NB111', 5, '12', '2008-2009-1');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `SCId` int NOT NULL COMMENT '选课序号，主键',
  `CId` char(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程编号，外键',
  `SId` char(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '学号，外键',
  `SCTerm` char(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '开课学年/学期',
  `SCScore1` float NULL DEFAULT NULL COMMENT '平时成绩',
  `SCScore2` float NULL DEFAULT NULL COMMENT '期中成绩',
  `SCScore3` float NULL DEFAULT NULL COMMENT '期末成绩',
  `SCScore` float NULL DEFAULT NULL COMMENT '总评成绩',
  PRIMARY KEY (`SCId`) USING BTREE,
  INDEX `FK_SC_Course`(`CId`) USING BTREE,
  INDEX `FK_SC_Student`(`SId`) USING BTREE,
  CONSTRAINT `FK_SC_Course` FOREIGN KEY (`CId`) REFERENCES `course` (`CId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SC_Student` FOREIGN KEY (`SId`) REFERENCES `student` (`SId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '选课信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES (2, '1', '012005002', '2008-2009-1', 99, 66, 70, 78.33);
INSERT INTO `sc` VALUES (3, '1', '012005003', '2008-2009-1', 99, 60, 88, 82.33);
INSERT INTO `sc` VALUES (4, '1', '012005004', '2008-2009-1', 99, 81, 67, 82.33);
INSERT INTO `sc` VALUES (5, '1', '032005005', '2008-2009-1', 99, 67, 87, 84.33);
INSERT INTO `sc` VALUES (6, '1', '012005002', '2008-2009-1', 99, 77, 98, 91.33);
INSERT INTO `sc` VALUES (7, '1', '032005007', '2008-2009-2', 99, 56, 78, 77.67);
INSERT INTO `sc` VALUES (20, '5', '082005009', '2008-2009-1', 99, 78, 83, 86.67);
INSERT INTO `sc` VALUES (21, '5', '092005010', '2008-2009-2', 99, 77, 63, 79.6667);
INSERT INTO `sc` VALUES (22, '5', '112005011', '2008-2009-2', 99, 90, 74, 87.6667);
INSERT INTO `sc` VALUES (23, '5', '112005012', '2008-2009-2', 99, 45, 83, 75.6667);
INSERT INTO `sc` VALUES (24, '5', '112005013', '2008-2009-2', 99, 89, 73, 87);
INSERT INTO `sc` VALUES (25, '10', '012006002', '2008-2009-2', 99, 67, 73, 79.67);
INSERT INTO `sc` VALUES (26, '10', '012006002', '2008-2009-2', 99, 36, 82, 72.3333);
INSERT INTO `sc` VALUES (27, '10', '012006003', '2008-2009-2', 99, 87, 83, 89.6667);
INSERT INTO `sc` VALUES (28, '10', '012006004', '2008-2009-2', 99, 54, 73, 75.3333);
INSERT INTO `sc` VALUES (29, '10', '032006005', '2008-2009-2', 99, 45, 73, 72.3333);
INSERT INTO `sc` VALUES (30, '10', '032006006', '2008-2009-2', 99, 78, 83, 86.6667);
INSERT INTO `sc` VALUES (31, '10', '032006007', '2008-2009-2', 99, 72, 84, 85);
INSERT INTO `sc` VALUES (32, '10', '082006008', '2007-2008-2', 99, 60, 78, 79);
INSERT INTO `sc` VALUES (33, '12', '082006009', '2007-2008-2', 99, 60, 73, 77.3333);
INSERT INTO `sc` VALUES (34, '12', '092006010', '2007-2008-2', 99, 90, 83, 90.6667);
INSERT INTO `sc` VALUES (35, '12', '112006011', '2007-2008-2', 99, 89, 62, 83.3333);
INSERT INTO `sc` VALUES (36, '12', '112006012', '2007-2008-2', 99, 89, 65, 84.3333);
INSERT INTO `sc` VALUES (37, '12', '112006013', '2007-2008-2', 99, 78, 65, 80.6667);
INSERT INTO `sc` VALUES (38, '11', '012007001', '2007-2008-2', 99, 65, 67, 77);
INSERT INTO `sc` VALUES (39, '11', '012007002', '2007-2008-2', 99, 76, 78, 84.3333);
INSERT INTO `sc` VALUES (40, '11', '012007003', '2007-2008-2', 99, 56, 79, 78);
INSERT INTO `sc` VALUES (41, '11', '012007004', '2007-2008-2', 99, 50, 76, 75);
INSERT INTO `sc` VALUES (42, '11', '032007005', '2007-2008-2', 99, 78, 71, 82.6667);
INSERT INTO `sc` VALUES (43, '11', '032007006', '2007-2008-2', 99, 98, 81, 92.6667);
INSERT INTO `sc` VALUES (44, '11', '032007007', '2007-2008-2', 99, 79, 82, 86.6667);
INSERT INTO `sc` VALUES (45, '9', '082007008', '2007-2008-2', 99, 93, 62, 84.6667);
INSERT INTO `sc` VALUES (46, '9', '082007009', '2007-2008-2', 99, 72, 63, 78);
INSERT INTO `sc` VALUES (47, '9', '092007010', '2008-2009-1', 99, 89, 69, 85.6667);
INSERT INTO `sc` VALUES (48, '9', '112007011', '2008-2009-1', 99, 86, 68, 84.3333);
INSERT INTO `sc` VALUES (49, '9', '112007012', '2008-2009-1', 99, 80, 76, 85);
INSERT INTO `sc` VALUES (50, '9', '112007013', '2008-2009-1', 99, 88, 83, 90);
INSERT INTO `sc` VALUES (52, '9', '012005002', '2008-2009-1', 99, 54, 76, 76.3333);
INSERT INTO `sc` VALUES (53, '9', '012005003', '2008-2009-1', 99, 78, 76, 84.3333);
INSERT INTO `sc` VALUES (54, '9', '012005004', '2008-2009-1', 99, 77, 56, 77.3333);
INSERT INTO `sc` VALUES (55, '2', '032005005', '2008-2009-1', 99, 90, 65, 84.6667);
INSERT INTO `sc` VALUES (56, '2', '032005006', '2008-2009-1', 99, 45, 65, 69.6667);
INSERT INTO `sc` VALUES (57, '2', '032005007', '2008-2009-1', 99, 89, 76, 88);
INSERT INTO `sc` VALUES (58, '2', '082005008', '2008-2009-1', 99, 67, 45, 70.3333);
INSERT INTO `sc` VALUES (59, '2', '082005009', '2008-2009-1', 99, 36, 84, 73);
INSERT INTO `sc` VALUES (60, '2', '092005010', '2008-2009-1', 99, 87, 90, 92);
INSERT INTO `sc` VALUES (61, '2', '112005011', '2008-2009-1', 99, 54, 93, 82);
INSERT INTO `sc` VALUES (62, '2', '112005012', '2008-2009-1', 99, 45, 67, 70.3333);
INSERT INTO `sc` VALUES (63, '2', '112005013', '2008-2009-1', 99, 78, 64, 80.3333);
INSERT INTO `sc` VALUES (64, '2', '012006001', '2008-2009-1', 99, 72, 63, 78);
INSERT INTO `sc` VALUES (65, '6', '012006002', '2008-2009-1', 99, 60, 48, 69);
INSERT INTO `sc` VALUES (66, '6', '012006003', '2008-2009-1', 99, 60, 76, 78.3333);
INSERT INTO `sc` VALUES (67, '6', '012006004', '2008-2009-1', 99, 90, 65, 84.6667);
INSERT INTO `sc` VALUES (68, '6', '032006005', '2008-2009-1', 99, 89, 76, 88);
INSERT INTO `sc` VALUES (69, '6', '032006006', '2008-2009-1', 99, 89, 46, 78);
INSERT INTO `sc` VALUES (70, '6', '032006007', '2008-2009-1', 99, 78, 85, 87.3333);
INSERT INTO `sc` VALUES (71, '6', '082006008', '2008-2009-1', 99, 65, 65, 76.3333);
INSERT INTO `sc` VALUES (72, '6', '082006009', '2008-2009-1', 99, 76, 54, 76.3333);
INSERT INTO `sc` VALUES (73, '6', '092006010', '2007-2008-1', 99, 56, 65, 73.3333);
INSERT INTO `sc` VALUES (74, '6', '112006011', '2007-2008-1', 99, 50, 65, 71.3333);
INSERT INTO `sc` VALUES (75, '6', '112006012', '2007-2008-1', 99, 78, 74, 83.6667);
INSERT INTO `sc` VALUES (76, '6', '112006013', '2007-2008-1', 99, 98, 74, 90.3333);
INSERT INTO `sc` VALUES (77, '7', '012007001', '2007-2008-1', 99, 79, 83, 87);
INSERT INTO `sc` VALUES (78, '7', '012007002', '2007-2008-1', 99, 93, 94, 95.3333);
INSERT INTO `sc` VALUES (79, '7', '012007003', '2007-2008-1', 99, 72, 73, 81.3333);
INSERT INTO `sc` VALUES (80, '7', '012007004', '2007-2008-1', 99, 89, 83, 90.3333);
INSERT INTO `sc` VALUES (81, '7', '032007005', '2007-2008-1', 99, 86, 63, 82.6667);
INSERT INTO `sc` VALUES (82, '7', '032007006', '2007-2008-1', 99, 80, 67, 82);
INSERT INTO `sc` VALUES (83, '7', '032007007', '2007-2008-1', 99, 88, 84, 90.3333);
INSERT INTO `sc` VALUES (84, '7', '082007008', '2007-2008-1', 99, 67, 96, 87.3333);
INSERT INTO `sc` VALUES (85, '7', '082007009', '2007-2008-1', 99, 65, 90, 84.6667);
INSERT INTO `sc` VALUES (86, '7', '092007010', '2007-2008-1', 99, 78, 92, 89.6667);
INSERT INTO `sc` VALUES (87, '7', '112007011', '2007-2008-1', 99, 77, 86, 87.3333);
INSERT INTO `sc` VALUES (88, '7', '112007012', '2007-2008-1', 99, 90, 80, 89.6667);
INSERT INTO `sc` VALUES (89, '7', '112007013', '2007-2008-1', 99, 45, 80, 74.6667);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `SId` char(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '学号，主键',
  `GId` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '班级ID，外键',
  `SName` char(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '姓名',
  `SSexy` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `SBdate` date NOT NULL COMMENT '出生日期',
  `STele` char(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`SId`) USING BTREE,
  INDEX `FK_Student_Grade`(`GId`) USING BTREE,
  CONSTRAINT `FK_Student_Grade` FOREIGN KEY (`GId`) REFERENCES `grade` (`GId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '学生信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('012005001', '03', '李山', '男', '1998-10-11', '660780');
INSERT INTO `student` VALUES ('012005002', '01', '张飞', '男', '1997-10-11', '660781');
INSERT INTO `student` VALUES ('012005003', '01', '李玉和', '女', '1999-10-11', '660782');
INSERT INTO `student` VALUES ('012005004', '01', '王一飞', '女', '2000-10-11', '660783');
INSERT INTO `student` VALUES ('012006001', '01', '韦宝', '男', '1998-10-11', '660780');
INSERT INTO `student` VALUES ('012006002', '01', '李飞', '男', '1997-10-11', '660101');
INSERT INTO `student` VALUES ('012006003', '01', '冯玉', '女', '1999-10-11', '660782');
INSERT INTO `student` VALUES ('012006004', '01', '马观', '女', '2000-10-11', '660783');
INSERT INTO `student` VALUES ('012007001', '01', '李知', '男', '1998-10-11', '660780');
INSERT INTO `student` VALUES ('012007002', '01', '吴飞', '男', '1997-10-11', '660781');
INSERT INTO `student` VALUES ('012007003', '01', '李凡', '女', '1999-10-11', '660782');
INSERT INTO `student` VALUES ('012007004', '01', '王二飞', '女', '2000-10-11', '660783');
INSERT INTO `student` VALUES ('032005005', '03', '徐红', '女', '1998-01-11', '660784');
INSERT INTO `student` VALUES ('032005006', '03', '刘和', '男', '1998-12-11', '660785');
INSERT INTO `student` VALUES ('032005007', '03', '刘山', '男', '1999-10-01', '660786');
INSERT INTO `student` VALUES ('032006005', '03', '徐一红', '女', '1998-01-11', '660784');
INSERT INTO `student` VALUES ('032006006', '03', '刘一和', '男', '1998-12-11', '660785');
INSERT INTO `student` VALUES ('032006007', '03', '马西', '男', '1999-10-01', '660786');
INSERT INTO `student` VALUES ('032007005', '03', '王红', '女', '1998-01-11', '660784');
INSERT INTO `student` VALUES ('032007006', '03', '王一红', '男', '1998-12-11', '660785');
INSERT INTO `student` VALUES ('032007007', '03', '丁西', '男', '1999-10-01', '660786');
INSERT INTO `student` VALUES ('082005008', '08', '刘去山', '女', '2000-01-11', '660787');
INSERT INTO `student` VALUES ('082005009', '08', '白云飞', '女', '2002-10-11', '660788');
INSERT INTO `student` VALUES ('082006008', '08', '刘问计', '女', '2000-01-11', '660787');
INSERT INTO `student` VALUES ('082006009', '08', '白问礼', '女', '2002-10-11', '660788');
INSERT INTO `student` VALUES ('082007008', '08', '刘红丽', '女', '2000-01-11', '660787');
INSERT INTO `student` VALUES ('082007009', '08', '沈学云', '女', '2002-10-11', '660788');
INSERT INTO `student` VALUES ('092005010', '08', '白云', '女', '1998-11-11', '660789');
INSERT INTO `student` VALUES ('092006010', '09', '黑土', '女', '1998-12-11', '660788');
INSERT INTO `student` VALUES ('092007010', '09', '李风', '女', '1998-11-11', '660789');
INSERT INTO `student` VALUES ('112005011', '11', '李红', '女', '1997-12-11', '660790');
INSERT INTO `student` VALUES ('112005012', '11', '周磊', '男', '1996-06-11', '660791');
INSERT INTO `student` VALUES ('112005013', '11', '冯圭', '女', '1997-08-11', '660792');
INSERT INTO `student` VALUES ('112006011', '11', '李玉红', '女', '1997-12-11', '660790');
INSERT INTO `student` VALUES ('112006012', '11', '冯磊', '男', '2006-06-11', '660791');
INSERT INTO `student` VALUES ('112006013', '11', '冯由', '女', '2007-08-11', '660792');
INSERT INTO `student` VALUES ('112007011', '11', '刘好', '女', '1997-12-11', '660790');
INSERT INTO `student` VALUES ('112007012', '11', '周成', '男', '1996-06-11', '660791');
INSERT INTO `student` VALUES ('112007013', '11', '文成', '女', '1997-08-11', '660792');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `TId` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '教师工号，主键',
  `DId` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '系编号，外键',
  `TName` char(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '姓名',
  `TSexy` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '性别',
  `TBdate` date NOT NULL COMMENT '出生日期',
  `TField` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '研究领域',
  `TProf` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '职称',
  `TTele` char(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `TQq` char(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'QQ号码',
  `TEmail` char(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `TMsn` char(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'MSN',
  PRIMARY KEY (`TId`) USING BTREE,
  INDEX `FK_Teacher_Dept`(`DId`) USING BTREE,
  CONSTRAINT `FK_Teacher_Dept` FOREIGN KEY (`DId`) REFERENCES `dept` (`DId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '教师信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('02001', 'CS', '李飞', '男', '1986-05-05', '数据库', '讲师', '660001', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('02002', 'CS', '郭山', '男', '1980-06-09', '数据库', '副教授', '660002', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('02003', 'CS', '马骊', '女', '1983-03-08', '网络技术与数据库', '教授', '660003', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('02004', 'CS', '徐守', '女', '1980-06-09', '面向对象编程', '助教', '660004', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('02005', 'CS', '金贵', '女', '1980-06-09', '财务管理', '助教', '660005', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('02006', 'IT', '成山云', '男', '1984-11-02', '金融学', '教授', '660006', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('02007', 'IT', '张田下', '男', '1977-01-07', '新能源技术', '研究员', '660007', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('02008', 'IT', '王一钱', '女', '1965-03-03', '信息管理与数据库', '讲师', '660008', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('02009', 'IT', '李远', '女', '1977-01-07', '电工学', '实验师', '660009', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('03010', 'IT', '吴天贵', '女', '1984-04-26', '中医学', '主治医师', '660010', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('03011', 'EM', '刘了了', '女', '1972-06-12', '近代史', '研究员', '660220', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('03012', 'EM', '洪玉飞', '男', '1967-09-29', '哲学', '教授', '660222', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('03013', 'EM', '划计成', '女', '1962-09-01', '应用数学', '教授', '660223', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('03014', 'EM', '李丽青', '男', '1968-05-09', '应用物理', '讲师', '660233', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('03015', 'FD', '李员', '男', '1971-09-15', '统计学', '研究员', '660234', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('03016', 'FD', '国威', '女', '1965-04-30', '政治学', '研究员', '660123', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('03017', 'FD', '国华', '女', '1989-05-29', '证券投资', '研究员', '660987', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('05022', 'SD', '后羿', '女', '1983-06-16', '护理与营养', '主任护理师', '660909', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('05023', 'SD', '王飞红', '男', '1975-11-20', '多媒体技术', '讲师', '660938', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('05024', 'SD', '李丽青', '男', '1969-03-30', '理论力学', '副教授', '660323', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('05025', 'SD', '王红', '女', '1970-06-15', '建筑学', '副教授', '660099', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('05026', 'SD', '李飞', '女', '1963-12-22', '流体力学', '讲师', '660987', NULL, NULL, NULL);

-- ----------------------------
-- Procedure structure for pro_five_grade
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_five_grade`;
delimiter ;;
CREATE PROCEDURE `pro_five_grade`()
BEGIN
-- 需要定义接收游标数据的变量
  DECLARE A INT DEFAULT 0;
  DECLARE B INT DEFAULT 0;
  DECLARE C INT DEFAULT 0;
  DECLARE D INT DEFAULT 0;
  DECLARE E INT DEFAULT 0;
  DECLARE score FLOAT;
  -- 遍历数据结束标志
  DECLARE done INT DEFAULT FALSE;
  -- 游标
  DECLARE cur CURSOR FOR SELECT SCScore FROM sc;
  -- 将结束标志绑定到游标
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  -- 打开游标
  OPEN cur;

  -- 开始循环
  read_loop: LOOP
    -- 提取游标里的数据，这里只有一个，多个的话也一样；
    FETCH cur INTO score;
    -- 声明结束的时候
    IF done THEN
      LEAVE read_loop;
    END IF;

    IF score>90 THEN
      SET A=A+1 ;
    ELSEIF score>80 THEN
      SET B=B+1;
    ELSEIF score>70 THEN
      SET C=C+1;
    ELSEIF score>60 THEN
      SET D=D+1;
    ELSE
      SET E=E+1;
    END IF;

  END LOOP;
  -- 关闭游标
  CLOSE cur;

  -- 输出结果
  SELECT A;
  SELECT B;
  SELECT C;
  SELECT D;
  SELECT E;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for pro_sum
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_sum`;
delimiter ;;
CREATE PROCEDURE `pro_sum`(m INT, n INT, OUT result INT)
BEGIN
	SET result = m + n;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table sc
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_update_sc`;
delimiter ;;
CREATE TRIGGER `tri_update_sc` BEFORE UPDATE ON `sc` FOR EACH ROW BEGIN
	set new.SCScore=ROUND((new.SCScore1+new.SCScore2+new.SCScore3)/3,2);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_ins_num`;
delimiter ;;
CREATE TRIGGER `tri_ins_num` AFTER DELETE ON `student` FOR EACH ROW BEGIN
insert into friend values(old.SId, old.GId, old.SName, old.SSexy, old.SBdate, old.STele);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
