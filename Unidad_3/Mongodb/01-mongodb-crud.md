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
db.empliado.insertOne(
    {

    nombre:'soyla',
    aplellido:'house',
    edad:32,
    ciudad: 'tepeji'
            
    }
)