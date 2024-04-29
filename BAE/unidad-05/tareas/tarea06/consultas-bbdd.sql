-- Obtener todos los clientes.

select * from clientes;

/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
**/

-- Obtener la cantidad total de productos en todos los pedidos

select sum(cantidad) as total_productos from pedidos;

/**
+-----------------+
| total_productos |
+-----------------+
| 54              |
+-----------------+
**/

-- Obtener el precio promedio de los productos:

select round(avg(precio),2) as avg_precio from productos;

/**
+------------+
| avg_precio |
+------------+
| 188.29     |
+------------+
**/

-- Obtener los clientes que tienen un email válido (contiene '@'):

select * from clientes where email regexp '@';

/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
**/

-- Obtener el producto más caro.

select id, nombre, max(precio) as precio_max from productos;

/**
+----+--------+------------+
| id | nombre | precio_max |
+----+--------+------------+
| 1  | Laptop | 1200.0     |
+----+--------+------------+
**/

-- Obtener los pedidos realizados en febrero de 2024.

select * from pedidos where fecha_pedido regexp '2024-02-';

/**
+-----------+------------+-------------+----------+--------------+
| id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
+-----------+------------+-------------+----------+--------------+
| 1         | 1          | 1           | 2        | 2024-02-01   |
| 2         | 2          | 2           | 1        | 2024-02-02   |
| 3         | 3          | 3           | 3        | 2024-02-03   |
| 4         | 4          | 4           | 1        | 2024-02-04   |
| 5         | 5          | 5           | 2        | 2024-02-05   |
| 6         | 6          | 6           | 1        | 2024-02-06   |
| 7         | 7          | 7           | 3        | 2024-02-07   |
| 8         | 8          | 8           | 2        | 2024-02-08   |
| 9         | 9          | 9           | 1        | 2024-02-09   |
| 10        | 10         | 10          | 2        | 2024-02-10   |
| 11        | 11         | 11          | 1        | 2024-02-11   |
| 12        | 12         | 12          | 3        | 2024-02-12   |
| 13        | 13         | 13          | 1        | 2024-02-13   |
| 14        | 14         | 14          | 2        | 2024-02-14   |
| 15        | 15         | 15          | 1        | 2024-02-15   |
| 16        | 16         | 16          | 3        | 2024-02-16   |
| 17        | 17         | 17          | 2        | 2024-02-17   |
| 18        | 18         | 18          | 1        | 2024-02-18   |
| 19        | 19         | 19          | 2        | 2024-02-19   |
| 20        | 20         | 20          | 1        | 2024-02-20   |
| 21        | 21         | 21          | 3        | 2024-02-21   |
| 22        | 22         | 22          | 1        | 2024-02-22   |
| 23        | 23         | 23          | 2        | 2024-02-23   |
| 24        | 24         | 24          | 1        | 2024-02-24   |
| 25        | 25         | 25          | 3        | 2024-02-25   |
| 26        | 26         | 26          | 2        | 2024-02-26   |
| 27        | 27         | 27          | 1        | 2024-02-27   |
| 28        | 28         | 28          | 2        | 2024-02-28   |
| 29        | 29         | 29          | 1        | 2024-02-29   |
+-----------+------------+-------------+----------+--------------+
**/

-- Obtener la cantidad total de productos en todos los pedidos por producto.

select ped.id_producto, pro.nombre, sum(ped.cantidad) as cantidad_total from pedidos as ped, productos as pro where ped.id_producto = pro.id group by ped.id_producto;

