create database HMS;

use HMS;

create table patient(
patientid int not null,
p_firstname varchar(45) not null,
p_lastname varchar(45) not null,
p_age int not null,
p_gender char(1) not null,
p_phonenumber int not null,
p_address varchar(100)not null,
p_bloodtype varchar(3)not null,
p_disease varchar(50)not null,
primary key(patientid));

insert into patient
values
('71730040','Abbas','Fakih','21','M',123321,'Tyre','A+','Asthma'),
('71730141','Hassan','Issa','40','M',456654,'Beirut','B','High blood pressure'),
('71730242','Rana','Khoury','60','F',978452,'Zahle','A','Cancer');

create table doctor(
doctorid int not null,
d_firstname varchar(45)not null,
d_lastname varchar(45)not null,
speciality varchar(45)not null,
d_age int not null,
d_gender char(1) not null,
d_phonenumber int not null,
d_address varchar(100) not null,
primary key(doctorid));

insert into doctor
values
('10120050','Mohammad','Dhainy','Cardiologist','55','M',654888,'Beirut'),
(10120151,'Carla','Usef','Allergy and Asthma','36','F',985435,'Beirut'),
('101202152','Hamza','Kanso','Dermatologist','40','M',876230,'saida');

create table appointment(
dateofapp date not null,
timeofapp time not null,
patientid int not null,
doctorid int not null,
primary key(dateofapp,timeofapp),
constraint fk_appointment_patient foreign key(patientid) references patient(patientid),
constraint fk_appointment_doctor foreign key(doctorid) references doctor(doctorid));

insert into appointment
values
('2019-07-15','10:00:00','71730141','10120050'),
('2020-12-10','12:30:00','71730040','10120151');
 
create table laboratory(
labno int not null,
patientid int not null,
doctorid int not null,
dateoftest datetime not null,
amountoftest int not null,
primary key(labno),
constraint fk_laboratory_patient foreign key(patientid) references patient(patientid),
constraint fk_laboratory_doctor foreign key(doctorid) references doctor(doctorid));

insert into laboratory
values
('30310060','71730040','10120151','2020-12-01 12:00:00','2'),
('30310161','71730141','10120050','2019-07-10 9:30:00','3');

create table room(
roomno int not null,
doctorid int not null,
roomtype varchar(45)not null,
statu varchar(45)not null,
primary key(roomno),
constraint fk_room_doctor foreign key(doctorid) references doctor(doctorid));

insert into room
values
('201','10120151','Single','Unavailable'),
('205','101202152','Double','Available'),
('210','10120151','Double','Available'),
('303','10120050','Double','Available'),
('305','10120050','Single','Available');

create table medicine(
medid int not null,
patientid int not null,
medname varchar(100)not null,
medtype varchar(45)not null,
quantity int not null,
price decimal(10,2)not null,
sideeffects varchar(45)not null,
primary key(medid),
constraint fk_medicine_patient foreign key(patientid) references patient(patientid));

insert into medicine
values
('80890010','71730040','Prednisone','Pills','45','18','Yes'),
('80890111','71730141','Bumetanide','Pills','50','11','Yes'),
('80890212','71730242','Abraxane','Chemotherapy','75','200','Yes');


create table morgue(
deadbodyid int not null,
m_firstname varchar(45),
m_lastname varchar(45),
m_gender char(1),
m_age int,
causeofdeath varchar(100),
disease varchar(50),
dateofdeath datetime,
primary key(deadbodyid));

insert into morgue
values
('1','Ali','Ahmad','M','30','Car Accident','','2020-12-10 05:20:00'),
('2','Laya','issa','F','50','Heart Attack','Blood Pressurre','2020-06-05 15:40:00'),
('3','','','M','25','Burn Injury','','2019-08-25 18:10:00');

create table bill(
billno int not null,
patientid int not null,
doctorcharge decimal(10,2)not null,
roomcharge decimal(10,2)not null,
numberofdays int not null,
labchargebill decimal(10,2)not null,
medicinecharge decimal(10,2)not null,
primary key(billno),
constraint fk_bill_patient foreign key(patientid) references patient(patientid));

insert into bill
values
('1','71730040','50','0','0','10','18'),
('2','71730141','100','100','2','30','11'),
('3','71730242','100','100','5','0','200');


