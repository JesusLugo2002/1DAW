# Tarea 08 - BBDD Alumnos

<div align=center>
  <img src="../../../../images/patricio.gif" alt="pez" width="50%"/>

  _Pez de la buena suerte_
</div>

<div align="justify">

<div align="justify">

## Trabajo con la BBDD Alumnos

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

- Tabla alumnos:

  - id (entero sin signo)
  - nombre (cadena de caracteres)
  - apellido1 (cadena de caracteres)
  - apellido2 (cadena de caracteres)
  - email (cadena de caracteres)
 
__Solución:__
```sql
-- Creación de la base de datos
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

-- Creación de la tabla "Alumnos"
CREATE TABLE alumnos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  apellido1 VARCHAR(50),
  apellido2 VARCHAR(50),
  email VARCHAR(100)
);
```

1. Escribe una función llamado __crear_email__ que dados los parámetros de entrada: __nombre, apellido1, apellido2 y dominio__, cree una dirección de email y la devuelva como salida.

- Función: crear_email
  - Entrada:
      - nombre (cadena de caracteres)
      - apellido1 (cadena de caracteres)
      - apellido2 (cadena de caracteres)
      - dominio (cadena de caracteres)
  - Salida:
      - email (cadena de caracteres)

El email devuelve una dirección de correo electrónico con el siguiente formato:

- El primer carácter del parámetro nombre.
- Los tres primeros caracteres del parámetro apellido1.
- Los tres primeros caracteres del parámetro apellido2.
- El carácter @.
- El dominio pasado como parámetro.
- La dirección de email debe estar en minúsculas.

__Solución:__
```sql
DROP FUNCTION IF EXISTS crear_email;
DELIMITER //
CREATE FUNCTION crear_email(nombre VARCHAR(100), apellido1 VARCHAR(50), apellido2 VARCHAR(50), dominio VARCHAR(50)) RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
  DECLARE caracter_nombre CHAR;
  DECLARE caracteres_apellido1 CHAR;
  DECLARE caracteres_apellido2 CHAR;

  SET caracter_nombre = SUBSTRING(nombre, 1, 1);
  SET caracteres_apellido1 = SUBSTRING(apellido1, 1, 3);
  SET caracteres_apellido2 = SUBSTRING(apellido2, 1, 3);
  RETURN eliminar_acentos(LCASE(CONCAT(caracter_nombre, caracteres_apellido1, caracteres_apellido2, '@', dominio)));
END //
DELIMITER ;
```

- También crea una función llamada __eliminar_acentos__ que reciba una cadena de caracteres y devuelva la misma cadena sin acentos. La función tendrá que reemplazar todas las vocales que tengan acento por la misma vocal pero sin acento. Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe devolver la cadena Maria.

- Función: eliminar_acentos
  - Entrada:
    - cadena (cadena de caracteres)
  - Salida:
    - (cadena de caracteres)

> ___La función crear_email deberá hacer uso de la función eliminar_acentos___.

__Función "eliminar_acentos"__:
```sql
DROP FUNCTION IF EXISTS eliminar_acentos;
DELIMITER //
CREATE FUNCTION eliminar_acentos(cadena VARCHAR(100)) RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
  DECLARE nueva_cadena VARCHAR(100);
  SET nueva_cadena = REPLACE(cadena, 'á', 'a');
  SET nueva_cadena = REPLACE(nueva_cadena, 'é', 'e');
  SET nueva_cadena = REPLACE(nueva_cadena, 'í', 'i');
  SET nueva_cadena = REPLACE(nueva_cadena, 'ó', 'o');
  SET nueva_cadena = REPLACE(nueva_cadena, 'ú', 'u');
  RETURN nueva_cadena;
END //
DELIMITER ;
```

Una vez creada la tabla escriba un trigger con las siguientes características:

- Trigger:
  - __trigger_crear_email_before_insert__. Se ejecuta sobre la tabla alumnos. Se ejecuta antes de una operación de inserción.Si el nuevo valor del email que se quiere insertar es NULL, entonces se le creará automáticamente una dirección de email y se insertará en la tabla. Si el nuevo valor del email no es NULL se guardará en la tabla el valor del email.

>__Nota__: Para crear la nueva dirección de email se deberá hacer uso del procedimiento crear_email.

- Verificación:
  - Realiza inserciones en la tabla y verifica el correcto funcionamiento de las __funciones y triggers__.
  - Realiza un procedimiento que realice la inserción de un número de elementos que se pasa como parámetro. Incluye la máxima aleatoridad posible.
  
## Referencias

- [Apuntes sobre triggers](../../trigers.md).
- [Apuntes sobre procedimientos y funciones](../../procedimientos.md).
- [Mysql SubString](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html).
- [Mysql Replace](https://dev.mysql.com/doc/refman/8.0/en/replace.html).

</div>
