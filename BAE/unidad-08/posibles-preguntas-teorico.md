# Posibles preguntas para un teórico

<div align=center>
    <img src="../../images/bg1.gif" alt="bg" width="50%">
</div>

## Aquí las preguntas mi rey/reina

#### ¿Qué es un procedimiento almacenado en MySQL?
Es un objeto que se crea con la sentencia CREATE PROCEDURE y se invoca con la sentencia CALL. Un procedimiento puede tener cero o muchos parámetros de entrada y cero o muchos parámetros de salida.

#### ¿Cómo se crea un procedimiento almacenado?
Con CREATE PROCEDURE, sus parámetros de entrada/salida y sus instrucciones SQL.

#### ¿Cuál es la sintaxis para definir un procedimiento almacenado?
```sql
CREATE
    [DEFINER = { user | CURRENT_USER }]
    PROCEDURE sp_name ([proc_parameter[,...]])
    [characteristic ...] routine_body
```

#### ¿Qué son los parámetros de entrada en un procedimiento?
Los argumentos que se les pasa dentro de los paréntesis para funcionar.
```sql
CALL sumar(AQUI LOS PARAMETROS)
```
#### ¿Cómo se invoca un procedimiento almacenado?
Con `CALL procedure_name()`

#### ¿Qué tipos de variables se pueden declarar en un procedimiento?
- Variables locales: declaradas con `DECLARE`.
- Variables definidas por usuario en el ámbito de la sesión: declaradas con `SET @variables` y su validez perdura con la duración de la sesión actual.
- Variables de sistema: pueden ser globales o de sesión y son utilizadas por la config. de MySQL

#### ¿Qué es una función almacenada en MySQL?
Una función almacenada es un conjunto de instrucciones SQL que se almacena asociado a una base de datos. Es un objeto que se crea con la sentencia CREATE FUNCTION y se invoca con la sentencia SELECT o dentro de una expresión. Una función puede tener cero o muchos parámetros de entrada y siempre devuelve un valor, asociado al nombre de la función.

#### ¿Cómo se crea una función almacenada?
```sql
CREATE
    [DEFINER = { user | CURRENT_USER }]
    FUNCTION sp_name ([func_parameter[,...]])
    RETURNS type
    [characteristic ...] routine_body
```
#### ¿Cuáles son los parámetros de entrada en una función?
En una función __TODOS LOS PARAMETROS SON DE ENTRADA__, por lo que no es necesario definir __IN__ como en los procedimientos.

#### ¿Qué es un trigger en MySQL?
Un trigger o disparador es una regla que se asocia a una tabla. Mediante esta regla, se ejecutan una serie de instrucciones cuando se producen ciertos eventos sobre una tabla. Los eventos son: INSERT, UPDATE o DELETE.

#### ¿Cómo se crea un trigger?
```sql
DELIMITER $$
CREATE TRIGGER nombre_trigger
AFTER INSERT ON nombre_tabla
FOR EACH ROW
BEGIN
//Instrucciones SQL
END;$$
```

#### ¿En qué situaciones se activa un trigger?
En eventos de INSERT, UPDATE o DELETE.

#### ¿Qué son los cursores en MySQL?
En base de datos un cursor es un mecanismo el cual nos permite procesar fila por fila el resultado de una consulta.

#### ¿Cuáles son las operaciones básicas con cursores?
La lectura de la información fila por fila.

#### ¿Cuál es la diferencia entre un procedimiento y una función?
- Un procedimiento __no nos regresa un valor__. En su lugar es llamado con una declaración __CALL__ para realizar una operación como __modificar una tabla__ o __procesar la recuperación de registros.__
-  Una función es llamada __dentro de una expresión y nos regresa un valor único__ directamente al que lo llama para ser utilizado en la expresión. 
- No se puede invocar una función con una instrucción CALL, ni puedes invocar un procedimiento en una expresión.

#### ¿Cómo se declara una variable local en un procedimiento?
Con `DECLARE variable_name variable_type`.

#### ¿Cómo se invoca un procedimiento almacenado utilizando la sentencia CALL?
Con `CALL procedure_name();`

#### ¿Cuáles son los tipos de variables que se pueden declarar en un procedimiento?
Variables locales, de sesión y de sistema
