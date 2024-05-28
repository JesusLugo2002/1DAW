-- ----------------------------------------
-- Consultas sobre una tabla
-- 0,2 puntos la correcta. Total = 1,4 puntos
-- ----------------------------------------

-- 1.- Devuelve un listado con todos las compras que se han realizado. Las compras deben estar ordenados
-- por la fecha de realización, mostrando en primer lugar las compras más recientes.
select * from compra order by fecha desc;
/*
┌────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │
│ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │
│ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
│ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │
│ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │
│ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │
│ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │
│ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │
│ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │
│ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │
└────┴─────────┴────────────┴───────────────┴──────────────────┘
*/

-- 2. Devuelve todos los datos de los dos compras de mayor valor.
select * from compra order by fecha desc limit 2;

/*
┌────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │
│ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │
└────┴─────────┴────────────┴───────────────┴──────────────────┘
*/

-- 3. Devuelve un listado con los identificadores de los consumidores que han realizado algún compra.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select distinct id_consumidor from compra;

/*
┌───────────────┐
│ id_consumidor │
├───────────────┤
│ 5             │
│ 1             │
│ 2             │
│ 8             │
│ 7             │
│ 4             │
│ 3             │
│ 6             │
└───────────────┘
*/

-- 4. Devuelve un listado de todos las compras que se realizaron durante el año 2020,
-- cuya cantidad total sea superior a 500€.
select * from compra where fecha regexp '2020' and total > 500;

/*
┌────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
└────┴─────────┴────────────┴───────────────┴──────────────────┘
*/

-- 5. Devuelve un listado con el nombre y los apellidos de los suministradores que tienen una comisión entre 0.11 y 0.15.
select nombre, apellido1 || ' ' || apellido2 as apellidos from suministrador where categoria between 0.11 and 0.15;

/*
┌─────────┬─────────────────────┐
│ nombre  │      apellidos      │
├─────────┼─────────────────────┤
│ Daniel  │ Sáez Vega           │
│ Juan    │ Gómez López         │
│ Diego   │ Flores Salas        │
│ Marta   │ Herrera Gil         │
│ Antonio │ Carretero Ortega    │
│ Manuel  │ Domínguez Hernández │
│ Antonio │ Vega Hernández      │
└─────────┴─────────────────────┘
*/

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla suministrador.
select max(categoria) as max_comision from suministrador;

/*
┌──────────────┐
│ max_comision │
├──────────────┤
│ 0.15         │
└──────────────┘
*/

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos consumidores cuyo segundo apellido no es NULL.
-- El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
select id, nombre, apellido1 from consumidor where apellido2 is not null order by apellido1, nombre;

/*
┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 5  │ Marcos    │ Loyola    │
│ 9  │ Guillermo │ López     │
│ 1  │ Aarón     │ Rivero    │
│ 3  │ Adolfo    │ Rubio     │
│ 8  │ Pepe      │ Ruiz      │
│ 2  │ Adela     │ Salas     │
│ 10 │ Daniel    │ Santana   │
│ 6  │ María     │ Santana   │
└────┴───────────┴───────────┘
*/

-- (Consultas Multitabla Where)
-- -----------------------------------------------
-- 0,3 puntos la correcta. Total =  2,1 puntos
-- -----------------------------------------------

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select distinct c.id, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos from consumidor as c, compra as com where c.id = com.id_consumidor order by nombre;

/*
┌────┬────────┬────────────────┐
│ id │ nombre │   apellidos    │
├────┼────────┼────────────────┤
│ 1  │ Aarón  │ Rivero Gómez   │
│ 2  │ Adela  │ Salas Díaz     │
│ 3  │ Adolfo │ Rubio Flores   │
│ 4  │ Adrián │ Suárez         │
│ 5  │ Marcos │ Loyola Méndez  │
│ 6  │ María  │ Santana Moreno │
│ 8  │ Pepe   │ Ruiz Santana   │
│ 7  │ Pilar  │ Ruiz           │
└────┴────────┴────────────────┘
*/

-- 2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
select c.*, com.id as id_compra, com.total, com.fecha, com.id_suministrador from consumidor as c, compra as com where c.id = com.id_consumidor order by c.nombre;