/**
+-------------+-----------------------------------+----------------+
| id_producto |              nombre               | cantidad_total |
+-------------+-----------------------------------+----------------+
| 1           | Laptop                            | 2              |
| 2           | Smartphone                        | 1              |
| 3           | TV LED                            | 3              |
| 4           | Tablet                            | 1              |
| 5           | Auriculares Bluetooth             | 2              |
| 6           | Impresora                         | 1              |
| 7           | Cámara Digital                    | 3              |
| 8           | Reproductor de Audio              | 2              |
| 9           | Altavoces Inalámbricos            | 1              |
| 10          | Reloj Inteligente                 | 2              |
| 11          | Teclado Inalámbrico               | 1              |
| 12          | Ratón Óptico                      | 3              |
| 13          | Monitor LED                       | 1              |
| 14          | Mochila para Portátil             | 2              |
| 15          | Disco Duro Externo                | 1              |
| 16          | Router Wi-Fi                      | 3              |
| 17          | Lámpara LED                       | 2              |
| 18          | Batería Externa                   | 1              |
| 19          | Estuche para Auriculares          | 2              |
| 20          | Tarjeta de Memoria                | 1              |
| 21          | Cargador Inalámbrico              | 3              |
| 22          | Kit de Limpieza para Computadoras | 1              |
| 23          | Funda para Tablet                 | 2              |
| 24          | Soporte para Teléfono             | 1              |
| 25          | Hub USB                           | 3              |
| 26          | Webcam HD                         | 2              |
| 27          | Funda para Laptop                 | 1              |
| 28          | Adaptador HDMI                    | 2              |
+-------------+-----------------------------------+----------------+
**/

-- Obtener los clientes que han realizado más de un pedido.

select c.* from clientes as c, pedidos as p where c.id = p.id_cliente group by c.id having count(p.id_cliente)>1;

/**
No se retorna nada porque no se cumplen los requisitos.
**/

-- Obtener los productos que tienen un precio registrado.

select * from productos where precio is not null;

/**
+----+-----------------------------------+--------+
| id |              nombre               | precio |
+----+-----------------------------------+--------+
| 1  | Laptop                            | 1200.0 |
| 2  | Smartphone                        | 699.99 |
| 3  | TV LED                            | 799.5  |
| 4  | Tablet                            | 299.99 |
| 5  | Auriculares Bluetooth             | 79.99  |
| 6  | Impresora                         | 199.99 |
| 7  | Cámara Digital                    | 499.99 |
| 8  | Reproductor de Audio              | 149.99 |
| 9  | Altavoces Inalámbricos            | 129.99 |
| 10 | Reloj Inteligente                 | 249.99 |
| 11 | Teclado Inalámbrico               | 59.99  |
| 12 | Ratón Óptico                      | 29.99  |
| 13 | Monitor LED                       | 349.99 |
| 14 | Mochila para Portátil             | 49.99  |
| 15 | Disco Duro Externo                | 89.99  |
| 16 | Router Wi-Fi                      | 69.99  |
| 17 | Lámpara LED                       | 39.99  |
| 18 | Batería Externa                   | 19.99  |
| 19 | Estuche para Auriculares          | 14.99  |
| 20 | Tarjeta de Memoria                | 24.99  |
| 21 | Cargador Inalámbrico              | 34.99  |
| 22 | Kit de Limpieza para Computadoras | 9.99   |
| 23 | Funda para Tablet                 | 19.99  |
| 24 | Soporte para Teléfono             | 14.99  |
| 25 | Hub USB                           | 29.99  |
| 26 | Webcam HD                         | 59.99  |
| 27 | Funda para Laptop                 | 29.99  |
| 28 | Adaptador HDMI                    | 12.99  |
+----+-----------------------------------+--------+
**/

-- Obtener la fecha del primer pedido realizado:

select * from pedidos order by fecha_pedido limit 1;

/**
+-----------+------------+-------------+----------+--------------+
| id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
+-----------+------------+-------------+----------+--------------+
| 1         | 1          | 1           | 2        | 2024-02-01   |
+-----------+------------+-------------+----------+--------------+
**/

-- Obtener los productos cuyos nombres comienzan con 'A' o 'B':

select * from productos where nombre regexp '^[AB]';

