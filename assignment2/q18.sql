Select City, count(customerID) NumCustomer from Customers
group by City
having count(CustomerID) > 10