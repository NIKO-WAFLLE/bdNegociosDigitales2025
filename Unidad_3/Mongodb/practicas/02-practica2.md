# Consultas

1. Cargar el archivo empleados.json
```json
db.cursos.insertMany([
	{
		"nombre": "Gregory",
		"apellidos": "Juarez",
		"correo": "nisi.mauris.nulla@google.edu",
		"direccion": "2727 Nec, St.",
		"region": "Mizoram",
		"pais": "Norway",
		"empresa": "Google",
		"ventas": 26890,
		"salario": 3265,
		"departamentos": "Legal Department, Accounting, Media Relations, Research and Development"
	},
	{
		"nombre": "Candace",
		"apellidos": "Buck",
		"correo": "donec.dignissim@google.ca",
		"direccion": "Ap #559-7631 Donec Road",
		"region": "Møre og Romsdal",
		"pais": "India",
		"empresa": "Google",
		"ventas": 1023,
		"salario": 6657,
		"departamentos": "Asset Management, Sales and Marketing, Media Relations"
	},
	{
		"nombre": "Lee",
		"apellidos": "Lyons",
		"correo": "ipsum.cursus@google.ca",
		"direccion": "5505 Aliquet St.",
		"region": "Prince Edward Island",
		"pais": "Peru",
		"empresa": "Borland",
		"ventas": 33530,
		"salario": 8245,
		"departamentos": "Asset Management, Advertising, Human Resources, Tech Support, Payroll"
	},
	{
		"nombre": "Imogene",
		"apellidos": "Nolan",
		"correo": "montes@protonmail.com",
		"direccion": "348-6070 Libero. Avenue",
		"region": "Bicol Region",
		"pais": "Costa Rica",
		"empresa": "Amazon",
		"ventas": 938,
		"salario": 6892,
		"departamentos": "Payroll, Public Relations, Customer Service, Advertising"
	},
	{
		"nombre": "Jana",
		"apellidos": "Sykes",
		"correo": "sed.dolor.fusce@protonmail.com",
		"direccion": "782-7657 Mauris Rd.",
		"region": "Wyoming",
		"pais": "Belgium",
		"empresa": "Yahoo",
		"ventas": 14292,
		"salario": 3912,
		"departamentos": "Customer Relations, Finances, Sales and Marketing, Media Relations"
	},
	{
		"nombre": "Olympia",
		"apellidos": "Ruiz",
		"correo": "accumsan.interdum@icloud.org",
		"direccion": "2330 Cursus Rd.",
		"region": "Catalunya",
		"pais": "Indonesia",
		"empresa": "Finale",
		"ventas": 37972,
		"salario": 8513,
		"departamentos": "Asset Management, Media Relations, Human Resources, Research and Development"
	},
	{
		"nombre": "Sopoline",
		"apellidos": "Cummings",
		"correo": "sed.sapien@protonmail.ca",
		"direccion": "689-6101 Iaculis Ave",
		"region": "Cantabria",
		"pais": "Canada",
		"empresa": "Borland",
		"ventas": 20335,
		"salario": 5504,
		"departamentos": "Accounting, Customer Service, Public Relations, Media Relations, Payroll"
	},
	{
		"nombre": "Omar",
		"apellidos": "Gentry",
		"correo": "non.egestas.a@outlook.edu",
		"direccion": "108-4018 Sit Rd.",
		"region": "Manitoba",
		"pais": "Australia",
		"empresa": "Google",
		"ventas": 2151,
		"salario": 1405,
		"departamentos": "Human Resources, Payroll, Research and Development, Media Relations"
	},
	{
		"nombre": "Kieran",
		"apellidos": "Saunders",
		"correo": "egestas@yahoo.edu",
		"direccion": "938-211 In Ave",
		"region": "Luxemburg",
		"pais": "Pakistan",
		"empresa": "Google",
		"ventas": 39042,
		"salario": 3244,
		"departamentos": "Human Resources, Finances, Advertising, Legal Department, Customer Service"
	},
	{
		"nombre": "Arthur",
		"apellidos": "Hyde",
		"correo": "libero.at@outlook.edu",
		"direccion": "429-2910 Purus Road",
		"region": "Goiás",
		"pais": "France",
		"empresa": "Chami",
		"ventas": 11103,
		"salario": 3180,
		"departamentos": "Asset Management, Customer Relations, Customer Service, Accounting"
	},
	{
		"nombre": "Philip",
		"apellidos": "Herrera",
		"correo": "sit.amet@yahoo.org",
		"direccion": "898-9792 Arcu. Ave",
		"region": "Argyllshire",
		"pais": "Costa Rica",
		"empresa": "Amazon",
		"ventas": 5571,
		"salario": 3873,
		"departamentos": "Legal Department, Customer Relations, Tech Support, Advertising, Asset Management"
	},
	{
		"nombre": "Heidi",
		"apellidos": "Thornton",
		"correo": "nulla.donec@yahoo.edu",
		"direccion": "Ap #901-8129 Sodales. St.",
		"region": "Azad Kashmir",
		"pais": "Turkey",
		"empresa": "Finale",
		"ventas": 38009,
		"salario": 5507,
		"departamentos": "Payroll, Advertising, Finances, Legal Department, Human Resources"
	},
	{
		"nombre": "Jameson",
		"apellidos": "Velazquez",
		"correo": "porttitor.vulputate@protonmail.net",
		"direccion": "P.O. Box 571, 8725 Orci Avenue",
		"region": "Gävleborgs län",
		"pais": "Pakistan",
		"empresa": "Google",
		"ventas": 2543,
		"salario": 8847,
		"departamentos": "Public Relations, Advertising, Customer Relations, Human Resources"
	},
	{
		"nombre": "Meghan",
		"apellidos": "Adams",
		"correo": "auctor.non@hotmail.edu",
		"direccion": "P.O. Box 170, 219 Dignissim St.",
		"region": "Bolívar",
		"pais": "Italy",
		"empresa": "Chami",
		"ventas": 33227,
		"salario": 3675,
		"departamentos": "Sales and Marketing, Human Resources, Quality Assurance, Payroll"
	},
	{
		"nombre": "Jaime",
		"apellidos": "Mejia",
		"correo": "sagittis.placerat.cras@icloud.ca",
		"direccion": "P.O. Box 395, 5762 Auctor Rd.",
		"region": "Troms og Finnmark",
		"pais": "Ukraine",
		"empresa": "Adobe",
		"ventas": 31024,
		"salario": 8110,
		"departamentos": "Advertising, Payroll, Tech Support"
	},
	{
		"nombre": "Anika",
		"apellidos": "Russo",
		"correo": "luctus@protonmail.com",
		"direccion": "P.O. Box 954, 2636 A St.",
		"region": "North Region",
		"pais": "Belgium",
		"empresa": "Borland",
		"ventas": 13004,
		"salario": 6600,
		"departamentos": "Asset Management, Quality Assurance, Media Relations, Research and Development"
	},
	{
		"nombre": "Alexis",
		"apellidos": "Phelps",
		"correo": "libero.integer.in@aol.net",
		"direccion": "Ap #779-6571 Mauris. St.",
		"region": "Calabarzon",
		"pais": "Australia",
		"empresa": "Cakewalk",
		"ventas": 23767,
		"salario": 7945,
		"departamentos": "Asset Management, Advertising, Media Relations"
	},
	{
		"nombre": "Hadassah",
		"apellidos": "Whitney",
		"correo": "eget.ipsum@outlook.com",
		"direccion": "4588 Donec St.",
		"region": "Central Visayas",
		"pais": "Russian Federation",
		"empresa": "Apple",
		"ventas": 8183,
		"salario": 5504,
		"departamentos": "Accounting, Asset Management, Human Resources, Finances"
	},
	{
		"nombre": "Basil",
		"apellidos": "Owens",
		"correo": "varius@protonmail.ca",
		"direccion": "767-1617 Nulla Road",
		"region": "Wielkopolskie",
		"pais": "Sweden",
		"empresa": "Amazon",
		"ventas": 25059,
		"salario": 8816,
		"departamentos": "Accounting, Payroll, Legal Department, Human Resources, Public Relations"
	},
	{
		"nombre": "Brady",
		"apellidos": "Castillo",
		"correo": "suscipit.nonummy.fusce@yahoo.com",
		"direccion": "1321 Suspendisse Ave",
		"region": "Magallanes y Antártica Chilena",
		"pais": "Italy",
		"empresa": "Google",
		"ventas": 14054,
		"salario": 5272,
		"departamentos": "Quality Assurance, Human Resources, Advertising, Sales and Marketing"
	}
	])
```
![Inner join ](../img/Practicas2MongoImg1.png)