/*
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬───────────┬─────────┬────────────┬──────────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id_compra │  total  │   fecha    │ id_suministrador │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼───────────┼─────────┼────────────┼──────────────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2         │ 270.65  │ 2019-09-10 │ 5                │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15        │ 370.85  │ 2022-03-11 │ 5                │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16        │ 2389.23 │ 2022-03-11 │ 5                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3         │ 65.26   │ 2020-10-05 │ 1                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7         │ 5760.0  │ 2018-09-10 │ 1                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12        │ 3045.6  │ 2020-04-25 │ 1                │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11        │ 75.29   │ 2019-08-17 │ 7                │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8         │ 1983.43 │ 2020-10-10 │ 6                │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1         │ 150.5   │ 2020-10-05 │ 2                │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5         │ 948.5   │ 2020-09-10 │ 2                │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13        │ 545.75  │ 2022-01-25 │ 1                │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14        │ 145.82  │ 2020-02-02 │ 1                │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4         │ 110.5   │ 2019-08-17 │ 3                │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9         │ 2480.4  │ 2019-10-10 │ 3                │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10        │ 250.45  │ 2018-06-27 │ 2                │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6         │ 2400.6  │ 2019-07-27 │ 1                │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴───────────┴─────────┴────────────┴──────────────────┘
*/

-- 3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.
select s.*, com.id as id_compra, com.fecha, com.total, com.id_consumidor from suministrador as s, compra as com where s.id = com.id_suministrador order by s.nombre;

/*
┌────┬─────────┬───────────┬───────────┬───────────┬───────────┬────────────┬─────────┬───────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id_compra │   fecha    │  total  │ id_consumidor │
├────┼─────────┼───────────┼───────────┼───────────┼───────────┼────────────┼─────────┼───────────────┤
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2         │ 2019-09-10 │ 270.65  │ 1             │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11        │ 2019-08-17 │ 75.29   │ 3             │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15        │ 2022-03-11 │ 370.85  │ 1             │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16        │ 2022-03-11 │ 2389.23 │ 1             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3         │ 2020-10-05 │ 65.26   │ 2             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6         │ 2019-07-27 │ 2400.6  │ 7             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7         │ 2018-09-10 │ 5760.0  │ 2             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12        │ 2020-04-25 │ 3045.6  │ 2             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13        │ 2022-01-25 │ 545.75  │ 6             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14        │ 2020-02-02 │ 145.82  │ 6             │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4         │ 2019-08-17 │ 110.5   │ 8             │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9         │ 2019-10-10 │ 2480.4  │ 8             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1         │ 2020-10-05 │ 150.5   │ 5             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5         │ 2020-09-10 │ 948.5   │ 5             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10        │ 2018-06-27 │ 250.45  │ 8             │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8         │ 2020-10-10 │ 1983.43 │ 4             │
└────┴─────────┴───────────┴───────────┴───────────┴───────────┴────────────┴─────────┴───────────────┘
*/

-- 4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.
select c.id as id_consumidor, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos, c.ciudad, com.id as id_compra, com.fecha, com.total, s.id as id_suministrador, s.nombre, s.apellido1 || ' ' || coalesce(s.apellido2, '') as apellidos from consumidor as c, compra as com, suministrador as s where c.id = com.id_consumidor and s.id = com.id_suministrador;

