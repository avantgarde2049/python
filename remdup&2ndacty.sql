
create table em(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);

insert into em values(1,'Ankit',100,10000,4,39);
insert into em values(2,'Mohit',100,15000,5,48);
insert into em values(3,'Vikas',100,10000,4,37);
insert into em values(4,'Rohit',100,5000,2,16);
insert into em values(5,'Mudit',200,12000,6,55);
insert into em values(6,'Agam',200,12000,2,14);
insert into em values(7,'Sanjay',200,9000,2,13);
insert into em values(8,'Ashish',200,5000,2,12);
insert into em values(9,'Mukesh',300,6000,6,51);
insert into em values(10,'Rakesh',500,7000,6,50);
insert into em values(9,'Mukesh',300,6000,6,51);
insert into em values(10,'Rakesh',500,7000,6,50);

select * from em
 

create table em12(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);

insert into em12 values(1,'Ankit',100,10000,4,39);
insert into em12 values(2,'Mohit',100,15000,5,48);
insert into em12 values(3,'Vikas',100,10000,4,37);
insert into em12 values(4,'Rohit',100,5000,2,16);
insert into em12 values(5,'Mudit',200,12000,6,55);
insert into em12 values(6,'Agam',200,12000,2,14);
insert into em12 values(7,'Sanjay',200,9000,2,13);
insert into em12 values(8,'Ashish',200,5000,2,12);
insert into em12 values(9,'Mukesh',300,6000,6,51);
insert into em12 values(10,'Rakesh',500,7000,6,50);
insert into em12 values(9,'Mukesh',300,6000,6,51);
insert into em12 values(10,'Rakesh',500,7000,6,50);

truncate table em 

select * from em

insert into em
select emp_id,emp_name,dept_id,salary,manager_id,emp_age from (select *,row_number() over (partition by emp_id order by salary asc) as rn from em12) A where rn=1

select * from em

create table UserActivity
(
username      varchar(20) ,
activity      varchar(20),
startDate     Date   ,
endDate      Date
);

insert into UserActivity values 
('Alice','Travel','2020-02-12','2020-02-20')
,('Alice','Dancing','2020-02-21','2020-02-23')
,('Alice','Travel','2020-02-24','2020-02-28')
,('Bob','Travel','2020-02-11','2020-02-18');

--print only user activity and for multiple acitvities for a user 2nd most activity

select * from UserActivity

select username,activity,startDate,endDate from
(select *,rank() over (partition by username order by startDate) as rn,
count(1) over (partition by username) as cnt from UserActivity)a where cnt=2 or rn=1

