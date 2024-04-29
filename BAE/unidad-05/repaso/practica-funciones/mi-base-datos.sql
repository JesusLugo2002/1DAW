PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE empleados (
    codigo INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido TEXT,
    salario REAL
);
INSERT INTO empleados VALUES(1,'Juan','Pérez',50000.0);
INSERT INTO empleados VALUES(2,'María','López',60000.0);
INSERT INTO empleados VALUES(3,'Pedro','García',55000.0);
INSERT INTO empleados VALUES(4,'Ana','Martínez',70000.0);
INSERT INTO empleados VALUES(5,'Carlos','Rodríguez',48000.000000000000001);
INSERT INTO empleados VALUES(6,'Laura','Sánchez',75000.0);
INSERT INTO empleados VALUES(7,'José','Fernández',61999.999999999999998);
INSERT INTO empleados VALUES(8,'Sara','Gómez',58000.000000000000001);
INSERT INTO empleados VALUES(9,'Javier','Díaz',66999.999999999999998);
INSERT INTO empleados VALUES(10,'Carmen','Ruiz',53000.000000000000001);
COMMIT;