/*
┌───────────────┬────────┬────────────────┬─────────┬───────────┬────────────┬─────────┬──────────────────┬─────────┬─────────────────────┐
│ id_consumidor │ nombre │   apellidos    │ ciudad  │ id_compra │   fecha    │  total  │ id_suministrador │ nombre  │      apellidos      │
├───────────────┼────────┼────────────────┼─────────┼───────────┼────────────┼─────────┼──────────────────┼─────────┼─────────────────────┤
│ 5             │ Marcos │ Loyola Méndez  │ Almería │ 1         │ 2020-10-05 │ 150.5   │ 2                │ Juan    │ Gómez López         │
│ 1             │ Aarón  │ Rivero Gómez   │ Almería │ 2         │ 2019-09-10 │ 270.65  │ 5                │ Antonio │ Carretero Ortega    │
│ 2             │ Adela  │ Salas Díaz     │ Granada │ 3         │ 2020-10-05 │ 65.26   │ 1                │ Daniel  │ Sáez Vega           │
│ 8             │ Pepe   │ Ruiz Santana   │ Huelva  │ 4         │ 2019-08-17 │ 110.5   │ 3                │ Diego   │ Flores Salas        │
│ 5             │ Marcos │ Loyola Méndez  │ Almería │ 5         │ 2020-09-10 │ 948.5   │ 2                │ Juan    │ Gómez López         │
│ 7             │ Pilar  │ Ruiz           │ Sevilla │ 6         │ 2019-07-27 │ 2400.6  │ 1                │ Daniel  │ Sáez Vega           │
│ 2             │ Adela  │ Salas Díaz     │ Granada │ 7         │ 2018-09-10 │ 5760.0  │ 1                │ Daniel  │ Sáez Vega           │
│ 4             │ Adrián │ Suárez         │ Jaén    │ 8         │ 2020-10-10 │ 1983.43 │ 6                │ Manuel  │ Domínguez Hernández │
│ 8             │ Pepe   │ Ruiz Santana   │ Huelva  │ 9         │ 2019-10-10 │ 2480.4  │ 3                │ Diego   │ Flores Salas        │
│ 8             │ Pepe   │ Ruiz Santana   │ Huelva  │ 10        │ 2018-06-27 │ 250.45  │ 2                │ Juan    │ Gómez López         │
│ 3             │ Adolfo │ Rubio Flores   │ Sevilla │ 11        │ 2019-08-17 │ 75.29   │ 7                │ Antonio │ Vega Hernández      │
│ 2             │ Adela  │ Salas Díaz     │ Granada │ 12        │ 2020-04-25 │ 3045.6  │ 1                │ Daniel  │ Sáez Vega           │
│ 6             │ María  │ Santana Moreno │ Cádiz   │ 13        │ 2022-01-25 │ 545.75  │ 1                │ Daniel  │ Sáez Vega           │
│ 6             │ María  │ Santana Moreno │ Cádiz   │ 14        │ 2020-02-02 │ 145.82  │ 1                │ Daniel  │ Sáez Vega           │
│ 1             │ Aarón  │ Rivero Gómez   │ Almería │ 15        │ 2022-03-11 │ 370.85  │ 5                │ Antonio │ Carretero Ortega    │
│ 1             │ Aarón  │ Rivero Gómez   │ Almería │ 16        │ 2022-03-11 │ 2389.23 │ 5                │ Antonio │ Carretero Ortega    │
└───────────────┴────────┴────────────────┴─────────┴───────────┴────────────┴─────────┴──────────────────┴─────────┴─────────────────────┘
*/

-- 5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.
select c.* from consumidor as c, compra as com where c.id = com.id_consumidor and com.fecha regexp '2020' and com.total between 300 and 1000;

/*
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
*/

-- 6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
select distinct s.nombre, s.apellido1 || ' ' || coalesce(s.apellido2, '') as apellidos from suministrador as s, compra as com, consumidor as c where s.id = com.id_suministrador and c.id = com.id_consumidor and c.nombre = 'María' and c.apellido1 = 'Santana' and c.apellido2 = 'Moreno';

/*
┌────────┬───────────┐
│ nombre │ apellidos │
├────────┼───────────┤
│ Daniel │ Sáez Vega │
└────────┴───────────┘
*/

-- 7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.
select distinct c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos from suministrador as s, compra as com, consumidor as c where s.id = com.id_suministrador and c.id = com.id_consumidor and s.nombre = 'Daniel' and s.apellido1 = 'Sáez' and s.apellido2 = 'Vega';

/*
┌────────┬────────────────┐
│ nombre │   apellidos    │
├────────┼────────────────┤
│ Adela  │ Salas Díaz     │
│ Pilar  │ Ruiz           │
│ María  │ Santana Moreno │
└────────┴────────────────┘
*/

