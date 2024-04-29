# Tarea 2 - Trabajo con índices

<div align=center>

![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

<div align=justify>

## Elimine la tabla "cliente" si existe. 
```sql
drop table if exists cliente;
```
> Salida: Query OK, 0 rows affected, 1 warning (0,01 sec)
   
## Cree la tabla sin clave primaria e incluye a posteriori esta.

1. Primero se crea con el siguiente comando sql:
```sql
create table cliente (
    documento char(8) not null,
    nombre varchar(30) not null,
    domicilio varchar(30),
    ciudad varchar(20),
    provincia varchar(20),
    telefono varchar(11)
);
```
A continuación la salida dada con `describe cliente`:
```sql
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| documento | char(8)     | NO   |     | NULL    |       |
| nombre    | varchar(30) | NO   |     | NULL    |       |
| domicilio | varchar(30) | YES  |     | NULL    |       |
| ciudad    | varchar(20) | YES  |     | NULL    |       |
| provincia | varchar(20) | YES  |     | NULL    |       |
| telefono  | varchar(11) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
```

2. Ahora incluimos la _primary key_ a la columna __documento__ con:
```sql
alter table cliente modify documento char(8) not null, add primary key(documento);
```
Y para ver que esto funcionó, podemos comprobarlo en la columna __Key__ del siguiente `describe cliente`:
```sql
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| documento | char(8)     | NO   | PRI | NULL    |       |
| nombre    | varchar(30) | NO   |     | NULL    |       |
| domicilio | varchar(30) | YES  |     | NULL    |       |
| ciudad    | varchar(20) | YES  |     | NULL    |       |
| provincia | varchar(20) | YES  |     | NULL    |       |
| telefono  | varchar(11) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
```

## Define los siguientes indices:

- Un índice único por el campo "documento" y un índice común por ciudad y provincia.
```sql
create unique index idx_documento on cliente(documento); -- Índice único para documento
create index idx_ciudad_provincia on cliente(ciudad, provincia); -- Índice común para ciudad y provincia
```

- Vea los índices de la tabla.
```sql
show index from cliente;

+---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY              |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          0 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

## Agregue un índice único por el campo "telefono".
```sql
create unique index idx_telefono on cliente(telefono);

-- Para mostrar que funcionó, aparece el idx_telefono en la siguiente tabla:
show index from cliente;

+---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY              |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          0 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          0 | idx_telefono         |            1 | telefono    | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```


## Elimina los índices.

Para eliminar los índices:
```sql
drop index idx_documento on cliente;
drop index idx_telefono on cliente;
drop index idx_ciudad_provincia on cliente;
```

Ahora para comprobar que fueron borradas, se ejecuta nuevamente `show index from cliente;`:
```sql
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY  |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

</div>