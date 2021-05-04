SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 
FROM Production.Product
WHERE ListPrice BETWEEN 1000 AND 2000
	  OR Color IN ('Red','Black') 
      AND ProductSubCategoryID = 1
ORDER BY ProductSubCategoryID desc
