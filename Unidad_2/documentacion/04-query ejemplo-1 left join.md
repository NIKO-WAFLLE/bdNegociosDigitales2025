# query ejemplo, left join

![Leftjoin](../img/img_left_join.png)
```sql
drop table products_new
-- crear una tabla apartir de una consulta 

select 
p.ProductID,p.ProductName,
[cu].CompanyName ,
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() as 'inserted_date'
into products_new
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as cu
on [cu].CustomerID = o.CustomerID

select * from products_new

-- crear la tabla sin registros solo la estructura para una tabla 

select top 0
p.ProductID,p.ProductName,
[cu].CompanyName ,
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() as 'inserted_date'
into products_new
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as cu
on [cu].CustomerID = o.CustomerID


select * from products_new

--con alias
drop table products_new
 
select top 0
p.ProductID,p.ProductName as 'nombre producto',
[cu].CompanyName ,
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() as 'inserted_date'
into products_new
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as cu
on [cu].CustomerID = o.CustomerID

select * from products_new

--cargar full


insert into products_new
select  p.ProductID,p.ProductName,
[cu].CompanyName ,
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE()
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as cu
on [cu].CustomerID = o.CustomerID

select * from products_new
--
drop table products_new


select top 0 0 as [productbk], p.ProductID,p.ProductName,
[cu].CompanyName ,
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() as 'inserted_date'
into products_new
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as cu
on [cu].CustomerID = o.CustomerID

select * from products_new

alter table products_new
add constraint pk_products_new
primary key (productbk) 

-- crear la tabla mediante consulta y se crea el campo identidad 
-- y la clave identidad

drop table products_news

select top 0  p.ProductID,p.ProductName,
[cu].CompanyName ,
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() as 'inserted_date'
into products_new
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as cu
on [cu].CustomerID = o.CustomerID

alter table products_new
add productbk int not null

--
alter table products_news
add productbk int not null


 alter table products_news
 add constraint pk_products_news
 primary key�(productbk)
�
insert into products_news
select  p.ProductID, p.ProductName,
[cu].CompanyName ,
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() as 'fecha '
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as cu
on [cu].CustomerID = o.CustomerID

-- nuevo campo en una tabla que sea identity

alter table products_new
add productbk int not null identity(1,1)

-- crear la prymary key

 alter table products_new
 add constraint pk_products_news
 primary key�(productbk)
�

select *  from products_new


-- cargar full a la tabla creada


insert into products_new (ProductID, ProductName,CompanyName, CategoryName, UnitPrice, Discontinued, inserted_date)
select p.ProductID,p.ProductName as [producto],
[cu].CompanyName  as [customer],
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() 
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as [cu]
on [cu].CustomerID�=�o.CustomerID

--- porfe 

drop table products_new

select top 0 p.ProductID, p.ProductName as [producto]
,[cu].CompanyName as [Customer], 
c.CategoryName as [Category], od.UnitPrice, 
p.Discontinued, GETDATE() as 'inserted_date'
into products_new
from Products as p 
inner join 
Categories as c 
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
inner join Customers as [cu]
on [cu].CustomerID = o.CustomerID



alter table products_new
add productbk int not null identity(1,1)

alter table products_new
add constraint pk_products_new
primary key (productbk)
Go


-- Carga Full
insert into products_new (ProductID,producto,Customer,
Category,UnitPrice,Discontinued, inserted_date)
select p.ProductID, p.ProductName
,[cu].CompanyName, 
c.CategoryName, od.UnitPrice, 
p.Discontinued, GETDATE() as 'inserted_date' 
from Products as p 
inner join 
Categories as c 
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
inner join Customers as [cu]
on [cu].CustomerID = o.CustomerID




-- encontrar un nuevo producto por id

select pn.ProductID, pn.producto, pn.Customer,
pn.Category, pn.UnitPrice, pn.Discontinued, pn.inserted_date, 
p.ProductID, p.ProductName
from Products as p
left join
products_new as pn
on p.ProductID = pn.ProductID
where pn.ProductID is null

--carga delta 

select  p.ProductID, p.ProductName as [producto]
,[cu].CompanyName as [Customer], 
c.CategoryName as [Category], od.UnitPrice, 
p.Discontinued, GETDATE() as 'inserted_date', pn.ProductID
from Products as p 
left join 
Categories as c 
on p.CategoryID = c.CategoryID
left join [Order Details] as od
on od.ProductID = p.ProductID
left join Orders as o
on o.OrderID = od.OrderID
left join Customers as [cu]
on [cu].CustomerID = o.CustomerID
left join products_new as pn
on pn.ProductID = p.ProductID
where pn.ProductID is null

--

insert into products_new (ProductID,producto,Customer,
Category,UnitPrice,Discontinued, inserted_date)
select  p.ProductID, p.ProductName as [producto]
,[cu].CompanyName as [Customer], 
c.CategoryName as [Category], od.UnitPrice, 
p.Discontinued, GETDATE() as 'inserted_date'
from Products as p 
left join 
Categories as c 
on p.CategoryID = c.CategoryID
left join [Order Details] as od
on od.ProductID = p.ProductID
left join Orders as o
on o.OrderID = od.OrderID
left join Customers as [cu]
on [cu].CustomerID = o.CustomerID
left join products_new as pn
on pn.ProductID = p.ProductID
where pn.ProductID is null

select *  from products_new as pn
where pn.producto in ('guaracha sabrosa', 'elote feliz')

---repaso left.  right

select top 10 * 
into products2
from Products

select *  from products as p1
inner  join products2 as p2
on p1.ProductID = p2.ProductID

select *  from products as p1
left join products2 as p2
on p1.ProductID = p2.ProductID

select *  from products as p1 
right join products2 as p2 
on p1.ProductID = p2.ProductID

-- store vistas
-- store indice
```