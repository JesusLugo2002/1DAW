# Unidad 08 - Programación en MySQL

<div align=center>
    <img src="../../images/bg1.gif" alt="bg" width="50%">
</div>

## Índice

- [Introducción](#introducción)
- [Procedimientos](#procedimientos)
- [Funciones](#funciones)
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

## Procedimientos

Un procedimiento almacenado es un __conjunto de instrucciones SQL__ que se almacena asociado a una base de datos. Es un objeto que se crea con la sentencia CREATE PROCEDURE y se invoca con la sentencia __CALL__. Un procedimiento puede tener ___cero o muchos parámetros de entrada___ y ___cero o muchos parámetros de salida___.

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
CALL procedure_name()
```

## Funciones

## Cursores

## Aleatoriedad

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