2. Utilizar la base de datos curso
    ```json
    use curso
    ```

![Inner join ](../img/PracticasMongoImg2.png)

3. Buscar todos los empleados que trabajen en google
```json
 db.cursos.find({empresa: "Google"}).size()
```
![Inner join ](../img/Practicas2MongoImg3.png)

4. Empleados que vivan en peru
```json
 db.cursos.find({ pais: "Peru"}).size()
```
![Inner join ](../img/Practicas2MongoImg4.png)
5. Empleados que ganen mas de 8000 dolares

```json
 db.curso.find({ salario: {$gt:8000}})
```
![Inner join ](../img/Practicas2MongoImg5.png)
6. Empleados con ventas inferiores a 10000

```json
 db.curso.find({ salario: {$lte:10000}})
```
![Inner join ](../img/Practicas2MongoImg6.png)

7. Realizar la consulta anterior pero devolviendo una sola fila

```json
 db.curso.findOne({ salario: {$lte:10000}})
```
![Inner join ](../img/Practicas2MongoImg7.png)

8. Empleados que trabajan en google o en yahoo con el operador $in
```json
 db.curso.find(
      {
     empresa:{
            $in:["Google", "Yahoo"]
        }
 
 })
```
![Inner join ](../img/Practicas2MongoImg8.png)

9. Empleados de amazon que ganen mas de 8000 dolares

```json
 db.curso.find({ salario: {$gt:8000}})
```
![Inner join ](../img/Practicas2MongoImg9.png)

10. Empleados que trabajan en Google o en Yahoo con el operador $or


```json
 db.curso.find({
        $or:[
          {empresa:"Google"},
          {empresa:"Yahoo"}
           ]
        
     })
```
![Inner join ](../img/Practicas2MongoImg10.png)

11. Empleados que trabajen en Yahoo que ganen mas de 6000 o empleados que trabajen en Google que tengan ventas inferiores a 20000

```json
 db.curso.find({
        $or:[
          {
            empresa:"Google",
             salario: {$gt:8000}
          },
            {
          empresa:"Yahoo",
          salario: {$lt:20000}
            }
           ]
        
     })
```
![Inner join ](../img/Practicas2MongoImg11.png)

12. Visualizar el nombre, apellidos y el país de cada empleado

```json
db.curso.find(
    {},
    {
    nombre: 1,
    apellidos: 1,
    pais: 1
    }.sort(
    {
    nombre: 1,
    apellidos: 1,
     }
    )
)
```

![Inner join ](../img/Practicas2MongoImg12.png)