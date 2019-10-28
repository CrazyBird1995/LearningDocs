INSERT INTO class(id,cname) VALUES(1,"一年级一班");
INSERT INTO class VALUES(2,"一年级二班");
INSERT INTO class(cname) VALUES("二年级一班");
INSERT INTO class(id,cname) VALUES(4,"二年级二班"),(5,"三年级一班"),(6,"三年级二班");
CREATE TABLE class_copy LIKE class;
#插入多行数据，数据来源于另一张表
INSERT INTO class_copy(id,cname) SELECT * FROM class;
#更新
#更新单行
UPDATE class SET id=3 WHERE cname='二年级一班';
UPDATE class SET id=id+1;
UPDATE class SET id=id-1;
#删除
DELETE FROM class WHERE cname="三年级一班";
DELETE FROM class;
TRUNCATE TABLE class;
#练习:
#1、分别向class表和student表各添加至少5条数据
#2、修改所有学生性别为"女";
#3、删除id为1的学生，并尝试两种清空表的命令;
DROP TABLE class;

#约束
#非空约束
CREATE TABLE class(
	id INT,
	cname VARCHAR(16) NOT NULL
);
INSERT INTO class(id) VALUES(1);
DROP TABLE student;
#默认
CREATE TABLE student(
	id INT,
	sname VARCHAR(16) NOT NULL,
	sex CHAR(1) DEFAULT '女',
	age INT,
	tel CHAR(11),
	cid INT
);
INSERT INTO student(id,sname,age,tel,cid) VALUES(1,"张三",22,"16627876545",1);
INSERT INTO student(id,sname,sex,age,tel,cid) VALUES(1,"张三","男",22,"16627876545",1);

#唯一
CREATE TABLE student(
	id INT,
	sname VARCHAR(16) NOT NULL,
	sex CHAR(1) DEFAULT '女',
	age INT,
	tel CHAR(11),
	cid INT,
	CONSTRAINT uq_student UNIQUE KEY(tel)
);
INSERT INTO student(id,sname,sex,age,tel,cid) VALUES(1,"张三","男",22,"16627876545",1);
INSERT INTO student(id,sname,sex,age,tel,cid) VALUES(2,"李四","男",22,"16627876545",1);

#主键
CREATE TABLE student(
	id INT PRIMARY KEY,
	sname VARCHAR(16) NOT NULL,
	sex CHAR(1) DEFAULT '女',
	age INT,
	tel CHAR(11),
	cid INT,
	CONSTRAINT uq_student UNIQUE KEY(tel)
);
CREATE TABLE student(
	id INT,
	sname VARCHAR(16) NOT NULL,
	sex CHAR(1) DEFAULT '女',
	age INT,
	tel CHAR(11),
	cid INT,
	CONSTRAINT uq_student UNIQUE KEY(tel),
	PRIMARY KEY(id)
);
INSERT INTO student(id,sname,sex,age,tel,cid) VALUES(1,"张三","男",22,"16627876545",1);
INSERT INTO student(id,sname,sex,age,tel,cid) VALUES(1,"李四","男",22,"16627876546",1);

#自增
CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(16) NOT NULL,
	sex CHAR(1) DEFAULT '女',
	age INT,
	tel CHAR(11),
	cid INT,
	CONSTRAINT uq_student UNIQUE KEY(tel)
);
INSERT INTO student(sname,sex,age,tel,cid) VALUES("张三","男",22,"16627876545",1);
INSERT INTO student(sname,sex,age,tel,cid) VALUES("李四","男",22,"16627876546",1);

#外键
CREATE TABLE class(
	id INT PRIMARY KEY,
	cname VARCHAR(16) NOT NULL
);
CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(16) NOT NULL,
	sex CHAR(1) DEFAULT '女',
	age INT,
	tel CHAR(11),
	cid INT,
	CONSTRAINT uq_student UNIQUE KEY(tel),
	CONSTRAINT fk_student_cid FOREIGN KEY(cid) REFERENCES class(id)
);
INSERT INTO student(sname,sex,age,tel,cid) VALUES("张三","男",22,"16627876545",1);
INSERT INTO student(sname,sex,age,tel,cid) VALUES("李四","男",22,"16627876546",7);

