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