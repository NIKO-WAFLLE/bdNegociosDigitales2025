# views- transact-funciones- cadena
> **Views:** Son consultas guardadas como vistas virtuales. Facilitan el acceso a datos complejos, mejoran la seguridad y no almacenan información, solo muestran resultados predefinidos.

> **Transact-SQL:** Es el lenguaje extendido de SQL en SQL Server. Permite programar con variables, condiciones y ciclos para crear consultas más dinámicas y procedimientos.

> **Funciones:** Son bloques que realizan cálculos y devuelven resultados. Pueden ser escalares o de tabla, y ayudan a reutilizar lógica dentro de consultas o procedimientos.

> **Funciones de cadena:** Manipulan texto en SQL. Permiten contar, reemplazar, extraer o convertir letras, facilitando el trabajo con datos de tipo texto.

![cadeas](../img/FuncionesDeCadena.jpg)

```sql
-- funciones de cadena

-- las funciones de cadena permite manipular tipos de datos
-- como VARCHAR, NVVARCHAR,  CHAR, NCHAR

-- FUNCION LEN -> DEVUELVE LA LONGITUD DE UNA CADENA

--DECLARACION DE UNA VARIABLE


DECLARE @NUMERO INT;
SET @NUMERO = 10;
PRINT @NUMERO



--OBTENER EL TAMA�O DE LA CADENA ALMACENADA EN LA VARIABLE TETO
DECLARE @TEXTO VARCHAR(50) = 'HOLA, MUNDO!'
SELECT LEN(@TEXTO) AS [LONGITUD]

SELECT CompanyName, LEN(CompanyName) AS LONGITUD FROM Customers
ORDER BY 2 DESC

-- LEFT -> EXTRAE UN NUMERO DE CARACTERES UN DETERMINADO 
-- NUMERO DE CARACTERES DESDE EL INICIO DE LA CADENA 

SELECT LEFT(@TEXTO,4) AS INICIO

-- RIGHT -> EXTRAE UNNUMERO DECARACTERES DETERMINADO
-- NUMERO DE CARACTERES DEL FINAL DE LA CADENA 
GO

DECLARE @TEXTO VARCHAR(50) = 'HOLA, MUNDO!'
SELECT LEN(@TEXTO) AS [LONGITUD]
SELECT RIGHT(@TEXTO,6) AS FINAL
--SUBSTRIG -> EXTRAE UNAPARTE DE LA CADENA, 
-- DONDE EL PRIMER PARAMETRO ES LA POSICION INICIAL Y E
-- SEGUNDO ES EL RECORRIDO 

SELECT SUBSTRING(@TEXTO,7,5) AS MEOW

--RENPLACE  -> REMPLAZA UNA SUBCADENA POR OTRA 
-- REMPLASE (STRING_EXPRESSION 2)
SELECT REPLACE(@TEXTO, 'MUNDO', 'AMIGO')

--CHARINDEX -> DA LA POSICION DEL TEXTO
DECLARE @TEXTO2 VARCHAR(50) = 'HOLA, MUNDO!'
SELECT CHARINDEX('MUNDO',@TEXTO2)

--UPPER ->CONVIERTE UNA CADENA EN MAYUSCULAS
go
DECLARE @TEXTO2 VARCHAR(50) = 'HOLA, mundo!'

SELECT UPPER(@TEXTO2) AS MAYUSCULAS
SELECT UPPER(SUBSTRING(@TEXTO2,7,5)) AS MAYUSCULAS

SELECT	concat(left(@TEXTO2,5 )	, ' ', UPPER(SUBSTRING(@TEXTO2,7,6))) AS MAYUSCULAS
-- select trim ('    test     ') as result
--	trim ->quita espacios en blanco de una cadena pero solo de derecha e izquierda
go
DECLARE @TEXTO2 VARCHAR(50) = '             HOLA,   mundo!            '
select ltrim (@TEXTO2) as result

select rtrim (@TEXTO2) as result

select trim (@TEXTO2) as result
go




SELECT CompanyName, LEN(CompanyName) AS 'NUMERO DE CARACTERES',
LEFT(CompanyName,4) AS INICIO,
RIGHT(CompanyName,6) AS FINAL,
SUBSTRING(COMPANYNAME,7,5) AS MEOW
FROM Customers
ORDER BY 2 ASC
go

select c.CompanyName, upper(c.CompanyName) from Customers as c

update Customers
set CompanyName = upper (CompanyName)
where Country in ('mexico', 'germany') 

select * from Customers
where Country in ('mexico', 'germany') 
```