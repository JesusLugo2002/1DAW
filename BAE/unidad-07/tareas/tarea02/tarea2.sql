create database tarea2;
use tarea2;

drop table if exists cliente;
create table cliente (
    documento char(8) not null,
    nombre varchar(30) not null,
    domicilio varchar(30),
    ciudad varchar(20),
    provincia varchar(20),
    telefono varchar(11)
);