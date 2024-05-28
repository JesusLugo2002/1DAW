-- ¿Sabías que la mayoría de los adultos sanos pueden ser donantes? Aunque existen ciertas condiciones que debes cumplir para realizar con éxito una donación. Descubre los requisitos básicos para donar sangre.

-- Para la poder donar sangre se deben cumplir varias condiciones:

-- Tener un peso superior a 50Kg.
-- No haber donado en un periodo anterior a 90 días en caso de ser hombre y 120 días en caso de mujer.

-- Teniendo en cuenta esta información se pide:

-- Crea una base datos llamada donación.

DROP DATABASE IF EXISTS donacion;
CREATE DATABASE donacion;
USE donacion;

-- Crea una tabla llamada persona con los siguientes campos:

-- Identificador Auto Incremental (Integer) PK
-- Identificador (Texto) 
-- Peso. (Entero)
-- Admitido. Texto(Si/No).(Valores de dominio:Si/No)
-- Sexo. Texto (H/M).(Valores de dominio:H/M)
-- Fecha Última Donación.

DROP TABLE IF EXISTS persona;
CREATE TABLE persona (
    id INT PRIMARY KEY AUTO_INCREMENT,
    identificador VARCHAR(100),
    peso INT,
    admitido VARCHAR(10),
    sexo VARCHAR(10),
    fecha DATE
);

-- Se pide:

-- - Realiza los siguientes procedimientos:

-- - (1) Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. 
-- El procedimiento debe de recibir como parámetro de entrada, al menos, el número de registros que se desea insertar y se debe de lanzar, al menos, 
-- en dos ocasiones, para verificar su correcto funcionamiento. Los datos deben de ser aleatorios, es decir, 
-- en cada inserción de debe de auto generar o seleccionar uno al azar, de los campos requeridos.

