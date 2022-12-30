create table tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);
delete from tickets;
insert into tickets values
(1,'2022-08-01','2022-08-03')
,(2,'2022-08-01','2022-08-12')
,(3,'2022-08-01','2022-08-16');

select * from tickets



select *,datediff(day,create_date,resolved_date) as actual_days,datediff(day,create_date,resolved_date)-2*datediff(week,create_date,resolved_date) as business_days
from tickets

create table holidays
(
holiday_date date
,reason varchar(100)
);
insert into holidays values
('2022-08-11','Rakhi'),('2022-08-15','Independence day');

select *,datediff(day,create_date,resolved_date) as actual_days,datediff(day,create_date,resolved_date)-2*datediff(week,create_date,resolved_date)-no_of_holidays as business_days
from
(select ticket_id,create_date,resolved_date,count(holiday_date) as no_of_holidays from tickets 
left join holidays on holiday_date between create_date and resolved_date
group by ticket_id,create_date,resolved_date) a


create table employee 
(
emp_id int,
company varchar(10),
salary int
);

insert into employee values (1,'A',2341)
insert into employee values (2,'A',341)
insert into employee values (3,'A',15)
insert into employee values (4,'A',15314)
insert into employee values (5,'A',451)
insert into employee values (6,'A',513)
insert into employee values (7,'B',15)
insert into employee values (8,'B',13)
insert into employee values (9,'B',1154)
insert into employee values (10,'B',1345)
insert into employee values (11,'B',1221)
insert into employee values (12,'B',234)
insert into employee values (13,'C',2345)
insert into employee values (14,'C',2645)
insert into employee values (15,'C',2645)
insert into employee values (16,'C',2652)
insert into employee values (17,'C',65);

select company,avg(salary) as med_salary from
(select *,ROW_NUMBER() over (partition by company order by salary) as rn,
count(1) over (partition by company order by company) as cnt 
from employee) a  where rn between cnt*1.0/2 and cnt*1.0/2 +1  
group by company