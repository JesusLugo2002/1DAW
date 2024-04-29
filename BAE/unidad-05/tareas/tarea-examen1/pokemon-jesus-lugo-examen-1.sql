-- Actualizar el nivel de Bulbasaur.
/**
select * from Pokemon where nombre like "Bulbasaur";
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 1  | Bulbasaur | 3       | 10    |
+----+-----------+---------+-------+
 **/
update pokemon set nivel=30 where nombre like "Bulbasaur";
/**
select * from Pokemon where nombre like "Bulbasaur";
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 1  | Bulbasaur | 3       | 30    |
+----+-----------+---------+-------+
**/


-- Cambiar el tipo de Pikachu a "Eléctrico/Rojo".
-- Como no existe un tipo "Eléctrico/Rojo", este se inserta en la tabla "Tipo"
insert into tipo (nombre) values ('Eléctrico/Rojo');
/**
select * from tipo;
+----+----------------+
| id |     nombre     |
+----+----------------+
| 1  | Agua           |
| 2  | Fuego          |
| 3  | Planta         |
| 4  | Eléctrico      |
| 5  | Tierra         |
| 6  | Eléctrico/Rojo |
+----+----------------+
Ahora que sabemos que la id del nuevo tipo 'Eléctrico/Rojo' es 6...
select * from pokemon where nombre like "Pikachu";
+----+---------+---------+-------+
| id | nombre  | id_tipo | nivel |
+----+---------+---------+-------+
| 4  | Pikachu | 4       | 15    |
+----+---------+---------+-------+
**/
update pokemon set id_tipo=6 where nombre like "Pikachu";
/**
select * from pokemon where nombre like "Pikachu";
+----+---------+---------+-------+
| id | nombre  | id_tipo | nivel |
+----+---------+---------+-------+
| 4  | Pikachu | 6       | 15    |
+----+---------+---------+-------+
**/


-- Incrementar el nivel de todos los Pokémon de tipo Agua.
/**
select * from pokemon as p, tipo as t where p.id_tipo = t.id and t.nombre like "Agua";
+----+-----------+---------+-------+----+--------+
| id |  nombre   | id_tipo | nivel | id | nombre |
+----+-----------+---------+-------+----+--------+
| 3  | Squirtle  | 1       | 8     | 1  | Agua   |
| 6  | Vaporeon  | 1       | 25    | 1  | Agua   |
| 11 | Gyarados  | 1       | 30    | 1  | Agua   |
| 18 | Blastoise | 1       | 55    | 1  | Agua   |
+----+-----------+---------+-------+----+--------+
**/
update pokemon set nivel=nivel+10 where pokemon.id in (select p.id from pokemon as p, tipo as t where p.id_tipo = t.id and t.nombre like "Agua");
/**
select * from pokemon as p, tipo as t where p.id_tipo = t.id and t.nombre like "Agua";
+----+-----------+---------+-------+----+--------+
| id |  nombre   | id_tipo | nivel | id | nombre |
+----+-----------+---------+-------+----+--------+
| 3  | Squirtle  | 1       | 18    | 1  | Agua   |
| 6  | Vaporeon  | 1       | 35    | 1  | Agua   |
| 11 | Gyarados  | 1       | 40    | 1  | Agua   |
| 18 | Blastoise | 1       | 65    | 1  | Agua   |
+----+-----------+---------+-------+----+--------+
**/


-- Eliminar a Jynx de la lista de Pokémon.
/**
select * from pokemon where nombre like "Jynx";
Tras realizar la consulta, no se arroja ningún resultado, por lo que podemos comprobar que no existe ningún Pokemon llamado Jynx al cual eliminar.
**/


 -- Eliminar el tipo "Hielo" de la lista de tipos de Pokémon.
