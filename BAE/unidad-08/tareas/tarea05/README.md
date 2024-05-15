# Tarea 05 - Procedimientos de generación de información

<div align=center>
  <img src="../../../../images/patricio.gif" alt="pez" width="50%"/>

  _Pez de la buena suerte (¡regresó!)_
</div>

<div align="justify">

## Trabajo con procedimientos de generación de información

Dado el procedimiento base:

```sql
DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop(5);
```

Y las funciones descritas en aleatoriedad, realiza los siguientes procedimientos, que realicen las siguietes operaciones:

  1. Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND().

    ```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
            (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
            (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
            (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
            (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
    ```

 2. Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función __UUID()__.

    ```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
      ```

  3. Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().

      ```sql
      INSERT INTO empleados (nombre, salario)
      SELECT CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000
      FROM (SELECT 1 UNION SELECT 2) AS sub
      ORDER BY RAND()
      LIMIT 2;
      ```

 4. Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).

    ```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
    ```
 
 5. Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.

    ```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (CONCAT('Empleado', RAND(1)), FLOOR(RAND(1) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(2)), FLOOR(RAND(2) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(3)), FLOOR(RAND(3) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(4)), FLOOR(RAND(4) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(5)), FLOOR(RAND(5) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(6)), FLOOR(RAND(6) * (10000 - 2000 + 1)) + 2000);
    ```

Crea cada uno de los procedimientos, maximixando el número de parámetros de entrada necesarios, por ejemplo: ___nombre, salario, e id__.

___Crea el procedimiento, la invocación, y el estado de la tabla después de la invocación de este___.

## Ejercicio 01

__Respuesta:__
```sql
DROP PROCEDURE IF EXISTS nombres_aleatorios;
DELIMITER //
CREATE PROCEDURE nombres_aleatorios(IN prefix VARCHAR(50), input_rows INT, base_salary INT, max_salary INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < input_rows DO
        INSERT INTO empleados (nombre, salario) VALUES (CONCAT(prefix, RAND()), FLOOR(RAND() * (max_salary - base_salary + 1)) + base_salary);

        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```

__Comprobación__:
```sql
select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+

call nombres_aleatorios("Empleado", 5, 1000, 7000);

select * from empleados;
+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.4406885899982309  | 5820.00 |
|  5 | Empleado0.6944879076392277  | 1375.00 |
|  6 | Empleado0.22907321176405365 | 6748.00 |
|  7 | Empleado0.10200013136677456 | 4819.00 |
|  8 | Empleado0.8763438666950388  | 3834.00 |
+----+-----------------------------+---------+
```

## Ejercicio 02

__Respuesta:__

```sql
DROP PROCEDURE IF EXISTS nombres_aleatorios_uuid;
DELIMITER //
CREATE PROCEDURE nombres_aleatorios_uuid(IN prefix VARCHAR(50), input_rows INT, base_salary INT, max_salary INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < input_rows DO
        INSERT INTO empleados (nombre, salario) VALUES (CONCAT(prefix, CONV(UUID(), 16, 10)), FLOOR(RAND() * (max_salary - base_salary + 1)) + base_salary);

        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```

__Comprobación:__

```sql
select * from empleados;
+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.4406885899982309  | 5820.00 |
|  5 | Empleado0.6944879076392277  | 1375.00 |
|  6 | Empleado0.22907321176405365 | 6748.00 |
|  7 | Empleado0.10200013136677456 | 4819.00 |
|  8 | Empleado0.8763438666950388  | 3834.00 |
+----+-----------------------------+---------+

call nombres_aleatorios_uuid(3, 2000, 10000);

select * from empleados;
+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.4406885899982309  | 5820.00 |
|  5 | Empleado0.6944879076392277  | 1375.00 |
|  6 | Empleado0.22907321176405365 | 6748.00 |
|  7 | Empleado0.10200013136677456 | 4819.00 |
|  8 | Empleado0.8763438666950388  | 3834.00 |
| 12 | TestUser3002705208          | 5343.00 |
| 13 | TestUser3002819821          | 9974.00 |
| 14 | TestUser3002916457          | 7836.00 |
+----+-----------------------------+---------+
```

