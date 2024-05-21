# Tarea 07 - Triggers

<div align=center>
  <img src="../../../../images/patricio.gif" alt="pez" width="50%"/>

  _Pez de la buena suerte_
</div>

<div align="justify">

## Trabajo con la BBDD Alumnos

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

- Tabla alumnos:
  - id (entero sin signo)
  - nombre (cadena de caracteres)
  - apellido1 (cadena de caracteres)
  - apellido2 (cadena de caracteres)
  - nota (número real)

__Solución:__
```sql
-- Creación de la base de datos
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

-- Creación de la tabla "alumno"
DROP TABLE IF EXISTS alumno;
CREATE TABLE alumno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    nota FLOAT
);
```
  
Crea los siguientes __triggers__:
- Trigger1:_trigger_check_nota_before_insert_.
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta antes de una operación de inserción.
  - Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
  - Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.´

__Solución:__
```sql
DROP TRIGGER IF EXISTS check_nota_before_insert;
DELIMITER $$
CREATE TRIGGER check_nota_before_insert
BEFORE INSERT ON alumno
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END;$$
DELIMITER ;
```

__Comprobación:__
```sql
INSERT INTO alumno (nombre, apellido1, apellido2, nota) values ('Juan', 'Pepito', 'Perez', -4);
INSERT INTO alumno (nombre, apellido1, apellido2, nota) values ('Maria', 'Antonella', 'Perez', 20);

SELECT * FROM alumno;
+----+--------+-----------+-----------+------+
| id | nombre | apellido1 | apellido2 | nota |
+----+--------+-----------+-----------+------+
|  1 | Juan   | Pepito    | Perez     |    0 |
|  2 | Maria  | Antonella | Perez     |   10 |
+----+--------+-----------+-----------+------+
```

- __Trigger2__ : _trigger_check_nota_before_update_.
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta antes de una operación de actualización.
  - Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.
  - Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10.

__Solución:__
```sql
DROP TRIGGER IF EXISTS check_nota_before_update;
DELIMITER $$
CREATE TRIGGER check_nota_before_update
BEFORE UPDATE ON alumno
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END;$$
DELIMITER ;
```

__Comprobación:__
```sql
UPDATE alumno SET nota = 13 WHERE id = 1;
UPDATE alumno SET nota = -2 WHERE id = 2;

SELECT * FROM alumno;
+----+--------+-----------+-----------+------+
| id | nombre | apellido1 | apellido2 | nota |
+----+--------+-----------+-----------+------+
|  1 | Juan   | Pepito    | Perez     |   10 |
|  2 | Maria  | Antonella | Perez     |    0 |
+----+--------+-----------+-----------+------+
```

Una vez creados los triggers escriba varias sentencias de inserción y actualización sobre la tabla alumnos y verifica que los triggers se están ejecutando correctamente.

Crea el siguiente procedimiento:
- __Procedimiento1__:
  - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre 3, y 10.
  - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre -10, y 12.
Realiza los procedimientos y verifica el comportamiento llamando a este con los parámetros adecuados.

__Solución:__
```sql
DROP PROCEDURE IF EXISTS generar_alumnos;
DELIMITER //
CREATE PROCEDURE generar_alumnos(IN cantidad INT, prefix VARCHAR(100), nota_minima INT, nota_maxima INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE p_nombre VARCHAR(100);
    DECLARE p_nota FLOAT;
    WHILE counter < cantidad DO
        SET p_nombre = CONCAT(prefix, (RAND(counter) * 1000) + 1);
        SET p_nota = ROUND(RAND(counter) * (nota_maxima - nota_minima + 1) + nota_minima);
        INSERT INTO alumno (nombre, apellido1, apellido2, nota) VALUES (
            p_nombre, p_nombre, p_nombre, p_nota
        );
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```

__Comprobación:__
```sql
CALL generar_alumnos(5, "alumno", 3, 10);
+----+--------------------------+--------------------------+--------------------------+------+
| id | nombre                   | apellido1                | apellido2                | nota |
+----+--------------------------+--------------------------+--------------------------+------+
|  8 | alumno156.22042769493575 | alumno156.22042769493575 | alumno156.22042769493575 |    4 |
|  9 | alumno406.40353712197725 | alumno406.40353712197725 | alumno406.40353712197725 |    6 |
| 10 | alumno656.5866465490186  | alumno656.5866465490186  | alumno656.5866465490186  |    8 |
| 11 | alumno906.7697559760601  | alumno906.7697559760601  | alumno906.7697559760601  |   10 |
| 12 | alumno156.95286540310167 | alumno156.95286540310167 | alumno156.95286540310167 |    4 |
+----+--------------------------+--------------------------+--------------------------+------+

CALL generar_alumnos(5, "mal_alumno", -10, 12);
+----+------------------------------+------------------------------+------------------------------+------+
| id | nombre                       | apellido1                    | apellido2                    | nota |
+----+------------------------------+------------------------------+------------------------------+------+
| 13 | mal_alumno156.22042769493575 | mal_alumno156.22042769493575 | mal_alumno156.22042769493575 |    0 |
| 14 | mal_alumno406.40353712197725 | mal_alumno406.40353712197725 | mal_alumno406.40353712197725 |    0 |
| 15 | mal_alumno656.5866465490186  | mal_alumno656.5866465490186  | mal_alumno656.5866465490186  |    5 |
| 16 | mal_alumno906.7697559760601  | mal_alumno906.7697559760601  | mal_alumno906.7697559760601  |   10 |
| 17 | mal_alumno156.95286540310167 | mal_alumno156.95286540310167 | mal_alumno156.95286540310167 |    0 |
+----+------------------------------+------------------------------+------------------------------+------+
```

</div>