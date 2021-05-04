Select ProductID, concat (Name, Color) as NameColor, ListPrice from Production.Product
where Color is not null