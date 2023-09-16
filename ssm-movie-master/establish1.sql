use webdb;

drop table if exists Admin_Info;

drop table if exists Movie_Info;

drop table if exists User_Info;

drop table if exists Bill_Info;

drop table if exists Ticket_Info;

drop table if exists Room_Info;

/*==============================================================*/
/* Table: Admin_Info                                            */
/*==============================================================*/
create table Admin_Info
(
   Phone                varchar(20) not null,
   GuarantorID          int,
   AdminID              int not null,
   UserID               varchar(15) not null,
   Email                varchar(20) not null,
   Password             varchar(16) not null,
   ID                   varchar(20) not null,
   Address              varchar(50) not null,
   primary key (Phone, AdminID)
);

/*==============================================================*/
/* Table: Movie_Info                                            */
/*==============================================================*/
drop table if exists movie_info; 
create table Movie_Info
(
   MovieID              int not null auto_increment,
   MName                varchar(20) not null,
   Type                 varchar(10) not null,
   Duration             int not null,
   Director             varchar(10) not null,
   Performer            varchar(50) not null,
   Introduction               text,
	 url                       text,
   primary key (MovieID)
);

/*==============================================================*/
/* Table: User_Info                                             */
/*==============================================================*/
create table User_Info
(
   UserName             varchar(15) not null,
   Phone                varchar(20) not null,
   Password             varchar(16) not null,
   Email                varchar(20) not null,
   primary key (Phone)
);


desc user_info;
insert into user_info values('小明','12345678910','123456','abc@qq.com');
select * from user_info;

desc admin_info;
alter table admin_info drop primary key;
alter table admin_info modify AdminID int(11) primary key auto_increment;
desc admin_info;
insert into admin_info values('123',123,null,'123','123','123','123','123');

select * from movie_info;
insert into movie_info values(null,'一号电影','其他',120,'导演一','演员一','测试电影','');
insert into movie_info values(null,'film2','其他',123,'导演一','演员二','测试搜索','');


/*==============================================================*/
/* Table: Bill_Info                                             */
/*==============================================================*/
create table Bill_Info
(
   Billid               int not null auto_increment,     #订单id 
   money                varchar(20) not null,            #总价
   Phone                varchar(20) not null,            #电话（对应于购票用户）
   roomid               int not null,                    #排片编号
	 paytime							varchar(30) not null,            #付款时间
   primary key (Billid)
);

/*==============================================================*/
/* Table: Ticket_Info                                             */
/*==============================================================*/
create table Ticket_Info
(
   Ticketid             int not null auto_increment,        #电影票id
   roomid               int not null,                       #排片编号
   site                 int not null,                       #座号
	 Billid               int not null,                       #订单id
   primary key (Ticketid)
);
/*==============================================================*/
/* Table: Room_Info                                             */
/*==============================================================*/
create table Room_Info #排片
(
   Roomid             int not null primary key auto_increment, #排片编号
	 Rid                int not null,                            #放映室
	 starttime				  varchar(30) not null,                    #开始时间
	 MovieID              int not null,                          #电影编号
	 price int                                                   #价格
);
alter table Room_Info add constraint FK_Reference_3 foreign key (MovieID)
      references Movie_Info (MovieID) on delete restrict on update restrict;
alter table Ticket_Info add constraint FK_Reference_4 foreign key (roomid)
      references Room_Info (roomid) on delete restrict on update restrict;
alter table Bill_Info add constraint FK_Reference_5 foreign key (Phone)
      references User_Info (Phone) on delete restrict on update restrict;
alter table Bill_Info add constraint FK_Reference_6 foreign key (roomid)
      references Room_Info (roomid) on delete restrict on update restrict;
alter table Ticket_Info add constraint FK_Reference_7 foreign key (Billid)
      references Bill_Info (Billid) on delete restrict on update restrict;

alter table ticket_info drop foreign key FK_Reference_7;
insert into room_info values(null,1,'2022-12-15-23:00',1,10);
insert into bill_info values(null,120,'12345678910',1,'2022-12-14-23:00');
insert into bill_info values(null,120,'12345678910',1,'2022-12-13-23:00');
insert into ticket_info values(null,1,21,2);
insert into ticket_info values(null,1,22,2);

update movie_info set url='http://seopic.699pic.com/photo/50062/2180.jpg_wh1200.jpg';

select * from bill_info;
delete from bill_info where billid>2;
select * from ticket_info;
insert into ticket_info values(null,1,12,1);

SELECT * from movie_info;
select * from room_info;
insert into movie_info values(null,'阿凡达','科幻',180,'卡梅隆','萨姆','科幻巨制','https://news.mydrivers.com/Img/20091223/04561047.jpg'),
(null,'放牛班的春天','其他',97,'乔治','让·巴蒂斯特','发生在池塘之底的故事','https://pic2.zhimg.com/v2-a4e9de59e724744648119763d200ed94_qhd.jpg?source=57bbeac9'
),(null,'泰坦尼克号','爱情',194,'卡梅隆','莱昂纳多','巨轮泰坦尼克号沉没...','http://www.sfs-cn.com/node3/node625/node3046/images/00198731.jpg')