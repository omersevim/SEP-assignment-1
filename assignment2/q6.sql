select ProductID,  sum(quantity) TheSum from Production.ProductInventory
where LocationID = 40
group by ProductID
having sum(quantity)<100