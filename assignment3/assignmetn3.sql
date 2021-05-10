/*
1. Using join is better because most of the time it is faster
*/

/*
2. CTE is an acronym for Common Table Expression, it can be used to do multilevel grouping without having to group every query.
*/

/*
3. table variables are local variables created locally to store the data in a table before or after processing it. 
*/

/*
4.  TRUNCATE always deletes all rows from the table while keeping the template intact, DELETE can be used to delete rows with 
	that match the condition given by a WHERE clause. TTUNCATE will have better performance because it does not check the row to 
	see if it matches the condition and it also doesn't log every row thats deleted unlike the DELETE function.
*/

/*  
5. it is a special type of column that auto generates values based on a given seed.
*/

/*
6. TRUNCATE table table_name will delete everything in the table, without scanning for the number of deleted rows, 
   DELETE from table_name will scan each row and calculate how many rows have been deleted, making it slower.
*/

--1--
Select distinct c.City Cities
from Customers c inner join Employees e on c.City = e.City

--2--
--a--
Select distinct City from Customers
where
City not in (select distinct City from Employees)

--b--
Select distinct c.City from Customers c left join Employees e
on c.City = e.City
where e.City is null

--3--
select ProductID, sum(Quantity) total from [Order Details]
group by ProductID
order by ProductID

--4--
select o.ShipCity, sum(od.quantity) totalOrders from Orders o inner join [Order Details] od on od.OrderID = o.OrderID
where o.ShipCity in (select City from Customers)
group by o.ShipCity

--5--
Select City from Customers
group by City
having count(CustomerID) > 1

--6--
select distinct City from Customers
where CustomerID in (select CustomerID from Orders
					 where OrderID in (select distinct OrderID from [Order Details]))

--7--
select distinct c.ContactName from Customers c left join Orders o
on c.CustomerID = o.CustomerID
where c.City != o.ShipCity and o.OrderID in (select OrderID from [Order Details] where Quantity != 0)

--8--