-- (Consultas Multitabla Join)
-- -----------------------------------------------
-- 0,3 puntos la correcta. Total = 2,1 puntos
-- -----------------------------------------------

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select distinct c.id, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos from consumidor as c join compra as com on c.id = com.id_consumidor order by c.nombre;

/*
┌────┬────────┬────────────────┐
│ id │ nombre │   apellidos    │
├────┼────────┼────────────────┤
│ 1  │ Aarón  │ Rivero Gómez   │
│ 2  │ Adela  │ Salas Díaz     │
│ 3  │ Adolfo │ Rubio Flores   │
│ 4  │ Adrián │ Suárez         │
│ 5  │ Marcos │ Loyola Méndez  │
│ 6  │ María  │ Santana Moreno │
│ 8  │ Pepe   │ Ruiz Santana   │
│ 7  │ Pilar  │ Ruiz           │
└────┴────────┴────────────────┘
*/

-- 2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
select c.*, com.id as id_compra, com.total, com.fecha, com.id_suministrador from consumidor as c join compra as com on c.id = com.id_consumidor order by c.nombre;

/*
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬───────────┬─────────┬────────────┬──────────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id_compra │  total  │   fecha    │ id_suministrador │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼───────────┼─────────┼────────────┼──────────────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2         │ 270.65  │ 2019-09-10 │ 5                │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15        │ 370.85  │ 2022-03-11 │ 5                │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16        │ 2389.23 │ 2022-03-11 │ 5                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3         │ 65.26   │ 2020-10-05 │ 1                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7         │ 5760.0  │ 2018-09-10 │ 1                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12        │ 3045.6  │ 2020-04-25 │ 1                │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11        │ 75.29   │ 2019-08-17 │ 7                │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8         │ 1983.43 │ 2020-10-10 │ 6                │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1         │ 150.5   │ 2020-10-05 │ 2                │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5         │ 948.5   │ 2020-09-10 │ 2                │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13        │ 545.75  │ 2022-01-25 │ 1                │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14        │ 145.82  │ 2020-02-02 │ 1                │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4         │ 110.5   │ 2019-08-17 │ 3                │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9         │ 2480.4  │ 2019-10-10 │ 3                │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10        │ 250.45  │ 2018-06-27 │ 2                │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6         │ 2400.6  │ 2019-07-27 │ 1                │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴───────────┴─────────┴────────────┴──────────────────┘
*/

-- 3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.
select s.*, com.id as id_compra, com.fecha, com.total, com.id_consumidor from suministrador as s join compra as com on s.id = com.id_suministrador order by s.nombre;

/*
┌────┬─────────┬───────────┬───────────┬───────────┬───────────┬────────────┬─────────┬───────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id_compra │   fecha    │  total  │ id_consumidor │
├────┼─────────┼───────────┼───────────┼───────────┼───────────┼────────────┼─────────┼───────────────┤
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2         │ 2019-09-10 │ 270.65  │ 1             │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11        │ 2019-08-17 │ 75.29   │ 3             │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15        │ 2022-03-11 │ 370.85  │ 1             │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16        │ 2022-03-11 │ 2389.23 │ 1             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3         │ 2020-10-05 │ 65.26   │ 2             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6         │ 2019-07-27 │ 2400.6  │ 7             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7         │ 2018-09-10 │ 5760.0  │ 2             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12        │ 2020-04-25 │ 3045.6  │ 2             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13        │ 2022-01-25 │ 545.75  │ 6             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14        │ 2020-02-02 │ 145.82  │ 6             │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4         │ 2019-08-17 │ 110.5   │ 8             │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9         │ 2019-10-10 │ 2480.4  │ 8             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1         │ 2020-10-05 │ 150.5   │ 5             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5         │ 2020-09-10 │ 948.5   │ 5             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10        │ 2018-06-27 │ 250.45  │ 8             │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8         │ 2020-10-10 │ 1983.43 │ 4             │
└────┴─────────┴───────────┴───────────┴───────────┴───────────┴────────────┴─────────┴───────────────┘
*/

-- 4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.
select c.id as id_consumidor, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos, c.ciudad, com.id as id_compra, com.fecha, com.total, s.id as id_suministrador, s.nombre, s.apellido1 || ' ' || coalesce(s.apellido2, '') as apellidos from consumidor as c join compra as com on c.id = com.id_consumidor join suministrador as s on s.id = com.id_suministrador;

