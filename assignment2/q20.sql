Select c.ContactName, max(o.OrderDate)
from Customers c inner join Orders o 
on c.CustomerID = o.CustomerID
group by c.ContactName
