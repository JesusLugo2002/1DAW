# Tarea 3 - Trabajando con Join's

<div align=center>

![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

<div align=justify>

## Migración de datos

Los principales cambios realizados en el fichero .sql dado, para que fuese compatible con el modelo de MySql y la actividad propuesta, fueron:
1. Añadir el `create database if not exists tarea3;` y `use tarea3;` para crear la base de datos sobre la que se trabajará.
2. Añadir la línea `drop table if not exists` por encima de cada definición de tabla.
3. Cambiar el tipo __DECIMAL__ a __FLOAT__.

Si quiere ver los archivos, se los dejo a continuación:
- [Versión Sqlite](./files/tarea3-base.sql)
- [Versión MySql](./files/tarea3.sql)

## Realiza las siguientes consultas

- Mostrar todos los clientes.
```sql
select * from clientes;
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
```

- Mostrar todas las órdenes.
```sql
select * from ordenes;
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
|        2 |          2 | 2024-03-02  |
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+
```

- Mostrar todos los productos.
```sql
select * from productos;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           1 | Producto A      |              50 |
|           2 | Producto B      |              75 |
|           3 | Producto C      |             100 |
+-------------+-----------------+-----------------+
```

- Mostrar todos los detalles de las órdenes.
```sql
select * from detalles_ordenes;
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          1 |        1 |           1 |        2 |
|          2 |        2 |           2 |        1 |
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+
```

- Mostrar los primeros 5 clientes ordenados por nombre.
```sql
select * from clientes order by nombre_cliente limit 5;
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
```

- Mostrar los productos con un precio mayor a 50.
```sql
select * from productos where precio_producto > 50;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           2 | Producto B      |              75 |
|           3 | Producto C      |             100 |
+-------------+-----------------+-----------------+
```

- Mostrar todas las órdenes realizadas por el cliente con ID 1.
```sql
select * from ordenes where id_cliente = 1;
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
+----------+------------+-------------+
```

- Mostrar los clientes cuyos nombres comienzan con la letra "A".
```sql
select * from clientes where nombre_cliente regexp '^A';
```
> No se arroja resultado porque no se cumplen los requisitos.

- Mostrar las órdenes que contienen más de 2 productos.
```sql
select o.* from ordenes as o join detalles_ordenes as d on o.id_orden = d.id_orden where d.cantidad > 2; 
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+
```

- Mostrar los productos ordenados por precio de forma descendente.
```sql
select * from productos order by precio_producto desc;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           3 | Producto C      |             100 |
|           2 | Producto B      |              75 |
|           1 | Producto A      |              50 |
+-------------+-----------------+-----------------+
```

- Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes.
```sql
select c.*, o.id_orden, o.fecha_orden from clientes as c left join ordenes as o on c.id_cliente = o.id_cliente;
+------------+----------------+----------------+----------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | fecha_orden |
+------------+----------------+----------------+----------+-------------+
|          1 | Juan           | Ciudad A       |        1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 | 2024-03-03  |
+------------+----------------+----------------+----------+-------------+
```

- Seleccionar todas las órdenes junto con los productos correspondientes.
```sql
select o.*, p.* from ordenes as o join detalles_ordenes as d on o.id_orden = d.id_orden join productos as p on d.id_producto = p.id_producto;
+----------+------------+-------------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |           1 | Producto A      |              50 |
|        2 |          2 | 2024-03-02  |           2 | Producto B      |              75 |
|        3 |          3 | 2024-03-03  |           3 | Producto C      |             100 |
+----------+------------+-------------+-------------+-----------------+-----------------+
```

- Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50.
```sql
select c.nombre_cliente from clientes as c join ordenes as o on c.id_cliente = o.id_cliente join detalles_ordenes as d on o.id_orden = d.id_orden join productos as p on d.id_producto = p.id_producto where p.precio_producto > 50;
+----------------+
| nombre_cliente |
+----------------+
| María          |
| Pedro          |
+----------------+
```

- Obtener el nombre de los productos que no se han ordenado aún.
```sql
select nombre_producto from productos where id_producto not in (select id_producto from detalles_ordenes);
```
> No se arrojan resultados porque no se cumplen los requisitos.

- Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes.
```sql
select c.nombre_cliente, p.nombre_producto, d.cantidad from ordenes as o join clientes as c on o.id_cliente = c.id_cliente join detalles_ordenes as d on o.id_orden = d.id_orden join productos as p on d.id_producto = p.id_producto;
+----------------+-----------------+----------+
| nombre_cliente | nombre_producto | cantidad |
+----------------+-----------------+----------+
| Juan           | Producto A      |        2 |
| María          | Producto B      |        1 |
| Pedro          | Producto C      |        3 |
+----------------+-----------------+----------+
```

- Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos.
```sql
select p.nombre_producto, c.nombre_cliente from clientes as c join ordenes as o on c.id_cliente = o.id_cliente join detalles_ordenes as d on d.id_orden = o.id_orden join productos as p on p.id_producto = d.id_producto;
+-----------------+----------------+
| nombre_producto | nombre_cliente |
+-----------------+----------------+
| Producto A      | Juan           |
| Producto B      | María          |
| Producto C      | Pedro          |
+-----------------+----------------+
```

- Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes.
```sql
select d.*, c.id_cliente, c.nombre_cliente, p.nombre_producto, p.precio_producto from ordenes as o right join clientes as c on o.id_cliente = c.id_cliente join detalles_ordenes as d on d.id_orden = o.id_orden join productos as p on d.id_producto = p.id_producto;
+------------+----------+-------------+----------+------------+----------------+-----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | id_cliente | nombre_cliente | nombre_producto | precio_producto |
+------------+----------+-------------+----------+------------+----------------+-----------------+-----------------+
|          1 |        1 |           1 |        2 |          1 | Juan           | Producto A      |              50 |
|          2 |        2 |           2 |        1 |          2 | María          | Producto B      |              75 |
|          3 |        3 |           3 |        3 |          3 | Pedro          | Producto C      |             100 |
+------------+----------+-------------+----------+------------+----------------+-----------------+-----------------+
```

- Obtener el nombre de los clientes junto con el número total de órdenes que han realizado.
```sql
select c.nombre_cliente, count(o.id_orden) as total_ordenes from clientes as c join ordenes as o on c.id_cliente = o.id_cliente group by c.id_cliente;
+----------------+---------------+
| nombre_cliente | total_ordenes |
+----------------+---------------+
| Juan           |             1 |
| María          |             1 |
| Pedro          |             1 |
+----------------+---------------+
```

- Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto.
```sql
select distinct * from (select c.*, o.id_orden, o.fecha_orden from clientes as c left join ordenes as o on c.id_cliente = o.id_cliente union all select c.*, o.id_orden, o.fecha_orden from clientes as c right join ordenes as o on c.id_cliente = o.id_cliente) as consulta;
+------------+----------------+----------------+----------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | fecha_orden |
+------------+----------------+----------------+----------+-------------+
|          1 | Juan           | Ciudad A       |        1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 | 2024-03-03  |
+------------+----------------+----------------+----------+-------------+
```

- Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
```sql
select o.*, p.nombre_producto, c.nombre_cliente from ordenes as o left join clientes as c on o.id_cliente = c.id_cliente join detalles_ordenes as d on o.id_orden = d.id_orden join productos as p on p.id_producto = d.id_producto;
+----------+------------+-------------+-----------------+----------------+
| id_orden | id_cliente | fecha_orden | nombre_producto | nombre_cliente |
+----------+------------+-------------+-----------------+----------------+
|        1 |          1 | 2024-03-01  | Producto A      | Juan           |
|        2 |          2 | 2024-03-02  | Producto B      | María          |
|        3 |          3 | 2024-03-03  | Producto C      | Pedro          |
+----------+------------+-------------+-----------------+----------------+
```

- Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados.
```sql
select p.nombre_producto, c.nombre_cliente from clientes as c join ordenes as o on c.id_cliente = o.id_cliente join detalles_ordenes as d on o.id_orden = d.id_orden right join productos as p on d.id_producto = p.id_producto;
+-----------------+----------------+
| nombre_producto | nombre_cliente |
+-----------------+----------------+
| Producto A      | Juan           |
| Producto B      | María          |
| Producto C      | Pedro          |
+-----------------+----------------+
```

- Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos.
```sql
select o.*, c.nombre_cliente, p.nombre_producto from ordenes as o join detalles_ordenes as d on o.id_orden = d.id_orden left join productos as p on p.id_producto = d.id_producto join clientes as c on c.id_cliente = o.id_cliente;
+----------+------------+-------------+----------------+-----------------+
| id_orden | id_cliente | fecha_orden | nombre_cliente | nombre_producto |
+----------+------------+-------------+----------------+-----------------+
|        1 |          1 | 2024-03-01  | Juan           | Producto A      |
|        2 |          2 | 2024-03-02  | María          | Producto B      |
|        3 |          3 | 2024-03-03  | Pedro          | Producto C      |
+----------+------------+-------------+----------------+-----------------+
```

- Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
```sql
select c.nombre_cliente, count(o.id_orden) as total_ordenes from clientes as c left join ordenes as o on c.id_cliente = o.id_cliente group by c.id_cliente;
+----------------+---------------+
| nombre_cliente | total_ordenes |
+----------------+---------------+
| Juan           |             1 |
| María          |             1 |
| Pedro          |             1 |
+----------------+---------------+
```

- Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.
```sql
select o.*, c.nombre_cliente, c.ciudad_cliente, p.nombre_producto, p.precio_producto from ordenes as o left join clientes as c on o.id_cliente = c.id_cliente join detalles_ordenes as d on d.id_orden = o.id_orden right join productos as p on p.id_producto = d.id_producto;
+----------+------------+-------------+----------------+----------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | nombre_cliente | ciudad_cliente | nombre_producto | precio_producto |
+----------+------------+-------------+----------------+----------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  | Juan           | Ciudad A       | Producto A      |              50 |
|        2 |          2 | 2024-03-02  | María          | Ciudad B       | Producto B      |              75 |
|        3 |          3 | 2024-03-03  | Pedro          | Ciudad C       | Producto C      |             100 |
+----------+------------+-------------+----------------+----------------+-----------------+-----------------+
```

- Realizar un inner join entre clientes y órdenes.
```sql
select o.*, c.nombre_cliente, c.ciudad_cliente from clientes as c join ordenes as o on o.id_cliente = c.id_cliente;
+----------+------------+-------------+----------------+----------------+
| id_orden | id_cliente | fecha_orden | nombre_cliente | ciudad_cliente |
+----------+------------+-------------+----------------+----------------+
|        1 |          1 | 2024-03-01  | Juan           | Ciudad A       |
|        2 |          2 | 2024-03-02  | María          | Ciudad B       |
|        3 |          3 | 2024-03-03  | Pedro          | Ciudad C       |
+----------+------------+-------------+----------------+----------------+
```

- Realizar un left join entre órdenes y detalles de órdenes.
```sql
select d.*, o.id_cliente, o.fecha_orden from ordenes as o left join detalles_ordenes as d on d.id_orden = o.id_orden;
+------------+----------+-------------+----------+------------+-------------+
| id_detalle | id_orden | id_producto | cantidad | id_cliente | fecha_orden |
+------------+----------+-------------+----------+------------+-------------+
|          1 |        1 |           1 |        2 |          1 | 2024-03-01  |
|          2 |        2 |           2 |        1 |          2 | 2024-03-02  |
|          3 |        3 |           3 |        3 |          3 | 2024-03-03  |
+------------+----------+-------------+----------+------------+-------------+
```

- Realizar un right join entre productos y detalles de órdenes.
```sql
select p.nombre_producto, p.precio_producto, d.* from productos as p right join detalles_ordenes as d on p.id_producto = d.id_producto;
+-----------------+-----------------+------------+----------+-------------+----------+
| nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-----------------+-----------------+------------+----------+-------------+----------+
| Producto A      |              50 |          1 |        1 |           1 |        2 |
| Producto B      |              75 |          2 |        2 |           2 |        1 |
| Producto C      |             100 |          3 |        3 |           3 |        3 |
+-----------------+-----------------+------------+----------+-------------+----------+
```

- Realizar un full join entre clientes y órdenes. 
```sql
select distinct * from (select c.*, o.id_orden, o.fecha_orden from clientes as c left join ordenes as o on c.id_cliente = o.id_cliente union all select c.*, o.id_orden, o.fecha_orden from clientes as c right join ordenes as o on c.id_cliente = o.id_cliente) as consulta;
+------------+----------------+----------------+----------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | fecha_orden |
+------------+----------------+----------------+----------+-------------+
|          1 | Juan           | Ciudad A       |        1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 | 2024-03-03  |
+------------+----------------+----------------+----------+-------------+
```

- Realizar un full join entre órdenes y detalles de órdenes.
```sql
select distinct * from (select d.*, o.fecha_orden from ordenes as o left join detalles_ordenes as d on d.id_orden = o.id_orden union all select d.*, o.fecha_orden from ordenes as o right join detalles_ordenes as d on d.id_orden = o.id_orden) as consulta;
+------------+----------+-------------+----------+-------------+
| id_detalle | id_orden | id_producto | cantidad | fecha_orden |
+------------+----------+-------------+----------+-------------+
|          1 |        1 |           1 |        2 | 2024-03-01  |
|          2 |        2 |           2 |        1 | 2024-03-02  |
|          3 |        3 |           3 |        3 | 2024-03-03  |
+------------+----------+-------------+----------+-------------+
```

- Realizar un full join entre productos y detalles de órdenes.
```sql
select distinct * from (select d.*, p.nombre_producto, p.precio_producto from productos as p left join detalles_ordenes as d on d.id_producto = p.id_producto union all select d.*, p.nombre_producto, p.precio_producto from productos as p right join detalles_ordenes as d on d.id_producto = p.id_producto) as consulta;
+------------+----------+-------------+----------+-----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | nombre_producto | precio_producto |
+------------+----------+-------------+----------+-----------------+-----------------+
|          1 |        1 |           1 |        2 | Producto A      |              50 |
|          2 |        2 |           2 |        1 | Producto B      |              75 |
|          3 |        3 |           3 |        3 | Producto C      |             100 |
+------------+----------+-------------+----------+-----------------+-----------------+
```
