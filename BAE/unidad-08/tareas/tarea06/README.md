# Tarea 06 - El Salario

<div align=center>
  <img src="../../../../images/patricio.gif" alt="pez" width="50%"/>

  _Pez de la buena suerte_
</div>

<div align="justify">

## ¿El salario?

Una de las preguntas más comunes que se hacen las personas cuando empiezan su vida laboral, suele ser qué es el salario base. Y es que es normal que la gente ande un poco confundida ya que, si no tienes conocimientos en este campo, es fácil hacerse un lío con términos como:
- Salario base.
- Base reguladora.
- Salario bruto.
- Salario neto.
- Etc.

Teniendo en cuenta esta información se pide:
- Crea una base datos llamada __salario__.
    
    __Solución:__
    ```sql
    DROP DATABASE IF EXISTS salario;
    CREATE DATABASE salario;
    USE salario;
    ```

- Crea una tabla llamada persona con los siguientes campos:
    - Identificador. (Texto)__(PK)__.
    - Nombre (Texto).
    - Salario_base. (__Escoge el tipo de dato__).
    - Subsidio(__Escoge el tipo de dato__).
    - Salud(__Escoge el tipo de dato__).
    - Pensión(__Escoge el tipo de dato__).
    - Bono(__Escoge el tipo de dato__).
    - Integral(__Escoge el tipo de dato__).

    __Solución__:
    ```sql
    DROP TABLE IF EXISTS persona;
    CREATE TABLE persona (
        id VARCHAR(100) PRIMARY KEY,
        nombre VARCHAR(100),
        salario_base DECIMAL(10, 2),
        subsidio DECIMAL(10, 2),
        salud DECIMAL(10, 2),
        pension DECIMAL(10, 2),
        bono DECIMAL(10, 2),
        integral DECIMAL(10, 2)
    );
    ```

- Creación de un __procedimiento__ de forma aleatoria con las siguientes características:
    - Parámetro de entrada el número de registros (_Mínimo 10, y realiza la prueba varias veces_). 

    __Solución:__
    ```sql
    DROP PROCEDURE IF EXISTS generar_personas;
    DELIMITER //
    CREATE PROCEDURE generar_personas(IN cantidad_registros INT, prefix VARCHAR(30), salario_min INT, salario_max INT)
    BEGIN
        DECLARE counter INT DEFAULT 0;
        DECLARE salario DECIMAL(10, 2);
        DECLARE p_id VARCHAR(100);
        DECLARE p_nombre VARCHAR(100);
        DECLARE p_salario DECIMAL(10, 2);
        DECLARE p_subsidio DECIMAL(10, 2);
        DECLARE p_salud DECIMAL(10, 2);
        DECLARE p_pension DECIMAL(10, 2);
        DECLARE p_bono DECIMAL(10, 2);
        DECLARE p_integral DECIMAL(10, 2);

        WHILE counter < cantidad_registros DO
            SET p_id = REPLACE(CAST(UUID() AS CHAR), '-', '');
            SET p_nombre = CONCAT(prefix, RAND());
            SET p_salario = FLOOR(RAND() * (salario_max - salario_min + 1) + salario_min);
            SET p_subsidio = p_salario * 0.07;
            SET p_salud = p_salario * 0.04;
            SET p_pension = p_salario * 0.04;
            SET p_bono = p_salario * 0.08;
            SET p_integral = p_salario - p_salud - p_pension + p_bono + p_subsidio;
            INSERT INTO persona (id, nombre, salario_base, subsidio, salud, pension, bono, integral) values(
                p_id, p_nombre, p_salario, p_subsidio, p_salud, p_pension, p_bono, p_integral
            );
            SET counter = counter + 1;
        END WHILE;
    END //
    DELIMITER ;
    ```

    __Comprobación:__
    ```sql
    CALL generar_personas(10, 'Persona-', 1200, 4000);
    +----------------------------------+-----------------------------+--------------+----------+--------+---------+--------+----------+
    | id                               | nombre                      | salario_base | subsidio | salud  | pension | bono   | integral |
    +----------------------------------+-----------------------------+--------------+----------+--------+---------+--------+----------+
    | fa83d69b155b11ef830a0800273b8748 | Persona-0.27675192176993185 |      1824.00 |   127.68 |  72.96 |   72.96 | 145.92 |  1951.68 |
    | fa84f712155b11ef830a0800273b8748 | Persona-0.2846200059024803  |      3312.00 |   231.84 | 132.48 |  132.48 | 264.96 |  3543.84 |
    | fa85b36c155b11ef830a0800273b8748 | Persona-0.9170130928205448  |      2103.00 |   147.21 |  84.12 |   84.12 | 168.24 |  2250.21 |
    | fa866844155b11ef830a0800273b8748 | Persona-0.8616689870708333  |      2154.00 |   150.78 |  86.16 |   86.16 | 172.32 |  2304.78 |
    | fa86fea4155b11ef830a0800273b8748 | Persona-0.1185931955637347  |      2798.00 |   195.86 | 111.92 |  111.92 | 223.84 |  2993.86 |
    | fa879804155b11ef830a0800273b8748 | Persona-0.4982501086762642  |      3381.00 |   236.67 | 135.24 |  135.24 | 270.48 |  3617.67 |
    | fa883e7d155b11ef830a0800273b8748 | Persona-0.3994135813782118  |      3050.00 |   213.50 | 122.00 |  122.00 | 244.00 |  3263.50 |
    | fa88b13f155b11ef830a0800273b8748 | Persona-0.10460734470245181 |      2716.00 |   190.12 | 108.64 |  108.64 | 217.28 |  2906.12 |
    | fa89202e155b11ef830a0800273b8748 | Persona-0.39281759354548307 |      2152.00 |   150.64 |  86.08 |   86.08 | 172.16 |  2302.64 |
    | fa897271155b11ef830a0800273b8748 | Persona-0.5220684516449166  |      2852.00 |   199.64 | 114.08 |  114.08 | 228.16 |  3051.64 |
    +----------------------------------+-----------------------------+--------------+----------+--------+---------+--------+----------+
    ```