/*
┌───────────────┬────────┬────────────────┬─────────┬───────────┬────────────┬─────────┬──────────────────┬─────────┬─────────────────────┐
│ id_consumidor │ nombre │   apellidos    │ ciudad  │ id_compra │   fecha    │  total  │ id_suministrador │ nombre  │      apellidos      │
├───────────────┼────────┼────────────────┼─────────┼───────────┼────────────┼─────────┼──────────────────┼─────────┼─────────────────────┤
│ 5             │ Marcos │ Loyola Méndez  │ Almería │ 1         │ 2020-10-05 │ 150.5   │ 2                │ Juan    │ Gómez López         │
│ 1             │ Aarón  │ Rivero Gómez   │ Almería │ 2         │ 2019-09-10 │ 270.65  │ 5                │ Antonio │ Carretero Ortega    │
│ 2             │ Adela  │ Salas Díaz     │ Granada │ 3         │ 2020-10-05 │ 65.26   │ 1                │ Daniel  │ Sáez Vega           │
│ 8             │ Pepe   │ Ruiz Santana   │ Huelva  │ 4         │ 2019-08-17 │ 110.5   │ 3                │ Diego   │ Flores Salas        │
│ 5             │ Marcos │ Loyola Méndez  │ Almería │ 5         │ 2020-09-10 │ 948.5   │ 2                │ Juan    │ Gómez López         │
│ 7             │ Pilar  │ Ruiz           │ Sevilla │ 6         │ 2019-07-27 │ 2400.6  │ 1                │ Daniel  │ Sáez Vega           │
│ 2             │ Adela  │ Salas Díaz     │ Granada │ 7         │ 2018-09-10 │ 5760.0  │ 1                │ Daniel  │ Sáez Vega           │
│ 4             │ Adrián │ Suárez         │ Jaén    │ 8         │ 2020-10-10 │ 1983.43 │ 6                │ Manuel  │ Domínguez Hernández │
│ 8             │ Pepe   │ Ruiz Santana   │ Huelva  │ 9         │ 2019-10-10 │ 2480.4  │ 3                │ Diego   │ Flores Salas        │
│ 8             │ Pepe   │ Ruiz Santana   │ Huelva  │ 10        │ 2018-06-27 │ 250.45  │ 2                │ Juan    │ Gómez López         │
│ 3             │ Adolfo │ Rubio Flores   │ Sevilla │ 11        │ 2019-08-17 │ 75.29   │ 7                │ Antonio │ Vega Hernández      │
│ 2             │ Adela  │ Salas Díaz     │ Granada │ 12        │ 2020-04-25 │ 3045.6  │ 1                │ Daniel  │ Sáez Vega           │
│ 6             │ María  │ Santana Moreno │ Cádiz   │ 13        │ 2022-01-25 │ 545.75  │ 1                │ Daniel  │ Sáez Vega           │
│ 6             │ María  │ Santana Moreno │ Cádiz   │ 14        │ 2020-02-02 │ 145.82  │ 1                │ Daniel  │ Sáez Vega           │
│ 1             │ Aarón  │ Rivero Gómez   │ Almería │ 15        │ 2022-03-11 │ 370.85  │ 5                │ Antonio │ Carretero Ortega    │
│ 1             │ Aarón  │ Rivero Gómez   │ Almería │ 16        │ 2022-03-11 │ 2389.23 │ 5                │ Antonio │ Carretero Ortega    │
└───────────────┴────────┴────────────────┴─────────┴───────────┴────────────┴─────────┴──────────────────┴─────────┴─────────────────────┘
*/

-- 5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.
select c.* from consumidor as c join compra as com on c.id = com.id_consumidor and com.fecha regexp '2020' and com.total between 300 and 1000;

/*
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
*/

-- 6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
select distinct s.nombre, s.apellido1 || ' ' || coalesce(s.apellido2, '') as apellidos from suministrador as s join compra as com on s.id = com.id_suministrador join consumidor as c on c.id = com.id_consumidor where c.nombre = 'María' and c.apellido1 = 'Santana' and c.apellido2 = 'Moreno';

