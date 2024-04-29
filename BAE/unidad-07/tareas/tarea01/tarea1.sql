drop database if exists tarea1;
create database tarea1;

use tarea1;

drop table if exists alumno;
create table alumno (
    numero_inscripcion int,
    anio_inscripcion int,
    nombre varchar(50),
    dni varchar(20),
    domicilio varchar(50),
    ciudad varchar(50),
    provincia varchar(50),
    primary key(numero_inscripcion, anio_inscripcion)
);

create unique index idx_dni on alumno(dni); 
create index idx_ciudad_provincia on alumno(ciudad, provincia);