/**
select * from tipo where nombre like "Hielo";
Tras realizar la consulta, no se arroja ningún resultado, por lo que podemos comprobar que no existe el tipo "Hielo".
**/


 -- Obtener todos los Pokémon.
 /**
select * from pokemon;
+----+------------+---------+-------+
| id |   nombre   | id_tipo | nivel |
+----+------------+---------+-------+
| 1  | Bulbasaur  | 3       | 30    |
| 2  | Charmander | 2       | 12    |
| 3  | Squirtle   | 1       | 18    |
| 4  | Pikachu    | 6       | 15    |
| 5  | Geodude    | 5       | 11    |
| 6  | Vaporeon   | 1       | 35    |
| 7  | Flareon    | 2       | 27    |
| 8  | Ivysaur    | 3       | 18    |
| 9  | Jolteon    | 4       | 22    |
| 10 | Cubone     | 5       | 14    |
| 11 | Gyarados   | 1       | 40    |
| 12 | Arcanine   | 2       | 35    |
| 13 | Exeggutor  | 3       | 40    |
| 14 | Raichu     | 4       | 38    |
| 15 | Sandslash  | 5       | 33    |
| 16 | Venusaur   | 3       | 45    |
| 17 | Charizard  | 2       | 50    |
| 18 | Blastoise  | 1       | 65    |
| 19 | Electabuzz | 4       | 48    |
| 20 | Rhydon     | 5       | 52    |
| 21 | Dragonite  | 2       | 60    |
| 22 | Flareon    | 2       | 65    |
| 23 | Venusaur   | 3       | 70    |
| 24 | Zapdos     | 4       | 75    |
| 25 | Rhydon     | 5       | 80    |
+----+------------+---------+-------+
**/

-- Obtener el nombre y nivel de los Pokémon de tipo Fuego.
/**
select p.nombre, p.nivel, t.nombre as tipo from pokemon as p, tipo as t where p.id_tipo = t.id and t.id in (select id from tipo where nombre like "Fuego");
+------------+-------+-------+
|   nombre   | nivel | tipo  |
+------------+-------+-------+
| Charmander | 12    | Fuego |
| Flareon    | 27    | Fuego |
| Arcanine   | 35    | Fuego |
| Charizard  | 50    | Fuego |
| Dragonite  | 60    | Fuego |
| Flareon    | 65    | Fuego |
+------------+-------+-------+
**/


-- Obtener el nombre de los Pokémon que tienen un nivel superior a 30.
/**
select pokemon.nombre, pokemon.nivel from pokemon where nivel > 30;
+------------+-------+
|   nombre   | nivel |
+------------+-------+
| Vaporeon   | 35    |
| Gyarados   | 40    |
| Arcanine   | 35    |
| Exeggutor  | 40    |
| Raichu     | 38    |
| Sandslash  | 33    |
| Venusaur   | 45    |
| Charizard  | 50    |
| Blastoise  | 65    |
| Electabuzz | 48    |
| Rhydon     | 52    |
| Dragonite  | 60    |
| Flareon    | 65    |
| Venusaur   | 70    |
| Zapdos     | 75    |
| Rhydon     | 80    |
+------------+-------+
**/


-- Obtener el nombre de los Pokémon ordenados por nivel de forma descendente.
/**
select pokemon.nombre, pokemon.nivel from pokemon order by nivel desc;
+------------+-------+
|   nombre   | nivel |
+------------+-------+
| Rhydon     | 80    |
| Zapdos     | 75    |
| Venusaur   | 70    |
| Blastoise  | 65    |
| Flareon    | 65    |
| Dragonite  | 60    |
| Rhydon     | 52    |
| Charizard  | 50    |
| Electabuzz | 48    |
| Venusaur   | 45    |
| Gyarados   | 40    |
| Exeggutor  | 40    |
| Raichu     | 38    |
| Vaporeon   | 35    |
| Arcanine   | 35    |
| Sandslash  | 33    |
| Bulbasaur  | 30    |
| Flareon    | 27    |
| Jolteon    | 22    |
| Squirtle   | 18    |
| Ivysaur    | 18    |
| Pikachu    | 15    |
| Cubone     | 14    |
| Charmander | 12    |
| Geodude    | 11    |
+------------+-------+
**/


