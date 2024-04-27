# Unidad 7 - Optimización de las bases de datos

<div align=center>
<img src="https://i.pinimg.com/originals/4e/f7/ff/4ef7ff2ad4b220a4b3fbdfbfb189de4d.gif" alt="fondo" width="60%"/>
</div>

<div align=justify>

## Contenido

- [Introducción](#introducción-a-la-programación-y-optimización-en-sql)
- [Índices](#índices)
- [Vistas](#vistas)
- [Comando EXPLAIN](#comando-explain)
- [Resumen de comandos](#resumen-de-comandos-básicos)

## Introducción a la programación y optimización en SQL

A ver mi parcerito, te explico rápidamente la vaina que escribió el Joatham, espero se logre entender.

Entramos con la programación y la optimización en MySql, pero para empezar, me enfocaré en la optimización, ¿que por qué? Porque tenemos un examen de eso y no de programación, mi rey/reina.

Según yo, las bases de datos deben ser optimizadas siempre que se puedan, porque el ahorro de 2 milisegundos en una consulta nos puede salvar la vida. Esta optimización se logra con el uso de dos mecánismos implementados en MySql: la utilización de __índices__ y de __vistas__.
Una mejor eficiencia en nuestras consultas implica un mejor trabajo realizados y, con ello, más satisfacción personal y menores probabilidades de despido por ser un paquete.

## Índices

__¿Qué mondá son los índices?__ Según el Joatham:

> Un índice es un puntero a una fila de una determinada tabla de nuestra base de datos.

¿Qué significa eso? Ni puta idea, pero algo con lo que me gusta relacionarlo es __un marcapáginas en un libro__. Crear un índice en una tabla le permite a MySql realizar la búsqueda de lo que quiere mucho más rápido, como si colocaramos un marcapáginas en un libro: ya no tendríamos que pasar todas las páginas para buscar lo que queremos, sino pasar solamente a esa página con el marcapáginas. Algo así hace el MySql.
Aunque eso sí, grábate la definición del Joatham por si entra en el examen, te lo repito tres veces acá abajo para que no se te olvide, luego me das las gracias:

    Un índice es un puntero a una fila de una determinada tabla de nuestra base de datos.
    Un índice es un puntero a una fila de una determinada tabla de nuestra base de datos.
    Un índice es un puntero a una fila de una determinada tabla de nuestra base de datos.

__Cabe destacar que al usar índices se mejora la eficiencia tanto en las consultas SELECT, como cuando usamos WHERE, GROUP BY y ORDER BY.__

Y otra cosa, a pesar de que los índices mejoran la eficiencia de las consultas, __NO DEBEMOS crear índices para todas las columnas__, esto porque vuelven las operaciones de escritura (__INSERT, UPDATE...__) más lentas e ineficientes. Por eso __solo debemos crear índices para valores que solamente usaríamos comunmente en búsquedas.__

### Tipos de índices

Así como existen marcapáginas con colores para identificar lo que quieres guardar, existen varios tipos de índices que se usan para distintos tipos de datos que quieras hacer referencia, estos son:

1. INDEX (NON-UNIQUE): Un índice normalito para valores que __PUEDEN REPETIRSE EN UNA TABLA__, como nombres, edades... Así que si pones esta vaina para una columna DNI, un machetazo pa' ti.
2. UNIQUE: Para valores que __NO PUEDEN__ repetirse. Aquí si entran los DNIs.
3. PRIMARY: La clave primaria de toda la vida.
4. FULLTEXT: Este índice se emplean con valores de tipo __CHAR, VARCHAR y TEXT__. Se usa cuando se realizan búsquedas sobre el texto, por ejemplo: _busca todas las descripciones de la tabla producto que contengan la palabra 'mamaguevo'_, el MySql debería recorrer las descripciones buscando la palabra 'mamaguevo', y si la columna de descripción tiene un índice FULLTEXT, lo hará más rápidamente.
5. SPATIAL: _Estos índices se emplean para realizar búsquedas sobre datos que componen formas geométricas representadas en el espacio._ (No hemos usado esto nunca ni el Joatham lo ha explicado del todo, espero no entre en el examen, pero ahí está por si acaso.)

### Ejemplos de sintaxis

El comando base para crear un índice es:
```sql
CREATE [index_type] INDEX index_name ON table_name(column1, column2...)
```
Donde *index_type* puede ser cambiado a __UNIQUE, PRIMARY, FULLTEXT__, si se creará alguna de esas. Si no, puedes usar `CREATE INDEX...` para crear un índice NON-UNIQUE.

## Vistas

__¿Qué mondá son las vistas?__ Según Joatham: __Tablas virtuales__. Como lo veo yo: __Accesos directos__. Pero para el examen, fíate más del Joatham.

La función principal de una vista es __almacenar el contenido de un SELECT en una 'variable' o 'tabla'__ para que puedas, a posteriori, consultar de nuevo su contenido sin tener que replicar el SELECT complejo.

__¿Cómo se crea? Así mi pana:__ 
```sql
CREATE VIEW view_name AS SELECT ...;
```
Suponiendo que después del __AS__ viene todo el SELECT inmenso con la masa y el queso bueno. Esto permite que cosas como la siguiente:

```sql
SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo;
```

La consulta anterior te genera una tabla con _tickets_ de venta, que incluye la clave y fecha de la venta, el nombre y precio del producto y el nombre del empleado. Al ser información proveniente de tres tablas distintas, habría que usar JOIN's y toda esa mondá, y cada vez que nos lo pidiesen tendríamos que usar esta consulta. ¿Pereza, verdad? Pos para eso existen las vistas. Podemos almacenar toda esa consulta en una vista bajo un nombre y recurrir a ella usando únicamente el nombre de la vista, de la siguiente manera.

__Creamos la vista añadiendo la secuencia `CREATE VIEW tickets AS` antes de la consulta__:
```sql
CREATE VIEW tickets AS
SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo;
```

Y con eso ya creamos una _tabla virtual_ o un _acceso directo_ de nuestra consulta y la almacenamos con el nombre de _tickets_. Ahora cuando queramos recurrir a esa información ya no será necesaria la consulta larga, sino simplemente:
```sql
select * from tickets;
```

Sobre una vista podemos hacer cualquier tipo de consulta con WHERE, GROUP BY, ORDER BY y todo eso. Pero __NO PODEMOS HACER CUALQUIER TIPO DE ESCRITURA Y MODIFICACIÓN, SOLO LECTURA__.

__Las ventajas que nos presentan son:__

1. __Mayor privacidad en la información:__ Mostramos la información que creamos conveniente y necesaria.
2. __Optimizar el rendimiento de la base de datos:__ nos ahorramos la consulta continua con SELECTs complejos.
3. __Mayor seguridad:__ ya que no puede modificarse la información de las vistas, esto da una capa de más seguridad.

## Comando EXPLAIN

A ver, aquí pondré la resumida explicación del _output_ del comando `EXPLAIN` que el Joatham no se digna en dar. Pero eso sí, de los campos que realmente nos conviene, no la mondá esa de _partitions_, por ejemplo, que ni puta idea tenemos de eso. Seguro nos preocuparemos luego de ello.

```sql
EXPLAIN SELECT * FROM cliente;

+----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table   | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | cliente | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   36 |   100.00 | NULL  |
+----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------+
```

Siguiendo el orden de las columnas tenemos:
- __id__: el identificador del SELECT.
- __select_type__: el tipo del SELECT. (No hemos visto otros tipos de SELECT, así que ni te rayes). 
- __table__: el nombre de la tabla que se consulta.
- __partitions__: pregúntale al Joatham de esto, a mi no me jodan.
- __type__: el tipo de unión que hay entre las tablas. En este caso, __ALL__ viene de haber usado * en la consulta, porque selecciona toda la tabla sin filtro alguno.
- __possible_keys__: los índices posibles que MySql puede coger al realizar la consulta.
- __key__: el índice que MySql cogió.
- __key_len__: la longitud del índice que MySql cogió al realizar la consulta. Esto tiene sentido para índices compuestos por varias columnas.
- __ref__: ni idea.
- __rows__: las filas que MySql __ESTIMA__ recorrer, más no las realmente recorridas.
- __filtered__: el porcentaje de las filas que __SÍ FUERON RECORRIDAS Y MOSTRADAS EN CONSULTA__. En este caso, de las 36 filas estimadas (sacada de la columna _rows_), se consultó el 100% de ellas (columna _filtered_).
- __Extra__: Información extra, sorprendentemente.

## Resumen de comandos básicos

- __Índices__:
    - __Crear un índice (Forma 1)__: `CREATE [FULLTEXT|UNIQUE|PRIMARY] INDEX index_name ON table_name(column1, ..., columnN);`
    ```sql
    CREATE INDEX idx_username ON users(username);
    ```
    - __Crear un índice (Forma 2)__: `ALTER TABLE table_name ADD INDEX index_name (column1, ..., columnN);`
    ```sql
    ALTER TABLE users ADD INDEX idx_username (username);
    ```
    - __Ver índices de una tabla__: `SHOW INDEX FROM table_name;` o `DESCRIBE table_name;`
    ```sql
    SHOW INDEX FROM users;
    DESCRIBE users;
    ```
    - __Eliminar un índice (Forma 1)__: `DROP INDEX index_name ON table_name;`
    ```sql
    DROP INDEX idx_username ON users;
    ```
    - __Eliminar un índice (Forma 2)__: `ALTER TABLE table_name DROP INDEX index_name;`
    ```sql
    ALTER TABLE users DROP INDEX idx_username;
    ```

- __Vistas__:
    - __Crear una vista__: `CREATE VIEW view_name AS SELECT ...;`
    ```sql
    CREATE VIEW tickets AS
    (SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
    FROM venta v
    JOIN empleado e
    ON v.id_empleado = e.id_empleado
    JOIN articulo a
    ON v.id_articulo = a.id_articulo);
    ```
    - __Eliminar una vista__: `DROP VIEW IF EXISTS view_name;`
    ```sql
    DROP VIEW IF EXISTS tickets;
    ```

- __Otros relacionados__:
    - __Analizar tabla__: `ANALYZE TABLE table_name;`
    - __Optimizar tabla__: `OPTIMIZE TABLE table_name;`


## Conclusión

Suerte en el examen parcerito(a), tqm, bebe agua.

<div align=center>
    <img src="https://i.redd.it/bm4wx6lxfuz91.gif" alt="cat" width="50%">
</div>

</div>
