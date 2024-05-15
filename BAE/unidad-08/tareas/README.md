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
        id VARCHAR(30) PRIMARY KEY AUTO_INCREMENT,
        nombre VARCHAR(50),
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
    DELIMITER //
    CREATE PROCEDURE generar_personas(IN cantidad_registros INT, prefix VARCHAR(30), salario_min INT, salario_max INT)
    BEGIN
        DECLARE counter INT DEFAULT 0;
        DECLARE salario DECIMAL(10, 2);
        DECLARE p_subsidio DECIMAL(10, 2);
        DECLARE p_salud DECIMAL(10, 2);
        DECLARE p_pension DECIMAL(10, 2);
        DECLARE p_bono DECIMAL(10, 2);
        DECLARE p_integral DECIMAL(10, 2);

        WHILE counter > cantidad_registros DO
            SET p_nombre = CONCAT(prefix, SUBSTRING_INDEX(UUID(), '-', -1));
            SET p_salario = FLOOR(RAND() * (salario_max - salario_min + 1) + salario_min)
            SET p_subsidio = p_salario * 0.07;
            SET p_salud = p_salario * 0.04;
            SET p_pension = p_salario * 0.04;
            SET p_bono = p_salario * 0.08;
            SET p_integral = p_salario - p_salud - p_pension + p_bono + p_subsidio;
            INSERT INTO persona (nombre, salario_base, subsidio, salud, pension, bono, integral) values (
                p_nombre, p_salario, p_subsidio, p_salud, p_pension, p_bono, p_integral
            );
            SET counter = counter + 1;
        END WHILE;
    END //
    DELIMITER ;
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



</div>
