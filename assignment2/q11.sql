Select Color, Class, count(1) TheCount, avg(ListPrice) TheAvg from Production.Product
group by Color, Class
having Color is not null and Class is not null