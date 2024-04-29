# Tarea 1 - Trabajando con índices

<div align=center>

![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

<div align=justify>

- Elimine la tabla "alumno" si existe.
```sql
drop table if exists alumno;
```
> Salida: Query OK, 0 rows affected (0,02 sec)

- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
inscripción).
```sql
create table alumno (
    numero_inscripcion int,
    anio_inscripcion int,
    nombre varchar(50),
    dni varchar(20),
    domicilio varchar(50),
    ciudad varchar(50),
    provincia varchar(50),
    primary key(numero_inscripcion, anio_inscripcion)
);
```
__Salida__: se muestra a continuación por un `describe alumno`;
```sql
+--------------------+-------------+------+-----+---------+-------+
| Field              | Type        | Null | Key | Default | Extra |
+--------------------+-------------+------+-----+---------+-------+
| numero_inscripcion | int         | NO   | PRI | NULL    |       |
| anio_inscripcion   | int         | NO   | PRI | NULL    |       |
| nombre             | varchar(50) | YES  |     | NULL    |       |
| dni                | varchar(20) | YES  |     | NULL    |       |
| domicilio          | varchar(50) | YES  |     | NULL    |       |
| ciudad             | varchar(50) | YES  |     | NULL    |       |
| provincia          | varchar(50) | YES  |     | NULL    |       |
+--------------------+-------------+------+-----+---------+-------+
```

- Define los siguientes indices:
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
   ```sql
    create unique index idx_dni on alumno(dni); 
    create index idx_ciudad_provincia on alumno(ciudad, provincia);
   ```
        
    - Vea los índices de la tabla.
    ```sql
    show index from alumno;

    +--------+------------+----------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table  | Non_unique | Key_name             | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +--------+------------+----------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | alumno |          0 | PRIMARY              |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | alumno |          0 | PRIMARY              |            2 | anio_inscripcion   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | alumno |          0 | idx_dni              |            1 | dni                | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | alumno |          1 | idx_ciudad_provincia |            1 | ciudad             | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | alumno |          1 | idx_ciudad_provincia |            2 | provincia          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    +--------+------------+----------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

    ```

- Intente ingresar un alumno con clave primaria repetida.
```sql
insert into alumno values(2, 2002, "Jesús", "Y812719F", "La Montaña", "Los Realejos", "Santa Cruz de Tenerife");
insert into alumno values(2, 2002, "Pepito", "Y999122F", "La Vera", "Puerto de la Cruz", "Santa Cruz de Tenerife");
```

__Salida:__
```sql
-- Primer insert
Query OK, 1 row affected (0,00 sec)
-- Segundo insert
ERROR 1062 (23000): Duplicate entry '2-2002' for key 'alumno.PRIMARY'
```

- Intente ingresar un alumno con documento repetido.
```sql
insert into alumno values(3, 2000, "Juan", "Y812719F", "La Montaña", "Los Realejos", "Santa Cruz de Tenerife");
```
__Salida:__
```sql
ERROR 1062 (23000): Duplicate entry 'Y812719F' for key 'alumno.idx_dni'
```

- Ingrese varios alumnos de la misma ciudad y provincia.
```sql
insert into alumno values(1, 2003, "Pepito", "Y123456F", "La Vera", "Puerto de la Cruz", "Santa Cruz de Tenerife");
insert into alumno values(1, 2001, "Sara", "S1231231F", "La Vera", "Puerto de la Cruz", "Santa Cruz de Tenerife");
insert into alumno values(1, 2004, "Margarito", "J128931C", "La Vera", "Puerto de la Cruz", "Santa Cruz de Tenerife");
```
__Salida:__ Todo ha salido bien, sin errores, a continuación la consulta de la tabla completa.
```sql
+--------------------+------------------+-----------+-----------+-------------+-------------------+------------------------+
| numero_inscripcion | anio_inscripcion | nombre    | dni       | domicilio   | ciudad            | provincia              |
+--------------------+------------------+-----------+-----------+-------------+-------------------+------------------------+
|                  1 |             2001 | Sara      | S1231231F | La Vera     | Puerto de la Cruz | Santa Cruz de Tenerife |
|                  1 |             2003 | Pepito    | Y123456F  | La Vera     | Puerto de la Cruz | Santa Cruz de Tenerife |
|                  1 |             2004 | Margarito | J128931C  | La Vera     | Puerto de la Cruz | Santa Cruz de Tenerife |
|                  2 |             2002 | Jesús     | Y812719F  | La Montaña  | Los Realejos      | Santa Cruz de Tenerife |
+--------------------+------------------+-----------+-----------+-------------+-------------------+------------------------+
```

- Elimina los indices creados, y muestra que ya no se encuentran.
```sql
drop index idx_dni on alumno;
drop index idx_ciudad_provincia on alumno;
```
__Después de ejecutar `show index from alumno`__:
```sql
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY  |            1 | numero_inscripcion | A         |           2 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY  |            2 | anio_inscripcion   | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```


</div>