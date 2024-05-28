-- Nombre: Jesús Daniel Lugo López

-- 1. Realiza la inserción de, al menos, 2 alumnos.

/** Estado anterior
select count(*) as alumnos from alumno;
+---------+
| alumnos |
+---------+
| 10      |
+---------+
**/
-- Consulta: 
insert into alumno values ('DNI198321F','Jesus','Lugo','90','1');
insert into alumno values ('DNI987678K','Michael','Jackson','89','2');
/** Estado posterior
select count(*) as alumnos from alumno;
+---------+
| alumnos |
+---------+
| 12      |
+---------+
**/

-- 2. Obtener los apellidos de los alumnos.

/** Estado anterior
select apellido from alumno;
+-----------+
| apellido  |
+-----------+
| Pérez     |
| Martínez  |
| Gómez     |
| Martínez  |
| Fernández |
| Pérez     |
| Pérez     |
| García    |
| López     |
| Martínez  |
| Lugo      |
| Jackson   |
+-----------+
**/
-- Consulta:
select apellido from alumno;
/** Estado posterior
select apellido from alumno;
+-----------+
| apellido  |
+-----------+
| Pérez     |
| Martínez  |
| Gómez     |
| Martínez  |
| Fernández |
| Pérez     |
| Pérez     |
| García    |
| López     |
| Martínez  |
| Lugo      |
| Jackson   |
+-----------+
**/


-- 3. Obtener los apellidos de los alumnos sin repeticiones.

/** Estado anterior
select distinct(apellido) from alumno;
+-----------+
| apellido  |
+-----------+
| Pérez     |
| Martínez  |
| Gómez     |
| Fernández |
| García    |
| López     |
| Lugo      |
| Jackson   |
+-----------+
**/
-- Consulta:
select distinct(apellido) from alumno
/** Estado posterior
select distinct(apellido) from alumno;
+-----------+
| apellido  |
+-----------+
| Pérez     |
| Martínez  |
| Gómez     |
| Fernández |
| García    |
| López     |
| Lugo      |
| Jackson   |
+-----------+
**/


-- 4. Obtener todos los datos de los alumnos que se apellidan Martínez.

/** Estado anterior
select * from alumno where apellido like "Martínez";
+------------+--------+----------+------+----------+
|    dni     | nombre | apellido | nota | id_clase |
+------------+--------+----------+------+----------+
| DNI789012B | María  | Martínez | 92   | 2        |
| DNI901234D | Ana    | Martínez | 89   | 3        |
| DNI345678J | Elena  | Martínez | 94   | 3        |
+------------+--------+----------+------+----------+
**/
-- Consulta:
select * from alumno where apellido like "Martínez";
/** Estado posterior
select * from alumno where apellido like "Martínez";
+------------+--------+----------+------+----------+
|    dni     | nombre | apellido | nota | id_clase |
+------------+--------+----------+------+----------+
| DNI789012B | María  | Martínez | 92   | 2        |
| DNI901234D | Ana    | Martínez | 89   | 3        |
| DNI345678J | Elena  | Martínez | 94   | 3        |
+------------+--------+----------+------+----------+
**/


-- 5. Obtener todos los datos de los alumnos que se apellidan Martínez y los que se apellidan Pérez.

/** Estado anterior
select * from alumno where apellido like "Martínez" or apellido like "Pérez";
+------------+--------+----------+------+----------+
|    dni     | nombre | apellido | nota | id_clase |
+------------+--------+----------+------+----------+
| DNI123456A | Juan   | Pérez    | 85   | 1        |
| DNI789012B | María  | Martínez | 92   | 2        |
| DNI901234D | Ana    | Martínez | 89   | 3        |
| DNI123890F | Laura  | Pérez    | 75   | 1        |
| DNI456789G | Carlos | Pérez    | 88   | 3        |
| DNI345678J | Elena  | Martínez | 94   | 3        |
+------------+--------+----------+------+----------+
**/
-- Consulta:
select * from alumno where apellido like "Martínez" or apellido like "Pérez";
/** Estado posterior
select * from alumno where apellido like "Martínez" or apellido like "Pérez";
+------------+--------+----------+------+----------+
|    dni     | nombre | apellido | nota | id_clase |
+------------+--------+----------+------+----------+
| DNI123456A | Juan   | Pérez    | 85   | 1        |
| DNI789012B | María  | Martínez | 92   | 2        |
| DNI901234D | Ana    | Martínez | 89   | 3        |
| DNI123890F | Laura  | Pérez    | 75   | 1        |
| DNI456789G | Carlos | Pérez    | 88   | 3        |
| DNI345678J | Elena  | Martínez | 94   | 3        |
+------------+--------+----------+------+----------+
**/


