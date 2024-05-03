# Tarea 1 - Funciones y procedimientos

<div align=center>

![img](https://media.tenor.com/eFeqNqXZS0IAAAAM/cc.gif)

_Pez de la buena suerte, pero segundo_

</div>

## Creación de la base de datos y tablas

Se realiza con el siguiente comando:
```sql
CREATE DATABASE IF NOT EXISTS SimpleDB;

USE SimpleDB;

CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);
```

## Inserción de datos

Ahora se realiza la inserción de datos de prueba con:
```sql
INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');

INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);
```

## Procedimientos almacenados

Se crean los siguientes procedimientos...

### Procedimiento para insertar un nuevo usuario

```sql
delimiter $$
drop procedure if exists create_new_user$$
create procedure create_new_user
(in username varchar(50), in email varchar(100))
BEGIN
    insert into Users(UserName, Email) values (username, email);
END$$

delimiter ;
```

__Comprobación del funcionamiento:__
```sql
call create_new_user('UserTest1', 'test1@gmail.com');
-- Query OK, 1 row affected (0,02 sec)

select * from Users;
/*
+--------+-----------+-------------------+
| UserID | UserName  | Email             |
+--------+-----------+-------------------+
|      1 | Juan      | juan@example.com  |
|      2 | María     | maria@example.com |
|      3 | Pedro     | pedro@example.com |
|      4 | Juanito   | hola@yahoo        |
|      5 | UserTest1 | test1@gmail.com   |
+--------+-----------+-------------------+
*/
```

### Procedimiento para actualizar el nombre de un usuario

```sql
delimiter $$
drop procedure if exists update_username$$
create procedure update_username
(in user_id integer, in new_username varchar(100))
BEGIN
    update Users set UserName = new_username where UserId = user_id;
END$$

delimiter ;
```

__Comprobación del funcionamiento:__

```sql
select * from Users where UserId = 3;
/*
+--------+----------+-------------------+
| UserID | UserName | Email             |
+--------+----------+-------------------+
|      3 | Pedro    | pedro@example.com |
+--------+----------+-------------------+
*/

call update_username(3, 'Pepito');
-- Query OK, 1 row affected (0,01 sec)

select * from Users where UserId = 3;
/*
+--------+----------+-------------------+
| UserID | UserName | Email             |
+--------+----------+-------------------+
|      3 | Pepito   | pedro@example.com |
+--------+----------+-------------------+
*/
```

## Funciones 

Se crean las siguientes funciones...

### Función para calcular el precio total de un conjunto de productos

```sql
delimiter $$

drop function if exists get_products_total$$
create function get_products_total() 
returns float deterministic
BEGIN
    declare result float;
    select sum(Price) from Products into result;
    return result;
END$$

delimiter ;
```

__Comprobación del funcionamiento:__

```sql
select get_products_total();
/*
+----------------------+
| get_products_total() |
+----------------------+
|                47.24 |
+----------------------+
*/

select sum(Price) from Products;
/*
+------------+
| sum(Price) |
+------------+
|      47.24 |
+------------+
*/
```

### Función para contar el número de usuarios

```sql
delimiter $$

drop function if exists get_users_count$$
create function get_users_count() 
returns integer deterministic
BEGIN
    declare result integer;
    select count(*) From Users into result;
    return result;
END$$

delimiter ;
```

__Comprobación del funcionamiento:__

```sql
select get_users_count();
/*
+-------------------+
| get_users_count() |
+-------------------+
|                 6 |
+-------------------+
*/

select * from Users;
/*
+--------+-----------+-------------------+
| UserID | UserName  | Email             |
+--------+-----------+-------------------+
|      1 | Juan      | juan@example.com  |
|      2 | María     | maria@example.com |
|      3 | Pepito    | pedro@example.com |
|      4 | Juanito   | hola@yahoo        |
|      5 | UserTest1 | test1@gmail.com   |
|      6 | UserTest2 | test2@hotmail.com |
+--------+-----------+-------------------+
*/
```