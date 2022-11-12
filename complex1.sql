/**ICC Tournament**/
create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);

INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

select Team_Name, COUNT(1) as Matches_Played,sum(win_flag) as matches_won,count(1)-sum(win_flag) as matches_lost 
from(
select Team_1 as Team_Name, case when team_1= winner then 1 else 0 end as win_flag
from icc_world_cup
union all 
select Team_2 as Team_Name, case when team_2= winner then 1 else 0 end as win_flag
from icc_world_cup) A
group by Team_Name
order by matches_won desc



/**Find order date with count of newand repeated customers**/
create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);
select * from customer_orders
insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;

with cte as(
select customer_id,min(order_date) as first_visit from customer_orders
group by  customer_id
),visit_flag as
(select  tab.order_id,tab.customer_id,tab.order_date,cte.first_visit, 
case when tab.order_date=cte.first_visit then 1 else 0 end as first_flag,
case when tab.order_date!=cte.first_visit then 1 else 0 end as repeat_flag
from customer_orders as tab
join 
cte on tab.customer_id=cte.customer_id)
select order_date,sum(first_flag) no_of_new_customers,sum(repeat_flag) no_of_repeated_customers
from visit_flag
group by order_date

/**goldmedals by them with no of gold medals**/

CREATE TABLE events (
ID int,
event varchar(255),
YEAR INt,
GOLD varchar(255),
SILVER varchar(255),
BRONZE varchar(255)
);

INSERT INTO events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO events VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');

select * from events
with tab1 as(
select gold ,'gold' as medal_type from events 
union all 
select silver ,'silver' as medal_type from events
union all
select bronze ,'bronze' as medal_type from events)
select gold as Name,count(1) as no_of_gold_medals from tab1
group by gold
having count(distinct medal_type)=1 and max(medal_type) = 'gold'