- Cree una función para cada punto teniendo en cuenta que:
    - Función __subsidio_transporte__: El subsidio de transporte equivale al __7%__ al salario básico. _Actualiza el valor en la tabla_.
    - Función __salud__: La salud que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    - Función __pension__: La pensión que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    - Función __bono__: Un bono que corresponde al __8%__ al salario básico. _Actualiza el valor en la tabla_. 
    - Función __integral__: El salario integral es la ___suma del salario básico - salud - pension + bono + sub de transporte___. _Actualiza el valor en la tabla_.
    - ___Crea cada uno de las funciones anteriores para una persona en específico___.
    - El parámetro de entrada debe de ser un identificar de la persona.

## Soluciones

__Función para extraer porcentaje de un valor (Se utiliza en todas las funciones)__
```sql
DELIMITER //
DROP FUNCTION IF EXISTS extraer_porcentaje;
CREATE FUNCTION extraer_porcentaje(valor DECIMAL(10, 2), porcentaje INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE result DECIMAL(10, 2);
    SET result = valor * (porcentaje / 100);
    RETURN result;
END //
DELIMITER ;
```

### Función subsidio_transporte()

```sql
DELIMITER //
DROP FUNCTION IF EXISTS subsidio_transporte;
CREATE FUNCTION subsidio_transporte(id_persona VARCHAR(100), porcentaje INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE subsidio_actual DECIMAL(10, 2);
    DECLARE subsidio_nuevo DECIMAL(10, 2);

    SELECT subsidio INTO subsidio_actual FROM persona WHERE id = id_persona;
    SET subsidio_nuevo = subsidio_actual + extraer_porcentaje(subsidio_actual, porcentaje);
    UPDATE persona SET subsidio = subsidio_nuevo WHERE id = id_persona;
    RETURN subsidio_nuevo;
END //
DELIMITER ;
```

__Comprobación__:
```sql
-- Antes de aplicar la función
select subsidio from persona where id = 'fa83d69b155b11ef830a0800273b8748';
+----------+
| subsidio |
+----------+
|   127.68 |
+----------+

-- Llamada de la función
select subsidio_transporte('fa83d69b155b11ef830a0800273b8748', 7);
+------------------------------------------------------------+
| subsidio_transporte('fa83d69b155b11ef830a0800273b8748', 7) |
+------------------------------------------------------------+
|                                                     136.62 |
+------------------------------------------------------------+

-- Después de aplicar la función
select subsidio from persona where id = 'fa83d69b155b11ef830a0800273b8748';
+----------+
| subsidio |
+----------+
|   136.62 |
+----------+
```

### Función salud()
```sql
DELIMITER //
DROP FUNCTION IF EXISTS salud;
CREATE FUNCTION salud(id_persona VARCHAR(100), porcentaje INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE salud_actual DECIMAL(10, 2);
    DECLARE salud_nuevo DECIMAL(10, 2);

    SELECT salud INTO salud_actual FROM persona WHERE id = id_persona;
    SET salud_nuevo = salud_actual + extraer_porcentaje(salud_actual, porcentaje);
    UPDATE persona SET salud = salud_nuevo WHERE id = id_persona;
    RETURN salud_nuevo;
END //
DELIMITER ;
```

