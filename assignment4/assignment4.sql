--Written Questions--
--1--
--View is a virtual table based on the result set of a query. it provides extra security and can speed up data analysis.

--2--
--Data cannot be directly modified using view.

--3--
--Stored procedures are subroutines that can be used by applications accessing that database. they are stored in the data dictionary.

--4--
--View shows data that is stored in the database while stored procedure can be executed to show/modify data.

--5--
--a function must return a value while stored procedure does not have to.

--6--
--Yes it can

--7--
--yes, stored procedures can be executed in a select statement implicitly

--8--
--trigger is a special stored procedure that automatically runs when an event occurs in the database. There is DDL, DML, CLR, and Logon triggers.

--9--
-- triggers are used to assess or evaluate data before DDL or DML commands are executed so that data is assessed before it is modified. They also preserve data integrity.

--10--
--triggers are special stored procedures that happen when an event occurs. Stored procedures are user defined code written in the local version of SQL.

--DATABASE QUESTIONS--
--1--
--a--
insert into Region Values(5, 'Middle Earth')
--b--
insert into Territories Values(97968, 'Gondor', (Select RegionID from Region where RegionDescription = 'Middle Earth'))
--c--
insert into Employees (LastName, FirstName, Region) Values('King', 'Aragorn', 'Middle Earth')
go
insert into EmployeeTerritories (EmployeeID, TerritoryID) Values ( (Select EmployeeID from Employees where FirstName = 'Aragorn' and LastName = 'King'), (Select TerritoryID from Territories where TerritoryDescription = 'Gondor'))
go

--2--
update Territories
set TerritoryDescription = 'Arnor'
where TerritoryDescription = 'Gondor'

--3--
delete from EmployeeTerritories where EmployeeID = (Select EmployeeID from Employees where FirstName = 'Aragorn' and LastName = 'King')
delete from Territories
where RegionID = (select RegionID from Region where RegionDescription = 'Middle Earth')
update Employees 
set Region = Null where Region = 'Middle Earth'

--4--
create view [view product_order sevim]
as 
select ProductID, count(ProductID) TotalCount from [Order Details]
group by ProductID