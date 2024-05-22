# Unidad 08 - Programación en MySQL

<div align=center>
    <img src="../../images/bg1.gif" alt="bg" width="50%">
</div>

## Índice

- [Introducción](#introducción)
- [Procedimientos](#procedimientos)
- [Funciones](#funciones)
- [Diferencias entre procedimientos y funciones](#diferencias-entre-procedimientos-y-funciones)
- [Cursores](#cursores)
- [Aleatoriedad](#aleatoriedad)
- [Triggers](#triggers)

## Introducción

Aquí toda la mondá de BAE y la programación en MySql. A continuación, cuestiones básicas de esta mamada:

- __Declaración de variables:__
```sql
DECLARE @nombre_de_variable tipo_de_dato;
SET @nombre_de_variable = valor;
```

- __Asignación a variables:__
```sql
SELECT campo1, campo2, . . . INTO variable1, variable2, . . . 
FROM nombre_tabla WHERE . . .
```

- __Valores por defecto a variable:__
```sql
DECLARE nombre_variable tipo_variable [DEFAULT valor];
```

---

- __IF-ELSE:__
```sql
IF condicion THEN
    sentencias;
[ELSEIF condicion2 THEN
    sentencias;] . . .
[ELSE 
    sentencias;]
END IF
```

- __CASE:__
```sql
CASE variable
    WHEN valor1 THEN
        sentencias;
    [WHEN valor2 THEN
        sentencias;] . . .
    [ELSE 
        sentencias;]
END CASE
```

---

- __LOOP:__
...

## Procedimientos

Un procedimiento almacenado es un __conjunto de instrucciones SQL__ que se almacena asociado a una base de datos. Es un objeto que se crea con la sentencia CREATE PROCEDURE y se invoca con la sentencia __CALL__. Un procedimiento puede tener ___cero o muchos parámetros de entrada__ y __cero o muchos parámetros de salida__.

- __Creación de procedimientos:__
```sql
DELIMITER //
CREATE PROCEDURE procedure_name([IN|OUT|INOUT] param_name param_type...)
BEGIN
    -- Instrucciones SQL
END //
DELIMITER ;
```

- __Eliminación de procedimientos:__
```sql
DROP PROCEDURE [IF EXISTS] procedure_name;
```

- __Llamada de procedimientos:__
```sql
CALL procedure_name(parametros)
```

## Funciones

Las funciones son similares a los procedimientos pero con la principal diferencia de que __siempre devuelven un resultado__. Estos se llaman tanto en el SELECT como en cualquier otro cuerpo de instrucciones SQL (como dentro de otras funciones, en procedimientos, triggers...). ¿Cómo se usa esta mondá? Mira acá mi parcero:

- __Creación de una función__:
```sql
DELIMITER //
CREATE FUNCTION function_name(parameter_name parameter_type,...)
RETURNS result_type CARACTERISTICA
BEGIN
    -- Instrucciones SQL
    -- ...
    -- ...
    -- ...
    RETURN result
END //
DELIMTER ;
```
> ![NOTE]
> FIJO ESTA MONDÁ ENTRA EN EL TEORICO, PAREN BOLAS A LO SIGUIENTE.

Donde dice __CARACTERISTICA__ se debe reemplazar con una característica de función que MySql tiene definida; estas son:
- __DETERMINISTIC__: Indica que la función siempre devuelve el mismo resultado cuando se utilizan los mismos parámetros de entrada.
- __NOT DETERMINISTIC__: Indica que la función no siempre devuelve el mismo resultado, aunque se utilicen los mismos parámetros de entrada. Esta es la opción que se selecciona por defecto cuando no se indica una característica de forma explícita.
- __CONTAINS SQL__: Indica que la función contiene sentencias SQL, pero no contiene sentencias de manipulación de datos. Algunos ejemplos de sentencias SQL que pueden aparecer en este caso son operaciones con variables _(Ej: SET @x = 1)_ o uso de funciones de MySQL _(Ej: SELECT NOW();)_ entre otras. Pero en ningún caso aparecerán sentencias de escritura o lectura de datos.
- __NO SQL__: Indica que la función no contiene sentencias SQL.
- __READS SQL DATA__: Indica que la función no modifica los datos de la base de datos y que contiene sentencias de lectura de datos, como la sentencia SELECT.
- __MODIFIES SQL DATA__: Indica que la función sí modifica los datos de la base de datos y que contiene sentencias como _INSERT, UPDATE o DELETE_.

__Para poder crear una función en MySQL es necesario indicar al menos una de estas tres características:__
- DETERMINISTIC
- NO SQL
- READS SQL DATA

__Un ejemplo de una función creada es:__
```sql
DELIMITER //
CREATE FUNCTION holaMundo() RETURNS VARCHAR(20)
BEGIN
    RETURN ‘HolaMundo!!’;
END //
DELIMITER ;
```

- __Eliminación de funciones__:
```sql
DROP FUNCTION IF EXISTS function_name;
```

## Diferencias entre procedimientos y funciones

Como sé que el Joatham le excita hacer esta pregunta, dejo aquí las diferencias principales que hay entre los procedimientos y las funciones:

- Un procedimiento __no nos regresa un valor__. En su lugar es llamado con una declaración __CALL__ para realizar una operación como __modificar una tabla__ o __procesar la recuperación de registros.__
-  Una función es llamada __dentro de una expresión y nos regresa un valor único__ directamente al que lo llama para ser utilizado en la expresión. 
- No se puede invocar una función con una instrucción CALL, ni puedes invocar un procedimiento en una expresión.

## Cursores

Un cursor es, según mis palabras, un cosito que se encarga de recorrer las filas de una tabla para ir cogiendo información de la fila donde se encuentre y enviartela para que tú hagas con ella lo que se te de la gana.
En palabras de Joatham:
> En base de datos un Cursor es un mecanismo el cual nos permite procesar fila por fila el resultado de una consulta.

- __Creación de cursor__:
```sql
DECLARE done INT DEFAULT FALSE; -- Variable necesaria para indicarle al cursor que ya se terminó.
... -- En los ... se supone que van el resto de declaraciones de variables usadas en la 
... -- función/procedimiento.
...
DECLARE cursor_name CURSOR FOR SELECT "TODA LA VAINA DE UN SELECT COMPLICADO..."; -- El cursor mismo
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; -- Captura que le dice al cursor "para mi niño"
```

Al crear un cursor se debe tomar en cuenta:

1. Indicar que para salir del bucle vamos a 'capturar' una excepción de 'no hay más datos'. La definición de dicha captura tienen que ir después de DECLARE. 
2. La declaración del cursor tiene que ir después de la declaración de las variables y condiciones.
3. En la sentencia SELECT seleccionaremos las columnas que queremos guardar 'por cada fila' al recorrer el cursor.
4. Dentro de un procedimiento, trigger o función podemos tener varios cursores, pero todos ellos deben de tener un nombre diferente.

__Apertura de un cursor:__
```sql
OPEN nombre_cursor;
```

__Lectura del cursor:__
Esto se realiza con la orden __FETCH__ que permite guardar la información de una fila en variables locales y pasa a la siguiente fila del conjunto de resultados. La lectura va en un bucle que se ejecuta hasta que se terminan de leer todas las filas.

```sql
FETCH nombre_cursor INTO variable1[,variable2,...];
```

- En la parte INTO deben ir tantas variables como columnas tengamos en la sentencia SELECT.
- Cada variable guardará el dato de la columna que venga en el SELECT, de tal forma que la primera variable guardará el dato de la primera columna, la segunda variable, el dato de la segunda columna y así sucesivamente
- Cada variable debe estar definida con el mismo tipo de dato que la columna a la que está asociada.

__Cierre del cursor:__
```sql
CLOSE nombre_cursor;
```

Algunas caracteristicas de los cursores son:
- __Son de solo lectura__: no sirven para modificar los datos de esa tabla.
- __Son de acceso secuencial__: o sea, leen las filas de la tabla una a una, no pueden hacer saltos.
- Pueden crearse dentro de un procedimiento, de una función o de un trigger.

## Aleatoriedad

- __RAND()__. Esta función devuelve un valor de punto flotante aleatorio entre 0 y 1. Se puede usar para generar valores aleatorios en general.

```sql
SELECT RAND(); -- Genera un número aleatorio entre 0 y 1
-- Ejemplo de salida: 0.712345
```

- __RAND(N)__. Similar a RAND(), pero toma una semilla N como argumento para generar números pseudo-aleatorios.

```sql
SELECT RAND(1); -- Genera un número aleatorio basado en la semilla 1
-- Ejemplo de salida: 0.659217
```

- __RAND() con ORDER BY__. Si necesitas una lista de filas en un orden aleatorio, puedes usar RAND() junto con ORDER BY.

```sql
SELECT * FROM tabla ORDER BY RAND();
-- SELECT * FROM tabla ORDER BY RAND(); -- Ejemplo de salida: Filas de la tabla en un orden aleatorio
```

- __FLOOR(RAND() * (max - min + 1)) + min__. Esta fórmula te permite generar un número entero aleatorio dentro de un rango específico.

```sql
SELECT FLOOR(RAND() * (100 - 1 + 1)) + 1; -- Genera un número aleatorio entre 1 y 100
-- Ejemplo de salida: 42
```

- __UUID()__. Esta función genera un identificador único universal (UUID) en formato hexadecimal.

```sql
SELECT UUID(); -- Genera un UUID único
-- Ejemplo de salida: 123e4567-e89b-12d3-a456-426614174000
```

- __CONCAT() con RAND()__. Puedes usar CONCAT() junto con RAND() para generar datos aleatorios combinando valores.

```sql
SELECT CONCAT('Usuario', RAND()); -- Genera un nombre de usuario aleatorio
-- Ejemplo de salida: Usuario0.123456
```

- __SUBSTRING_INDEX(UUID(), '-', -1)__. Esta expresión toma el UUID generado por UUID() y extrae la última parte, que es la parte aleatoria. Esto puede ser útil si necesitas solo la parte aleatoria de un UUID.

```sql
SELECT SUBSTRING_INDEX(UUID(), '-', -1); -- Extrae la parte aleatoria de un UUID
-- Ejemplo de salida: 426614174000
```

## Triggers

___Un trigger o disparador___ es una _regla que se asocia a una tabla_. Mediante esta __regla__, _se ejecutan una serie de instrucciones cuando se producen ciertos eventos sobre una tabla_. Los eventos son: __INSERT, UPDATE o DELETE__.

- __Creación de triggers__:
```sql
DELIMITER $$
CREATE TRIGGER trigger_name
[AFTER|BEFORE] [INSERT|UPDATE|DELETE] ON table_name
FOR EACH ROW
BEGIN
    -- Instrucciones SQL
END;$$
```

- __Eliminación de triggers__:
```sql
DROP TRIGGER trigger_name;
```

---

- __Variables NEW y OLD__: Hacen referencia a los valores aportados en las instrucciones. _NEW_ está disponible para los __INSERT__ y __UPDATE__, mientras que _OLD_ solo está disponible para los __DELETE__.
A continuación, un ejemplo con un trigger que comprueba si la edad insertada es negativa para hacerle un _SET = 0_.
```sql
DELIMITER $$
CREATE TRIGGER comprobar_edad
AFTER INSERT ON cliente
FOR EACH ROW 
BEGIN
    IF NEW.edad<0
      THEN SET NEW.edad = 0;
    END IF; 
END; $$
DELIMITER ;
```

Otro ejemplo es el de la creación simultanea de un histórico en base a las inserciones en una tabla __Producto__:
```sql
DELIMITER $$
CREATE TRIGGER trigger_producto_historico 
AFTER INSERT ON producto
FOR EACH ROW
BEGIN 
   INSERT INTO producto_historico(id, descripcion, precio)
   VALUES (NEW.id, NEW.descripcion, NEW.precio, CURDATE());
END; $$
```