/**
+----+------------------------+--------+
| id |         nombre         | precio |
+----+------------------------+--------+
| 5  | Auriculares Bluetooth  | 79.99  |
| 9  | Altavoces Inalámbricos | 129.99 |
| 18 | Batería Externa        | 19.99  |
| 28 | Adaptador HDMI         | 12.99  |
+----+------------------------+--------+
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.

select p.id_cliente, c.nombre, sum(p.cantidad) as cantidad_total from pedidos as p, clientes as c where c.id = p.id_cliente group by p.id_cliente;

/**
+------------+-----------------+----------------+
| id_cliente |     nombre      | cantidad_total |
+------------+-----------------+----------------+
| 1          | Juan Pérez      | 2              |
| 2          | María Gómez     | 1              |
| 3          | Carlos López    | 3              |
| 4          | Ana Rodríguez   | 1              |
| 5          | Luisa Martínez  | 2              |
| 6          | Pedro Sánchez   | 1              |
| 7          | Laura García    | 3              |
| 8          | Miguel Martín   | 2              |
| 9          | Elena González  | 1              |
| 10         | David Torres    | 2              |
| 11         | Sofía Ruiz      | 1              |
| 12         | Javier López    | 3              |
| 13         | Carmen Vargas   | 1              |
| 14         | Daniel Muñoz    | 2              |
| 15         | Isabel Serrano  | 1              |
| 16         | Alejandro Muñoz | 3              |
| 17         | Raquel Herrera  | 2              |
| 18         | Francisco Mora  | 1              |
| 19         | Marina Díaz     | 2              |
| 20         | Antonio Jiménez | 1              |
| 21         | Beatriz Romero  | 3              |
| 22         | Carlos Gómez    | 1              |
| 23         | Clara Sánchez   | 2              |
| 24         | Andrés Martínez | 1              |
| 25         | Lucía Díaz      | 3              |
| 26         | Mario Serrano   | 2              |
| 27         | Eva Torres      | 1              |
| 28         | Roberto Ruiz    | 2              |
| 29         | Celia García    | 1              |
+------------+-----------------+----------------+
**/

-- Obtener los clientes que han realizado más de un pedido en febrero de 2024.

select c.* from clientes as c, pedidos as p where c.id = p.id_cliente and p.fecha_pedido regexp '2024-02-' group by c.id having count(p.id_cliente)>1;

/**
No se retorna nada porque no se cumplen los requisitos.
**/

-- Obtener los productos con precio entre 100 y 500.

select * from productos where precio between 100 and 500;

/**
+----+------------------------+--------+
| id |         nombre         | precio |
+----+------------------------+--------+
| 4  | Tablet                 | 299.99 |
| 6  | Impresora              | 199.99 |
| 7  | Cámara Digital         | 499.99 |
| 8  | Reproductor de Audio   | 149.99 |
| 9  | Altavoces Inalámbricos | 129.99 |
| 10 | Reloj Inteligente      | 249.99 |
| 13 | Monitor LED            | 349.99 |
+----+------------------------+--------+
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.

select p.id_cliente, c.nombre, sum(p.cantidad) as cantidad_total from pedidos as p, clientes as c where c.id = p.id_cliente group by p.id_cliente order by p.cantidad desc;

/**
+------------+-----------------+----------------+
| id_cliente |     nombre      | cantidad_total |
+------------+-----------------+----------------+
| 25         | Lucía Díaz      | 3              |
| 21         | Beatriz Romero  | 3              |
| 16         | Alejandro Muñoz | 3              |
| 12         | Javier López    | 3              |
| 7          | Laura García    | 3              |
| 3          | Carlos López    | 3              |
| 28         | Roberto Ruiz    | 2              |
| 26         | Mario Serrano   | 2              |
| 23         | Clara Sánchez   | 2              |
| 19         | Marina Díaz     | 2              |
| 17         | Raquel Herrera  | 2              |
| 14         | Daniel Muñoz    | 2              |
| 10         | David Torres    | 2              |
| 8          | Miguel Martín   | 2              |
| 5          | Luisa Martínez  | 2              |
| 1          | Juan Pérez      | 2              |
| 29         | Celia García    | 1              |
| 27         | Eva Torres      | 1              |
| 24         | Andrés Martínez | 1              |
| 22         | Carlos Gómez    | 1              |
| 20         | Antonio Jiménez | 1              |
| 18         | Francisco Mora  | 1              |
| 15         | Isabel Serrano  | 1              |
| 13         | Carmen Vargas   | 1              |
| 11         | Sofía Ruiz      | 1              |
| 9          | Elena González  | 1              |
| 6          | Pedro Sánchez   | 1              |
| 4          | Ana Rodríguez   | 1              |
| 2          | María Gómez     | 1              |
+------------+-----------------+----------------+
**/

-- Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.

select * from clientes where nombre regexp '[aA]';

/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
**/

-- Obtener el precio máximo de los productos.

select max(precio) as precio_maximo from productos;

/**
+---------------+
| precio_maximo |
+---------------+
| 1200.0        |
+---------------+
**/

-- Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.

select ped.id_pedido, ped.id_cliente, c.nombre as nombre_cliente, ped.id_producto, pro.nombre as nombre_producto, ped.cantidad, ped.fecha_pedido from pedidos as ped, clientes as c, productos as pro where ped.id_cliente = c.id and ped.id_producto = pro.id and ped.id_cliente = 1 and ped.fecha_pedido regexp '2024-02-';

/**
+-----------+------------+----------------+-------------+-----------------+----------+--------------+
| id_pedido | id_cliente | nombre_cliente | id_producto | nombre_producto | cantidad | fecha_pedido |
+-----------+------------+----------------+-------------+-----------------+----------+--------------+
| 1         | 1          | Juan Pérez     | 1           | Laptop          | 2        | 2024-02-01   |
+-----------+------------+----------------+-------------+-----------------+----------+--------------+
**/

-- Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.

select ped.id_producto, pro.nombre, sum(ped.cantidad) as cantidad_total from pedidos as ped, productos as pro where pro.id = ped.id_producto group by ped.id_producto order by cantidad_total desc;

/**
+-------------+-----------------------------------+----------------+
| id_producto |              nombre               | cantidad_total |
+-------------+-----------------------------------+----------------+
| 25          | Hub USB                           | 3              |
| 21          | Cargador Inalámbrico              | 3              |
| 16          | Router Wi-Fi                      | 3              |
| 12          | Ratón Óptico                      | 3              |
| 7           | Cámara Digital                    | 3              |
| 3           | TV LED                            | 3              |
| 28          | Adaptador HDMI                    | 2              |
| 26          | Webcam HD                         | 2              |
| 23          | Funda para Tablet                 | 2              |
| 19          | Estuche para Auriculares          | 2              |
| 17          | Lámpara LED                       | 2              |
| 14          | Mochila para Portátil             | 2              |
| 10          | Reloj Inteligente                 | 2              |
| 8           | Reproductor de Audio              | 2              |
| 5           | Auriculares Bluetooth             | 2              |
| 1           | Laptop                            | 2              |
| 27          | Funda para Laptop                 | 1              |
| 24          | Soporte para Teléfono             | 1              |
| 22          | Kit de Limpieza para Computadoras | 1              |
| 20          | Tarjeta de Memoria                | 1              |
| 18          | Batería Externa                   | 1              |
| 15          | Disco Duro Externo                | 1              |
| 13          | Monitor LED                       | 1              |
| 11          | Teclado Inalámbrico               | 1              |
| 9           | Altavoces Inalámbricos            | 1              |
| 6           | Impresora                         | 1              |
| 4           | Tablet                            | 1              |
| 2           | Smartphone                        | 1              |
+-------------+-----------------------------------+----------------+
**/

-- Obtener los productos que no tienen un precio registrado.

select * from productos where precio is NULL;

/**
No se retorna respuesta pues no se cumplen las condiciones.
**/

-- Obtener la fecha del último pedido realizado.

select fecha_pedido from pedidos order by fecha_pedido desc limit 1;

/**
+--------------+
| fecha_pedido |
+--------------+
| 2024-03-01   |
+--------------+
**/

-- Obtener los clientes cuyo nombre tiene al menos 5 caracteres.

