create database if not exists DBSP;
use DBSP;
create table if not exists s (
	sno char(10) primary key not null unique check (
		sno like '2009%' or
		sno like '2010%' or
		sno like '2011%' or
		sno like '2012%' or
		sno like '2013%' or
		sno like '2014%' or
		sno like '2015%' or
		sno like '2016%' or
		sno like '2017%' or
		sno like '2018%'
	), /* 设置约束2009-2018开头 */
	sname varchar(20) not null, /* 变长字符串 */
	ssex char(4) not null check(ssex in ('男','女')) ,
	sbirth date not null, /* 日期类型，Java处理的时候需要Format */
	sclass varchar(20) not null, /* 变长字符串 */
	sdept varchar(50) not null /* 变长字符串 */
);
create table if not exists c (
	cno char(10) primary key not null unique,
	cname varchar(50) not null, /* 变长字符串 */
	ccredit float not null,
	cteacher varchar(50) /* 新增任课教师 */
);
create table if not exists sc (
	sno char(10) not null,
	cno char(10) not null,
	grade float not null, /* 成绩改为用小数表示 */
	primary key(sno, cno),
	foreign key(sno) references s(sno),
	foreign key(cno) references c(cno)
);
create table if not exists admins (
	username varchar(12),
	password varchar(16)
);
/* 触发器 */
delimiter $

create trigger delete_grades after delete on s for each row
begin
delete from sc where sno=old.sno;
end $

delimiter $
create trigger update_cno after update on c for each row
begin
update sc set cno=new.cno where cno=old.cno;
end $

delimiter ;
/* 已达到3NF */
/* SQL在MySQL环境下调试通过，用VC6编写 */
