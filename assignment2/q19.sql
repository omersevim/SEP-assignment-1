Select c.ContactName, o.OrderDate
from Customers c inner join Orders o 
on c.CustomerID = o.CustomerID
where o.OrderDate > '19980101'