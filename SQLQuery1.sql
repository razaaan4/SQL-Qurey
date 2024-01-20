create database PH
create table pharmacy
(
PH_ID int primary key,
PH_NAME nvarchar(40)not null,
PH_ADDRESS nvarchar(50)
)
create table company
(
COM_ID int primary key,
COM_NAME nvarchar(40)not null,
COM_ADDRESS nvarchar(70),
PH_ID int foreign key references pharmacy(PH_ID)
)
create table contractee
(
COM_ID int primary key,
STAR_DATE date,
END_DATE date,
PH_ID int foreign key references pharmacy(PH_ID)
)
create table drug
(
TRADE_NAME nvarchar(50) primary key,
PRICE int,
PH_ID int foreign key references pharmacy(PH_ID)
)
create table employee
(
E_ID int primary key,
E_NAME nvarchar(50),
E_PHONE int,
PH_ID int foreign key references pharmacy(PH_ID)
)
create table coustmer
(
C_ID int primary key,
C_NAME nvarchar(50),
C_PHONE int,
C_INSURANCE nvarchar(20),
E_ID int foreign key references employee(E_ID)
)
create table prescribe
(
PH_ID int primary key,
P_DATE date,
P_QUANTITY int,
C_ID int foreign key references coustmer(C_ID)
)

insert into pharmacy
values(1104590,'nahdi','buraydah')

insert into company
values(2200001,'GERMANY','leverkusen',1104590)
insert into company
values(2200002,'BAYER AG','berlin',1104590)
insert into company
values(2200003,'ASTRAZENECA','UK',1104590)
insert into company
values(2200004,'N.V.ORGANON','france',1104590)
insert into company
values(2200005,'ELI LILLY','USA',1104590)

insert into contractee
values(2200001,'20JUL2019','20JUL2023',1104590)
insert into contractee
values(2200002,'1APR2020','1APR2024',1104590)
insert into contractee
values(2200003,'1AUG2021','1AUG2025',1104590)
insert into contractee
values(2200004,'23DEC2022','23DEC2026',1104590)
insert into contractee
values(2200005,'5NOV2023','5NOV2027',1104590)

insert into drug
values('ORS 30GM SACHET',7,1104590)
insert into drug
values('OROFAR LOZENGE',10,1104590)
insert into drug
values('ORELOX 100MG TABLET',78,1104590)
insert into drug
values('OSPEN 500',21,1104590)
insert into drug
values('RIAPANTA',30,1104590)

insert into employee
values(3301,'OMAR',055387652,1104590)
insert into employee
values(3302,'KHALEED',050517762,1104590)
insert into employee
values(3303,'FARES',051234674,1104590)
insert into employee
values(3304,'FATEEN',055283979,1104590)
insert into employee
values(3305,'ABER',050573698,1104590)

insert into coustmer
values(4401,'AMAL',055395673,'fast',3301)
insert into coustmer
values(4402,'RANDA',055192974,'fast',3302)
insert into coustmer
values(4403,'RAZAN',050173836,'fast',3303)
insert into coustmer
values(4404,'AHMAD',055736483,'fast',3304)
insert into coustmer
values(4405,'MANAL',050262381,'fast',3305)

insert into prescribe
values(4401,'13APR2023',3,3301)
insert into prescribe
values(4402,'1JUL2023',4,3302)
insert into prescribe
values(4403,'22DEC2023',2,3303)
insert into prescribe
values(4404,'18N0V2023',2,3304)
insert into prescribe
values(4405,'30AUG2023',3,3305)

select * from coustmer
where C_ID=4404
select lower(C_NAME)
from coustmer
select COM_NAME,COM_ADDRESS
from company
select STAR_DATE,END_DATE
from contractee
select E_NAME
from employee
where E_NAME like 'F%'