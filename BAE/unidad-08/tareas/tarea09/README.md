# Tarea 09 - Triggers

<div align=center>
  <img src="../../../../images/patricio.gif" alt="pez" width="50%"/>

  _Pez de la buena suerte_
</div>

<div align="justify">

## Trabajo con la BBDD Alumnos

Modifica el ejercicio anterior y añade un nuevo trigger que las siguientes características:
Trigger: __trigger_guardar_email_after_update__:
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta después de una operación de actualización.
  - Cada vez que un alumno modifique su dirección de email se deberá insertar un nuevo registro en una tabla llamada log_cambios_email.
  - La tabla log_cambios_email contiene los siguientes campos:
    - id: clave primaria (entero autonumérico)
    - id_alumno: id del alumno (entero)
    - fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
    - old_email: valor anterior del email (cadena de caracteres)
    - new_email: nuevo valor con el que se ha actualizado

#### Tabla requerida "log_cambios_email"
```sql
DROP TABLE IF EXISTS log_cambios_email;
CREATE TABLE log_cambios_email (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_alumno INT REFERENCES alumnos(id),
  fecha_hora DATETIME,
  old_email VARCHAR(100),
  new_email VARCHAR(100)
);
```

#### Trigger "guardar_email_after_update"
```sql
DROP TRIGGER IF EXISTS guardar_email_after_update;
DELIMITER //
CREATE TRIGGER guardar_email_after_update
AFTER UPDATE ON alumnos FOR EACH ROW
BEGIN
  IF OLD.email <> NEW.email THEN
    INSERT INTO log_cambios_email (id_alumno, fecha_hora, old_email, new_email) VALUES (
      NEW.id, NOW(), OLD.email, NEW.email
    );
  END IF;
END;//
DELIMITER ;
```

#### Comprobación
```sql
UPDATE alumnos SET email = 'paquita_la_del_barrio@gmail.com' WHERE id = 45;

SELECT * FROM alumnos WHERE id = 45;
+----+----------------+----------------+----------------+---------------------------------+
| id | nombre         | apellido1      | apellido2      | email                           |
+----+----------------+----------------+----------------+---------------------------------+
| 45 | Alumnoe7a7f598 | Alumnoe7a7f5f6 | Alumnoe7a7f617 | paquita_la_del_barrio@gmail.com |
+----+----------------+----------------+----------------+---------------------------------+

SELECT * FROM log_cambios_email;
+----+-----------+---------------------+----------------------+---------------------------------+
| id | id_alumno | fecha_hora          | old_email            | new_email                       |
+----+-----------+---------------------+----------------------+---------------------------------+
|  1 |        45 | 2024-05-22 19:17:36 | aalualu@e7a7f9db.com | paquita_la_del_barrio@gmail.com |
+----+-----------+---------------------+----------------------+---------------------------------+
```

Añade un nuevo trigger que tenga las siguientes características:
- Trigger: __trigger_guardar_alumnos_eliminados__:
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta después de una operación de borrado.
  - Cada vez que se elimine un alumno de la tabla alumnos se deberá insertar un nuevo registro en una tabla llamada log_alumnos_eliminados.
  - La tabla log_alumnos_eliminados contiene los siguientes campos:
    - id: clave primaria (entero autonumérico)
    - id_alumno: id del alumno (entero)
    - fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
    - nombre: nombre del alumno eliminado (cadena de caracteres)
    - apellido1: primer apellido del alumno eliminado (cadena de caracteres)
    - apellido2: segundo apellido del alumno eliminado (cadena de caracteres)
    - email: email del alumno eliminado (cadena de caracteres).

#### Tabla requerida "log_alumnos_eliminados"
```sql
DROP TABLE IF EXISTS log_alumnos_eliminados;
CREATE TABLE log_alumnos_eliminados (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_alumno INT REFERENCES alumnos(id),
  fecha_hora DATETIME,
  nombre VARCHAR(100),
  apellido1 VARCHAR(100),
  apellido2 VARCHAR(100),
  email VARCHAR(100)
);
```

#### Trigger "guardar_alumnos_eliminados"
```sql
DROP TRIGGER IF EXISTS guardar_alumnos_eliminados;
DELIMITER //
CREATE TRIGGER guardar_alumnos_eliminados
AFTER DELETE ON alumnos FOR EACH ROW
BEGIN
  INSERT INTO log_alumnos_eliminados(id_alumno, fecha_hora, nombre, apellido1, apellido2, email) VALUES (
    OLD.id, NOW(), OLD.nombre, OLD.apellido1, OLD.apellido2, OLD.email
  );
END;//
DELIMITER ;
```

#### Comprobación
```sql
DELETE FROM alumnos WHERE id = 46;

SELECT * FROM alumnos WHERE id BETWEEN 44 AND 48;
+----+----------------+----------------+----------------+---------------------------------+
| id | nombre         | apellido1      | apellido2      | email                           |
+----+----------------+----------------+----------------+---------------------------------+
| 44 | Alumnoe7a6daa3 | Alumnoe7a6db01 | Alumnoe7a6db28 | aalualu@e7a6df30.com            |
| 45 | Alumnoe7a7f598 | Alumnoe7a7f5f6 | Alumnoe7a7f617 | paquita_la_del_barrio@gmail.com |
| 47 | Alumnoe7a96e66 | Alumnoe7a96ea8 | Alumnoe7a96ec7 | aalualu@e7a97143.com            |
| 48 | Alumnoe7aa17d5 | Alumnoe7aa1816 | Alumnoe7aa1832 | aalualu@e7aa1a81.com            |
+----+----------------+----------------+----------------+---------------------------------+

SELECT * FROM log_alumnos_eliminados;
+----+-----------+---------------------+----------------+----------------+----------------+----------------------+
| id | id_alumno | fecha_hora          | nombre         | apellido1      | apellido2      | email                |
+----+-----------+---------------------+----------------+----------------+----------------+----------------------+
|  1 |        46 | 2024-05-22 19:19:55 | Alumnoe7a8ee66 | Alumnoe7a8eeab | Alumnoe7a8eecb | aalualu@e7a8f130.com |
+----+-----------+---------------------+----------------+----------------+----------------+----------------------+
```

</div>