select * from clientes where nombre regexp '.....';

/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
**/

-- Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.

select * from productos where nombre regexp '[oO]';

/**
+----+-----------------------------------+--------+
| id |              nombre               | precio |
+----+-----------------------------------+--------+
| 1  | Laptop                            | 1200.0 |
| 2  | Smartphone                        | 699.99 |
| 5  | Auriculares Bluetooth             | 79.99  |
| 6  | Impresora                         | 199.99 |
| 8  | Reproductor de Audio              | 149.99 |
| 9  | Altavoces Inalámbricos            | 129.99 |
| 10 | Reloj Inteligente                 | 249.99 |
| 11 | Teclado Inalámbrico               | 59.99  |
| 12 | Ratón Óptico                      | 29.99  |
| 13 | Monitor LED                       | 349.99 |
| 14 | Mochila para Portátil             | 49.99  |
| 15 | Disco Duro Externo                | 89.99  |
| 16 | Router Wi-Fi                      | 69.99  |
| 20 | Tarjeta de Memoria                | 24.99  |
| 21 | Cargador Inalámbrico              | 34.99  |
| 22 | Kit de Limpieza para Computadoras | 9.99   |
| 24 | Soporte para Teléfono             | 14.99  |
| 27 | Funda para Laptop                 | 29.99  |
| 28 | Adaptador HDMI                    | 12.99  |
+----+-----------------------------------+--------+
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.

select p.id_pedido, c.nombre, sum(p.cantidad) as cantidad_productos from pedidos as p, clientes as c where p.id_cliente = c.id group by p.id_cliente order by p.id_cliente;

/**
+-----------+-----------------+--------------------+
| id_pedido |     nombre      | cantidad_productos |
+-----------+-----------------+--------------------+
| 1         | Juan Pérez      | 2                  |
| 2         | María Gómez     | 1                  |
| 3         | Carlos López    | 3                  |
| 4         | Ana Rodríguez   | 1                  |
| 5         | Luisa Martínez  | 2                  |
| 6         | Pedro Sánchez   | 1                  |
| 7         | Laura García    | 3                  |
| 8         | Miguel Martín   | 2                  |
| 9         | Elena González  | 1                  |
| 10        | David Torres    | 2                  |
| 11        | Sofía Ruiz      | 1                  |
| 12        | Javier López    | 3                  |
| 13        | Carmen Vargas   | 1                  |
| 14        | Daniel Muñoz    | 2                  |
| 15        | Isabel Serrano  | 1                  |
| 16        | Alejandro Muñoz | 3                  |
| 17        | Raquel Herrera  | 2                  |
| 18        | Francisco Mora  | 1                  |
| 19        | Marina Díaz     | 2                  |
| 20        | Antonio Jiménez | 1                  |
| 21        | Beatriz Romero  | 3                  |
| 22        | Carlos Gómez    | 1                  |
| 23        | Clara Sánchez   | 2                  |
| 24        | Andrés Martínez | 1                  |
| 25        | Lucía Díaz      | 3                  |
| 26        | Mario Serrano   | 2                  |
| 27        | Eva Torres      | 1                  |
| 28        | Roberto Ruiz    | 2                  |
| 29        | Celia García    | 1                  |
+-----------+-----------------+--------------------+
**/

-- Obtener los clientes cuyos nombres no contienen la letra 'i':

select * from clientes where nombre not regexp '[iíI]';

/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 3  | Carlos López    | carlos@example.com        |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 9  | Elena González  | elena@example.com         |
| 13 | Carmen Vargas   | carmen@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 27 | Eva Torres      | eva.torres@example.com    |
+----+-----------------+---------------------------+
**/

-- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.

select ped.id_pedido, ped.id_cliente, c.nombre as nombre_cliente, ped.id_producto, pro.nombre as nombre_producto, ped.cantidad, ped.fecha_pedido from pedidos as ped, clientes as c, productos as pro where ped.id_cliente = c.id and ped.id_producto = pro.id and ped.id_cliente = 2 and ped.fecha_pedido regexp '2024-02-';

