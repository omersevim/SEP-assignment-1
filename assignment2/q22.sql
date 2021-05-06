Select c.CustomerID, count(o.OrderDate)
from Customers c inner join Orders o 
on c.CustomerID = o.CustomerID
group by c.CustomerID
having count(o.OrderDate) > 100
