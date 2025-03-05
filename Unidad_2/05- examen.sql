-- 1 - clientes con limite de credito mayor a 5000 y sus representantes

select c.Empresa, Rep_Cli, Limite_Credito, r.Nombre
from Clientes as c
inner join Representantes as r
 on c.Rep_Cli = r.Num_Empl
 where Limite_Credito > 5000

 -- 2 

 select C.Empresa, r.Nombre AS 'REPRESENTANTE CLIENTE', Cantidad, Importe from Clientes as c
 inner join Representantes as r
 on  c.Rep_Cli = r.Num_Empl
 inner join  Pedidos as p
 on  r.Num_Empl = P.Rep
 WHERE Cantidad > 100 OR Importe >5000

 -- 3 
 SELECT o.Ciudad, r.Oficina_Rep, r.Nombre , Region FROM Oficinas AS o
 inner join Representantes as r
 on o.Oficina = r.Oficina_Rep
 where o.Region between 'Este' and 'Oeste'

 -- 4
 select Empresa, Nombre,  Ciudad as localidad  from Clientes as c
 inner join Representantes as r
 on c.Rep_Cli = r.Num_Empl
 inner join Oficinas as o
 on  r.Num_Empl = o.Jef
 where o.Ciudad in ('Navarra' , 'daimiel', 'castellón')

 -- 5
 select c.Limite_Credito ,c.Empresa, r.Nombre AS 'REPRESENTANTE '
 , r.Edad from Representantes as r
 inner join Clientes as c
  on c.Rep_Cli = r.Num_Empl
  order by 1 desc 
  
  --	6
  select c.Empresa,  r.Nombre, count (Num_Pedido) as pedidos 
  from Clientes as c
  inner join Representantes as r
  on  c.Rep_Cli = r.Num_Empl
  inner join Pedidos as p
  on p.Rep = r.Num_Empl
  group by c.Empresa,  r.Nombre
  having  count (Num_Pedido) < 3


  --	7 *
  select r.Nombre as 'empleado',  r.Jefe,
  r.Ventas, o.Oficina, Region from Representantes as r
  inner join Oficinas as o
	on r.Oficina_Rep = o.Oficina
	where r.Ventas > 10000


  --	8 

   select *
   --Empresa, Nombre,  Ciudad as localidad 
   from Clientes as c
 inner join Representantes as r
 on c.Rep_Cli = r.Num_Empl
 inner join Oficinas as o
 on  r.Num_Empl = o.Jef
 

  --	9 

    select P.Producto, p.Fab,  PRO.Descripcion, PRO.Stock
	from Productos  as pro 
  inner join Pedidos as p
  on  Id_fab = p.Fab
  WHERE PRO.Stock < 50


  --	10

   select C.Empresa AS 'CLIENTE' , R.Nombre  as 'NOMBRE DEL REPRESENTANTE'
   , O.Ciudad AS 'CIUDAD ', COUNT (Num_Pedido) AS 'NUMERO PEDIDO'
   from Clientes as c
 inner join Representantes as r
 on c.Rep_Cli = r.Num_Empl
 inner join Oficinas as o
 on  r.Num_Empl = o.Jef
 INNER JOIN Pedidos AS P
 ON R.Num_Empl = P.Rep
GROUP BY   C.Empresa , R.Nombre  , O.Ciudad
  having  count (Num_Pedido) < 3


