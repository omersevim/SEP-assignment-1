Select OrderDate from Orders
where OrderDate > dateadd(year, -20, getdate())