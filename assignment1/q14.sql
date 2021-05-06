--this shows colors that only appear once
Select Color from Production.Product
group by color
having count(color) = 1
order by color desc
go

--this shows each individual color that appears.
Select distinct color from Production.Product
order by color desc
go