-- 6. Obtener todos los datos de los alumnos que asisten a la clase 10.

/** Estado anterior
select * from alumno where id_clase = 10;
No hay tabla pues no existe la clase 10.
**/
-- Consulta:
select * from alumno where id_clase = 10;
/** Estado posterior
select * from alumno where id_clase = 10;
No hay tabla pues no existe la clase 10.
**/


-- 7. Obtener todos los datos de los alumnos que asisten a la clase 8 y para el clase 5.

/** Estado anterior
select * from alumno where id_clase = 8 or id_clase = 5;
No hay tabla pues no existe la clase 8 ni 5.
**/
-- Consulta:
select * from alumno where id_clase = 8 or id_clase = 5;
/** Estado posterior
select * from alumno where id_clase = 8 or id_clase = 5;
No hay tabla pues no existe la clase 8 ni 5.
**/


-- 8. Obtener todos los datos de los alumnos cuyo apellido comience por P.

/** Estado anterior
select * from alumno where apellido like "P%";
+------------+--------+----------+------+----------+
|    dni     | nombre | apellido | nota | id_clase |
+------------+--------+----------+------+----------+
| DNI123456A | Juan   | Pérez    | 85   | 1        |
| DNI123890F | Laura  | Pérez    | 75   | 1        |
| DNI456789G | Carlos | Pérez    | 88   | 3        |
+------------+--------+----------+------+----------+
**/
-- Consulta:
select * from alumno where apellido like "P%";
/** Estado posterior
select * from alumno where apellido like "P%";
+------------+--------+----------+------+----------+
|    dni     | nombre | apellido | nota | id_clase |
+------------+--------+----------+------+----------+
| DNI123456A | Juan   | Pérez    | 85   | 1        |
| DNI123890F | Laura  | Pérez    | 75   | 1        |
| DNI456789G | Carlos | Pérez    | 88   | 3        |
+------------+--------+----------+------+----------+
**/


-- 9. Obtener el número máximo de alumnos por en todas las clases.

/** Estado anterior
select id as clase, max_alumnos from clase;
+-------+-------------+
| clase | max_alumnos |
+-------+-------------+
| 1     | 30          |
| 2     | 25          |
| 3     | 20          |
+-------+-------------+
**/
-- Consulta:
select id as clase, max_alumnos from clase;
/** Estado posterior
select id as clase, max_alumnos from clase;
+-------+-------------+
| clase | max_alumnos |
+-------+-------------+
| 1     | 30          |
| 2     | 25          |
| 3     | 20          |
+-------+-------------+
**/


-- 10. Obtener el número de alumnos en cada clase.

/** Estado anterior
select count(*), id_clase as clase from alumno group by clase;
+----------+-------+
| count(*) | clase |
+----------+-------+
| 5        | 1     |
| 4        | 2     |
| 3        | 3     |
+----------+-------+
**/
-- Consulta:
select count(*), id_clase as clase from alumno group by clase;
/** Estado posterior
select count(*), id_clase as clase from alumno group by clase;
+----------+-------+
| count(*) | clase |
+----------+-------+
| 5        | 1     |
| 4        | 2     |
| 3        | 3     |
+----------+-------+
**/


-- 11. Obtener un listado completo de alumnos, incluyendo los datos de su clase a la que asisten.

