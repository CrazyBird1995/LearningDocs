-- 练习1(DDL、DML):
	-- 1、创建数据库school，并设置编码为utf8
CREATE DATABASE school CHARACTER SET utf8;
	-- 2、创建四张表，要求如下：
		-- 教师表(teacher)
			-- 教师编号（tno）
				-- 主键
			-- 名称(tname)
				-- 非空，唯一
USE school;
CREATE TABLE teacher(
tno CHAR(4) PRIMARY KEY,
tname VARCHAR(16) NOT NULL UNIQUE
);

		-- 课程表(course)
			-- 课程编号(cno)
				-- 主键
			-- 课程名称(cname)
				-- 非空
			-- 教师编号(tno)
				-- 外键关联教师表中主键
CREATE TABLE course(
	cno CHAR(4) PRIMARY KEY,
	cname VARCHAR(16) NOT NULL,
	tno CHAR(4),
	CONSTRAINT fk_course_tno_teacher_tno FOREIGN KEY(tno) REFERENCES teacher(tno)
);

		-- 学生表(student)
			-- 学生编号(sno)
				-- 主键
			-- 学生名称(sname)
				-- 非空，唯一
			-- 学生年龄(sage)
			-- 学生性别(ssex)
				-- 默认'男'
CREATE TABLE student(
	sno CHAR(4) PRIMARY KEY,
	sname VARCHAR(16) NOT NULL UNIQUE,
	sage INT,
	ssex CHAR(1) DEFAULT "男"
);

		-- 成绩表(sc)
			-- 成绩编号(scno)
				-- 主键，自增
			-- 学生编号(sno)
				-- 外键关联学生表中主键
			-- 课程编号(cno)
				-- 外键关联课程表中主键
			-- 成绩(score)
CREATE TABLE sc(
	scno INT PRIMARY KEY AUTO_INCREMENT,
	sno CHAR(4),
	cno CHAR(4),
	score DOUBLE,
	CONSTRAINT fk_sc_sno FOREIGN KEY(sno) REFERENCES student(sno),
	CONSTRAINT fk_sc_cno FOREIGN KEY(cno) REFERENCES course(cno)
);

	-- 3、插入如下数据
		-- course：
INSERT INTO course VALUES('c001','J2SE','t002');
INSERT INTO course VALUES('c002','Java Web','t002');
INSERT INTO course VALUES('c003','SSH','t001');
INSERT INTO course VALUES('c004','Oracle','t001');
INSERT INTO course VALUES('c005','SQL SERVER 2005','t003');
INSERT INTO course VALUES('c006','C#','t003');
INSERT INTO course VALUES('c007','JavaScript','t002');
INSERT INTO course VALUES('c008','DIV+CSS','t001');
INSERT INTO course VALUES('c009','PHP','t003');
INSERT INTO course VALUES('c010','EJB3.0','t002');
		-- sc:
INSERT INTO sc(sno,cno,score) VALUES('s001','c001',78.9);
INSERT INTO sc(sno,cno,score) VALUES('s002','c001',80.9);
INSERT INTO sc(sno,cno,score) VALUES('s003','c001',81.9);
INSERT INTO sc(sno,cno,score) VALUES('s004','c001',60.9);
INSERT INTO sc(sno,cno,score) VALUES('s001','c002',82.9);
INSERT INTO sc(sno,cno,score) VALUES('s002','c002',72.9);
INSERT INTO sc(sno,cno,score) VALUES('s003','c004',41.9);
INSERT INTO sc(sno,cno,score) VALUES('s001','c004',59);
INSERT INTO sc(sno,cno,score) VALUES('s004','c004',46);
INSERT INTO sc(sno,cno,score) VALUES('s008','c003',56);
INSERT INTO sc(sno,cno,score) VALUES('s008','c002',43);
INSERT INTO sc(sno,cno,score) VALUES('s008','c001',32);
		-- student:
INSERT INTO student VALUES('s001','张三',23,'男');
INSERT INTO student VALUES('s002','李四',23,'男');
INSERT INTO student VALUES('s003','吴鹏',25,'男');
INSERT INTO student VALUES('s004','琴沁',20,'女');
INSERT INTO student VALUES('s005','王丽',20,'女');
INSERT INTO student VALUES('s006','李波',21,'男');
INSERT INTO student VALUES('s007','刘玉',21,'男');
INSERT INTO student VALUES('s008','萧蓉',21,'女');
INSERT INTO student VALUES('s009','陈萧晓',23,'女');
INSERT INTO student VALUES('s010','陈美',22,'女');
		-- teacher:
INSERT INTO teacher VALUES('t001', '刘阳');
INSERT INTO teacher VALUES('t002', '谌燕');
INSERT INTO teacher VALUES('t003', '胡明星');
INSERT INTO teacher VALUES('t004', '刘阳阳');
-- 练习2(DQL简单查询)：
	-- 1. 查询姓陈的学生姓名和学号。
SELECT sno,sname FROM student WHERE sname LIKE "陈%";
	-- 2. 查询年龄在[20,25]区间的且性别为女的学生姓名。
SELECT sname FROM student WHERE sage BETWEEN 20 AND 25 AND ssex="女";
	-- 3. 查找编号t002的老师教的全部科目的科目名和对应编号。
SELECT cno,cname FROM course WHERE tno="t002";
	-- 4. 查找科目c001的考试结果中前3名学生的学号和分数。
SELECT sno,score FROM sc WHERE cno="c001" ORDER BY score DESC LIMIT 3;
	-- 5. 查找科目c002的考试成绩中最后一名学生的学号和分数。
SELECT sno,score FROM sc WHERE cno="c002" ORDER BY score LIMIT 1;
	-- 6. 查找科目c001的考试成绩在70~80分数段的学生的学号和对应分数。
SELECT sno,score FROM sc WHERE cno="c001" AND score>=70 AND score<80;
	-- 7.查询所有科目c004的考试不及格的成绩信息。
SELECT * FROM sc WHERE cno="c004" AND score<60;
	-- 8. 查询学过c001、c002、c007、c010其中一门或多门课的同学的学号；
SELECT DISTINCT sno FROM sc WHERE cno IN ("c001","c002","c007","c010");



-- 1、查询平均成绩大于60分的同学的学号和平均成绩；
-- 2、查询各科成绩最高和最低的分：以如下形式显示：课程ID，最高分，最低分
-- 3、查询不同课程平均分从高到低显示
-- 4、查询每门课程的平均成绩，结果按平均成绩升序排列，平均成绩相同时，按课程号降序排列
-- 5、统计每门课程的学生选修人数。
-- 要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列
-- 6、检索至少选修两门课程的学生学号
-- 7、查询同名同姓学生名单，并统计同名人数
-- 8、查询两门以上不及格课程的同学的学号及其平均成绩