/**
+-----------+------------+----------------+-------------+-----------------+----------+--------------+
| id_pedido | id_cliente | nombre_cliente | id_producto | nombre_producto | cantidad | fecha_pedido |
+-----------+------------+----------------+-------------+-----------------+----------+--------------+
| 2         | 2          | María Gómez    | 2           | Smartphone      | 1        | 2024-02-02   |
+-----------+------------+----------------+-------------+-----------------+----------+--------------+
**/

-- Obtener el precio mínimo de los productos.

select min(precio) as precio_minimo from productos;

/**
+---------------+
| precio_minimo |
+---------------+
| 9.99          |
+---------------+
**/

-- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.

select c.* from clientes as c, pedidos as p where p.id_cliente = c.id and c.id in (select id_cliente from pedidos where fecha_pedido regexp '2024-02-');

/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
**/

-- Obtener la fecha del último pedido realizado por el cliente con ID 3.

select fecha_pedido from pedidos as p, clientes as c where p.id_cliente = c.id and p.id_cliente = 3 order by fecha_pedido desc limit 1;

/**
+--------------+
| fecha_pedido |
+--------------+
| 2024-02-03   |
+--------------+
**/

-- Obtener los productos que tienen una 'a' al final del nombre.

select * from productos where nombre regexp 'a$';

/**
+----+--------------------+--------+
| id |       nombre       | precio |
+----+--------------------+--------+
| 6  | Impresora          | 199.99 |
| 18 | Batería Externa    | 19.99  |
| 20 | Tarjeta de Memoria | 24.99  |
+----+--------------------+--------+
**/

-- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).

select * from clientes where nombre regexp '[aeiouAEIOU]{4,}'; -- Preguntar por esta consulta, posiblemente el problema de versión del sqlite3.

-- Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.

select * from productos where precio regexp '^[0-9]{4,}\.'; -- ¿Sintaxis similar al del ejercicio anterior pero que sí funciona?

/**
+----+--------+--------+
| id | nombre | precio |
+----+--------+--------+
| 1  | Laptop | 1200.0 |
+----+--------+--------+
**/

-- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.

select * from clientes where nombre regexp 'ae';

/**
No retorna respuesta pues no hay clientes que cumplan dichas condiciones.
**/

-- Obtener los productos cuyos nombres terminan con una consonante.

select * from productos where nombre regexp '[a-zA-Z][^aeiouAEIOU]$';

/**
+----+-----------------------------------+--------+
| id |              nombre               | precio |
+----+-----------------------------------+--------+
| 1  | Laptop                            | 1200.0 |
| 3  | TV LED                            | 799.5  |
| 4  | Tablet                            | 299.99 |
| 5  | Auriculares Bluetooth             | 79.99  |
| 7  | Cámara Digital                    | 499.99 |
| 9  | Altavoces Inalámbricos            | 129.99 |
| 13 | Monitor LED                       | 349.99 |
| 14 | Mochila para Portátil             | 49.99  |
| 17 | Lámpara LED                       | 39.99  |
| 19 | Estuche para Auriculares          | 14.99  |
| 22 | Kit de Limpieza para Computadoras | 9.99   |
| 23 | Funda para Tablet                 | 19.99  |
| 25 | Hub USB                           | 29.99  |
| 26 | Webcam HD                         | 59.99  |
| 27 | Funda para Laptop                 | 29.99  |
+----+-----------------------------------+--------+
**/

-- Obtener los productos cuyos nombres empiezan con una vocal.

select * from productos where nombre regexp '^[aeiouAEIOU]';

/**
+----+--------------------------+--------+
| id |          nombre          | precio |
+----+--------------------------+--------+
| 5  | Auriculares Bluetooth    | 79.99  |
| 6  | Impresora                | 199.99 |
| 9  | Altavoces Inalámbricos   | 129.99 |
| 19 | Estuche para Auriculares | 14.99  |
| 28 | Adaptador HDMI           | 12.99  |
+----+--------------------------+--------+
**/