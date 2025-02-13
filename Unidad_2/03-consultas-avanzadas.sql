--	joins	-- juntan

--	inner	-select * from tabla inner tabla2 on campo1(estos tienen que ser del mismo valor)campo2
--	left
--	right
--	cross
--	full

use Northwind

select * from 
 Categories
 inner join
 Products 
 on Categories.CategoryID =Products.CategoryID

 select C.CategoryID, CategoryName as 'nombre categoria',
 ProductName as 'nombre producto', UnitsInStock 'unidades en stock', UnitsInStock 'Existencia' from 
 Categories as c
 inner join
 Products as p
 on C.CategoryID = P.CategoryID

 -- seleccionar los productos de la categoria beverages y condiments donde la existencia
 -- este estre 18 y 30

  select * from Categories;
  select * from Products;

  select p.ProductName , c.CategoryName , p.UnitPrice, p.UnitsInStock from 
	 Categories as c
	 inner join
	 Products as p
	on C.CategoryID = P.CategoryID
	where c.CategoryName in ('beverages', 'condiments')
	and p.UnitsInStock between '18' and  '30'

	-- seeleccionar los productos y sus importes realisados de marzo a juniode 1996
	-- de 1995, mostrando la fecha de la orden, el id del producto y el importe

select o.OrderDate , o.OrderDate, od.ProductID,
(od. UnitPrice * od.Quantity) as 'importe'  from 
Orders as O
inner join
[Order Details] AS OD
ON od.OrderID = o.OrderID
where o.OrderDate between '1996-07-01' and '1996-10-31'

select GETDATE()
-- mostrar el importe total del ventas de la consulta anterior 

select '$ ' + sum(od.Quantity * od.UnitPrice) as total
from 
Orders as O
inner join
[Order Details] AS OD
ON od.OrderID = o.OrderID
where o.OrderDate between '1996-07-01' and '1996-10-31'


-- consultas basicas con inner join

-- 1 obtener los nombre de los clientes y los paises de los que enviaron sus pedidos 

select * from Orders 
select * from Customers

select c.ContactName ,c.Country, o.ShipCity  from
Customers as c
inner join
Orders AS o
ON c.CustomerID = o.CustomerID	
order by o.ShipCountry asc


-- 2- obtener los productos y sus respectivos provedores

select p.CategoryID, p.ProductName as 'nombre porducto', s.SupplierID, s.CompanyName from
Suppliers as s
inner join
Products AS p
ON s.SupplierID = p.SupplierID	
order by 1 desc

-- 3 obtener los pedidos y los empleados que los gestionaron

select top 3 Em.EmployeeID, em.FirstName, o.OrderID, o.ShipCountry from
Employees as Em
inner join
Orders as o
on  Em.EmployeeID = o.EmployeeID
order by o.OrderID desc

-- 4 listar los productos con sus precios y la categoria a la que pertenecen 

select p.ProductName, p.UnitPrice, p.UnitsInStock, C.CategoryName, C.CategoryID from
Categories as c
inner join
Products as p
on c.CategoryID = p.CategoryID

-- 5 obtener el numero del cliente, el numero de orden y la fecha de orden 

SELECT O.CustomerID, O.OrderID, O.OrderDate, C.CompanyName FROM 
Customers AS C
INNER JOIN 
Orders AS O
ON C.CustomerID = O.CustomerID

--6 listar las ordenes mostrando el numero de order, el nombre del producto 
-- y la cantidad que se vendio 

SELECT TOP 5 OD.OrderID, OD.ProductID, P.ProductName, OD.Quantity FROM 
Products AS P
INNER JOIN 
[Order Details] AS OD
ON Od.ProductID = P.ProductID
ORDER BY OD.Quantity DESC

SELECT TOP 5 OD.OrderID, OD.ProductID, P.ProductName, OD.Quantity FROM 
Products AS P
INNER JOIN 
[Order Details] AS OD
ON Od.ProductID = P.ProductID
ORDER BY OD.Quantity DESC

SELECT OD.OrderID, OD.ProductID, P.ProductName,
COUNT(*) AS 'PRODUCTOS VENDIDOS '
FROM 
[Order Details] AS OD
INNER JOIN 
Products AS P
ON Od.ProductID = P.ProductID
GROUP BY OD.OrderID

-- 7. OBTENER LOS EMPLEADOS Y SUS RESPECTIVOS JEFES

SELECT E.EmployeeID , E.FirstName AS 'EMPLEADO', EM.ReportsTo ,CONCAT(EM.Title, '  -', EM.LastName) AS JEFE   FROM 
Employees AS E
INNER JOIN
Employees AS EM
ON E.EmployeeID = EM.ReportsTo
 
-- 8 LISTAR LOS PEDIDOS Y EL NOMBRE DE LA EMPRESA DE TRANSPORTE UTILIZADA

SELECT O.OrderID, S.CompanyName  FROM 
Orders AS O
INNER JOIN
Shippers AS S
ON O.ShipVia = S.ShipperID

-- 9. OBTENNER LA CANTIDAD TOTAL DE PRODUCTOS VENTDIDOS POR CATEGORIA


SELECT SUM(Quantity) FROM [Order Details]

SELECT C.CategoryName, SUM(Quantity) AS 'PRODUCTOS VENDIDOS' FROM
Categories AS C
INNER JOIN
Products AS P
ON C.CategoryID =  P.CategoryID
INNER JOIN 
[Order Details] AS OD
ON OD.ProductID = P.ProductID
GROUP BY C.CategoryName
ORDER BY C.CategoryName

-- 10. OBTENER EL TOTAL DE VENTAS POR EMPLEADO

SELECT E.FirstName,COUNT(O.OrderID) FROM
Employees AS E
INNER JOIN
Orders AS O
ON E.EmployeeID = O.EmployeeID
INNER JOIN
[Order Details] AS OD
ON O.OrderID = OD.OrderID
GROUP BY E.FirstName


SELECT CONCAT(E.FirstName, '', E.LastName) AS NOMBRE ,
SUM((OD.Quantity * OD.UnitPrice)- (OD.Quantity * OD.UnitPrice) * OD.Discount)
FROM
Employees AS E
INNER JOIN
Orders AS O
ON E.EmployeeID = O.EmployeeID
INNER JOIN
[Order Details] AS OD
ON O.OrderID = OD.OrderID
GROUP BY E.FirstName
--
SELECT * FROM
Orders AS O
INNER JOIN
Employees AS E
ON O.EmployeeID = E.EmployeeID
INNER JOIN
[Order Details] AS OD
ON OD.OrderID = O.OrderID
GROUP BY 


-- JOINS 
-- VISTAR INDICES-
-- STORES Y TRIGERS
-- 