-- Obtener la cantidad de Pokémon por tipo.
/**
select count(*) as cantidad_pokemons, id_tipo from pokemon group by id_tipo;
+-------------------+---------+
| cantidad_pokemons | id_tipo |
+-------------------+---------+
| 4                 | 1       |
| 6                 | 2       |
| 5                 | 3       |
| 4                 | 4       |
| 5                 | 5       |
| 1                 | 6       |
+-------------------+---------+
**/


-- Obtener la información completa de un Pokémon específico. Selecciona el que desees.
/**
select p.id, p.nombre, p.nivel, t.nombre as tipo from pokemon as p, tipo as t where p.id_tipo = t.id and p.nombre like "Arcanine";
+----+----------+-------+-------+
| id |  nombre  | nivel | tipo  |
+----+----------+-------+-------+
| 12 | Arcanine | 35    | Fuego |
+----+----------+-------+-------+
**/


-- Obtener el promedio de niveles de todos los Pokémon.
/**
select avg(nivel) as promedio_niveles from pokemon;
+------------------+
| promedio_niveles |
+------------------+
| 39.92            |
+------------------+
**/


-- Obtener el nombre del Pokémon de mayor nivel.
/**
select nombre, max(nivel) as max_nivel from pokemon;
+--------+-----------+
| nombre | max_nivel |
+--------+-----------+
| Rhydon | 80        |
+--------+-----------+
**/


-- Actualizar el nombre de Bulbasaur a "Bulbasaur Nv. 15":
/**
select * from pokemon where nombre like "Bulbasaur";
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 1  | Bulbasaur | 3       | 30    |
+----+-----------+---------+-------+
**/
update pokemon set nombre="Bulbasaur Nv. 15" where nombre like "Bulbasaur";
/**
select * from pokemon where nombre like "Bulbasaur%";
+----+------------------+---------+-------+
| id |      nombre      | id_tipo | nivel |
+----+------------------+---------+-------+
| 1  | Bulbasaur Nv. 15 | 3       | 30    |
+----+------------------+---------+-------+
**/


-- Obtener los Pokémon cuyo nivel es igual a 50.
/**
select * from pokemon where nivel=50;
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 17 | Charizard | 2       | 50    |
+----+-----------+---------+-------+
**/


-- Eliminar todos los Pokémon de nivel 40.
/**
select * from pokemon where nivel=40;
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 11 | Gyarados  | 1       | 40    |
| 13 | Exeggutor | 3       | 40    |
+----+-----------+---------+-------+
**/
delete from pokemon where nivel=40;
/**
select * from pokemon where nivel=40;
Al volver a realizar la consulta, no se arrojan los resultados, pues estos fueron borrados satisfactoriamente.
**/


 -- Obtener el tipo y nivel de Pikachu.
/**
select p.nombre, t.nombre as tipo, p.nivel from pokemon as p, tipo as t where p.nombre like "Pikachu" and p.id_tipo = t.id;
+---------+----------------+-------+
| nombre  |      tipo      | nivel |
+---------+----------------+-------+
| Pikachu | Eléctrico/Rojo | 15    |
+---------+----------------+-------+
**/

 -- Obtener los Pokémon de tipo Planta con nivel superior a 20:
 /**
select * from pokemon where nivel > 20 and id_tipo in (select id from tipo where nombre like "Planta");
+----+------------------+---------+-------+
| id |      nombre      | id_tipo | nivel |
+----+------------------+---------+-------+
| 1  | Bulbasaur Nv. 15 | 3       | 30    |
| 16 | Venusaur         | 3       | 45    |
| 23 | Venusaur         | 3       | 70    |
+----+------------------+---------+-------+
**/


