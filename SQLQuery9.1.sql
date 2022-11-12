create table rem(EmployeeID int,Firstname varchar(30),Lastname varchar(30),age int,gender varchar(30))

insert into rem values (1110,'Kate','Winslet',43,'Female'),
(1111,'Kevin','Bruyne',33,'Male'),
(1112,'Zlatan','Ibrahimovic',48,'Male'),
(1113,'Alex','Morgan',27,'Female'),
(1114,'Preeti','Mishra',25,'Female'),
(1115,'Monika','Burns',19,'Female'),
(1116,'Marlon','Brando',70,'Male')
,
(1003,'Slim','Shady',40,'Male')

select * from EMPLOYEEDemo
union all
select * from rem

create table  addit as 
  select * from EMPLOYEEDemo
   union 
  select * from rem 