__Comprobación__:
```sql
-- Antes de aplicar la función
select salud from persona where id = 'fa83d69b155b11ef830a0800273b8748';
+-------+
| salud |
+-------+
| 72.96 |
+-------+

-- Llamada de la función
select salud('fa83d69b155b11ef830a0800273b8748', 4);
+----------------------------------------------+
| salud('fa83d69b155b11ef830a0800273b8748', 4) |
+----------------------------------------------+
|                                        75.88 |
+----------------------------------------------+

-- Después de aplicar la función
select subsidio from persona where id = 'fa83d69b155b11ef830a0800273b8748';
+-------+
| salud |
+-------+
| 75.88 |
+-------+
```

### Función pension()
```sql
DELIMITER //
DROP FUNCTION IF EXISTS pension;
CREATE FUNCTION pension(id_persona VARCHAR(100), porcentaje INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE pension_actual DECIMAL(10, 2);
    DECLARE pension_nuevo DECIMAL(10, 2);

    SELECT pension INTO pension_actual FROM persona WHERE id = id_persona;
    SET pension_nuevo = pension_actual + extraer_porcentaje(pension_actual, porcentaje);
    UPDATE persona SET pension = pension_nuevo WHERE id = id_persona;
    RETURN pension_nuevo;
END //
DELIMITER ;
```

__Comprobación__:
```sql
-- Antes de aplicar la función
select pension from persona where id = 'fa83d69b155b11ef830a0800273b8748';
+---------+
| pension |
+---------+
|   72.96 |
+---------+

-- Llamada de la función
select pension('fa83d69b155b11ef830a0800273b8748', 4);
+------------------------------------------------+
| pension('fa83d69b155b11ef830a0800273b8748', 4) |
+------------------------------------------------+
|                                          75.88 |
+------------------------------------------------+

-- Después de aplicar la función
select pension from persona where id = 'fa83d69b155b11ef830a0800273b8748';
+---------+
| pension |
+---------+
|   75.88 |
+---------+
```

### Función bono()
```sql
DELIMITER //
DROP FUNCTION IF EXISTS bono;
CREATE FUNCTION bono(id_persona VARCHAR(100), porcentaje INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE bono_actual DECIMAL(10, 2);
    DECLARE bono_nuevo DECIMAL(10, 2);

    SELECT bono INTO bono_actual FROM persona WHERE id = id_persona;
    SET bono_nuevo = bono_actual + extraer_porcentaje(bono_actual, porcentaje);
    UPDATE persona SET bono = bono_nuevo WHERE id = id_persona;
    RETURN bono_nuevo;
END //
DELIMITER ;
```

__Comprobación__:
```sql
-- Antes de aplicar la función
select bono from persona where id = 'fa83d69b155b11ef830a0800273b8748';
+--------+
| bono   |
+--------+
| 145.92 |
+--------+

-- Llamada de la función
select bono('fa83d69b155b11ef830a0800273b8748', 8);
+---------------------------------------------+
| bono('fa83d69b155b11ef830a0800273b8748', 8) |
+---------------------------------------------+
|                                      157.59 |
+---------------------------------------------+

-- Después de aplicar la función
select bono from persona where id = 'fa83d69b155b11ef830a0800273b8748';
+--------+
| bono   |
+--------+
| 157.59 |
+--------+
```

### Función integral()
```sql
DELIMITER //
DROP FUNCTION IF EXISTS integral;
CREATE FUNCTION integral(id_persona VARCHAR(100)) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE p_salario DECIMAL(10, 2);
    DECLARE p_subsidio DECIMAL(10, 2);
    DECLARE p_salud DECIMAL(10, 2);
    DECLARE p_pension DECIMAL(10, 2);
    DECLARE p_bono DECIMAL(10, 2);
    DECLARE integral_nuevo DECIMAL(10, 2);

    SELECT salario_base, subsidio, salud, pension, bono INTO p_salario, p_subsidio, p_salud, p_pension, p_bono FROM persona WHERE id = id_persona;
    SET integral_nuevo = p_salario - p_salud - p_pension + p_subsidio + p_bono;
    UPDATE persona SET integral = integral_nuevo WHERE id = id_persona;
    RETURN integral_nuevo;
END //
DELIMITER ;
```

__Comprobación__:
```sql
-- Antes de aplicar la función
select integral from persona where id = 'fa83d69b155b11ef830a0800273b8748';
+----------+
| integral |
+----------+
|  1951.68 |
+----------+

-- Llamada de la función
select integral('fa83d69b155b11ef830a0800273b8748');
+----------------------------------------------+
| integral('fa83d69b155b11ef830a0800273b8748') |
+----------------------------------------------+
|                                      1966.45 |
+----------------------------------------------+

/* Después de aplicar la función:
El cambio se debe a que es la misma persona a la que se le ha aplicado las funciones anteriores y,
al aumentar los valores de los otros campos, se debía actualizar este campo de "integral". */
select integral from persona where id = 'fa83d69b155b11ef830a0800273b8748';
+----------+
| integral |
+----------+
|  1966.45 |
+----------+
```
</div>
