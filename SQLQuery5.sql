/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmployeeID]
      ,[Firstname]
      ,[Lastname]
      ,[age]
      ,[gender]
  FROM [new1].[dbo].[EMPLOYEEDemo]  

  select top 5 * from EMPLOYEEDemo
  select distinct gender from EmployeeDemo 
  
  select COUNT(Lastname) from EmployeeDemo 
  
  select min(age) from EmployeeDemo 

  
  select avg(age) from EmployeeDemo 