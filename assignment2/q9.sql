Select ProductID, Shelf, avg(quantity) TheAvg from Production.ProductInventory
group by ProductID, Shelf