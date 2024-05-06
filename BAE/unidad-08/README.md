# Unidad 08 - Programación en MySQL

<div align=center>
    <img src="../../images/bg1.gif" alt="bg" width="50%">
</div>

## Índice

- [Introducción](#introducción)
- [Procedimientos](#procedimientos)
- [Funciones](#funciones)
- [Cursores](#cursores)
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

## Funciones

## Cursores

## Triggers