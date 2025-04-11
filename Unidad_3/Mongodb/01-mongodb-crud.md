# MongoDB Crud

## Crear una base de datos

**solo se crea si contiene por lo menos una coleccion**

```json

use basededatos

```

## crear una colecccion 

`use bd1
db.createCollection('empliado')`

## mostrar collecciones
`show collections`

##insercion de un documento 
db.Empliado.insertOne(
    {

    nombre:'soyla',
    aplellido:'house',
    edad:32,
    ciudad: 'tepeji'
            
    }
)

-   show dbs

## Insercion de un documento mas complejo con array

```json
db.Empleado.insertOne({
    Nombre: 'Ivan',
    Apellido: 'Baltazar',
    Apellido2:'rodriges',
    aficiones: ['Ceveza','canabis','crico','mentir']
    }
)
```

**Eliminar una colecccion**
```json
db.Collection.drop()
```
> Ejemplo
```json
db.empleado.drop()
```

## insercion de documentos mas complejos con documentos aniddos, arrys y ID
> equivalente al select from
```json
db.Collection.find()
```

```json
db.alumnos.InsertOne(
{

    nombre:'marcos',
    apellido:'Ivan',
    apellido:'velazquez',
    ead:20,
    estudios:[
   'tecnico univercitario'
    'ingenieria en entornos virtuales'
    ]
    ,
    experiencia:{
        lengiaje: 'sql',
        sgb:'sqlserver',
        anios_experiencia:20
    }

}
)

db.alumnos.insertOne(
 {
   nombre: 'Jose Luis',
   Apellido1: 'Herrera',
   Apellido2: 'Gallardo',
   edad:41,
   estudios:[
    'Ingeneriia en Sistema Computacionales',
    'Maestria en Administacion de Tecnologia de la Informacion'
   ],
   Experienxia:{
     lenguaje:'sql',
     sgp:'sqlServer',
    anios_Experiencia: 20

   }
 }
 
 )
```


```json
db.alumnos.insertOne({
_id:3,
nombre:'sergio',
apellido:'ramos',
equipo:'monterry',
aficiones:['dinero','hombres','fiesta'],

talentos:{
    futbol:true,
    ducharse:false
}

}
)
```
## insertar multibles docuemtnos 

```json
db.alumnos.insertMany(
[
    {
        _id:12,
        nombre:'osgualdo',
        apellido:'venado',
        edad:20,
        descripcion:'es un quejumbroso'
    },
    {
        nombre: 'maritza',
        apellido:'Rechicken',
        edad:20,
        habilidades:[
            'gostear gente',
            'ilucionar',
            'caguamear'
        ],
        direccion:{
            calle:'del infierno',
            numero:666

        },
        esposos:[
            {
                nombre: 'joshua',
                edad:20,
                pension:-34,
                hijos:['ivan', 'jose']
            },
            {
                nombre:'leo',
                edad:15,
                pension:70,
                complaciente:true
            }
                ]

        

    }
]
)
```
# busquedas, condiciones de igualdad metodo find()
    1. seleccionar todos los libros de la la colleccion libros 

    ```json

        db.libros.find({})

    ```

    2. seleccionar todos los documentos que sean de la editoriar biblio
    
    ```json

        db.libros.find({editorial:'Biblio'})

    ```
    3. Monstrar todos los documentos que el precio sea 25 
    ```json
    db.libros.find({precio:25})
    ```
    4. Seleccionar todos los docuemtnos donde el tirulo sea 
    json para todos
    ```json
    db.libros.find({ titulo: 'JSON para todos'})
    ```

