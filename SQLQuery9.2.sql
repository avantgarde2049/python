select * from EMPLOYEEDemo
Inner join EmployeeSalary
on EMPLOYEEDemo.EmployeeID=EmployeeSalary.EmployeeID

insert into EmployeeSalary values 
(1010,'Designer',42000),
(1011,'Engineer',45000),
(1012,'HR',35000)

select * from EMPLOYEEDemo
Full outer join EmployeeSalary
on EMPLOYEEDemo.EmployeeID=EmployeeSalary.EmployeeID

select * from EMPLOYEEDemo
Left join EmployeeSalary
on EMPLOYEEDemo.EmployeeID=EmployeeSalary.EmployeeID

select * from EMPLOYEEDemo
Right join EmployeeSalary
on EMPLOYEEDemo.EmployeeID=EmployeeSalary.EmployeeID


select EMPLOYEEDemo.EmployeeID,Firstname,Lastname,Salary from EMPLOYEEDemo
Right join EmployeeSalary
on EMPLOYEEDemo.EmployeeID=EmployeeSalary.EmployeeID


select EmployeeSalary.EmployeeID,Firstname,Lastname,Salary from EMPLOYEEDemo
left outer join EmployeeSalary
on EMPLOYEEDemo.EmployeeID=EmployeeSalary.EmployeeID



select EmployeeSalary.EmployeeID,Firstname,Lastname,Salary from EMPLOYEEDemo
inner join EmployeeSalary
on EMPLOYEEDemo.EmployeeID=EmployeeSalary.EmployeeID where Firstname not like 'Jim' order by Salary desc

select jobtitle,avg(salary) from EmployeeSalary where jobtitle like 'HR' group by Jobtitle 

SELECT * FROM EmployeeSalary
