select ProductID,  avg(quantity) TheAvg from Production.ProductInventory
where LocationID = 10
group by ProductID