Select c.Name Country, s.Name Province
from Person.CountryRegion c inner join Person.StateProvince s
on c.CountryRegionCode = s.CountryRegionCode
where c.Name in('Germany', 'Canada')
order by c.Name