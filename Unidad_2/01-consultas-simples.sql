

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

-- filas duplicadas (distinct)
select * from Customers;
-- mostrar los paises donde se tienen clientes, mostrando pais solamente 

select distinct Country as paises from Customers 

order by Country;

-- clausulas where
-- operadores relacionales o test de comparacion (<,>,=,<=,=>,!=, <>)

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

--mostrar todas las ordenes de compra donde la cantidad de productos comprados 
-- se mayor de 40

select * from [Order Details]
where Quantity >= 40;

-- mostar el nombre completo del empleado, numero de empleado, fecha de nacimiento
-- ciuadad, fecha de contratacion y esta debe ser de aquellos que fueron contratados
-- despues de 1993, los resultados en sus encabezadis deben ser mostrados en espanol

select * from Employees;


select FirstName as primer_nombre, LastName as apelllido,
BirthDate as nacimiento, City as ciudad, HireDate as fecha_contratacion
from Employees
where YEAR(HireDate) > 1993;

-- concatenacion 

select EmployeeID as numero,
(FirstName + ' ' + LastName) as nombre,
BirthDate as nacimiento, City as ciudad, HireDate as fecha_contratacion
from Employees
where YEAR(HireDate) > 1993;

--segunda opcion

select EmployeeID as numero,
concat(FirstName, ' ' , LastName) as [nombre completo],
BirthDate as nacimiento, City as ciudad, HireDate as fecha_contratacion
from Employees
where YEAR(HireDate) > 1993;

-- mostrar los empleados que no son dirigidos por el jefe 2

select * from Employees

select * from Employees where [ReportsTo] != 2;

select EmployeeID as numero,
concat(FirstName, ' ' , LastName) as [nombre completo],
BirthDate as nacimiento, City as ciudad, HireDate as fecha_contratacion,
[ReportsTo] as jefe
from Employees
where [ReportsTo] != 2;

-- operadores logicos (or, and, not)
--seleccionar los productos que tengan un precio de entre 10 y 50 dolares 

select * from Products;

select ProductName as ProductoNombre , UnitPrice as PrecioUnitario, UnitsInStock as productoEnStock
from Products
where UnitPrice>=10
and UnitPrice<=50;

-- mostrar todos los pedidos por clientes que no son de alemania

select * from Orders;

select OrderID as NumeroCliente, CustomerID as clienteID, ShipCountry as pais, OrderDate as [fehca orden]  from Orders
where ShipCountry <> 'Germany' ;

select OrderID as NumeroCliente, CustomerID as clienteID, ShipCountry as pais, OrderDate as [fehca orden]  from Orders
where not ShipCountry = 'Germany' ;

--seleccionar clientes de mexico o de usa

select * from Customers;

select CustomerID as [CLIENTE ID], City as ciudad, Country as pais  from Customers
where  Country = 'Mexico' 
or Country= 'USA';

-- selecciona empleados que nacieron entre 1955 y 1958 que viven en londers 

select * from Employees;

select EmployeeID as [Numero empleados],BirthDate as fechaCumple, Title as Titulo, City as Ciudad from Employees
where  (year(BirthDate)>=1955 and YEAR(BirthDate)<=1958) and City = 'london';

-- seleccionar los pedidos con flete mayor a $100
-- y enviados a francia  o espa�a

select * from Orders;

select * from Orders
where (ShipCountry = 'France' or ShipCountry = 'spain') and Freight > 100 ;

--seleccionar las primeras cinco ordenes de compra

select top 5 * from Orders;

-- seleccionar los productos con precio entre $10 y $50
-- que NO esten descontinuados y tengan mas de 20 unidades en stock

select * from Products;

select * from Products
where (UnitPrice >= 10 or UnitPrice <=50)
and Discontinued = 0
and UnitsInStock > 20 ;

-- seleccionar los pedidos con flete manor a $50
-- y enviados a francia  o alemania

select * from Orders;

select * from Orders
where (ShipCountry = 'France' or ShipCountry = 'Germany') and Freight > 0 ;

--clientes que no sean de mexico o usa y tengan un fax registrado

select CompanyName, Country, City, Fax from Customers where not (Country= 'Mexico' or Country= 'USA')
and fax is not null;

--seleccionar pedidos con un flete mayor a 100
--enciados a brasil o argentina
-- pero NO enviados por el transportista 1 Speedy Express

select * from shippers;

select * from Orders
where ((ShipCountry = 'Brazil' or ShipCountry = 'Argentina') and Freight > 100) and [ShipVia] <> 1 ;

--seleccionar empleados que no viven en londres o seattle y que fueron contratados despues de 1992

select CONCAT(FirstName ,  ' ' , LastName ) as [nombre completo] , HireDate, City, Country from Employees
where not (city = 'london' or city = 'seattle') and year(HireDate) >= 1992;

--clausula in
--seleccionar los productos con categoria 1,3 o 5

select ProductName,CategoryID, UnitPrice from Products
where CategoryID= 1 or CategoryID = 2 or CategoryID = 5;

select ProductName,CategoryID, UnitPrice from Products
where CategoryID in (1,2, 5);

--seleccionar todas las ordenes de la recion RJ, Tachira y que no tenga region asignada

select OrderID, ShipRegion, ShipCity from Orders
where ShipRegion in ('RJ','T�chira')
or ShipRegion is null;

