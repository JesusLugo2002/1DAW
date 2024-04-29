# Tarea 3 - Trabajando con índices

<div align=center>

![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

## Actividad

<div align=justify>

Después de crear la base de datos con `create database Base_Indices` y usarla con `use Base_Indices`...
- Creamos la tabla __Movimiento__ con el siguiente comando sql:
```sql
drop table if exists MOVIMIENTO;
create table MOVIMIENTO (
    Identificador int auto_increment primary key,
    Articulo varchar(50) not null,
    Fecha date not null,
    Cantidad int not null
);
```

### Aplica la sentencia adecuada para visualizar los índices que hay en la tabla

```sql
show index from movimiento;

+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| movimiento |          0 | PRIMARY  |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```
El único índice actual es el __Primary Key__ de la tabla: la columna __Id__.

### Inserción de datos

Tras utilizar el código para generar datos en la tabla __MOVIMIENTO__, este generó __3588__ registros:
```sql
select count(*) from MOVIMIENTO;
+----------+
| count(*) |
+----------+
|     3588 |
+----------+
```

### Duplicado de la tabla

Se duplica la tabla __MOVIMIENTO__ a __MOVIMIENTO_BIS__ con:
```sql
create table MOVIMIENTO_BIS select * from MOVIMIENTO;
```
La salida dada es:
    Query OK, 3588 rows affected (0,09 sec)
    Records: 3588  Duplicates: 0  Warnings: 0

### _Describe_ de la tabla duplicada

Tras ejecutar `describe` tanto en la tabla __MOVIMIENTO__:
```sql
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Identificador | int         | NO   | PRI | NULL    | auto_increment |
| Articulo      | varchar(50) | NO   |     | NULL    |                |
| Fecha         | date        | NO   |     | NULL    |                |
| Cantidad      | int         | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
```
Como en la tabla __MOVIMIENTO_BIS__:
```sql
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   |     | 0       |       |
| Articulo      | varchar(50) | NO   |     | NULL    |       |
| Fecha         | date        | NO   |     | NULL    |       |
| Cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
```
Se puede ver la diferencia de que la columna __Identificador__ ya no es la _primary key_ ni mantiene el extra de *auto_increment*.

### Utilización de _Explain_

Sobre la tabla __MOVIMIENTO__:
```sql
explain select * from MOVIMIENTO where Identificador = 3;

+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
```

Sobre la tabla __MOVIMIENTO_BIS__:
```sql
explain select * from MOVIMIENTO_BIS where Identificador = 3;

+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3588 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
```

La conclusión que puedo dar es que puede verse como, según la columna __rows__, en la tabla __MOVIMIENTO__ solo recorre un registro, pues al ser _primary key_ el motor actua más eficientemente para encontrar la información, en cambio, en el caso de __MOVIMIENTO_BIS__, el cual no tiene la _primary key_, el registro se encontró después de recorrer las 3588 filas de información.

### Creación de índices para *MOVIMIENTO_BIS*

Para añadir los índices a la columna __Identificador__ y __Fecha__:
```sql
create unique index IX_IDENTIFICADOR on MOVIMIENTO_BIS(Identificador);
create index IX_FECHA_BIS on MOVIMIENTO_BIS(Fecha)
```

### Consultas y análisis de planes de ejecución (1)

#### Consulta 1
```sql
explain select * from MOVIMIENTO where identificador = 3;

+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
```
#### Consulta 2
```sql
explain select identificador from MOVIMIENTO_BIS where identificador = 3;

+----+-------------+----------------+------------+-------+------------------+------------------+---------+-------+------+----------+-------------+
| id | select_type | table          | partitions | type  | possible_keys    | key              | key_len | ref   | rows | filtered | Extra       |
+----+-------------+----------------+------------+-------+------------------+------------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | const | IX_IDENTIFICADOR | IX_IDENTIFICADOR | 4       | const |    1 |   100.00 | Using index |
+----+-------------+----------------+------------+-------+------------------+------------------+---------+-------+------+----------+-------------+
```

Para estas consultas, en el caso __MOVIMIENTO__ utiliza la _primary key_ para encontrar los datos, mientras que en __MOVIMIENTO_BIS__ los encuentra por medio del índice *IX_IDENTIFICADOR*.

### Consultas y análisis de planes de ejecución (2)

#### Consulta 1
```sql
EXPLAIN SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN '01/01/2012' and '01/03/2012';

+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3588 |    11.11 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
```

#### Consulta 2
```sql
EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' and '01/03/2012';

+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | IX_FECHA_BIS  | NULL | NULL    | NULL | 3588 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
```

Aquí, ambas consultas recorren todos los registros de información utilizando el _where_. En el caso de __MOVIMIENTO_BIS__, a pesar de que exista un índice para el campo __Fecha__, este se ignora porque el `select *` va a solicitar toda la información de la tabla.

### Consultas y análisis de planes de ejecución (3)

Para las siguientes consultas, se crea un índice para el campo __Fecha__ de la tabla __MOVIMIENTO__ con:
```sql
create index IX_FECHA on MOVIMIENTO(Fecha);
```

Y a continuación visualizamos los índices de ambas tablas con `show index`:
__Tabla MOVIMIENTO__:
```sql
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO |          0 | PRIMARY  |            1 | Identificador | A         |        3588 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO |          1 | IX_FECHA |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

__Tabla MOVIMIENTO_BIS__:
```sql
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table          | Non_unique | Key_name         | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO_BIS |          0 | IX_IDENTIFICADOR |            1 | Identificador | A         |        3588 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO_BIS |          1 | IX_FECHA_BIS     |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

#### Consulta 1
```sql
EXPLAIN SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;

+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ref  | IX_FECHA      | IX_FECHA | 3       | const |    1 |   100.00 | Using index |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
```

#### Consulta 2
```sql
EXPLAIN SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;

+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ref  | IX_FECHA      | IX_FECHA | 3       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
```

#### Consulta 3
```sql
EXPLAIN SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;

+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | Using index |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
```

#### Consulta 4
```sql
EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;

+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
```

La conclusión que puedo darle a las búsquedas realizadas es que, aquellos `select` donde se usa __*__, ignoran los índices para los campos de __Fecha__ en ambas tablas, mientras que los `select fecha` utilizan directamente los índices creados.
</div>