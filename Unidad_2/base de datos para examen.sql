select *  from pedidos 

select * from productos  

select pr.Descripcion, pr.Precio, pr.Id_fab, p.Fab, pr.Id_producto, p.Producto from 
Pedidos as p
inner join
Productos as pr 
on p.Producto = pr.Id_producto
