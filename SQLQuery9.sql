select * from EMPLOYEEDemo
select * from EmployeeSalary

select Firstname,Lastname,Jobtitle,Salary,
CASE 
    when Jobtitle = 'Director' then Salary + (Salary*0.15)
	when Jobtitle in ('Engineer','Architect') then Salary + (Salary*0.10)
    when Jobtitle = 'Designer' then Salary + (Salary*0.05)
	else Salary+ (Salary*0.02)
end as Revisedsalary
from EMPLOYEEDemo as dm
join EmployeeSalary as pm
on dm.EmployeeID=pm.EmployeeID


select Jobtitle,count(jobtitle)
from EMPLOYEEDemo as dm 
right join EmployeeSalary as pm
on dm.EmployeeID=pm.EmployeeID
Group by jobtitle
having count(jobtitle)>1


select Jobtitle,avg(salary) as upper
from EMPLOYEEDemo as dm 
right join EmployeeSalary as pm
on dm.EmployeeID=pm.EmployeeID
Group by jobtitle
having avg(salary)>30000


select Jobtitle,avg(salary) as upper1
from EMPLOYEEDemo as dm 
join EmployeeSalary as pm
on dm.EmployeeID=pm.EmployeeID
Group by jobtitle
having avg(salary)>45000  

/**subqueries**/
select EmployeeID,Jobtitle,Salary from employeesalary
where employeeID in (select employeeid from employeedemo where age>30)
/**however to show age column we need to use join**/

/*find the employees with salaries more than their managers */

create table emp_manager(emp_id int,emp_name varchar(50),salary int,manager_id int);
insert into emp_manager values(	1	,'Ankit',	10000	,4	);
insert into emp_manager values(	2	,'Mohit',	15000	,5	);
insert into emp_manager values(	3	,'Vikas',	10000	,4	);
insert into emp_manager values(	4	,'Rohit',	5000	,2	);
insert into emp_manager values(	5	,'Mudit',	12000	,6	);
insert into emp_manager values(	6	,'Agam',	12000	,2	);
insert into emp_manager values(	7	,'Sanjay',	9000	,2	);
insert into emp_manager values(	8	,'Ashish',	5000	,2	);

select * from emp_manager



with cte as(
select e.emp_id ,e.emp_name ,e.salary ,m.manager_id ,m.emp_name as manager_name ,m.salary as manger_salary from emp_manager e
inner join emp_manager m
on e.manager_id=m.emp_id
)
select emp_name,salary,manager_name,manger_salary from cte where salary>manger_salary