/*
┌────────┬───────────┐
│ nombre │ apellidos │
├────────┼───────────┤
│ Daniel │ Sáez Vega │
└────────┴───────────┘
*/

-- 7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.
select distinct c.nombre from suministrador as s join compra as com on s.id = com.id_suministrador join consumidor as c on c.id = com.id_consumidor and s.nombre = 'Daniel' and s.apellido1 = 'Sáez' and s.apellido2 = 'Vega';

/*
┌────────┐
│ nombre │
├────────┤
│ Adela  │
│ Pilar  │
│ María  │
└────────┘
*/

-- ---------------------------
-- Consultas resumen (funciones)
-- -----------------------------------------------
-- 0,2 puntos la correcta. (1-6) 1,2 puntos
-- 0,25 puntos la correcta. (7-10) 1 punto.
-- Total = 2,2 puntos
-- -----------------------------------------------

-- 1. Calcula la cantidad media de todos las compras que aparecen en la tabla compra.
select avg(total) as media_compras from compra;

/*
┌───────────────┐
│ media_compras │
├───────────────┤
│ 1312.051875   │
└───────────────┘
*/

-- 2. Calcula el número total de suministradores distintos que aparecen en la tabla compra.
select count(distinct(id_suministrador)) as suministradores from compra;

/*
┌─────────────────┐
│ suministradores │
├─────────────────┤
│ 6               │
└─────────────────┘
*/

-- 3. Calcula el número total de consumidores que aparecen en la tabla consumidor.
select count(id) as consumidores from consumidor;

/*
┌──────────────┐
│ consumidores │
├──────────────┤
│ 10           │
└──────────────┘
*/

-- 4. Calcula cuál es la mayor cantidad que aparece en la tabla compra.
select max(total) as max_cantidad from compra;

/*
┌──────────────┐
│ max_cantidad │
├──────────────┤
│ 5760.0       │
└──────────────┘
*/

-- 5. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla consumidor.
select ciudad, max(categoria) as max_categoria from consumidor group by ciudad;

/*
┌─────────┬───────────────┐
│ ciudad  │ max_categoria │
├─────────┼───────────────┤
│ Almería │ 200           │
│ Cádiz   │ 100           │
│ Granada │ 225           │
│ Huelva  │ 200           │
│ Jaén    │ 300           │
│ Sevilla │ 300           │
└─────────┴───────────────┘
*/

-- 6. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores.
-- Es decir, el mismo consumidor puede haber realizado varios compras de diferentes cantidades el mismo día.
-- Se pide que se calcule cuál es el compra de máximo valor para cada uno de los días en los que un consumidor ha realizado un compra.
-- Muestra el identificador del consumidor, nombre, apellidos, la fecha y el valor de la cantidad.
select com.id_consumidor, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos, com.fecha, max(com.total) as max_compra from compra as com join consumidor as c on com.id_consumidor = c.id group by com.fecha, com.id_consumidor;

/*
┌───────────────┬────────┬────────────────┬────────────┬────────────┐
│ id_consumidor │ nombre │   apellidos    │   fecha    │ max_compra │
├───────────────┼────────┼────────────────┼────────────┼────────────┤
│ 8             │ Pepe   │ Ruiz Santana   │ 2018-06-27 │ 250.45     │
│ 2             │ Adela  │ Salas Díaz     │ 2018-09-10 │ 5760.0     │
│ 7             │ Pilar  │ Ruiz           │ 2019-07-27 │ 2400.6     │
│ 3             │ Adolfo │ Rubio Flores   │ 2019-08-17 │ 75.29      │
│ 8             │ Pepe   │ Ruiz Santana   │ 2019-08-17 │ 110.5      │
│ 1             │ Aarón  │ Rivero Gómez   │ 2019-09-10 │ 270.65     │
│ 8             │ Pepe   │ Ruiz Santana   │ 2019-10-10 │ 2480.4     │
│ 6             │ María  │ Santana Moreno │ 2020-02-02 │ 145.82     │
│ 2             │ Adela  │ Salas Díaz     │ 2020-04-25 │ 3045.6     │
│ 5             │ Marcos │ Loyola Méndez  │ 2020-09-10 │ 948.5      │
│ 2             │ Adela  │ Salas Díaz     │ 2020-10-05 │ 65.26      │
│ 5             │ Marcos │ Loyola Méndez  │ 2020-10-05 │ 150.5      │
│ 4             │ Adrián │ Suárez         │ 2020-10-10 │ 1983.43    │
│ 6             │ María  │ Santana Moreno │ 2022-01-25 │ 545.75     │
│ 1             │ Aarón  │ Rivero Gómez   │ 2022-03-11 │ 2389.23    │
└───────────────┴────────┴────────────────┴────────────┴────────────┘
*/

