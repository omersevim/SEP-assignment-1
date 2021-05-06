Select ProductSubcategoryID, count(1) CountedProducts from Production.Product
group by ProductSubcategoryID
having ProductSubcategoryID is not null