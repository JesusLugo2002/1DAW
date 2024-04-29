create database Base_Indices;
use Base_Indices;

drop table if exists MOVIMIENTO;
create table MOVIMIENTO (
    Identificador int auto_increment primary key,
    Articulo varchar(50) not null,
    Fecha date not null,
    Cantidad int not null
);
