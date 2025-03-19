# Ejercicio de pedidos con store procedure

-   realisar un pedido 
-   validar que el pedido no exista
-    validar que el cliente exista, el empleado y el producto exista,
-    validar que la cantidad a vender tenga sufucuente stock 
-    insertar el pedido y calcular el importe (multiplicando el precio del porducto por la cantidad vendida  actualizar el stock del producto restando el stock menos la cantidad vendida)

```sql

-- realisar un pedido 
--validar que el pedido no exista
-- validar que el cliente exista, el empleado y el producto exista,
-- validar que la cantidad a vender tenga sufucuente stock 
-- insertar el pedido y calcular el importe (multiplicando el precio del porducto
-- por la cantidad vendida)
-- actualizar el stock del producto (restando el stock menos la cantidad vendida)

create or alter proc spu_RealizarPedido
@numPedido int, @cliente int,
@repre int, @fab char(3), 
@proceducto char(5), @cantidad int
as 
begin
	if exists (select 1 from Pedidos where Num_Pedido = @numPedido) -- verificamos si el pedido existe
	begin
	print 'el pedido ya existe'
	return
	end 
	if	not exists (select 1 from Clientes where Num_Cli = @cliente) or -- verificamos si el cliente existe
		not exists (select 1 from Representantes where Num_Empl = @repre) or
		not exists (select 1 from Productos where Id_fab= @fab and Id_producto = @proceducto) 
	begin
	print 'el pedido ya existe'
	return
	end 

	if @cantidad <= 0
	begin 
		print 'la cantidad no puede ser 0 o negativo'
		return ;
	end
	declare @stockvalido int
	select @stockvalido= Stock from Productos
	where Id_fab = @fab and Id_producto = @proceducto

		if @cantidad > @stockvalido
	begin 
		print 'no hay suficiente stock'
		return;
	end
	declare @precio money
	declare @importe money 
	select @precio = Precio  from   Productos where Id_fab = @fab  and Id_producto = @proceducto
	
	set @importe= @cantidad * @precio

	begin try
	-- se inserto un pedido
	insert into Pedidos
	values(@numPedido, GETDATE(), @cliente, @repre, @fab, @proceducto, @cantidad,@importe)

	update Productos
	set Stock = Stock - @cantidad
	where Id_fab = @fab and Id_producto = @proceducto;

	end try
	begin catch
	print 'Error al actualizar datos'
	return;
	end catch
end;

```

## Pruebas

```sql
exec spu_RealizarPedido 
@numPedido = 112961, @cliente = 2117,
@repre = 106, @fab = 'REI' , 
@proceducto = '2A44L', @cantidad = 10


exec spu_RealizarPedido 
@numPedido = 112961, @cliente = 2117,
@repre = 106, @fab = 'REI' , 
@proceducto = '2A44L', @cantidad = 10


exec spu_RealizarPedido 
@numPedido = 112961, @cliente = 2117,
@repre = 106, @fab = 'REI' , 
@proceducto = '2A44L', @cantidad = 10

exec spu_RealizarPedido @numpedido = 113070, @cliente = 2117,
@repre=101, @fab = 'ACI',
@proceducto = '4100X', @cantidad= 20

select * from Productos
where Id_fab = 'ACI' and Id_producto = '4100X'
```