/** Estado anterior
select a.dni, a.nombre, a.apellido, a.nota, a.id_clase as clase, c.max_alumnos as max_alumnos_en_clase from alumno as a, clase as c where a.id_clase = c.id;
+------------+---------+-----------+------+-------+----------------------+
|    dni     | nombre  | apellido  | nota | clase | max_alumnos_en_clase |
+------------+---------+-----------+------+-------+----------------------+
| DNI123456A | Juan    | Pérez     | 85   | 1     | 30                   |
| DNI789012B | María   | Martínez  | 92   | 2     | 25                   |
| DNI345678C | Pedro   | Gómez     | 78   | 1     | 30                   |
| DNI901234D | Ana     | Martínez  | 89   | 3     | 20                   |
| DNI567890E | David   | Fernández | 95   | 2     | 25                   |
| DNI123890F | Laura   | Pérez     | 75   | 1     | 30                   |
| DNI456789G | Carlos  | Pérez     | 88   | 3     | 20                   |
| DNI234567H | Sara    | García    | 67   | 2     | 25                   |
| DNI890123I | Javier  | López     | 76   | 1     | 30                   |
| DNI345678J | Elena   | Martínez  | 94   | 3     | 20                   |
| DNI198321F | Jesus   | Lugo      | 90   | 1     | 30                   |
| DNI987678K | Michael | Jackson   | 89   | 2     | 25                   |
+------------+---------+-----------+------+-------+----------------------
**/
-- Consulta:
select a.dni, a.nombre, a.apellido, a.nota, a.id_clase as clase, c.max_alumnos as max_alumnos_en_clase from alumno as a, clase as c where a.id_clase = c.id;
/** Estado posterior
select a.dni, a.nombre, a.apellido, a.nota, a.id_clase as clase, c.max_alumnos as max_alumnos_en_clase from alumno as a, clase as c where a.id_clase = c.id;
+------------+---------+-----------+------+-------+----------------------+
|    dni     | nombre  | apellido  | nota | clase | max_alumnos_en_clase |
+------------+---------+-----------+------+-------+----------------------+
| DNI123456A | Juan    | Pérez     | 85   | 1     | 30                   |
| DNI789012B | María   | Martínez  | 92   | 2     | 25                   |
| DNI345678C | Pedro   | Gómez     | 78   | 1     | 30                   |
| DNI901234D | Ana     | Martínez  | 89   | 3     | 20                   |
| DNI567890E | David   | Fernández | 95   | 2     | 25                   |
| DNI123890F | Laura   | Pérez     | 75   | 1     | 30                   |
| DNI456789G | Carlos  | Pérez     | 88   | 3     | 20                   |
| DNI234567H | Sara    | García    | 67   | 2     | 25                   |
| DNI890123I | Javier  | López     | 76   | 1     | 30                   |
| DNI345678J | Elena   | Martínez  | 94   | 3     | 20                   |
| DNI198321F | Jesus   | Lugo      | 90   | 1     | 30                   |
| DNI987678K | Michael | Jackson   | 89   | 2     | 25                   |
+------------+---------+-----------+------+-------+----------------------
**/


-- 12. Muestra todos los alumnos ordenando por nombre de forma descendiente y por nota de forma ascendente .

/** Estado anterior
select * from alumno order by nombre desc;
+------------+---------+-----------+------+----------+
|    dni     | nombre  | apellido  | nota | id_clase |
+------------+---------+-----------+------+----------+
| DNI234567H | Sara    | García    | 67   | 2        |
| DNI345678C | Pedro   | Gómez     | 78   | 1        |
| DNI987678K | Michael | Jackson   | 89   | 2        |
| DNI789012B | María   | Martínez  | 92   | 2        |
| DNI123890F | Laura   | Pérez     | 75   | 1        |
| DNI123456A | Juan    | Pérez     | 85   | 1        |
| DNI198321F | Jesus   | Lugo      | 90   | 1        |
| DNI890123I | Javier  | López     | 76   | 1        |
| DNI345678J | Elena   | Martínez  | 94   | 3        |
| DNI567890E | David   | Fernández | 95   | 2        |
| DNI456789G | Carlos  | Pérez     | 88   | 3        |
| DNI901234D | Ana     | Martínez  | 89   | 3        |
+------------+---------+-----------+------+----------+

select * from alumno order by nota;
+------------+---------+-----------+------+----------+
|    dni     | nombre  | apellido  | nota | id_clase |
+------------+---------+-----------+------+----------+
| DNI234567H | Sara    | García    | 67   | 2        |
| DNI123890F | Laura   | Pérez     | 75   | 1        |
| DNI890123I | Javier  | López     | 76   | 1        |
| DNI345678C | Pedro   | Gómez     | 78   | 1        |
| DNI123456A | Juan    | Pérez     | 85   | 1        |
| DNI456789G | Carlos  | Pérez     | 88   | 3        |
| DNI901234D | Ana     | Martínez  | 89   | 3        |
| DNI987678K | Michael | Jackson   | 89   | 2        |
| DNI198321F | Jesus   | Lugo      | 90   | 1        |
| DNI789012B | María   | Martínez  | 92   | 2        |
| DNI345678J | Elena   | Martínez  | 94   | 3        |
| DNI567890E | David   | Fernández | 95   | 2        |
+------------+---------+-----------+------+----------+
**/
-- Consulta:
select * from alumno order by nombre desc;
select * from alumno order by nota; 
/** Estado posterior
select * from alumno order by nombre desc;
+------------+---------+-----------+------+----------+
|    dni     | nombre  | apellido  | nota | id_clase |
+------------+---------+-----------+------+----------+
| DNI234567H | Sara    | García    | 67   | 2        |
| DNI345678C | Pedro   | Gómez     | 78   | 1        |
| DNI987678K | Michael | Jackson   | 89   | 2        |
| DNI789012B | María   | Martínez  | 92   | 2        |
| DNI123890F | Laura   | Pérez     | 75   | 1        |
| DNI123456A | Juan    | Pérez     | 85   | 1        |
| DNI198321F | Jesus   | Lugo      | 90   | 1        |
| DNI890123I | Javier  | López     | 76   | 1        |
| DNI345678J | Elena   | Martínez  | 94   | 3        |
| DNI567890E | David   | Fernández | 95   | 2        |
| DNI456789G | Carlos  | Pérez     | 88   | 3        |
| DNI901234D | Ana     | Martínez  | 89   | 3        |
+------------+---------+-----------+------+----------+

select * from alumno order by nota;
+------------+---------+-----------+------+----------+
|    dni     | nombre  | apellido  | nota | id_clase |
+------------+---------+-----------+------+----------+
| DNI234567H | Sara    | García    | 67   | 2        |
| DNI123890F | Laura   | Pérez     | 75   | 1        |
| DNI890123I | Javier  | López     | 76   | 1        |
| DNI345678C | Pedro   | Gómez     | 78   | 1        |
| DNI123456A | Juan    | Pérez     | 85   | 1        |
| DNI456789G | Carlos  | Pérez     | 88   | 3        |
| DNI901234D | Ana     | Martínez  | 89   | 3        |
| DNI987678K | Michael | Jackson   | 89   | 2        |
| DNI198321F | Jesus   | Lugo      | 90   | 1        |
| DNI789012B | María   | Martínez  | 92   | 2        |
| DNI345678J | Elena   | Martínez  | 94   | 3        |
| DNI567890E | David   | Fernández | 95   | 2        |
+------------+---------+-----------+------+----------+
**/


