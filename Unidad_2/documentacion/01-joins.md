# Inner join 
![Inner join ](../img/img_inner_join.png)

```sql
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

--11  listar los clientes y la cantidad de pedidos que han realizado
/*
SELECT   
	c.ContactName, 
    SUM(od.Quantity) AS TotalQuantity 
	*/
FROM Customers AS C
INNER JOIN
Orders AS O
ON C.CustomerID =  O.CustomerID
INNER JOIN 
[Order Details] AS OD
ON OD.OrderID = O.OrderID
GROUP BY C.ContactName
--

SELECT 
    c.ContactName, 
    SUM(od.Quantity) AS TotalQuantity
FROM Customers AS C
INNER JOIN 
Orders AS O 
ON C.CustomerID = O.CustomerID
INNER JOIN 
[Order Details] AS OD
ON OD.OrderID = O.OrderID
GROUP BY c.ContactName;
---

select 
c.CompanyName as [cliente],
COUNT(*) as [numero de ordenes ]
from 
Customers as c
inner join orders as o
on c.CustomerID = o.CustomerID
group by c.CompanyName
order by COUNT(*) desc 


--12. obtener los empleados que han gestionado pedidos enviados a alemania 

SELECT distinct 
CONCAT  (e.FirstName, '', e.LastName) as empleado ,  o.ShipCountry
FROM Employees AS E
INNER JOIN 
Orders AS O 
ON o.EmployeeID = e.EmployeeID
where o.ShipCountry = 'Germany'



--13. listar los productos junto con el nombre del provedor y el pais de origen 

select p.ProductID, p.ProductName, s.CompanyName as provedor, s.Country from 
Products as p
inner join 
Suppliers as s
on p.SupplierID = s.SupplierID
order by 2 asc

--14.	 obtener los pedidos agrupados por pais de envio

SELECT o.ShipCountry, COUNT(o.OrderID) as pedidos from orders as o group by o.ShipCountry



--15.	 obtener los empleados y la cantidad de territorios en lo que trabajan

select concat(e.FirstName, '', e.LastName) as nombre, 
count (et.TerritoryID) as 'cantidad territorios'
from 
Employees as e
inner join EmployeeTerritories as et
on e.EmployeeID= et.EmployeeID
group by concat(e.FirstName, '', e.LastName) 

--

/*
select concat(e.FirstName, '', e.LastName) as nombre, t.TerritoryDescription,
count (et.TerritoryID) as 'cantidad territorios'
from 
Employees as e
inner join EmployeeTerritories as et
on e.EmployeeID= et.EmployeeID
inner join
Territories as t
on et.EmployeeID = t.territoryId
group by concat(e.FirstName, '', e.LastName)

--
select  concat (e.FirstName, '', e.LastName),  t.TerritoryID
from Employees as e
inner join 
EmployeeTerritories as Te
on e.EmployeeID = te.TerritoryID
inner join 
Territories as t
on te.TerritoryID = t.TerritoryID 
order by concat (e.FirstName, '', e.LastName)
--
SELECT E.FirstName, T. FROM 
EmployeeTerritories AS ET
INNER JOIN
Territories AS T
ON ET.TerritoryID = T.TerritoryID
INNER JOIN 
Employees AS E
INNER JOIN 
Region AS R
ON R.RegionID = T.Regionis
ON E.EmployeeID = ET.EmployeeID

*/
SELECT * FROM Territories

--16.	 listar las categorias y la cantidad de productos que contienen 

SELECT E.CategoryName, count(p.ProductID)FROM 
Categories AS E
INNER JOIN
Products AS P
ON E.CategoryID = P.CategoryID
group by e.CategoryName
ORDER BY 1 ASC

-- 17 .obtener la cantidad total de productos ventidos por provedor 

select s.CompanyName, sum(od.Quantity) as 'total de productos vendidos '  from 
Suppliers as s
inner join
Products as p
on s.SupplierID = p.SupplierID
inner join 
[Order Details] as OD
on od.ProductID = p.ProductID
group by s.CompanyName
order by 2



-- 18. obtener la cantidad de pedidos enviados por cada empresa de transporte

select s.CompanyName,	count (o.OrderID) 'pedidos enviados' from Shippers as s
inner join Orders as o
on s.ShipperID = o.ShipVia
group by s.CompanyName
---

select s.CompanyName ,count(*)as [total de pedios] 
from orders as o
inner join Shippers as s
on o.ShipVia = s.ShipperID
group by s.CompanyName

-- 19 obtenner los clientes que han realizado pedidos con mas de un producto

select c.CompanyName,  SUM(od.Quantity)AS Total , count(distinct ProductID) as [numero productos]  from 
Customers as c
inner join
Orders as o
on c.CustomerID =o.CustomerID
inner join
[Order Details] as OD 
on o.OrderID = od.OrderID
where od.ProductID <= 2
group by c.CompanyName
order by 3 desc

-- 20.-	 LISTAR los empleados con la cantidad de pedidos que han gestionado y a que clientes les han
--	vendido, agrupandolos por nombre completo y dentro de este nombre por cliente,  ordenandolos
--	por la cantidad mayor de pedidos




SELECT
CONCAT(e.FirstName, '', e.LastName) as [nombre], 
count(o.OrderID) as [numero de ordenes], CompanyName
from 
Orders as o
inner join Employees as e
on o.EmployeeID = e.EmployeeID
inner join Customers as c
on o.CustomerID = c.CustomerID
group by e.FirstName, e.LastName, c.CompanyName
order by 2 desc
--

SELECT
CONCAT(e.FirstName, '', e.LastName) as [nombre], 
count(OrderID) as [numero de ordenes], c.CompanyName
from Orders as o
inner join Employees as e
on o.EmployeeID = e.EmployeeID
inner join Customers as c
on o.CustomerID = c.CustomerID
group by e.FirstName, e.LastName, c.CompanyName
order by 2 desc
--

select concat(e.FirstName, '', e.LastName) as [nombre] 
,Count(*) as [numero de ordenes]
from Orders as o
inner join Employees as e
on o.EmployeeID = e.EmployeeID
group by e.FirstName, e.LastName
order by [nombre] asc
-- 21 listar las categorias con el total de ingresos generados por sus productos 


select c.CategoryID, c.CategoryName, p.ProductName,	
sum(od.Quantity * od.UnitPrice) as 'total vendido' from 
Categories as c
inner join  
Products as p
on c.CategoryID = p.CategoryID
inner join 
[Order Details] as od
on p.ProductID= od.ProductID
group by c.CategoryID, c.CategoryName, p.ProductName
order by 1 desc, p.ProductName asc

--22. listar los clientes con el total de $ gastado en pedidos 
select c.CompanyName, o.OrderID, sum(od.Quantity) 'dinero gasrado' from 
Customers as c
inner join 
Orders as o
on c.CustomerID = o.CustomerID
inner join 
[Order Details] as od
on  o.OrderID = od.OrderID
group by c.CompanyName, o.OrderID;

--23. listar los pedidos realizados entre el 1 de enero de 1997 y 
-- el 30 de junio de 1997 y mostrar el total en dinero 

select o.OrderID , od.Quantity, o.OrderDate
from orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
where o.OrderDate between '1997-1-1' and '1997-6-30' 
group by  o.OrderID, od.Quantity,  o.OrderDate

--24 listar los productos con las categorias Beverages, seafood, confetions

--
select c.CategoryName, p.ProductName from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID 
where c.CategoryName in ('Beverages', 'seafood', 'confetions')

--25-	listar los clientes ubicados en alemania 
--		y que hayan realizado pedidos antes del 1 de enero de 1997

select c.CompanyName, o.OrderID, c.Country from Customers as c
inner join Orders as o 
on c.CustomerID = o.CustomerID
where o.OrderDate < '1997-1-1' and c.Country = 'Germany'


-- 26.	listar los clientes que han realizado pedidos con un total entre $500 y $2000
-- 

select c.CompanyName, sum(od.Quantity * od.UnitPrice) as vendido from Customers as c
inner join 
Orders as o
on c.CustomerID = o.CustomerID
inner join 
[Order Details] as od
on o.OrderID = od.OrderID
where (od.Quantity * od.UnitPrice) between 500 and 1000
group by  c.CompanyName
order by 2 desc
---
select c.CompanyName, sum(od.Quantity * od.UnitPrice) from Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join  [Order Details] as od
on od.OrderID = o.OrderID
group by c.CompanyName
--
select c.CompanyName, sum(od.Quantity * od.UnitPrice)  as total from Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join  [Order Details] as od
on od.OrderID = o.OrderID
group by c.CompanyName
having sum (od.Quantity * od.UnitPrice) between 500 and 3500

-- consultas avanzadas
-- les


```

> 20/02/2025
-- JOINS, left 
-- STORES Y TRIGERS
-- VISTAR INDICES