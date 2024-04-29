# Tarea-trabajo con funciones

<div align=center>
    
![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

<div align=justify>

## Paso 1 - Creación de una base de datos a partir de un .sql

Para esta actividad, ya se nos dispone el siguiente fichero .sql como base para crear la base de datos:

```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
```

Esto se puede lograr de varias formas pero, en mi caso, utilicé el comando `nano empleados-db.sql` para crear el fichero y, posteriormente, importarlo en *Sqlite3* con:

```sh
sqlite3 tareas3.db < empleados-db.sql
```

Otra de las formas que se puede hacer es, creando el fichero .db previamente y dentro de el mismo usar el comando `.read empleados-db.sql`.

Como resultado, tenemos la siguiente tabla tras realizar un `select * from empleados`:


| id |  nombre   | salario |   departamento   |
|----|-----------|---------|------------------|
| 1  | Juan      | 50000.0 | Ventas           |
| 2  | María     | 60000.0 | TI               |
| 3  | Carlos    | 55000.0 | Ventas           |
| 4  | Ana       | 48000.0 | Recursos Humanos |
| 5  | Pedro     | 70000.0 | TI               |
| 6  | Laura     | 52000.0 | Ventas           |
| 7  | Javier    | 48000.0 | Recursos Humanos |
| 8  | Carmen    | 65000.0 | TI               |
| 9  | Miguel    | 51000.0 | Ventas           |
| 10 | Elena     | 55000.0 | Recursos Humanos |
| 11 | Diego     | 72000.0 | TI               |
| 12 | Sofía     | 49000.0 | Ventas           |
| 13 | Andrés    | 60000.0 | Recursos Humanos |
| 14 | Isabel    | 53000.0 | TI               |
| 15 | Raúl      | 68000.0 | Ventas           |
| 16 | Patricia  | 47000.0 | Recursos Humanos |
| 17 | Alejandro | 71000.0 | TI               |
| 18 | Natalia   | 54000.0 | Ventas           |
| 19 | Roberto   | 49000.0 | Recursos Humanos |
| 20 | Beatriz   | 63000.0 | TI               |

## Paso 2 - Realización de consultas

Se deben realizar distintas consultas en la base de datos haciendo uso de funciones, pero antes de ello, se configura en *sqlite3*:

```sql
.mode markdown -- Imprime las tablas resultantes en el formato de tablas de markdown.
.headers on -- Activamos las cabeceras de las tablas.
```

- Funciones UPPER y LOWER:
  - Muestra el nombre de todos los empleados en mayúsculas.

```sql
select upper(nombre) as mayus_nombre from empleados;
```

| mayus_nombre |
|--------------|
| JUAN         |
| MARíA        |
| CARLOS       |
| ANA          |
| PEDRO        |
| LAURA        |
| JAVIER       |
| CARMEN       |
| MIGUEL       |
| ELENA        |
| DIEGO        |
| SOFíA        |
| ANDRéS       |
| ISABEL       |
| RAúL         |
| PATRICIA     |
| ALEJANDRO    |
| NATALIA      |
| ROBERTO      |
| BEATRIZ      |

- Funciones Numéricas:
  - Calcula el valor absoluto del salario de todos los empleados.

```sql
-- En este ejercicio no se notará diferencia, pues en sus valores base no existe ninguno que sea negativo.
select abs(salario) as abs_salario from empleados;
```

| abs_salario |
|-------------|
| 50000.0     |
| 60000.0     |
| 55000.0     |
| 48000.0     |
| 70000.0     |
| 52000.0     |
| 48000.0     |
| 65000.0     |
| 51000.0     |
| 55000.0     |
| 72000.0     |
| 49000.0     |
| 60000.0     |
| 53000.0     |
| 68000.0     |
| 47000.0     |
| 71000.0     |
| 54000.0     |
| 49000.0     |
| 63000.0     |

- Funciones de Fecha y Hora:
  - Muestra la fecha actual.

```sql
select date() as fecha_actual;
```

| fecha_actual |
|--------------|
| 2024-01-17   |

- Funciones de Agregación:
  - Calcula el promedio de salarios de todos los empleados.

```sql
select avg(salario) as avg_salario from empleados;
```

| avg_salario |
|-------------|
| 57000.0     |

  - Convierte la cadena '123' a un valor entero.

```sql
select cast('123' as integer) as str_to_int;
```

| str_to_int |
|------------|
| 123        |

- Funciones de Manipulación de Cadenas:
  - Concatena el nombre y el departamento de cada empleado.

```sql
select nombre || ' ' || departamento as nombre_dep from empleados;
```

|        nombre_dep         |
|---------------------------|
| Juan Ventas               |
| María TI                  |
| Carlos Ventas             |
| Ana Recursos Humanos      |
| Pedro TI                  |
| Laura Ventas              |
| Javier Recursos Humanos   |
| Carmen TI                 |
| Miguel Ventas             |
| Elena Recursos Humanos    |
| Diego TI                  |
| Sofía Ventas              |
| Andrés Recursos Humanos   |
| Isabel TI                 |
| Raúl Ventas               |
| Patricia Recursos Humanos |
| Alejandro TI              |
| Natalia Ventas            |
| Roberto Recursos Humanos  |
| Beatriz TI                |

- Funciones de Manipulación de Cadenas (CONCAT_WS):
  - Concatena el nombre y el departamento de cada empleado con un guion como separador.

```sql
-- Ya que no existe la función CONCAT_WS en SQLite, se sigue usando el método de ||
select nombre || '-' || departamento as nombre_dep from empleados;
```

|        nombre_dep         |
|---------------------------|
| Juan-Ventas               |
| María-TI                  |
| Carlos-Ventas             |
| Ana-Recursos Humanos      |
| Pedro-TI                  |
| Laura-Ventas              |
| Javier-Recursos Humanos   |
| Carmen-TI                 |
| Miguel-Ventas             |
| Elena-Recursos Humanos    |
| Diego-TI                  |
| Sofía-Ventas              |
| Andrés-Recursos Humanos   |
| Isabel-TI                 |
| Raúl-Ventas               |
| Patricia-Recursos Humanos |
| Alejandro-TI              |
| Natalia-Ventas            |
| Roberto-Recursos Humanos  |
| Beatriz-TI                |

- Funciones de Control de Flujo (CASE):
  - Categoriza a los empleados según sus salarios.

```sql
select nombre, salario,
case
    when salario > 60000 then 'Salario mayor a 60.000'
    when salario < 60000 then 'Salario menor a 60.000'
    when salario = 60000 then 'Salario igual a 60.000'
    else 'No se puede clasificar'
end as categoria_sal
from empleados;
```

|  nombre   | salario |     categoria_sal      |
|-----------|---------|------------------------|
| Juan      | 50000.0 | Salario menor a 60.000 |
| María     | 60000.0 | Salario igual a 60.000 |
| Carlos    | 55000.0 | Salario menor a 60.000 |
| Ana       | 48000.0 | Salario menor a 60.000 |
| Pedro     | 70000.0 | Salario mayor a 60.000 |
| Laura     | 52000.0 | Salario menor a 60.000 |
| Javier    | 48000.0 | Salario menor a 60.000 |
| Carmen    | 65000.0 | Salario mayor a 60.000 |
| Miguel    | 51000.0 | Salario menor a 60.000 |
| Elena     | 55000.0 | Salario menor a 60.000 |
| Diego     | 72000.0 | Salario mayor a 60.000 |
| Sofía     | 49000.0 | Salario menor a 60.000 |
| Andrés    | 60000.0 | Salario igual a 60.000 |
| Isabel    | 53000.0 | Salario menor a 60.000 |
| Raúl      | 68000.0 | Salario mayor a 60.000 |
| Patricia  | 47000.0 | Salario menor a 60.000 |
| Alejandro | 71000.0 | Salario mayor a 60.000 |
| Natalia   | 54000.0 | Salario menor a 60.000 |
| Roberto   | 49000.0 | Salario menor a 60.000 |
| Beatriz   | 63000.0 | Salario mayor a 60.000 |

- Funciones de Agregación (SUM):
  - Calcula la suma total de salarios de todos los empleados.

```sql
select sum(salario) as salario_total from empleados;
```

| salario_total |
|---------------|
| 1140000.0     |

- Funciones Numéricas (ROUND):
  - Redondea el salario de todos los empleados a dos decimales.

```sql
select round(salario, 2) as rnd_salario from empleados;
```

| rnd_salario |
|-------------|
| 50000.0     |
| 60000.0     |
| 55000.0     |
| 48000.0     |
| 70000.0     |
| 52000.0     |
| 48000.0     |
| 65000.0     |
| 51000.0     |
| 55000.0     |
| 72000.0     |
| 49000.0     |
| 60000.0     |
| 53000.0     |
| 68000.0     |
| 47000.0     |
| 71000.0     |
| 54000.0     |
| 49000.0     |
| 63000.0     |

- Funciones de Manipulación de Cadenas (LENGTH):
  - Muestra la longitud de cada nombre de empleado.

```sql
select nombre, length(nombre) as len_nombre from empleados;
```

|  nombre   | len_nombre |
|-----------|------------|
| Juan      | 4          |
| María     | 5          |
| Carlos    | 6          |
| Ana       | 3          |
| Pedro     | 5          |
| Laura     | 5          |
| Javier    | 6          |
| Carmen    | 6          |
| Miguel    | 6          |
| Elena     | 5          |
| Diego     | 5          |
| Sofía     | 5          |
| Andrés    | 6          |
| Isabel    | 6          |
| Raúl      | 4          |
| Patricia  | 8          |
| Alejandro | 9          |
| Natalia   | 7          |
| Roberto   | 7          |
| Beatriz   | 7          |

- Funciones de Agregación (COUNT):
  - Cuenta el número total de empleados en cada departamento.

```sql
select count(id) as empleados, departamento from empleados group by departamento;
```

| empleados |   departamento   |
|-----------|------------------|
| 6         | Recursos Humanos |
| 7         | TI               |
| 7         | Ventas           |

- Funciones de Fecha y Hora (CURRENT_TIME):
  - Muestra la hora actual.

```sql
select time() as hora_actual;
```

| hora_actual |
|-------------|
| 08:04:06    |

- Funciones de Conversión (CAST):
  - Convierte el salario a un valor de punto flotante.

```sql
select cast(salario as float) as salario_float from empleados;
```

| salario_float |
|---------------|
| 50000.0       |
| 60000.0       |
| 55000.0       |
| 48000.0       |
| 70000.0       |
| 52000.0       |
| 48000.0       |
| 65000.0       |
| 51000.0       |
| 55000.0       |
| 72000.0       |
| 49000.0       |
| 60000.0       |
| 53000.0       |
| 68000.0       |
| 47000.0       |
| 71000.0       |
| 54000.0       |
| 49000.0       |
| 63000.0       |

- Funciones de Manipulación de Cadenas (SUBSTR):
  - Muestra los primeros tres caracteres de cada nombre de empleado.

```sql
select nombre, substr(nombre, 1, 3) as sub_nombre from empleados;
```

|  nombre   | sub_nombre |
|-----------|------------|
| Juan      | Jua        |
| María     | Mar        |
| Carlos    | Car        |
| Ana       | Ana        |
| Pedro     | Ped        |
| Laura     | Lau        |
| Javier    | Jav        |
| Carmen    | Car        |
| Miguel    | Mig        |
| Elena     | Ele        |
| Diego     | Die        |
| Sofía     | Sof        |
| Andrés    | And        |
| Isabel    | Isa        |
| Raúl      | Raú        |
| Patricia  | Pat        |
| Alejandro | Ale        |
| Natalia   | Nat        |
| Roberto   | Rob        |
| Beatriz   | Bea        |

- __Order By__ and __Like__.

  - Empleados en el departamento de 'Ventas' con salarios superiores a 52000.

```sql
select * from empleados where departamento like "Ventas" and salario > 52000;
```

| id | nombre  | salario | departamento |
|----|---------|---------|--------------|
| 3  | Carlos  | 55000.0 | Ventas       |
| 15 | Raúl    | 68000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |

  - Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.

```sql
select * from empleados where nombre like "%a%" order by salario;
```

| id |  nombre   | salario |   departamento   |
|----|-----------|---------|------------------|
| 16 | Patricia  | 47000.0 | Recursos Humanos |
| 4  | Ana       | 48000.0 | Recursos Humanos |
| 7  | Javier    | 48000.0 | Recursos Humanos |
| 12 | Sofía     | 49000.0 | Ventas           |
| 1  | Juan      | 50000.0 | Ventas           |
| 6  | Laura     | 52000.0 | Ventas           |
| 14 | Isabel    | 53000.0 | TI               |
| 18 | Natalia   | 54000.0 | Ventas           |
| 3  | Carlos    | 55000.0 | Ventas           |
| 10 | Elena     | 55000.0 | Recursos Humanos |
| 2  | María     | 60000.0 | TI               |
| 13 | Andrés    | 60000.0 | Recursos Humanos |
| 20 | Beatriz   | 63000.0 | TI               |
| 8  | Carmen    | 65000.0 | TI               |
| 15 | Raúl      | 68000.0 | Ventas           |
| 17 | Alejandro | 71000.0 | TI               |

  - Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.

```sql
select * from empleados where departamento like "Recursos Humanos" and salario between 45000 and 55000;
```

| id |  nombre  | salario |   departamento   |
|----|----------|---------|------------------|
| 4  | Ana      | 48000.0 | Recursos Humanos |
| 7  | Javier   | 48000.0 | Recursos Humanos |
| 10 | Elena    | 55000.0 | Recursos Humanos |
| 16 | Patricia | 47000.0 | Recursos Humanos |
| 19 | Roberto  | 49000.0 | Recursos Humanos |

  - Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.

```sql
select * from empleados order by salario desc limit 5;
```

| id |  nombre   | salario | departamento |
|----|-----------|---------|--------------|
| 11 | Diego     | 72000.0 | TI           |
| 17 | Alejandro | 71000.0 | TI           |
| 5  | Pedro     | 70000.0 | TI           |
| 15 | Raúl      | 68000.0 | Ventas       |
| 8  | Carmen    | 65000.0 | TI           |

  - Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.

```sql
select * from empleados where nombre like "M%" or nombre like "N%" and salario > 50000;
```

| id | nombre  | salario | departamento |
|----|---------|---------|--------------|
| 2  | María   | 60000.0 | TI           |
| 9  | Miguel  | 51000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |

  - Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.

```sql
select * from empleados where departamento like "TI" or departamento like "Ventas" order by nombre;
```

| id |  nombre   | salario | departamento |
|----|-----------|---------|--------------|
| 17 | Alejandro | 71000.0 | TI           |
| 20 | Beatriz   | 63000.0 | TI           |
| 3  | Carlos    | 55000.0 | Ventas       |
| 8  | Carmen    | 65000.0 | TI           |
| 11 | Diego     | 72000.0 | TI           |
| 14 | Isabel    | 53000.0 | TI           |
| 1  | Juan      | 50000.0 | Ventas       |
| 6  | Laura     | 52000.0 | Ventas       |
| 2  | María     | 60000.0 | TI           |
| 9  | Miguel    | 51000.0 | Ventas       |
| 18 | Natalia   | 54000.0 | Ventas       |
| 5  | Pedro     | 70000.0 | TI           |
| 15 | Raúl      | 68000.0 | Ventas       |
| 12 | Sofía     | 49000.0 | Ventas       |

  - Empleados con salarios únicos (eliminando duplicados) en orden ascendente.

```sql
select distinct id, nombre, salario from empleados group by salario order by salario;
```


| id |  nombre   | salario |
|----|-----------|---------|
| 16 | Patricia  | 47000.0 |
| 4  | Ana       | 48000.0 |
| 12 | Sofía     | 49000.0 |
| 1  | Juan      | 50000.0 |
| 9  | Miguel    | 51000.0 |
| 6  | Laura     | 52000.0 |
| 14 | Isabel    | 53000.0 |
| 18 | Natalia   | 54000.0 |
| 3  | Carlos    | 55000.0 |
| 2  | María     | 60000.0 |
| 20 | Beatriz   | 63000.0 |
| 8  | Carmen    | 65000.0 |
| 15 | Raúl      | 68000.0 |
| 5  | Pedro     | 70000.0 |
| 17 | Alejandro | 71000.0 |
| 11 | Diego     | 72000.0 |

  - Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.

```sql
select * from empleados where (nombre like "%o" or nombre like "%a") and departamento like "Ventas";
```

| id | nombre  | salario | departamento |
|----|---------|---------|--------------|
| 6  | Laura   | 52000.0 | Ventas       |
| 12 | Sofía   | 49000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |

  - Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.

```sql
select * from empleados where salario not between 55000 and 70000 order by departamento;
```

| id |  nombre   | salario |   departamento   |
|----|-----------|---------|------------------|
| 4  | Ana       | 48000.0 | Recursos Humanos |
| 7  | Javier    | 48000.0 | Recursos Humanos |
| 16 | Patricia  | 47000.0 | Recursos Humanos |
| 19 | Roberto   | 49000.0 | Recursos Humanos |
| 11 | Diego     | 72000.0 | TI               |
| 14 | Isabel    | 53000.0 | TI               |
| 17 | Alejandro | 71000.0 | TI               |
| 1  | Juan      | 50000.0 | Ventas           |
| 6  | Laura     | 52000.0 | Ventas           |
| 9  | Miguel    | 51000.0 | Ventas           |
| 12 | Sofía     | 49000.0 | Ventas           |
| 18 | Natalia   | 54000.0 | Ventas           |

  - Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.

```sql
select * from empleados where departamento like "Recursos Humanos" and nombre not like "%e%" and nombre not like "%é%";
```

| id |  nombre  | salario |   departamento   |
|----|----------|---------|------------------|
| 4  | Ana      | 48000.0 | Recursos Humanos |
| 16 | Patricia | 47000.0 | Recursos Humanos |

</div>