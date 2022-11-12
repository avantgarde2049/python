/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmployeeID]
      ,[Jobtitle]
      ,[Salary]
  FROM [new1].[dbo].[EmployeeSalary]

  
  select * from new1.dbo.EmployeeDemo 

  
  select * from EmployeeDemo where Lastname like 's%'

  
  select * from EmployeeDemo where Lastname in ('Halpert','Rivers')

  
  select gender,count(gender) from EmployeeDemo where age>31 group by gender 


  
  select * from EmployeeDemo 
  
  select * from EmployeeSalary

  /* partition by*/
  select Firstname,Lastname,age,gender,Salary,COUNT(gender) OVER (PARTITION BY gender) AS Totalgender from new1..EmployeeDemo pk
  join new1..EmployeeSalary dk
   on pk.EmployeeID=dk.EmployeeID