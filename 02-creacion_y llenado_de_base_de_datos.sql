create database tienda1;

use tienda1;

create table categoria(
	categoriaid int not null,
	nombre varchar(20) not null,
	constraint pk_categoria
	primary key (categoriaid),
	constraint unico_nombre
	unique (nombre)
);

--sql lmd
--agregar registros a la tabla

insert into categoria
values(1,'carnes frias');

insert into categoria(categoriaid,nombre)
values(2, 'linea blanca');

insert into categoria(nombre,categoriaid)
values('vinos y  licores', 3);

insert into categoria
values( 4, 'ropa'),
		(5,'dulces'),
		(6,'lacteos');

insert into categoria(nombre,categoriaid)
values('panaderia', 7),
		('zapateria',8),
		('jugeteria',9);

select * from categoria
order by categoriaid asc;