DROP PROCEDURE IF EXISTS insertar_datos;
DELIMITER //
CREATE PROCEDURE insertar_datos(IN num_registros INT, peso_min INT, peso_max INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE auxiliar INT;
    DECLARE p_id VARCHAR(100);
    DECLARE p_peso INT;
    DECLARE p_admitido VARCHAR(10);
    DECLARE p_sexo VARCHAR(10);
    WHILE counter < num_registros DO
        SET p_id = SUBSTRING_INDEX(UUID(), '-', 1);
        SET p_peso = RAND() * (peso_max - peso_min) + peso_min;
        SET auxiliar = (RAND() * 100) + 1;
        IF auxiliar > 50 THEN
            SET p_admitido = 'Si';
        ELSE
            SET p_admitido = 'No';
        END IF;
        SET auxiliar = (RAND() * 100) + 1;
        IF auxiliar > 50 THEN
            SET p_sexo = 'M';
        ELSE
            SET p_sexo = 'H';
        END IF;
        INSERT INTO persona (identificador, peso, admitido, sexo, fecha) VALUES (
            p_id, p_peso, p_admitido, p_sexo, NOW()
        );
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;

CALL insertar_datos(5, 50, 100);
SELECT * FROM persona;
/*
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  1 | 82dc7194      |   74 | Si       | H    | 2024-05-23 |
|  2 | 82dcf20b      |   62 | No       | M    | 2024-05-23 |
|  3 | 82dd5439      |   82 | Si       | M    | 2024-05-23 |
|  4 | 82dddeb6      |   85 | Si       | M    | 2024-05-23 |
|  5 | 82de5544      |   92 | No       | M    | 2024-05-23 |
+----+---------------+------+----------+------+------------+
*/
CALL insertar_datos(10, 40, 80);
SELECT * FROM persona;
/*
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  1 | 82dc7194      |   74 | Si       | H    | 2024-05-23 |
|  2 | 82dcf20b      |   62 | No       | M    | 2024-05-23 |
|  3 | 82dd5439      |   82 | Si       | M    | 2024-05-23 |
|  4 | 82dddeb6      |   85 | Si       | M    | 2024-05-23 |
|  5 | 82de5544      |   92 | No       | M    | 2024-05-23 |
|  6 | 8bb1323a      |   44 | Si       | H    | 2024-05-23 |
|  7 | 8bb29a31      |   58 | No       | H    | 2024-05-23 |
|  8 | 8bb44362      |   64 | Si       | M    | 2024-05-23 |
|  9 | 8bb57a0b      |   56 | Si       | M    | 2024-05-23 |
| 10 | 8bb63d6a      |   71 | No       | H    | 2024-05-23 |
| 11 | 8bb6d432      |   55 | No       | M    | 2024-05-23 |
| 12 | 8bb75861      |   77 | Si       | M    | 2024-05-23 |
| 13 | 8bb7ebfe      |   42 | No       | M    | 2024-05-23 |
| 14 | 8bb891de      |   73 | No       | H    | 2024-05-23 |
| 15 | 8bb937b2      |   50 | Si       | H    | 2024-05-23 |
+----+---------------+------+----------+------+------------+
*/

-- - (2) Realiza un procedimiento que permita actualizar el la fecha de última donación, teniendo como parámetro de entrada el identificador de la persona, y una fecha.

DROP PROCEDURE IF EXISTS actualizar_fecha;
DELIMITER //
CREATE PROCEDURE actualizar_fecha(IN input_id VARCHAR(100), input_fecha DATE)
BEGIN
    UPDATE persona SET fecha = input_fecha WHERE identificador = input_id;
END //
DELIMITER ;

CALL actualizar_fecha('82dc7194', '2024-02-04');
SELECT * FROM persona WHERE identificador = '82dc7194';
/*
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  1 | 82dc7194      |   74 | Si       | H    | 2024-02-04 |
+----+---------------+------+----------+------+------------+
*/

-- - (3) Crea un procedimiento llamado CalcularTotalDonaciones que calcule la cantidad total de donaciones realizadas por cada persona y la almacene en una tabla llamada total_donaciones. La tabla total_donaciones debe tener dos columnas: id_persona (texto) y cantidad_total (integer).

DROP PROCEDURE IF EXISTS CalcularTotalDonaciones;
DELIMITER //
CREATE PROCEDURE CalcularTotalDonaciones()
BEGIN
    DROP TABLE IF EXISTS total_donaciones;
    CREATE TABLE total_donaciones(
        id_persona VARCHAR(100),
        cantidad_total INT
    );
    INSERT INTO total_donaciones SELECT identificador, count(id) FROM persona GROUP BY identificador;
END //
DELIMITER ;

CALL CalcularTotalDonaciones();
SELECT * FROM total_donaciones;
/*
+------------+----------------+
| id_persona | cantidad_total |
+------------+----------------+
| 82dc7194   |              1 |
| 82dcf20b   |              1 |
| 82dd5439   |              1 |
| 82dddeb6   |              1 |
| 82de5544   |              1 |
| 8bb1323a   |              1 |
| 8bb29a31   |              1 |
| 8bb44362   |              1 |
| 8bb57a0b   |              1 |
| 8bb63d6a   |              1 |
| 8bb6d432   |              1 |
| 8bb75861   |              1 |
| 8bb7ebfe   |              1 |
| 8bb891de   |              1 |
| 8bb937b2   |              1 |
+------------+----------------+
*/

-- - (4) Crea un procedimiento que me permita eliminar una persona de la tabla total_donaciones.

DROP PROCEDURE IF EXISTS eliminar_persona;
DELIMITER //
CREATE PROCEDURE eliminar_persona(IN input_id VARCHAR(100))
BEGIN
    DELETE FROM total_donaciones WHERE id_persona = input_id;
END //
DELIMITER ;

SELECT * FROM total_donaciones WHERE id_persona = '8bb891de';
/*
+------------+----------------+
| id_persona | cantidad_total |
+------------+----------------+
| 8bb891de   |              1 |
+------------+----------------+
*/
CALL eliminar_persona('8bb891de');
SELECT * FROM total_donaciones WHERE id_persona = '8bb891de';
/* Empty set (0,00 sec) */

-- - Realizar cada una de las siguientes funciones:

-- - (1) Realiza una función que determine si una persona almacenada en la tabla persona puede realizar una donación. Para ello la función recibe como parámetro de entrada el identificador de esta persona, y una fecha de donación. Revisa las condiciones para que una persona pueda o no donar. Posteriormente actualice el valor de la última donación de la persona indicada con el parámetro de entrada.

DELIMITER //
DROP FUNCTION IF EXISTS posible_donador;
CREATE FUNCTION posible_donador(id_persona VARCHAR(100), nueva_fecha DATE) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE p_fecha DATE;
    DECLARE p_admitido VARCHAR(10);
    SELECT admitido, fecha INTO p_admitido, p_fecha FROM persona WHERE identificador = id_persona;
    IF p_admitido = 'Si' THEN
        UPDATE persona SET fecha = nueva_fecha;
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //
DELIMITER ;

SELECT * FROM persona WHERE identificador = '82dddeb6';
/*
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  4 | 82dddeb6      |   85 | Si       | M    | 2024-05-23 |
+----+---------------+------+----------+------+------------+
*/
SELECT posible_donador('82dddeb6', '2024-06-18') as posible_donador;
/*
+-----------------+
| posible_donador |
+-----------------+
|               1 |
+-----------------+
*/
SELECT * FROM persona WHERE identificador = '82dddeb6';
/*
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  4 | 82dddeb6      |   85 | Si       | M    | 2024-06-18 |
+----+---------------+------+----------+------+------------+
*/

-- - (2) Realiza una función que determine que persona es la que más donaciones ha realizado.

DELIMITER //
DROP FUNCTION IF EXISTS maximo_donador;
CREATE FUNCTION maximo_donador() RETURNS VARCHAR(100) DETERMINISTIC 
BEGIN
    DECLARE p_identificador VARCHAR(100);
    SELECT id_persona INTO p_identificador FROM total_donaciones ORDER BY cantidad_total DESC LIMIT 1; 
    RETURN p_identificador;
END //
DELIMITER ;

-- Con motivos de probar la función, hice un par inserciones extra de una persona con igual identificador.
-- Luego, calcular nuevamente el total de donaciones.
INSERT INTO persona(identificador, peso, admitido, sexo, fecha) VALUES('82dddeb6', 85, 'Si', 'M', NOW());
CALL CalcularTotalDonaciones();
SELECT maximo_donador();
/*
+------------------+
| maximo_donador() |
+------------------+
| 82dddeb6         |
+------------------+
*/

-- - Triggers

-- - (1) Realiza un trigger que actualiza total_donaciones con cada una de las inserciones que se realicen en la tabla Persona.

DROP TRIGGER IF EXISTS calcular_total_donaciones_after_insert_persona;
DELIMITER //
CREATE TRIGGER calcular_total_donaciones_after_insert_persona
AFTER INSERT ON persona FOR EACH ROW
BEGIN
    IF NEW.identificador IN (SELECT id_persona FROM total_donaciones) THEN
        UPDATE total_donaciones SET cantidad_total = cantidad_total + 1 WHERE id_persona = NEW.identificador;
    ELSE
        INSERT INTO total_donaciones(id_persona, cantidad_total) VALUES (NEW.identificador, 1);
    END IF;
END;//
DELIMITER ; 

-- Pruebas con inserciones de nuevos identificadores
SELECT count(*) as registros FROM total_donaciones;
/*
+-----------+
| registros |
+-----------+
|        14 |
+-----------+
*/
CALL insertar_datos(10, 45, 90);
SELECT count(*) as registros FROM total_donaciones;
/*
+-----------+
| registros |
+-----------+
|        24 |
+-----------+
*/

-- Prueba con inserción de identificador ya existente
SELECT * FROM total_donaciones WHERE id_persona = '82dddeb6';
/*
+------------+----------------+
| id_persona | cantidad_total |
+------------+----------------+
| 82dddeb6   |              3 |
+------------+----------------+
*/
INSERT INTO persona(identificador, peso, admitido, sexo, fecha) VALUES('82dddeb6', 85, 'Si', 'M', NOW());
SELECT * FROM total_donaciones WHERE id_persona = '82dddeb6';
/*
+------------+----------------+
| id_persona | cantidad_total |
+------------+----------------+
| 82dddeb6   |              4 |
+------------+----------------+
*/

-- - (2) Realiza un trigger que elimine todos los registros en la tabla persona cuando se elimine un registro de la tabla total_donaciones.

DROP TRIGGER IF EXISTS eliminacion_total_tabla_persona;
DELIMITER //
CREATE TRIGGER eliminacion_total_tabla_persona
AFTER DELETE ON total_donaciones FOR EACH ROW
BEGIN
    DELETE FROM persona WHERE identificador = OLD.id_persona;
END;//
DELIMITER ;

SELECT * FROM persona WHERE identificador = '82dddeb6';
/*
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  4 | 82dddeb6      |   85 | Si       | M    | 2024-06-18 |
| 16 | 82dddeb6      |   85 | Si       | M    | 2024-05-23 |
| 17 | 82dddeb6      |   85 | Si       | M    | 2024-05-23 |
| 41 | 82dddeb6      |   85 | Si       | M    | 2024-05-23 |
+----+---------------+------+----------+------+------------+
*/
DELETE FROM total_donaciones WHERE id_persona = '82dddeb6';
SELECT * FROM persona WHERE identificador = '82dddeb6';
/* Empty set (0,00 sec) */