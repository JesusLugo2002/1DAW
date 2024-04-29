-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?
select co.id_coche, co.marca, co.modelo, co.precio, cl.id_cliente, cl.nombre as nombre_cliente from coches as co, clientes as cl, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente;

/**
| id_coche |   marca    |     modelo     | precio  | id_cliente | nombre_cliente  |
|----------|------------|----------------|---------|------------|-----------------|
| 1        | Toyota     | Sedán 2022     | 25000.0 | 1          | Juan Pérez      |
| 2        | Honda      | Hatchback 2021 | 22000.0 | 2          | María Gómez     |
| 3        | Ford       | SUV 2023       | 30000.0 | 3          | Carlos López    |
| 4        | Chevrolet  | Coupé 2022     | 28000.0 | 4          | Ana Martínez    |
| 5        | Nissan     | Camioneta 2023 | 32000.0 | 5          | Pedro Rodríguez |
| 6        | Volkswagen | Compacto 2021  | 20000.0 | 6          | Laura Sánchez   |
| 7        | Hyundai    | Híbrido 2022   | 27000.0 | 7          | Miguel González |
| 8        | Mazda      | Deportivo 2023 | 35000.0 | 8          | Isabel Díaz     |
| 10       | Tesla      | Eléctrico 2021 | 40000.0 | 10         | Elena Torres    |
**/

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)
select cl.* from clientes as cl, ventas as v, coches as co where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and co.precio > (select avg(precio) from coches);

/**
| id_cliente |     nombre      | edad |   direccion    |
|------------|-----------------|------|----------------|
| 3          | Carlos López    | 35   | Calle C #789   |
| 5          | Pedro Rodríguez | 40   | Calle E #234   |
| 8          | Isabel Díaz     | 38   | Avenida H #111 |
| 10         | Elena Torres    | 29   | Avenida J #333 |
**/

-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:

  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas
select modelo, precio from coches where id_coche not in (select id_coche from ventas); 

/**
|   modelo    | precio  |
|-------------|---------|
| Pickup 2022 | 31000.0 |
**/

-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

select sum(co.precio) as total_gastado from coches as co, ventas as v where co.id_coche = v.id_coche;

/**
| total_gastado |
|---------------|
| 259000.0      |
**/

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?
select co.*, cl.nombre as nombre_cliente, v.fecha_venta from coches as co, clientes as cl, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente order by fecha_venta desc;

/**
| id_coche |     modelo     |   marca    | año  | precio  | nombre_cliente  | fecha_venta |
|----------|----------------|------------|------|---------|-----------------|-------------|
| 10       | Eléctrico 2021 | Tesla      | 2021 | 40000.0 | Elena Torres    | 2023-10-05  |
| 8        | Deportivo 2023 | Mazda      | 2023 | 35000.0 | Isabel Díaz     | 2023-08-25  |
| 7        | Híbrido 2022   | Hyundai    | 2022 | 27000.0 | Miguel González | 2023-07-20  |
| 6        | Compacto 2021  | Volkswagen | 2021 | 20000.0 | Laura Sánchez   | 2023-06-15  |
| 5        | Camioneta 2023 | Nissan     | 2023 | 32000.0 | Pedro Rodríguez | 2023-05-05  |
| 4        | Coupé 2022     | Chevrolet  | 2022 | 28000.0 | Ana Martínez    | 2023-04-10  |
| 3        | SUV 2023       | Ford       | 2023 | 30000.0 | Carlos López    | 2023-03-25  |
| 2        | Hatchback 2021 | Honda      | 2021 | 22000.0 | María Gómez     | 2023-02-20  |
| 1        | Sedán 2022     | Toyota     | 2022 | 25000.0 | Juan Pérez      | 2023-01-15  |
**/

-- Encontrar el modelo de coche más caro.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX
select marca, modelo, max(precio) as precio_máximo from coches;

/**
| marca |     modelo     | precio_máximo |
|-------|----------------|---------------|
| Tesla | Eléctrico 2021 | 40000.0       |
**/

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT
select cl.id_cliente, cl.nombre, count(v.id_cliente) as coches_comprados from clientes as cl, ventas as v where cl.id_cliente = v.id_cliente group by cl.id_cliente;

/**
| id_cliente |     nombre      | coches_comprados |
|------------|-----------------|------------------|
| 1          | Juan Pérez      | 1                |
| 2          | María Gómez     | 1                |
| 3          | Carlos López    | 1                |
| 4          | Ana Martínez    | 1                |
| 5          | Pedro Rodríguez | 1                |
| 6          | Laura Sánchez   | 1                |
| 7          | Miguel González | 1                |
| 8          | Isabel Díaz     | 1                |
| 10         | Elena Torres    | 1                |
**/

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.
select cl.id_cliente, cl.nombre from clientes as cl, ventas as v, coches as co where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and co.marca = 'Toyota';

/**
| id_cliente |   nombre   |
|------------|------------|
| 1          | Juan Pérez |
**/

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 
select round(avg(cl.edad), 2) as edad_promedio from clientes as cl, ventas as v, coches as co where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and co.precio > 25000;

/**
| edad_promedio |
|---------------|
| 32.83         |
**/

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
select co.modelo, co.precio from coches as co, ventas as v, clientes as cl where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.edad > 30;

/**
|     modelo     | precio  |
|----------------|---------|
| SUV 2023       | 30000.0 |
| Camioneta 2023 | 32000.0 |
| Compacto 2021  | 20000.0 |
| Deportivo 2023 | 35000.0 |
**/

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
select co.*, count(v.id_coche) vendidos_2022 from coches as co, ventas as v where co.id_coche = v.id_coche and v.fecha_venta regexp '2022-' group by co.id_coche;

/**
No se devuelve resultado pues no se cumplen las condiciones.
**/

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG
select * from coches where precio > (select avg(co.precio) from coches as co, ventas as v, clientes as cl where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.edad < 30);

/**
| id_coche |     modelo     | marca  | año  | precio  |
|----------|----------------|--------|------|---------|
| 3        | SUV 2023       | Ford   | 2023 | 30000.0 |
| 5        | Camioneta 2023 | Nissan | 2023 | 32000.0 |
| 8        | Deportivo 2023 | Mazda  | 2023 | 35000.0 |
| 9        | Pickup 2022    | Ram    | 2022 | 31000.0 |
| 10       | Eléctrico 2021 | Tesla  | 2021 | 40000.0 |
**/

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
select co.marca, count(v.id_coche) as total_ventas from coches as co, ventas as v where v.id_coche = co.id_coche group by v.id_coche order by total_ventas desc;

/**
|   marca    | total_ventas |
|------------|--------------|
| Tesla      | 1            |
| Mazda      | 1            |
| Hyundai    | 1            |
| Volkswagen | 1            |
| Nissan     | 1            |
| Chevrolet  | 1            |
| Ford       | 1            |
| Honda      | 1            |
| Toyota     | 1            |
**/
