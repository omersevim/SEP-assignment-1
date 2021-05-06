Select top 5 ShipPostalCode, count(ShipPostalCode) NumOrder from Orders
group by ShipPostalCode
order by count(ShipPostalCode) desc