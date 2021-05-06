select productID,  avg(quantity) Average from Production.ProductInventory
where LocationID = 10
group by ProductID