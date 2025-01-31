use Northwind;

--1.	Productos con categoría 1, 3 o 5

select ProductName,CategoryID, UnitPrice from Products
where CategoryID in (1,2, 5);

--2.	Clientes de México, Brasil o Argentina
select * from Customers

select CustomerID, City, Country, Phone from Customers
where  Country in ('Mexico','Brazil', 'argentina' ) 

--3.    Pedidos enviados por los transportistas 1, 2 o 3 y con flete mayor a 50

select *  from Orders;

select *  from Orders
where ShipVia in (1,2,3) and Freight >50 ;

--4.    Empleados que trabajan en Londres, Seattle o Buenos Aires

select * from Employees;

select EmployeeID, concat(FirstName, LastName), City, Region from Employees
where City in ('London','Seattle', 'Buenos Aires');


--5.    Pedidos de clientes en Francia o Alemania, pero con un flete menor a 100

select * from Orders
where ShipCountry in ('germany', 'france') and (Freight < 100);

--6.    Productos con categoría 2, 4 o 6 y que NO estén descontinuados

select * from Products;

select ProductID, CategoryID, UnitsInStock, UnitPrice, Discontinued from Products
where CategoryID in (2,4, 6) and UnitsInStock > 50 and Discontinued < 1  ;

--7.    Clientes que NO son de Alemania, Reino Unido ni Canadá

select CustomerID, City, Country, Phone from Customers
where not Country in ('germany','Brazil', 'UK' ); 

--8.    Pedidos enviados por transportistas 2 o 3, pero que NO sean a USA ni Canadá

select OrderID, ShipVia, shipcountry, ShipCity from Orders

where ShipVia in (2 ,3) and not shipcountry in ('canada','usa')

--9.    Empleados que trabajan en 'London' o 'Seattle' y fueron contratados después de 1990

--en la tabla no hay ninguno que se contrato en 1995 lo pase a despues del 1993

select * from Employees;
select EmployeeID, LastName, FirstName, day(HireDate), year (HireDate), month (HireDate), City from Employees
where not City in ('london' , 'seatlle') and year (HireDate)>1993 ;

--10.   Productos de categorías 1, 3 o 5 con stock mayor a 50 y que NO están descontinuados

select * from Products;

select ProductID, CategoryID, UnitsInStock, UnitPrice, Discontinued from Products
where CategoryID in (1,3, 5) and UnitsInStock > 50 and Discontinued < 1  ;
