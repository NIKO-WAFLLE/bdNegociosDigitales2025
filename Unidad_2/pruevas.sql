select *  from
 categorias as c
 inner join Productos as p
 on c.categoriaID = p.cateforiaID


 select *  from
 categorias as c
 left join Productos as p
 on c.categoriaID = p.cateforiaID

  select *  from
Productos as p
 left join categorias as c
 on c.categoriaID = p.cateforiaID

   select c.categoriaID, c.nombre, p.cateforiaID,p.productoID, p.nombre  from
Productos as p
 left join categorias as c
 on c.categoriaID = p.cateforiaID