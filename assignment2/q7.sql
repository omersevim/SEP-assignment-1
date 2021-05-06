select Shelf, ProductID,  sum(quantity) TheSum from Production.ProductInventory
where LocationID = 40
group by Shelf, ProductID
having sum(quantity)<100