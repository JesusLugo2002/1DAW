# Tarea 1 - Migración y primeros pasos en MySql

<div align=center>

![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

## Conversión del fichero de Sqlite3 a MySql

Los cambios principales realizados fueron:
- Se crean las líneas `CREATE DATABASE IF NOT EXISTS tarea1;` y `USE tarea1;` para crear y usar la base de datos donde se trabajará.
- Cambiar el tipo de dato __Integer__ a __Int__.
- Reescribir el parámetro __AUTOINCREMENT__ a __AUTO_INCREMENT__.
- Reorganizar el orden de los parámetros, colocando __AUTO_INCREMENT__ antes del __PRIMARY KEY__.
- Añadir la línea del `DROP TABLE IF EXISTS` para cada una de las tablas.

Si quiere ver los archivos _.sql_, estos son:
- [Versión Sqlite3](./files/tarea1-base.sql)
- [Versión MySql](./files/tarea1.sql)

## Consultas

Tras realizar la migración de datos con `source tarea1.sql`, se hacen las siguientes consultas:

- Mostrar todos los usuarios.
```sql
select * from usuarios;
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
```

- Mostrar todos los productos.
```sql
select * from productos;
+----+-----------+--------+----------+
| id | nombre    | precio | cantidad |
+----+-----------+--------+----------+
|  1 | Camisa    |  25.99 |      100 |
|  2 | Pantalón  |  35.50 |       80 |
|  3 | Zapatos   |  59.99 |       50 |
+----+-----------+--------+----------+
```

- Mostrar todos los pedidos.
```sql
select * from pedidos;
+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  1 |          1 |           1 |        2 | 2024-03-01   |
|  2 |          2 |           2 |        1 | 2024-03-02   |
|  3 |          3 |           3 |        3 | 2024-03-03   |
+----+------------+-------------+----------+--------------+
```

- Mostrar los usuarios que tienen más de 25 años.
```sql
select * from usuarios where edad > 25;
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
```

- Mostrar los productos con un precio mayor a 50.
```sql
select * from productos where precio > 50;
+----+---------+--------+----------+
| id | nombre  | precio | cantidad |
+----+---------+--------+----------+
|  3 | Zapatos |  59.99 |       50 |
+----+---------+--------+----------+
```

- Mostrar los pedidos realizados el día de hoy.
```sql
select * from pedidos where fecha_pedido = date(now());
```
> No se arroja resultados pues no se cumplen los requisitos.

- Mostrar el total de productos en stock.
```sql
select sum(cantidad) as total_stock from productos;
+-------------+
| total_stock |
+-------------+
|         230 |
+-------------+
```

- Mostrar el promedio de edades de los usuarios.
```sql
select avg(edad) as edad_promedio from usuarios;
+---------------+
| edad_promedio |
+---------------+
|       27.6667 |
+---------------+
```

- Mostrar los usuarios que tienen la letra 'a' en su nombre
```sql
select * from usuarios where nombre regexp '[a|A]';
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
+----+--------+------+-------------------+
```

- Mostrar los productos ordenados por precio de forma descendente.
```sql
select * from productos order by precio desc;
+----+-----------+--------+----------+
| id | nombre    | precio | cantidad |
+----+-----------+--------+----------+
|  3 | Zapatos   |  59.99 |       50 |
|  2 | Pantalón  |  35.50 |       80 |
|  1 | Camisa    |  25.99 |      100 |
+----+-----------+--------+----------+
```

- Mostrar los pedidos realizados por el usuario con ID 2.
```sql
select * from pedidos where usuario_id = 2;
+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  2 |          2 |           2 |        1 | 2024-03-02   |
+----+------------+-------------+----------+--------------+
```

- Mostrar los usuarios ordenados por edad de forma ascendente.
```sql
select * from usuarios order by edad;
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  3 | Pedro  |   28 | pedro@example.com |
|  2 | María  |   30 | maria@example.com |
+----+--------+------+-------------------+
```

- Mostrar los productos con un precio entre 20 y 50.
```sql
select * from productos where precio between 20 and 50;
+----+-----------+--------+----------+
| id | nombre    | precio | cantidad |
+----+-----------+--------+----------+
|  1 | Camisa    |  25.99 |      100 |
|  2 | Pantalón  |  35.50 |       80 |
+----+-----------+--------+----------+
```

- Mostrar los usuarios que tienen un correo de dominio 'example.com'.
```sql
select * from usuarios where correo regexp '@example.com$';
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
```

- Mostrar los pedidos con una cantidad mayor a 2
```sql
select * from pedidos where cantidad > 2;
+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  3 |          3 |           3 |        3 | 2024-03-03   |
+----+------------+-------------+----------+--------------+
```