-- seleccionar las ordenes que tengan ccantidades de 12, 9 o 40
--y descuento de 0.15 0.05


select OrderID,Quantity, Discount from [Order Details]
where Quantity in (12,9,40)
and Discount in (0.15,0.05);

--clausula between siempre va en el where

--between  valorinicial and valorfinal--
--mostrar los productos con precio entre 10 y 50

select * from Products
where UnitPrice >= 10 and UnitPrice<=50;

select * from Products
where UnitPrice between 10 and  50;

--seleccionar todos los pedidos realisados entre el primero de enero y el 30 de junio de 1997

select * from Orders;

select OrderID as ordeniID, concat (day(OrderDate),  '-',year(OrderDate), '-',month(OrderDate))  from Orders
where OrderDate>= '1997-01-01' and OrderDate <= '1997-06-30' ;

select OrderID as ordeniID, concat (day(OrderDate),  '-',year(OrderDate), '-',month(OrderDate))  as fecha  from Orders
where OrderDate between '1997-01-01' and  '1997-06-30' ;


-- seleccionar todos los empleados contratados entre 1990 y 1995 que trabajan en londres

select *  from Employees;

select EmployeeID, HireDate, City, Country  from Employees
where year(HireDate) between '1992' and '1994' and City = 'London';

-- pedidos con flete (freigh) entre 50 y 200 enviados a alemania y a francia 

select *  from Orders;

select OrderID as 'numero orden ', OrderDate as [fecha orden],
ShipVia as 'transportista' , Freight as 'flete', ShipCountry as 'pais'
from Orders
where Freight between 50 and 200 
and (ShipCountry = 'Germany' or ShipCountry = 'france');


select OrderID as 'numero orden ', OrderDate as [fecha orden],
ShipVia as 'transportista' , Freight as 'flete', ShipCountry as 'pais'
from Orders
where Freight between 50 and 200 
and ShipCountry in ('Germany', 'france');


--seleccionar todos los productos que tengan un precio entre 5 y 20 y
-- que sean de la categoria 1,2, 3

select * from Products;


select ProductID as pruductoID, ProductName as NombreProducto,
CategoryID as CategoriaID, UnitPrice as Precio
from Products
where UnitPrice between 5 and 20
and (CategoryID in (1, 2, 3));

--emplrados con muero de trabajador entre 3 y 7 que no trabajan en londres
-- ni seattle

select * from Employees;

select EmployeeID, CONCAT(FirstName,LastName) as 'nombre completo', City as ciudad  from Employees
where EmployeeID between 3 and 7
and not City in ('London', 'seatlle');


-- clausula like
--patrones:
	--	1) (%) -> este representa cero o mas caracteres en el patron de busqueda
	
	--	2) (_) representa exactamente un caracter en el busquedad

	-- `3) ([]) corchetes se utlisa para definir cualquiera de ellos en la posicion especifica 
	
	--	4) (^)  se utilisa para buscar caracteres que no estan dentro del conjunto espesifico

	--	buscar los productos que comienza con c

	select * from Products
	where ProductName like 'c%';

	select * from Products
	where ProductName like 'ch%' and UnitPrice =18;

	select * from Products
	where ProductName like 'cha%' and UnitPrice =18;

	--	buscar todos los pordutos que terminen con e

	select * from Products
	where ProductName like '%e' ;

	-- seleccionar todos los clientes cuyo nombre de empresa contine co en cualquier parte 

	select CustomerID,CompanyName, City, Country from Customers;

	select CustomerID,CompanyName, City, Country from Customers 
	where CompanyName like '%co%';

	-- seleccionar los empleados cuyo nombre comiensen con 'A'
	--y tengan exactamente 5 caracteres

	select FirstName, LastName from Employees
	where FirstName like 'A_____';

	-- seleccionar los productos que comiencen con a o b

		select * from Products
		where ProductName like '[ABc]%' ;

		select * from Products 
		where ProductName like '[A-m]%' order by ProductName;

		-- seleccionar todos los productos que no comiencen con A O B

		-- ^ ASENTO SIRCUNFLEJO

		select * from Products
		where ProductName like '[^AB]%' order by ProductName;

		-- SELECCIONAR TODOS LOS PRODUCTOS DONDE EL NOMBRE QUE COMIENSE CON A
		-- PERO QUE COMIENSE CON A PERO NO CONTENGA LA E

		SELECT * FROM Products
		WHERE ProductName LIKE 'A[^E]%';

		-- CLAUSULA ORDER BY
		
		-- DESC -	DESEBDIENTE 
		-- ASC	-	ACENDENTE 

		SELECT ProductID, ProductName, UnitPrice AS 'PRECIO', UnitsInStock from Products
		order by 'PRECIO' Asc;

		-- seleccionar los clientes ordenados por pais y demtro por ciudad

		select CustomerID, Country, City from Customers
		order by Country asc, City desc;

		select CustomerID, Country, City from Customers
		where Country in ('Brazil' , 'Germany')
		order by Country asc, City desc;

			select CustomerID, Country, City from Customers
		where Country in ('Brazil' , 'Germany')
		and region is not null
		order by Country asc, City desc;

		
			select CustomerID, Country, City from Customers
		where (Country = 'Brazil' or Country = 'Germany')
		and region is not null
		order by Country asc, City desc;