-- 13. Obtener los nombres y apellido de los alumnos que asisten a la clase 4 y cuyo máximo de alumnos es mayor 10.

/** Estado anterior
select nombre, apellido from alumno, clase where alumno.id_clase = clase.id and alumno.id_clase = 4 and clase.max_alumnos > 10;
No se arrojan resultados pues no existe la clase 4.
**/
-- Consulta:
select nombre, apellido from alumno, clase where alumno.id_clase = clase.id and alumno.id_clase = 4 and clase.max_alumnos > 10;
/** Estado posterior
select nombre, apellido from alumno, clase where alumno.id_clase = clase.id and alumno.id_clase = 4 and clase.max_alumnos > 10;
No se arrojan resultados pues no existe la clase 4.
**/


-- 14. Obtener los datos de los clases cuyo número de alumnos es superior a la media de todos los clases.

/** Estado anterior
select * from clase where max_alumnos > (select avg(max_alumnos) from clase);
+----+-------------+
| id | max_alumnos |
+----+-------------+
| 1  | 30          |
+----+-------------+
**/
-- Consulta:
select * from clase where max_alumnos > (select avg(max_alumnos) from clase);
/** Estado posterior
select * from clase where max_alumnos > (select avg(max_alumnos) from clase);
+----+-------------+
| id | max_alumnos |
+----+-------------+
| 1  | 30          |
+----+-------------+
**/


-- 15. Obtener los nombres (únicamente los nombres) de los clases que tiene más de dos alumnos.

/** Estado anterior
select nombre from alumno where (select count(*) from alumno group by id_clase) > 2;
+---------+
| nombre  |
+---------+
| Juan    |
| María   |
| Pedro   |
| Ana     |
| David   |
| Laura   |
| Carlos  |
| Sara    |
| Javier  |
| Elena   |
| Jesus   |
| Michael |
+---------+
**/
-- Consulta:
select nombre from alumno where (select count(*) from alumno group by id_clase) > 2;
/** Estado posterior
select nombre from alumno where (select count(*) from alumno group by id_clase) > 2;
+---------+
| nombre  |
+---------+
| Juan    |
| María   |
| Pedro   |
| Ana     |
| David   |
| Laura   |
| Carlos  |
| Sara    |
| Javier  |
| Elena   |
| Jesus   |
| Michael |
+---------+
**/


-- 16. Añadir un nuevo clase, con un número máximo de alumnos es 20.

/** Estado anterior
select * from clase;
+----+-------------+
| id | max_alumnos |
+----+-------------+
| 1  | 30          |
| 2  | 25          |
| 3  | 20          |
+----+-------------+
**/
-- Consulta:
insert into clase (max_alumnos) values (20);
/** Estado posterior
select * from clase;
+----+-------------+
| id | max_alumnos |
+----+-------------+
| 1  | 30          |
| 2  | 25          |
| 3  | 20          |
| 4  | 20          |
+----+-------------+
**/


