create table stadium (
id int,
visit_date date,
no_of_people int
);

insert into stadium
values (1,'2017-07-01',10)
,(2,'2017-07-02',109)
,(3,'2017-07-03',150)
,(4,'2017-07-04',99)
,(5,'2017-07-05',145)
,(6,'2017-07-06',1455)
,(7,'2017-07-07',199)
,(8,'2017-07-08',188);
with cte as(
select *,row_number() over (order by visit_date) as rn,
id-row_number() over (order by visit_date) as grp
from stadium where no_of_people>=100)
select id,visit_date,no_of_people from cte where grp in(
select grp from cte group by grp having count(1)>=3)

create table players_location
(
name varchar(20),
city varchar(20)
);
delete from players_location;
insert into players_location
values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');

select * from players_location

select 
max(case when city='Bangalore' then name end) as Bangalore,
max(case when city='Delhi' then name end) as Delhi,
max(case when city='Mumbai' then name end) as Mumbai from
(select *,ROW_NUMBER() over (partition by city order by name) as grp from players_location)a 
group by grp

