/**complexquerypractice2**/
/**most visits in a floor with count**/
create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')

select * from entries
select name,count(name) ,floor,group_concat(distinct resources) as resources_used from(
select name,floor,count(floor) over(partition by name,floor order by floor) as c,resources
from entries ) tab1
group by name having c=max(c) 