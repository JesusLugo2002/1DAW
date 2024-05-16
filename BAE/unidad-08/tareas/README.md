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
    +----------------------------------+-------------------------------+--------------+----------+--------+---------+--------+----------+
    | id                               | nombre                        | salario_base | subsidio | salud  | pension | bono   | integral |
    +----------------------------------+-------------------------------+--------------+----------+--------+---------+--------+----------+
    | d42bd34313b811efb49e080027077231 | Persona-0.3700622183923258    |      3503.00 |   245.21 | 140.12 |  140.12 | 280.24 |  3748.21 |
    | d42d6e5213b811efb49e080027077231 | Persona-0.0024544503562659494 |      2725.00 |   190.75 | 109.00 |  109.00 | 218.00 |  2915.75 |
    | d42ed1d213b811efb49e080027077231 | Persona-0.716074867840926     |      3850.00 |   269.50 | 154.00 |  154.00 | 308.00 |  4119.50 |
    | d42fe51813b811efb49e080027077231 | Persona-0.5833327123740061    |      1417.00 |    99.19 |  56.68 |   56.68 | 113.36 |  1516.19 |
    | d430b11b13b811efb49e080027077231 | Persona-0.6386480011405871    |      3889.00 |   272.23 | 155.56 |  155.56 | 311.12 |  4161.23 |
    | d431616913b811efb49e080027077231 | Persona-0.8843178869079034    |      2716.00 |   190.12 | 108.64 |  108.64 | 217.28 |  2906.12 |
    | d432191b13b811efb49e080027077231 | Persona-0.05420811758768569   |      3011.00 |   210.77 | 120.44 |  120.44 | 240.88 |  3221.77 |
    | d432c9a813b811efb49e080027077231 | Persona-0.07109352859770277   |      2363.00 |   165.41 |  94.52 |   94.52 | 189.04 |  2528.41 |
    | d4334c8813b811efb49e080027077231 | Persona-0.8629042616699862    |      1392.00 |    97.44 |  55.68 |   55.68 | 111.36 |  1489.44 |
    | d434130b13b811efb49e080027077231 | Persona-0.7553394909532177    |      2797.00 |   195.79 | 111.88 |  111.88 | 223.76 |  2992.79 |
    +----------------------------------+-------------------------------+--------------+----------+--------+---------+--------+----------+
    ```

- Cree una función para cada punto teniendo en cuenta que:
    - Función __subsidio_transporte__: El subsidio de transporte equivale al __7%__ al salario básico. _Actualiza el valor en la tabla_.
    - Función __salud__: La salud que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    - Función __pension__: La pensión que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    - Función __bono__: Un bono que corresponde al __8%__ al salario básico. _Actualiza el valor en la tabla_. 
    - Función __integral__: El salario integral es la ___suma del salario básico - salud - pension + bono + sub de transporte___. _Actualiza el valor en la tabla_.
    - ___Crea cada uno de las funciones anteriores para una persona en específico___.
    - El parámetro de entrada debe de ser un identificar de la persona.

__Solución:__
```sql
DELIMITER //
DROP FUNCTION IF EXISTS extraer_porcentaje;
CREATE FUNCTION extraer_porcentaje(valor DECIMAL(10, 2), porcentaje INT) RETURNS DECIMAL(10, 2)
BEGIN

END //
DELIMITER ;
```



</div>
