# Tarea 4 - Consultas y vistas

<div align=center>

![img](https://media.tenor.com/eFeqNqXZS0IAAAAM/cc.gif)

_Pez de la buena suerte, pero segundo_

</div>

## Contenido

1. [Consultas](#consultas)
2. [Trabajo con vistas](#trabajo-con-vistas)

## Consultas

Dada la exageración de tamaño de las tablas resultantes al realizar las consultas, tuve que mover este apartado a un archivo independiente pues el _GitHub_ no es capaz de mostrar todo el _README_ con este contenido. [Lo encuentra aquí en este fichero.](./consultas/consultas.sql)

## Trabajo con vistas

Para empezar con este apartado, se realizan las consultas de las vistas previamente creadas en la base de datos _Sakila_:

### Customer_list

```sql
select * from customer_list;
```
La tabla resultante se encuentra en el siguiente archivo -> [customer_list](./consultas/customer_list.sql)

### Film_list

```sql
select * from film_list;
```
La tabla resultante se encuentra en el siguiente archivo -> [film_list](./consultas/film_list.sql)


### Creación de las vistas propias

1. film_category_language: contiene el nombre de la película, su categoría y su idioma.

- __Creación:__
```sql
create view film_category_language as select f.title, l.name as language, c.name as category from film as f join language as l on f.language_id = l.language_id join film_category as fc on f.film_id = fc.film_id join category as c on fc.category_id = c.category_id;
```

- __Consulta:__
```sql
select * from film_category_language;
```
La tabla resultante se encuentre en el siguiente archivo -> [film_category_language](./consultas/film_category_language.sql)


2. film_text_store: contiene el nombre de la película, la descripción y la dirección de la tienda donde se consigue.

- __Creación:__
```sql
create view film_text_store as select distinct f.title, ft.description, a.address as store_address from film as f join film_text as ft on f.film_id = ft.film_id join inventory as i on i.film_id = f.film_id join store as s on s.store_id = i.store_id join address
as a on a.address_id = s.address_id;
```

- __Consulta:__
```sql
select * from film_text_store;
```
La tabla resultante se encuentre en el siguiente archivo -> [film_text_store](./consultas/film_text_store.sql)

3. staff_store_inventory: contiene el nombre del manager de la tienda, la ubicación de la misma y la fecha de la última actualización del inventario de dicha tienda.

- __Creación:__
```sql
create view staff_store_inventory as select distinct concat_ws(' ', sl.first_name, sl.last_name) as manager_name, a.address as store_address, i.last_update from store as s join address as a on s.address_id = a.address_id join staff as sl on sl.staff_id = s.manager_staff_id join inventory as i on s.store_id = i.store_id; 
```

- __Consulta:__
```sql
select * from staff_store_inventory;

+--------------+--------------------+---------------------+
| manager_name | store_address      | last_update         |
+--------------+--------------------+---------------------+
| Mike Hillyer | 47 MySakila Drive  | 2006-02-15 05:09:17 |
| Jon Stephens | 28 MySQL Boulevard | 2006-02-15 05:09:17 |
+--------------+--------------------+---------------------+
```

4. film_actor_category: contiene la cantidad de películas y actores participantes por cada categoría.

- __Creación:__
```sql
create view film_actor_category as select count(f.film_id) as films, count(fa.actor_id) as actors, c.name as category from film as f join film_category as fc on f.film_id = fc.film_id join category as c on fc.category_id = c.category_id join film_actor as fa on fa.film_id = f.film_id group by category;
```

- __Consulta:__
```sql
select * from film_actor_category;

+-------+--------+-------------+
| films | actors | category    |
+-------+--------+-------------+
|   363 |    363 | Action      |
|   361 |    361 | Animation   |
|   344 |    344 | Children    |
|   307 |    307 | Classics    |
|   286 |    286 | Comedy      |
|   385 |    385 | Documentary |
|   350 |    350 | Drama       |
|   347 |    347 | Family      |
|   397 |    397 | Foreign     |
|   293 |    293 | Games       |
|   317 |    317 | Horror      |
|   281 |    281 | Music       |
|   343 |    343 | New         |
|   326 |    326 | Sci-Fi      |
|   441 |    441 | Sports      |
|   321 |    321 | Travel      |
+-------+--------+-------------+
```

5. country_city_postal: contienen los paises, las ciudades y los códigos postales encontrados en cobertura por el negocio.

- __Creación:__
```sql
create view country_city_postal as select c.country, ci.city, a.postal_code from country as c join city as ci on c.country_id = ci.country_id join address as a on a.city_id = ci.city_id order by c.country;
```

- __Consulta:__
```sql
select * from country_city_postal;
```
La tabla resultante se encuentra en el siguiente archivo -> [country_city_postal](./consultas/country_city_postal.sql)
