/***common table expression**/
with cte_employee as
(
select dm.Firstname,dm.Lastname,dm.gender,sal.salary,
count(gender) over (partition by gender) as Totalgen,
avg(salary) over (partition by Salary) as AvgSalary
from EmployeeDemo as dm
join EmployeeSalary as sal
on dm.EmployeeID=sal.EmployeeID
where Salary>45000
)
select Firstname,Lastname,AvgSalary from cte_employee


/***temp table ****/
drop table #temp_emp
create table #temp_emp(
jobtitle varchar(50),
empperjob int,
avgage int,
avgsal int)

insert into #temp_emp 
SELECT jobtitle,count(jobtitle),avg(age),avg(salary)
 from  EmployeeSalary sal
LEFT  join employeedemo dm
 on sal.EmployeeID=dm.EmployeeID
group by jobtitle

select * from #temp_emp
