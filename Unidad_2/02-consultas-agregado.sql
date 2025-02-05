-- consultas de agregado 
-- nota solo devuelven un solo gistro
-- sum, avg, count, count(*), max y min

-- cuants clientes tengo
USE Northwind;

select count(*) as 'Numero de clientes' 
from Customers;

-- cuanras regiones hay 

select count (Region) from Customers
where Region is null


select count (*) from Customers
where Region is null

select Region from Customers
where Region is not null 
order by Region asc;

select COUNT(distinct Region) as regiones from Customers
where region is not null