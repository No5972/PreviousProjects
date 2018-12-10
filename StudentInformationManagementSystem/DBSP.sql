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
	), /* ����Լ��2009-2018��ͷ */
	sname varchar(20) not null, /* �䳤�ַ��� */
	ssex char(4) not null check(ssex in ('��','Ů')) ,
	sbirth date not null, /* �������ͣ�Java�����ʱ����ҪFormat */
	sclass varchar(20) not null, /* �䳤�ַ��� */
	sdept varchar(50) not null /* �䳤�ַ��� */
);
create table if not exists c (
	cno char(10) primary key not null unique,
	cname varchar(50) not null, /* �䳤�ַ��� */
	ccredit float not null,
	cteacher varchar(50) /* �����ον�ʦ */
);
create table if not exists sc (
	sno char(10) not null,
	cno char(10) not null,
	grade float not null, /* �ɼ���Ϊ��С����ʾ */
	primary key(sno, cno),
	foreign key(sno) references s(sno),
	foreign key(cno) references c(cno)
);
create table if not exists admins (
	username varchar(12),
	password varchar(16)
);
/* ������ */
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
/* �Ѵﵽ3NF */
/* SQL��MySQL�����µ���ͨ������VC6��д */