-- 17. Añadir dos nuevos alumnos vinculando a la clase creada.

/** Estado anterior
select * from alumno;
+------------+---------+-----------+------+----------+
|    dni     | nombre  | apellido  | nota | id_clase |
+------------+---------+-----------+------+----------+
| DNI123456A | Juan    | Pérez     | 85   | 1        |
| DNI789012B | María   | Martínez  | 92   | 2        |
| DNI345678C | Pedro   | Gómez     | 78   | 1        |
| DNI901234D | Ana     | Martínez  | 89   | 3        |
| DNI567890E | David   | Fernández | 95   | 2        |
| DNI123890F | Laura   | Pérez     | 75   | 1        |
| DNI456789G | Carlos  | Pérez     | 88   | 3        |
| DNI234567H | Sara    | García    | 67   | 2        |
| DNI890123I | Javier  | López     | 76   | 1        |
| DNI345678J | Elena   | Martínez  | 94   | 3        |
| DNI198321F | Jesus   | Lugo      | 90   | 1        |
| DNI987678K | Michael | Jackson   | 89   | 2        |
+------------+---------+-----------+------+----------+
**/
-- Consulta:
insert into alumno values ('DNI987000Y','Pepito','Pérez','30','4');
insert into alumno values ('DNI912340Y','Francia','Margarita','99','4');
/** Estado posterior
select * from alumno;
+------------+---------+-----------+------+----------+
|    dni     | nombre  | apellido  | nota | id_clase |
+------------+---------+-----------+------+----------+
| DNI123456A | Juan    | Pérez     | 85   | 1        |
| DNI789012B | María   | Martínez  | 92   | 2        |
| DNI345678C | Pedro   | Gómez     | 78   | 1        |
| DNI901234D | Ana     | Martínez  | 89   | 3        |
| DNI567890E | David   | Fernández | 95   | 2        |
| DNI123890F | Laura   | Pérez     | 75   | 1        |
| DNI456789G | Carlos  | Pérez     | 88   | 3        |
| DNI234567H | Sara    | García    | 67   | 2        |
| DNI890123I | Javier  | López     | 76   | 1        |
| DNI345678J | Elena   | Martínez  | 94   | 3        |
| DNI198321F | Jesus   | Lugo      | 90   | 1        |
| DNI987678K | Michael | Jackson   | 89   | 2        |
| DNI987000Y | Pepito  | Pérez     | 30   | 4        |
| DNI912340Y | Francia | Margarita | 99   | 4        |
+------------+---------+-----------+------+----------+
**/


-- 18. Calcula el 10% de los alumnos por clase.

/** Estado anterior
select count(*)*0.1 as ten_perc_alumnos, id_clase as clase from alumno group by id_clase;
+------------------+-------+
| ten_perc_alumnos | clase |
+------------------+-------+
| 0.5              | 1     |
| 0.4              | 2     |
| 0.3              | 3     |
| 0.2              | 4     |
+------------------+-------+
**/
-- Consulta:
select count(*)*0.1 as ten_perc_alumnos, id_clase as clase from alumno group by id_clase;
/** Estado posterior
select count(*)*0.1 as ten_perc_alumnos, id_clase as clase from alumno group by id_clase;
+------------------+-------+
| ten_perc_alumnos | clase |
+------------------+-------+
| 0.5              | 1     |
| 0.4              | 2     |
| 0.3              | 3     |
| 0.2              | 4     |
+------------------+-------+
**/


-- 19. Elimina a todos los alumnos que asisten a la clase con id 2.

/** Estado anterior
select count(*) as alumnos from alumno where id_clase = 2;
+---------+
| alumnos |
+---------+
| 4       |
+---------+
**/
-- Consulta:
delete from alumno where id_clase = 2;
/** Estado posterior
select count(*) as alumnos from alumno where id_clase = 2;
+---------+
| alumnos |
+---------+
| 0       |
+---------+
**/


-- 20. Elimina a todos los alumnos cuyo nota sea inferior al 30%.

/** Estado anterior
select * from alumno where nota < 30;
No se arrojan resultados pues no existe nadie con notas menores al 30%
**/
-- Consulta:
delete from alumno where nota < 30;
/** Estado posterior
select * from alumno where nota < 30;
No se arrojan resultados pues no existe nadie con notas menores al 30%
**/

