

--lenguaje SQL-LMD (insert, update, delete, select - CRUD)
--CONSULTAS SIMPLES

USE Northwind;

--mostrar todos los clientes de la empresa con todas sus columnas

select * from Customers;

--mostrar todos los clientes, provedores,categorias, productos, ordenes , empleados
-- de la empresa

select * from Customers;
select * from Employees;
select * from Orders;
select * from Suppliers;
select * from Categories;
select * from [Order Details];

--proyeccion -- solo ser lo que quieres ver 

select ProductID, ProductName, UnitsInStock, UnitPrice from Products;

--seleccionar el numero de empleado, su primer nombre, su cargo, ciudad y pais 

select EmployeeID, FirstName, TitleOfCourtesy, City, Country from Employees;

-- alias de columna

-- enbase a la consulta anteriror,  visualisar el Employerid
-- como numero empleado, el firsname como PrimerNombre, title
-- como cargo, city como ciudad, country como pais.

select EmployeeID as 'Numero empleado', FirstName as PrimerNombre, TitleOfCourtesy 'cargo', 
City as ciudad, Country as pais from Employees;

--otra formar 

select EmployeeID as [Numero empleado], FirstName as PrimerNombre, TitleOfCourtesy [cargo], 
City as ciudad, Country as pais from Employees;

-- compos calculados 
-- seleccionar el importe de cada uno de los productos vendidos en una orden

select * from [Order Details];

select *, (UnitPrice * Quantity) as 'Importe' from [Order Details];

-- seleccionar las fechas de orden, y anos, mes y dia, el cliente que las
-- ordeno y el empleado que la realiso 

select * from Orders;

select OrderDate, CustomerID, EmployeeID from Orders;

select OrderDate as fechasOrden,
year(OrderDate) as anoorden,
MONTH(OrderDate) as MesOrden, 
day(OrderDate) as Dia, 
CustomerID, EmployeeID 
from Orders;

-- clausulas where
-- operadores relacionales (<,>,=,<=,=>,!=, <>)

select * from Customers;
-- Seleccionar el cliente Bolid

select CustomerID as clientes, CompanyName as NombreCompany, City as ciudad, Country  as pais from Customers
where CustomerID = 'BOLID';

-- seleccionar los clientes, mostrando su identificardor, nombre de la empresa
--contacto,  ciudad  y pais de alemania 

select CustomerID as NumeroCliente, CompanyName as NombreCompania, ContactName as NombreContacto,
City as ciudad, Country as pais  from Customers
where Country = 'germany';

--seleccionar todos los clientes que no sean de alemania 

select CustomerID as NumeroCliente, CompanyName as NombreCompania, ContactName as NombreContacto,
City as ciudad, Country as pais  from Customers
where Country != 'germany';

--selec cionar todos los productos, mostrnado  su nombre de producto
--categoria a la que pertemece existan, precio, pero solamente 
-- donde su precio seaq mayot a 100

select * from Products;
select ProductName as [nombre producto], CategoryID as Categoria , UnitsInStock as Existencia,
UnitPrice as precio  from Products
where UnitPrice >= 100;

-- seleccionar las ordenes de compra 
-- mostrando la fecha de orden, la fecha de entrega,  la
-- fecha de envio, el cliente a quien se vendio de 1996

select * from Orders;

select OrderDate as fechasOrden,
	ShippedDate as [fechas entrega],
	RequiredDate as [dia envio],
	CustomerID as cliente
from Orders
where year(OrderDate) = 1996;