## Ejercicio 03

__Respuesta__:
```sql
DROP PROCEDURE IF EXISTS nombres_aleatorios_order_rand;
DELIMITER //
CREATE PROCEDURE nombres_aleatorios_order_rand(IN prefix VARCHAR(50), input_rows INT, base_salary INT, max_salary INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    CREATE TEMPORARY TABLE sub (num INT);
    WHILE counter < input_rows DO
        INSERT INTO sub values (counter);
        SET counter = counter + 1;
    END WHILE;

    INSERT INTO empleados (nombre, salario)
    SELECT CONCAT(prefix, RAND()), FLOOR(RAND() * (max_salary - base_salary + 1)) + base_salary
    FROM sub
    ORDER BY RAND()
    LIMIT input_rows;
END //
DELIMITER ;
```

__Comprobación__:
```sql
select * from empleados;
+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.4406885899982309  | 5820.00 |
|  5 | Empleado0.6944879076392277  | 1375.00 |
|  6 | Empleado0.22907321176405365 | 6748.00 |
|  7 | Empleado0.10200013136677456 | 4819.00 |
|  8 | Empleado0.8763438666950388  | 3834.00 |
| 12 | TestUser3002705208          | 5343.00 |
| 13 | TestUser3002819821          | 9974.00 |
| 14 | TestUser3002916457          | 7836.00 |
| 15 | 080027077231                | 3972.00 |
| 16 | 080027077231                | 2296.00 |
| 17 | 080027077231                | 3564.00 |
| 18 | 080027077231                | 2931.00 |
| 19 | Empleado0.40540353712197724 | 5243.00 |
| 20 | Empleado0.6555866465490187  | 7245.00 |
| 21 | Empleado0.9057697559760601  | 9247.00 |
| 22 | Empleado0.15595286540310166 | 3247.00 |
| 23 | Empleado0.40613597483014313 | 5249.00 |
| 24 | Empleado0.6563190842571847  | 7251.00 |
+----+-----------------------------+---------+

call nombres_aleatorios_order_rand("Orden", 2, 2000, 5000);

+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.4406885899982309  | 5820.00 |
|  5 | Empleado0.6944879076392277  | 1375.00 |
|  6 | Empleado0.22907321176405365 | 6748.00 |
|  7 | Empleado0.10200013136677456 | 4819.00 |
|  8 | Empleado0.8763438666950388  | 3834.00 |
| 12 | TestUser3002705208          | 5343.00 |
| 13 | TestUser3002819821          | 9974.00 |
| 14 | TestUser3002916457          | 7836.00 |
| 15 | 080027077231                | 3972.00 |
| 16 | 080027077231                | 2296.00 |
| 17 | 080027077231                | 3564.00 |
| 18 | 080027077231                | 2931.00 |
| 19 | Empleado0.40540353712197724 | 5243.00 |
| 20 | Empleado0.6555866465490187  | 7245.00 |
| 21 | Empleado0.9057697559760601  | 9247.00 |
| 22 | Empleado0.15595286540310166 | 3247.00 |
| 23 | Empleado0.40613597483014313 | 5249.00 |
| 24 | Empleado0.6563190842571847  | 7251.00 |
| 25 | Orden0.506818432832899      | 2679.00 |
| 26 | Orden0.7839713103919954     | 3673.00 |
+----+-----------------------------+---------+
```

## Ejercicio 04

__Respuesta:__
```sql
DROP PROCEDURE IF EXISTS nombres_aleatorios_subindex;
DELIMITER //
CREATE PROCEDURE nombres_aleatorios_subindex(IN input_rows INT, base_salary INT, max_salary INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < input_rows DO
        INSERT INTO empleados (nombre, salario) VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (max_salary - base_salary + 1)) + base_salary);

        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```

