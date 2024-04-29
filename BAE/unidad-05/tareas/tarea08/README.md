# Ejercicios de subconsultas (expresiones regulares y funciones matemáticas)

<div align=center>
    
![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

## Consultas

#### 1. Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
```sql
select cl.nombre, cl.edad from clientes as cl, ventas as v, coches as co where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and co.marca = 'Toyota';
```
|   nombre   | edad |
|------------|------|
| Juan Pérez | 30   |


#### 2. Consulta para calcular el precio promedio de los coches vendidos.
```sql
select round(avg(co.precio), 2) as precio_promedio from coches as co, ventas as v where co.id_coche = v.id_coche;
```
| precio_promedio |
|-----------------|
| 28777.78        |

#### 3. Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.
```sql
select co.modelo, co.marca from coches as co, ventas as v, clientes as cl where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.edad < 30;
```
|     modelo     |   marca   |
|----------------|-----------|
| Hatchback 2021 | Honda     |
| Coupé 2022     | Chevrolet |
| Híbrido 2022   | Hyundai   |
| Eléctrico 2021 | Tesla     |


#### 4. Consulta para contar el número de coches vendidos de cada marca.
```sql
select co.marca, count(co.id_coche) as coches_vendidos from coches as co, ventas as v where co.id_coche = v.id_coche group by co.marca;
```
|   marca    | coches_vendidos |
|------------|-----------------|
| Chevrolet  | 1               |
| Ford       | 1               |
| Honda      | 1               |
| Hyundai    | 1               |
| Mazda      | 1               |
| Nissan     | 1               |
| Tesla      | 1               |
| Toyota     | 1               |
| Volkswagen | 1               |

#### 5. Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.
```sql
select distinct(cl.nombre), cl.direccion from clientes as cl, reparacion as r where cl.id_cliente = r.id_cliente and r.fecha_reparación regexp '2024-';
```
|     nombre      |   direccion    |
|-----------------|----------------|
| Francisco Ruiz  | Calle I #222   |
| Elena Torres    | Avenida J #333 |
| Juan Pérez      | Calle A #123   |
| María Gómez     | Avenida B #456 |
| Carlos López    | Calle C #789   |
| Ana Martínez    | Avenida D #101 |
| Pedro Rodríguez | Calle E #234   |
| Laura Sánchez   | Avenida F #567 |
| Miguel González | Calle G #890   |
| Isabel Díaz     | Avenida H #111 |


#### 6. Consulta para calcular el total gastado en reparaciones por cada cliente.

    No hay información suficiente para realizar este ejercicio. (No se halla precio de las reparaciones).

#### 7. Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.
```sql
select cl.nombre, cl.edad from clientes as cl, coches as co, ventas as v where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and co.precio > 30000;
```
|     nombre      | edad |
|-----------------|------|
| Pedro Rodríguez | 40   |
| Isabel Díaz     | 38   |
| Elena Torres    | 29   |


#### 8. Consulta para calcular el precio medio de los coches vendidos en 2023.
```sql
select round(avg(precio), 2) as precio_medio from coches where id_coche in (select id_coche from ventas where fecha_venta regexp '2023');
```
| precio_medio |
|--------------|
| 28777.78     |


#### 9. Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.
```sql
select cl.nombre, cl.direccion from clientes as cl, coches as co, ventas as v where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and co.marca = 'Ford';
```
|    nombre    |  direccion   |
|--------------|--------------|
| Carlos López | Calle C #789 |


#### 10. Consulta para contar el número de coches vendidos por año.
```sql
select substr(fecha_venta, 1, 4) as año, count(id_coche) as coches_vendidos from ventas group by año;
```
| año  | coches_vendidos |
|------|-----------------|
| 2023 | 9               |


#### 11. Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
```sql
select cl.nombre, cl.edad from clientes as cl, coches as co, ventas as v, reparacion as r where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and co.precio > 30000 and cl.id_cliente = r.id_cliente and co.id_coche = r.id_coche;
```
|    nombre    | edad |
|--------------|------|
| Isabel Díaz  | 38   |
| Elena Torres | 29   |


#### 12. Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
```sql
select sum(co.precio) as precio_total from coches as co, clientes as cl, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.edad < 30;
```
| precio_total |
|--------------|
| 117000.0     |


#### 13. Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
```sql
select distinct(co.modelo), co.año from coches as co, ventas as v, reparacion as r where co.id_coche = v.id_coche and co.id_coche = r.id_coche and v.fecha_venta regexp '2023';
```
|     modelo     | año  |
|----------------|------|
| Sedán 2022     | 2022 |
| Hatchback 2021 | 2021 |
| SUV 2023       | 2023 |
| Coupé 2022     | 2022 |
| Camioneta 2023 | 2023 |
| Compacto 2021  | 2021 |
| Híbrido 2022   | 2022 |
| Deportivo 2023 | 2023 |
| Eléctrico 2021 | 2021 |

#### 14. Consulta para contar el número de coches vendidos por cliente.
```sql
select cl.id_cliente, cl.nombre, count(v.id_coche) as coches_vendidos from clientes as cl, ventas as v where cl.id_cliente = v.id_cliente group by cl.id_cliente;
```
| id_cliente |     nombre      | coches_vendidos |
|------------|-----------------|-----------------|
| 1          | Juan Pérez      | 1               |
| 2          | María Gómez     | 1               |
| 3          | Carlos López    | 1               |
| 4          | Ana Martínez    | 1               |
| 5          | Pedro Rodríguez | 1               |
| 6          | Laura Sánchez   | 1               |
| 7          | Miguel González | 1               |
| 8          | Isabel Díaz     | 1               |
| 10         | Elena Torres    | 1               |


#### 15. Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.
```sql
select co.marca, co.modelo, co.precio from coches as co, clientes as cl, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.edad > 35;
```
| marca  |     modelo     | precio  |
|--------|----------------|---------|
| Nissan | Camioneta 2023 | 32000.0 |
| Mazda  | Deportivo 2023 | 35000.0 |


#### 16. Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).
```sql
select sum(co.precio) as precio_total from coches as co, ventas as v, clientes as cl where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.direccion regexp 'Calle';
```
| precio_total |
|--------------|
| 114000.0     |


#### 17. Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
```sql
select distinct(cl.nombre), cl.direccion from clientes as cl, coches as co, ventas as v, reparacion as r where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and co.id_coche = r.id_coche and co.precio > 30000 and r.fecha_reparación regexp '2024';
```
|     nombre      |   direccion    |
|-----------------|----------------|
| Pedro Rodríguez | Calle E #234   |
| Isabel Díaz     | Avenida H #111 |
| Elena Torres    | Avenida J #333 |


#### 18. Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.
```sql
select round(avg(co.precio), 2) as precio_medio from coches as co, ventas as v, clientes as cl, reparacion as r where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and v.fecha_venta regexp '2023' and r.id_cliente in (select id_cliente from clientes where edad < 30);
```
| precio_medio |
|--------------|
| 28777.78     |

#### 19. Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".
```sql
select co.modelo, co.año from coches as co, ventas as v, clientes as cl where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.direccion regexp 'Avenida';
```
|     modelo     | año  |
|----------------|------|
| Hatchback 2021 | 2021 |
| Coupé 2022     | 2022 |
| Compacto 2021  | 2021 |
| Deportivo 2023 | 2023 |
| Eléctrico 2021 | 2021 |

#### 20. Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.
```sql
select cl.nombre, count(r.id_reparación) as reparaciones from reparacion as r, clientes as cl where cl.id_cliente = r.id_cliente and r.fecha_reparación regexp '2024' group by cl.nombre;
```
|     nombre      | reparaciones |
|-----------------|--------------|
| Ana Martínez    | 1            |
| Carlos López    | 1            |
| Elena Torres    | 2            |
| Francisco Ruiz  | 2            |
| Isabel Díaz     | 1            |
| Juan Pérez      | 1            |
| Laura Sánchez   | 1            |
| María Gómez     | 1            |
| Miguel González | 1            |
| Pedro Rodríguez | 1            |
