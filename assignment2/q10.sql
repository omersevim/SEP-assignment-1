--idk why you want the productID in this because it makes it impossible to group by shelf.
Select ProductID, Shelf, avg(quantity) TheAvg from Production.ProductInventory
group by ProductID, Shelf 
having Shelf != 'N/A'
go

--no ProductID version
Select Shelf, avg(quantity) TheAvg from Production.ProductInventory
group by Shelf 
having Shelf != 'N/A'
order by Shelf
go