__Respuesta:__
```sql
select * from empleados;
+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.4406885899982309  | 5820.00 |
|  5 | Empleado0.6944879076392277  | 1375.00 |
|  6 | Empleado0.22907321176405365 | 6748.00 |
|  7 | Empleado0.10200013136677456 | 4819.00 |
|  8 | Empleado0.8763438666950388  | 3834.00 |
| 12 | TestUser3002705208          | 5343.00 |
| 13 | TestUser3002819821          | 9974.00 |
| 14 | TestUser3002916457          | 7836.00 |
+----+-----------------------------+---------+

call nombres_aleatorios_subindex(4, 2000, 5000);

select * from empleados;
+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.4406885899982309  | 5820.00 |
|  5 | Empleado0.6944879076392277  | 1375.00 |
|  6 | Empleado0.22907321176405365 | 6748.00 |
|  7 | Empleado0.10200013136677456 | 4819.00 |
|  8 | Empleado0.8763438666950388  | 3834.00 |
| 12 | TestUser3002705208          | 5343.00 |
| 13 | TestUser3002819821          | 9974.00 |
| 14 | TestUser3002916457          | 7836.00 |
| 15 | 080027077231                | 3972.00 |
| 16 | 080027077231                | 2296.00 |
| 17 | 080027077231                | 3564.00 |
| 18 | 080027077231                | 2931.00 |
+----+-----------------------------+---------+
```

## Ejercicio 05

__Respuesta:__
```sql
DROP PROCEDURE IF EXISTS nombres_aleatorios_semillas;
DELIMITER //
CREATE PROCEDURE nombres_aleatorios_semillas(IN prefix VARCHAR(50), input_rows INT, base_salary INT, max_salary INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < input_rows DO
        INSERT INTO empleados (nombre, salario) VALUES (CONCAT(prefix, RAND(counter + 1)), FLOOR(RAND(counter + 1) * (max_salary - base_salary + 1)) + base_salary);

        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```

__Comprobación:__
```sql
select * from empleados;
+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.4406885899982309  | 5820.00 |
|  5 | Empleado0.6944879076392277  | 1375.00 |
|  6 | Empleado0.22907321176405365 | 6748.00 |
|  7 | Empleado0.10200013136677456 | 4819.00 |
|  8 | Empleado0.8763438666950388  | 3834.00 |
| 12 | TestUser3002705208          | 5343.00 |
| 13 | TestUser3002819821          | 9974.00 |
| 14 | TestUser3002916457          | 7836.00 |
| 15 | 080027077231                | 3972.00 |
| 16 | 080027077231                | 2296.00 |
| 17 | 080027077231                | 3564.00 |
| 18 | 080027077231                | 2931.00 |
+----+-----------------------------+---------+

call nombres_aleatorios_semillas("Empleado", 6, 2000, 10000);

select * from empleados;
+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.4406885899982309  | 5820.00 |
|  5 | Empleado0.6944879076392277  | 1375.00 |
|  6 | Empleado0.22907321176405365 | 6748.00 |
|  7 | Empleado0.10200013136677456 | 4819.00 |
|  8 | Empleado0.8763438666950388  | 3834.00 |
| 12 | TestUser3002705208          | 5343.00 |
| 13 | TestUser3002819821          | 9974.00 |
| 14 | TestUser3002916457          | 7836.00 |
| 15 | 080027077231                | 3972.00 |
| 16 | 080027077231                | 2296.00 |
| 17 | 080027077231                | 3564.00 |
| 18 | 080027077231                | 2931.00 |
| 19 | Empleado0.40540353712197724 | 5243.00 |
| 20 | Empleado0.6555866465490187  | 7245.00 |
| 21 | Empleado0.9057697559760601  | 9247.00 |
| 22 | Empleado0.15595286540310166 | 3247.00 |
| 23 | Empleado0.40613597483014313 | 5249.00 |
| 24 | Empleado0.6563190842571847  | 7251.00 |
+----+-----------------------------+---------+
```

</div>