#练习:
#1、删除已有的class、student表
DROP TABLE student;
DROP TABLE class;
#2、创建表：
#class表，存储班级编号id(主键、自增)、名称cname(非空、唯一)信息
#student表，存储学生编号id(主键、自增)、名称sname(非空)、性别sex(默认"女")、
#年龄age、电话tel(唯一、非空)、班级编号cid(外键)信息
CREATE TABLE class(
	id INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(16) NOT NULL UNIQUE
);

CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(16) NOT NULL,
	sex CHAR(1) DEFAULT "女",
	age INT,
	tel CHAR(11) NOT NULL,
	cid INT,
	CONSTRAINT uq_student_tel UNIQUE KEY(tel),
	CONSTRAINT fk_student_cid FOREIGN KEY(cid) REFERENCES class(id)
);

#修改表的方式添加约束
CREATE TABLE class(
	id INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(16) NOT NULL UNIQUE
);
DROP TABLE student;
CREATE TABLE student(
	id INT,
	sname VARCHAR(16),
	sex CHAR(1),
	age INT,
	tel CHAR(11),
	cid INT
);
#非空
ALTER TABLE student MODIFY sname VARCHAR(16) NOT NULL;
ALTER TABLE student MODIFY tel CHAR(11) NOT NULL;
#默认
ALTER TABLE student MODIFY sex CHAR(1) DEFAULT '女';
#唯一
ALTER TABLE student MODIFY tel CHAR(11) NOT NULL UNIQUE;
#主键
ALTER TABLE student ADD PRIMARY KEY(id);
#自增
ALTER TABLE student MODIFY id INT AUTO_INCREMENT;
#外键
ALTER TABLE student ADD CONSTRAINT fk_student_cid FOREIGN KEY(cid) REFERENCES class(id);

#删除约束
#非空
ALTER TABLE student MODIFY sname VARCHAR(16);
#默认
ALTER TABLE student MODIFY sex CHAR(1);
#唯一
ALTER TABLE student DROP INDEX tel;
#主键
ALTER TABLE student DROP PRIMARY KEY;
#自增
ALTER TABLE student MODIFY id INT;
#外键
ALTER TABLE student DROP FOREIGN KEY fk_student_cid;


SHOW VARIABLES LIKE 'storage_engine';

#简单查询
#查询所有女生的姓名和电话
SELECT sname,tel FROM student WHERE sex='女';

#取别名
SELECT sname AS "姓名",tel AS "电话" FROM student WHERE sex='女'; 
SELECT sname "姓名",tel "电话" FROM student WHERE sex='女'; 

SELECT sname,id+age AS "测试" FROM student;

#限制行数(分页)
SELECT * FROM student LIMIT 2;
SELECT * FROM student LIMIT 0,2;

SELECT * FROM student LIMIT 2,2;

SELECT * FROM student LIMIT 4,2;

#去重
#查询性别
SELECT DISTINCT id,sex FROM student;

#多条件
#查询所有女生并且年龄小于25的姓名和电话
SELECT sname,tel FROM student WHERE sex="女" AND age<25;

#范围查询
#查询年龄在25~30之间的学生姓名
SELECT sname FROM student WHERE age>=25 AND age<=30;
SELECT sname FROM student WHERE age BETWEEN 25 AND 30;

SELECT sname FROM student WHERE age NOT BETWEEN 25 AND 30;

#集合操作
SELECT * FROM student WHERE sname="张三" OR sname="王八";
SELECT * FROM student WHERE sname IN ("张三","王八");

SELECT * FROM student WHERE sname NOT IN ("张三","王八");

#模糊查询 LIKE(搜索)
#查询王某的信息
SELECT * FROM student WHERE sname LIKE "王_";

#查询姓王的学生信息
SELECT * FROM student WHERE sname LIKE "王%";

#查询NULL
SELECT * FROM student WHERE sname IS NULL;

#常量列
SELECT id,sname,"蜗牛学院" AS "学校名称" FROM student;

#排序
SELECT * FROM student ORDER BY age ASC;
SELECT * FROM student ORDER BY age DESC LIMIT 5;

SELECT * FROM student WHERE sex="女" ORDER BY age DESC;

SELECT * FROM student ORDER BY age DESC,cid DESC;
