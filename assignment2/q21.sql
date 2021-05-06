Select c.ContactName, count(o.OrderDate) NumPurchase
from Customers c inner join Orders o 
on c.CustomerID = o.CustomerID
group by c.ContactName