-- 7. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores,
-- teniendo en cuenta que sólo queremos mostrar aquellas compras que superen la cantidad de 2000 €.
select com.id_consumidor, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos, com.fecha, max(com.total) as max_compra from compra as com join consumidor as c on com.id_consumidor = c.id group by com.fecha, com.id_consumidor having max_compra > 2000;
 
/*
┌───────────────┬────────┬──────────────┬────────────┬────────────┐
│ id_consumidor │ nombre │  apellidos   │   fecha    │ max_compra │
├───────────────┼────────┼──────────────┼────────────┼────────────┤
│ 2             │ Adela  │ Salas Díaz   │ 2018-09-10 │ 5760.0     │
│ 7             │ Pilar  │ Ruiz         │ 2019-07-27 │ 2400.6     │
│ 8             │ Pepe   │ Ruiz Santana │ 2019-10-10 │ 2480.4     │
│ 2             │ Adela  │ Salas Díaz   │ 2020-04-25 │ 3045.6     │
│ 1             │ Aarón  │ Rivero Gómez │ 2022-03-11 │ 2389.23    │
└───────────────┴────────┴──────────────┴────────────┴────────────┘
*/

-- 8. Calcula el máximo valor de las compras realizadas para cada uno de los suministradores durante la fecha 2020-08-17.
-- Muestra el identificador del suministrador, nombre, apellidos y total.
select com.id_suministrador, s.nombre, s.apellido1 || ' ' || coalesce(s.apellido2, '') as apellidos, max(com.total) as max_compra from compra as com join suministrador as s on com.id_suministrador = s.id where com.fecha = '2020-08-17' group by com.id_suministrador;

/*
No se devuelve tabla porque no se cumplen los requisitos.
*/

-- 9. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores.
-- Tenga en cuenta que pueden existir consumidores que no han realizado ninguna compra.
-- Estos consumidores también deben aparecer en el listado indicando que el número de compras realizadas es 0.
select c.id, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos, (select count(id) from compra where compra.id_consumidor = c.id) as total_compras from consumidor as c;

/*
┌────┬───────────┬────────────────┬───────────────┐
│ id │  nombre   │   apellidos    │ total_compras │
├────┼───────────┼────────────────┼───────────────┤
│ 1  │ Aarón     │ Rivero Gómez   │ 3             │
│ 2  │ Adela     │ Salas Díaz     │ 3             │
│ 3  │ Adolfo    │ Rubio Flores   │ 1             │
│ 4  │ Adrián    │ Suárez         │ 1             │
│ 5  │ Marcos    │ Loyola Méndez  │ 2             │
│ 6  │ María     │ Santana Moreno │ 2             │
│ 7  │ Pilar     │ Ruiz           │ 1             │
│ 8  │ Pepe      │ Ruiz Santana   │ 3             │
│ 9  │ Guillermo │ López Gómez    │ 0             │
│ 10 │ Daniel    │ Santana Loyola │ 0             │
└────┴───────────┴────────────────┴───────────────┘
*/

-- 10. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores durante el año 2020.
select c.id, c.nombre, c.apellido1 || ' ' || coalesce(c.apellido2, '') as apellidos, count(com.id_consumidor) as total_compras from consumidor as c join compra as com on c.id = com.id_consumidor where com.fecha regexp '2020' group by c.id;