## Operadores de comparacion
[operadores de comparacion](https://www.mongodb.com/docs/manual/reference/operator/query/)

![operadores de compraracion](./img/operadores-Relacionales.png)
.   == $eq

.   >   $gt

.   <   $lt

.   >=  $gte

.   <=  $lte

1. mostrar todos los docuemtnos donde el precio  sea mayor a 25
```json
db.libros.find({precio:{$gt:25}})
```
2. mostrar los docuemtnos donde el precio sea 25
```json
        db.libros.find({precio:{$eq:25}})
        db.libros.find({precio::25})
```
3.mostrar los docuemtnos cuya cantidad sea menor a 5
```json
 db.libros.find({cantidad:{$lte:5}})
```
4. mostrar los documentos que pertenesen a la editorial Biblio o Planeta

```json
db.libros.find(
    {
        editorial:{
            $in:['laneta', 'Biblio']
        }
    }
)
```

5. mostrar todos los docuemtos de libros que cuestan 20 0 25
```json
db.libros.find(
    {
        precio:{
            $in:[20, 25]
        }
    }
)
```
6. recuperar todos los documentos que no cuesten 20 0 25

```json
db.libros.find(
    {
        precio:{
            $nin:[20, 25]
        }
    }
)
```
#recuperar solo una fila (DEvuelve el primer elemento que cumpla la codicion)

7. recuperar solo una fila (devuelve el primer elemento)
```json
db.libros.findOne(
    {
        precio:{
            $in:[20, 25]
        }
    }
)
```
## operadores logicos
[operadores logicos](https://www.mongodb.com/docs/manual/reference/operator/query-logical/)

### Operador AND
- dos posibles opciones
1. la simple, mediante condiciones separadas por comas
    -db.libros.find({condicones1,condicion2,..... }) ->con esto asume es una and
1. usando el operador $and
    { $and: [ { <expression1> }, { <expression2> } , ... ,{<expressionN> } ] }
    - db.libros.find(
        {
        $and:[{condicion!}, {condicion2}]
    }
    )
1.Mostrar todos aquellos libros que cuestan mas de 25 y cuya cantidad sea inferiror a 15
```json
db.libros.find(
    {
        precio:{$gt:25},
        cantidad:{$lt:15}
    }
)
```
```json
db.libros.find(
    {
        $and:[
            {precio:{$gt:25}},
            {cantidad:{$lt:15}}
        ]
    }
)
```
### operador or ($or)
- mostrar todos aquellos libros que cuesten mas de 25 o cuya cantidad sea menor de 15
```json
db.libros.find(
    {
        $or:[
            {
                precio:{$gt:25}
            },
            {
                cantidad:{$lt:15}
            },
        ]
    }
)
```
### ejemplo con AND y OR combinados
- mostrar los libros de la editorial biblio con precio mayor a 40 o librps de la editorial planeta con precio mayor a 30

```json
db.libros.find({
    $and: [
        {
            $or: [
                { editorial: 'Planeta' },
                { editorial: 'Biblio' }
            ]
        },
        { 
            precio: { 
                $gte: 30,
              $lte: 40 
                } 
        }
    ]
})
```
> solucion correcta
```json
db.libros.find(
    {
        $and:[
            {$or:[{editorial:'Biblio'},{precio:{$gt:40}}] },
            {$or:[{editorial:{$eq:'Planeta'}},{precio:{$gt:30}} ]}
        ]
    }
)
```
```json
db.libros.find(
    {
        $and:[
            {$or:[{editorial:'Biblio'},{precio:{$gt:30}}] },
            {$or:[{editorial:{$eq:'Planeta'}},{precio:{$gt:20}} ]}
        ]
    }
)
```
### proyeccion (ver ciertas columnas)
***sintaxis***
bd.coleccion.find{filtro, comlumna}

1. seleccionar todos los libros, solo mostrando el titulo 
db.libros.find({},{titulo:1})
>muestra sin el id

db.libros.find({},{titulo:1,_id:0})
>compas
db.getCollection('libros').find(
  { editorial: 'Planeta' },
  { _id: 0, titulo: 1, editorial: 1, precio: 1 }
);

## operador exists (permite saber si un campo se encuentra o no en un docuemento)
[operador exist](https://www.mongodb.com/docs/manual/reference/operator/query/exists/)

{ field: { $exists: <boolean> } }
```json
db.libros.find(
    {editorial:{$exists:true}}
)
```

```json
db.libros.insertOne(
    {
        _id:10,
        titulo: 'Mongo en negocios digitales',
        editorial: 'Terra',
        precio: '125'

    }
)
```
- buscar todos los documentos que no tengan cantifaf

```json
db.libros.find(
    {cantidad:{$exists:false}}
)
```
## operador time
[operador type](https://www.mongodb.com/docs/manual/reference/operator/query/type/)

-- mostrar todos los documentos donde el precio sea de tipo double o entero o cualquier otro tipo de dato
```
db.libros.find(
    {
    
        precio:{$type:16}
    }
)


db.libros.find(
    {
    
        precio:{$type:'int'}
    }
)

db.libros.insertMany([
    {
        _id:12,
        titulo:'IA',
        editorial:'Terra',
        precio:125,
        cantidad:20
    },
    {
        _id:13,
        titulo:'Python para todos',
        editorial:2001,
        precio:200,
        cantidad:30
    }]
)
---seleccionar todos los docuementos donde la editorial sean strings
db.libros.find(
    {
        editorial:{$type:2}
    }
)

db.libros.find(
    {
        editorial:{$type:'string'}
    }
)

db.libros.find(
    {
        editorial:{$type:16}
    }
)

db.libros.find(
    {
        editorial:{$type:'int'}
    }
)

# Modificando documentos 
## comandos importantens


1. updateOne -> Modificar un solo documento
2. updateMany -> Modificar multiples docuemtnso
3. replaceOne -> Sustituir el contenido completo de un documento
4. tiene el siguiente formato

```json
db.collection.updateOne(
    {filtro},
    {operador:}
)
```
[operadores uptade](https://www.mongodb.com/docs/manual/reference/operator/update/)

***operador $ set***

1. modificar un documento

```json
db.libros.updateOne({
     titulo:'Python para todos',
},
{
    $set:{titulo:'java pata todos'}
}
)
```

-- modificar el documento con id 10, estableciendo el precio en 100 y la cantidad en 50

```json
db.libros.updateOne({
     _id:10,
},
{
    $set:{precio:100,cantidad:50}
}
)
```

--- utilizando el updateMany actualisar todos los libros donde el precio sea mayor a 100 y  cambiarlo por 150 


```json
db.libros.updateMany({
     precio:{$gte:100}
},
{
    $set:{precio:150}
}
)
```

## operadpres $inc y $mul

-- incrementar todos los precios de los libros en 5


```json
db.libros.updateMany(
    {
         editorial:'Terra'
    },
    {
        $inc:{precio:5}
    }
)
```

--- multipplicar todos los libros donde la cantidad sea mayor a 20, multiplicar por 2 ($mul)

```json
db.libros.updateMany(
    {
          cantidad:{$gt:20} 
    },
    {
        $mul:{cantidad:2}
    }
)
```
```json
db.libros.find({_id:{&in:[1,7]}})
```
-- actualizar todos los libros multiplicando por 2 la cantidad y el precio de todos aquellos libros donde el precio sea mayor a 20

```json
db.libros.updateMany(
    {   
        precio:{$gt:20}
    },
    {
        $mul:{cantidad:2,precio:2}
    }
)
```

## remplasar documentos (remplaceOne)

-- actualisar todo el documento del 1d 2 por el titulo de la tierra a la luna del autor julio verne, editorial terra, precio 100

```json
db.libros.replaceOne(
    {_id:12},
    {
        titulo:'De la  tierra a la luna',
        autor:'Juilio verne',
        editorial: 'Terra',
        precio:100
    }
)
```


```json
db.libros.replaceOne(
    {_id:11},
    {
        titulo:'la vida inutil de emilio perez',
        autor:'Juilio verne',
        editorial: 'Terra',
        precio:100
    }
)
```
## borrar documentos

1. deleteOne    -> elimina solo un documento
2- deleteMnay   -> Eliminar multiples documentos

--- eliminar el documento con el id 2 

```json
db.libros.deleteOne(
    {
        _id:2
    }
)
```
--- eliminar todos los libros  donde la cantidad es mayor a 150

```json
db.libros.deleteMany(
    {
        cantidad:{$gt:50}
    }
)
```

## expresiones regulares

-- seleccionar todos los libros que contengan en el titulo una t minuscula 
```json
db.libros.find({titulo:/t/})
```

--- seleccionar todos los libros donde el titulo 
congenga la palabra jason
```json
db.libros.find({titulo:/JSON/})
```


--- selecionar todos los libros  que en el titulo terminen con tos

```json
db.libros.find({titulo:/tos$/})
```

--- seleccionar todos los libros que en el titulo comiensen con j


```json
db.libros.find({titulo:/^J/})
```

## operador $regex
[perador regex](https://www.mongodb.com/docs/manual/reference/operator/query/regex/)

-- seleccionar los libros que tengan la palabra para 
```json
db.libros.find(
    {
        titulo: {$regex:'para'}
    }
)
```
----
```json
db.libros.find(
    {
        titulo: {$regex:/para/}
    }
)
```
-- seleccionar todos los titulos que contengan la palabra json
```json
db.libros.find(
    {
        titulo: {$regex:'JSON'}
    }
)
```
```json
db.libros.find(
    {
        titulo: {$regex:/JSON/}
    }
)
```
-- distingir entre mayuculas y MINUSCULAS
```json
db.libros.find(
    {
        titulo: {$regex:/json/i}
    }
)
```
{ <field>: /pattern/<options> }
```json
db.libros.find(
    {
        titulo: {$regex:/json/,$options:'i'}
    }
)
```
-- seleccionar todos los documentos de libros donde el libro comiense con j y no distinga entre mayusculas y minusculas
```json
db.libros.find(
    {
        titulo: {$regex:/^j/,$options:'i'}
    }
)
```
-- seleccionar todos los documentos de libros donde el libro termine con "es" y no distinga entre mayusculas y minusculas
```json
db.libros.find(
    {
        titulo: {$regex:/es$/,$options:'i'}
    }
)
```


## metodo sort (ordenar documento)

-- ordenar de forma asendente por el precio 

```json
db.libros.find(
    {},
    {
       _id:0,
       titulo:1,
       precio:1

    }).sort({precio:1})
```
-- ordenar de forma desendente por el precio 
```json
db.libros.find(
    {},
    {
       _id:0,
       titulo:1,
       precio:1

    }).sort({precio:-1})
```
-- ordenar los libros de manera asendente por la editorial y de manera desendente por el precio, mostrando el titulo, precio y editorial

```json
db.libros.find(
    {},
    {
       _id:0,
       precio:1,
       editorial:1,
    }).sort(
    {editorial:1, 
     precio:-1
     }
    )
```

## otros metodos skip,  limit, size
### metodos size
- contar los datos que tiene  libros
```json

db.libros.find(
    {}
).size()

```
- contar todos los libros que inician con j mayusculas o minusculas
```json
db.libros.find(
    {
        titulo: {$regex:/^j/,$options:'i'}
    }
).size().limit(2)
```
-- buscar todos los libros pero mostrando los dos primeros  
```json
db.libros.find({}).limit(2)
```
-- saltar los libros
```json
db.libros.find({}).skip(2).limit(2)
```
## borrar colecciones y baces de datos
db.cursos.drop()

bd.dropDatabase()







.   ==  $eq

.   >   $gt

.   <   $it

.   >=  $gte

.   <=  $lte
