-- realisar un trigger que se dispare cuando se inserte un pedido y medifique el stock
-- el producto vendifo, verificar si hay suficiente stock suno se cancela el pedido

select * from Pedidos


go


create or alter trigger Tg_PedidosInsertar
on pedidos
after insert
as 
begin

declare @existencia int
declare @fab char(3)
declare @prod char(5)
declare @cantidad int

select @fab = fab, @prod = producto, @cantidad = Cantidad from deleted 

select @existencia = Stock from Productos
where Id_fab = @fab  and Id_producto = @prod;

if @existencia > (select cantidad from inserted)
begin
	update Productos
	set Stock = Stock - @cantidad
	where Id_fab = @fab and 
		  Id_producto = @prod
end

else

begin 
	raiserror ('no hay suficiente stock para el pedido', 16, 1)
	rollback;
	
end

end;

select *  from Pedidos
select max(Num_Pedido)  from Pedidos
select *  from Productos

declare @importe money
select @importe = (p.Cantidad * pr.Precio) 
from Pedidos as p
inner join Productos as pr
ON p.Fab = pr.Id_fab
AND p.Producto = pr.Id_producto


insert into Pedidos (Num_Pedido, Fecha_Pedido, Cliente,
Rep, Fab, Producto, Cantidad, Importe)
values (113071, GETDATE(),2103,106, 'ACI', '41001',77, @importe)


select * from Productos
where Id_fab = 'ACI'
and Id_producto = '41001'
,41001

select *  from Pedidos

-- crear un trigger que cada vez que se elimine un pedido se debe actualizar el stock de los productos
-- con la cantidad eliminada

go

create or alter trigger Tg_PedidosBorrar
on pedidos
after delete
as 
begin

declare @existencia int
declare @fab char(3)
declare @prod char(5)
declare @cantidad int

select @fab = fab, @prod = producto, @cantidad = Cantidad from deleted 

select @existencia = Stock from Productos
where Id_fab = @fab  and Id_producto = @prod;

if @existencia > (select cantidad from deleted)

begin try
	
	update Productos
	set Stock = Stock + @cantidad
	where Id_fab = @fab and 
		  Id_producto = @prod
end try 
	begin catch
	print 'Error inesperado'
	return;
	end catch

else

begin 
	raiserror ('no hay suficiemtes productos', 16, 1)
	rollback;
	
end

end;

