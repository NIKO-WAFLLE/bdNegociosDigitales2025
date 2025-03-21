
-- ejercicio 1
select * from [Order Details]
select *  from Orders
go
create schema exma 


create or alter view  exma.ejercicio1
as
select o.OrderID as 'IDorden', OrderDate as 'fecha venta', CONCAT(em.FirstName , ' ', em.LastName)  as
'nombre empleado', c.CompanyName as cliente, c.ContactTitle as 'representante' ,
c.Country as Pais,c.Phone as Telefono, C.City ciudad,
(od.Quantity * od.UnitPrice) as [importe total]  

from [Order Details] as OD
inner join Orders as o
on o.OrderID = OD.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
inner join Employees as em
on o.EmployeeID =  em.EmployeeID
go

select * from  exma.ejercicio1
go
-- ejercicio2
select * from Products
select * from [Order Details]
go

create or alter view exma.ejercicio2
as

select p.ProductID as [ID], p.ProductName as [Nombre Del Producto], p.UnitPrice as [Precio del Producto],
od.Quantity as [Cantidad Vendida], od.UnitPrice as [Precio venta], o.OrderDate [Fecha pedido],
c.CompanyName [Nombre cliente], c.Country as [Pais]
from Products as p
inner join [Order Details] as OD
on p.ProductID = od.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID

go

select *  from exma.ejercicio2
select p.Discontinued
from Products as p 

-- ejercicio 3
select * from Products


go
create or alter proc sp_ActualizarPrecioProducto
@producID int,
@NuevoPrecio money
as
begin 

	if not exists (select 1 from Products  where ProductID = @producID)
		begin 
		print 'el producto no existe'
		return -1;
	end 
	declare @Discontinuado bit
	
		Select @Discontinuado = Discontinued
		from Products where ProductID = @producID
		if @Discontinuado = 0
	begin
		print ('El producto esta discontinuado');
		return -2;
	end
		
		if @NuevoPrecio <=0
	begin 
		print 'la cantidad no puede ser 0 o negativo'
		return ;
	end 
	begin try
		update Products
		set UnitPrice = @NuevoPrecio
		where ProductID = @producID;
		print 'se actualiso corectamente'



	end try
	begin catch
	print 'Error al actualizar datos'
	return -4;
	end catch
	

end;

go

exec sp_ActualizarPrecioProducto @producID=2 , @NuevoPrecio=5

go
--