/*
┌────┬────────┬────────────────┬───────────────┐
│ id │ nombre │   apellidos    │ total_compras │
├────┼────────┼────────────────┼───────────────┤
│ 2  │ Adela  │ Salas Díaz     │ 2             │
│ 4  │ Adrián │ Suárez         │ 1             │
│ 5  │ Marcos │ Loyola Méndez  │ 2             │
│ 6  │ María  │ Santana Moreno │ 1             │
└────┴────────┴────────────────┴───────────────┘
*/

-- ---------------------
-- Subconsultas
-- -----------------------------------------------
-- 0,2 puntos la correcta (1-5).
-- 0,3 puntos la correcta (6-9).
-- Total = 2,2 puntos
-- -----------------------------------------------

--- Con operadores básicos de comparación

-- 1. Devuelve un listado con todos las compras que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
select com.* from compra as com where com.id_consumidor = (select id from consumidor where nombre = 'Adela' and apellido1 = 'Salas' and apellido2 = 'Díaz');

/*
┌────┬────────┬────────────┬───────────────┬──────────────────┐
│ id │ total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼────────┼────────────┼───────────────┼──────────────────┤
│ 3  │ 65.26  │ 2020-10-05 │ 2             │ 1                │
│ 7  │ 5760.0 │ 2018-09-10 │ 2             │ 1                │
│ 12 │ 3045.6 │ 2020-04-25 │ 2             │ 1                │
└────┴────────┴────────────┴───────────────┴──────────────────┘
*/

-- 2. Devuelve la fecha y la cantidad del compra de menor valor realizado por el cliente Pepe Ruiz Santana.
select fecha, min(total) as min_valor from compra where compra.id_consumidor = (select id from consumidor where nombre = 'Pepe' and apellido1 = 'Ruiz' and apellido2 = 'Santana');

/*
┌────────────┬───────────┐
│   fecha    │ min_valor │
├────────────┼───────────┤
│ 2019-08-17 │ 110.5     │
└────────────┴───────────┘
*/

-- 3. Devuelve el número de compras en los que ha participado el suministrador Daniel Sáez Vega. (Sin utilizar INNER JOIN)
select count(id) as compras from compra where compra.id_suministrador = (select id from suministrador where nombre = 'Daniel' and apellido1 = 'Sáez' and apellido2 = 'Vega');

/*
┌─────────┐
│ compras │
├─────────┤
│ 6       │
└─────────┘
*/

-- 4. Devuelve los datos del consumidor que realizó el compra más caro en el año 2021. (Sin utilizar INNER JOIN)
select * from consumidor where id = (select id_consumidor from compra where total = (select max(total) from compra where fecha regexp '2021'));

/*
No se devuelve tabla porque no hubo compras en el 2021
*/

-- 5. Devuelve un listado con los datos de los consumidores y las compras, de todos los consumidores que han realizado un compra durante el año 2020 con un valor mayor o igual al valor medio de las compras realizadas durante ese mismo año.
select c.*, com.id as id_compra, com.fecha, com.total, com.id_suministrador from consumidor as c join compra as com on c.id = com.id_consumidor where com.fecha regexp '2020' and com.total >= (select avg(total) from compra where fecha regexp '2020');

/*
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬───────────┬────────────┬─────────┬──────────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id_compra │   fecha    │  total  │ id_suministrador │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼───────────┼────────────┼─────────┼──────────────────┤
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8         │ 2020-10-10 │ 1983.43 │ 6                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12        │ 2020-04-25 │ 3045.6  │ 1                │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴───────────┴────────────┴─────────┴──────────────────┘
*/

-- 6. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando IN o NOT IN).
select * from consumidor where id not in (select id_consumidor from compra);

/*
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
*/

-- 7. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando IN o NOT IN).
select * from suministrador where id not in (select id_suministrador from compra);

/*
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘
*/

-- 8. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
select * from consumidor where not exists (select id_consumidor from compra where compra.id_consumidor = consumidor.id);

/*
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
*/

-- 9. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
select * from suministrador where not exists (select id_suministrador from compra where compra.id_suministrador = suministrador.id);

/*
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘
*/