-- Actualizar el tipo de Pikachu a "Eléctrico/Azul":
-- Como no existe el tipo 'Eléctrico/Azul' en la tabla, esta es añadida:
insert into tipo (nombre) values ('Eléctrico/Azul');
/**
select * from tipo;
+----+----------------+
| id |     nombre     |
+----+----------------+
| 1  | Agua           |
| 2  | Fuego          |
| 3  | Planta         |
| 4  | Eléctrico      |
| 5  | Tierra         |
| 6  | Eléctrico/Rojo |
| 7  | Eléctrico/Azul |
+----+----------------+
Ahora que comprobamos que la id del nuevo tipo es 7...

select * from pokemon where nombre like "Pikachu";
+----+---------+---------+-------+
| id | nombre  | id_tipo | nivel |
+----+---------+---------+-------+
| 4  | Pikachu | 6       | 15    |
+----+---------+---------+-------+
**/
update pokemon set id_tipo=7 where nombre like "Pikachu";
/**
select * from pokemon where nombre like "Pikachu";
+----+---------+---------+-------+
| id | nombre  | id_tipo | nivel |
+----+---------+---------+-------+
| 4  | Pikachu | 7       | 15    |
+----+---------+---------+-------+
**/


-- Eliminar todos los Pokémon de tipo Planta.
delete from pokemon where id_tipo in (select id from tipo where nombre like "Planta");
/**
select * from pokemon where id_tipo in (select id from tipo where nombre like "Planta");
El select no arroja resultados, pues ya no existen pokemons de tipo Planta.
**/


 -- Obtener los Pokémon con nombre y tipo ordenados alfabéticamente.
/**
select p.nombre as nombre_pokemon, t.nombre as nombre_tipo from pokemon as p, tipo as t where p.id_tipo = t.id order by p.nombre;
+----------------+----------------+
| nombre_pokemon |  nombre_tipo   |
+----------------+----------------+
| Arcanine       | Fuego          |
| Blastoise      | Agua           |
| Charizard      | Fuego          |
| Charmander     | Fuego          |
| Cubone         | Tierra         |
| Dragonite      | Fuego          |
| Electabuzz     | Eléctrico      |
| Flareon        | Fuego          |
| Flareon        | Fuego          |
| Geodude        | Tierra         |
| Jolteon        | Eléctrico      |
| Pikachu        | Eléctrico/Azul |
| Raichu         | Eléctrico      |
| Rhydon         | Tierra         |
| Rhydon         | Tierra         |
| Sandslash      | Tierra         |
| Squirtle       | Agua           |
| Vaporeon       | Agua           |
| Zapdos         | Eléctrico      |
+----------------+----------------+
**/

-- Obtén todos los Pokémon cuyos nombres contienen las letras 'sa'.
/**
select * from pokemon where nombre like "%sa%";
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 15 | Sandslash | 5       | 33    |
+----+-----------+---------+-------+
**/


 -- Encuentra todos los Pokémon cuyo nivel es 40, 50 o 60.
 /**
select * from pokemon where nivel=40 or nivel=50 or nivel=60;
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 17 | Charizard | 2       | 50    |
| 21 | Dragonite | 2       | 60    |
+----+-----------+---------+-------+
**/


 -- Obtén todos los Pokémon de tipo Fuego cuyos nombres comienzan con la letra 'C'.
 /**
 select * from pokemon where nombre like "C%" and id_tipo in (select id from tipo where nombre like "Fuego");
+----+------------+---------+-------+
| id |   nombre   | id_tipo | nivel |
+----+------------+---------+-------+
| 2  | Charmander | 2       | 12    |
| 17 | Charizard  | 2       | 50    |
+----+------------+---------+-------+
**/


 -- Encuentra los nombres y tipos de los Pokémon cuyo nivel es mayor que el promedio de todos los Pokémon en la base de datos.
 /**
select p.nombre, t.nombre as tipo, p.nivel from pokemon as p, tipo as t where p.id_tipo = t.id and nivel > (select avg(nivel) from pokemon);
+------------+-----------+-------+
|   nombre   |   tipo    | nivel |
+------------+-----------+-------+
| Charizard  | Fuego     | 50    |
| Blastoise  | Agua      | 65    |
| Electabuzz | Eléctrico | 48    |
| Rhydon     | Tierra    | 52    |
| Dragonite  | Fuego     | 60    |
| Flareon    | Fuego     | 65    |
| Zapdos     | Eléctrico | 75    |
| Rhydon     | Tierra    | 80    |
+------------+-----------+-------+
**/