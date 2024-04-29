PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Propietarios (
id integer primary key autoincrement,
nombre text not null,
apellido text not null,
dni text unique);
INSERT INTO Propietarios VALUES(1,'Juanito','Perez','12345678A');
INSERT INTO Propietarios VALUES(2,'Maria','Lopez','87654321B');
INSERT INTO Propietarios VALUES(3,'Carlos','Ruiz','11111111C');
INSERT INTO Propietarios VALUES(4,'Laura','Gomez','22222222D');
INSERT INTO Propietarios VALUES(5,'Pedro','Martinez','33333333E');
INSERT INTO Propietarios VALUES(6,'Ana','Fernandez','44444444F');
INSERT INTO Propietarios VALUES(7,'Diego','Gomez','55555555G');
INSERT INTO Propietarios VALUES(8,'Sofia','Torres','66666666H');
INSERT INTO Propietarios VALUES(9,'Javier','Leon','77777777I');
INSERT INTO Propietarios VALUES(10,'Lucia','Castillo','88888888J');
INSERT INTO Propietarios VALUES(11,'Luis','Gonzalez','99999999K');
INSERT INTO Propietarios VALUES(12,'Marta','Diaz','10101010L');
INSERT INTO Propietarios VALUES(13,'Victor','Vargas','11111112M');
INSERT INTO Propietarios VALUES(14,'Elena','Castro','12121212N');
INSERT INTO Propietarios VALUES(15,'Roberto','Blanco','13131313O');
INSERT INTO Propietarios VALUES(16,'Natalia','Paredes','14141414P');
INSERT INTO Propietarios VALUES(17,'Fernando','Herrera','15151515Q');
INSERT INTO Propietarios VALUES(18,'Clara','Soto','16161616R');
INSERT INTO Propietarios VALUES(19,'Sergio','Mendoza','17171717S');
INSERT INTO Propietarios VALUES(20,'Patricia','Navarro','18181818T');
CREATE TABLE Vehiculos (
id integer primary key autoincrement,
marca text not null,
modelo text not null,
anio integer not null,
id_propietario integer references Propietarios(id));
INSERT INTO Vehiculos VALUES(1,'Renault','Fiesta',2019,1);
INSERT INTO Vehiculos VALUES(2,'Toyota','Corolla',2018,2);
INSERT INTO Vehiculos VALUES(3,'Nissan','Micra',2022,3);
INSERT INTO Vehiculos VALUES(4,'Chevrolet','Spark',2017,4);
INSERT INTO Vehiculos VALUES(5,'Honda','Civic',2016,5);
INSERT INTO Vehiculos VALUES(6,'Ford','Mustang',2021,6);
INSERT INTO Vehiculos VALUES(7,'Toyota','RAV4',2019,7);
INSERT INTO Vehiculos VALUES(8,'Volkswagen','Golf',2020,8);
INSERT INTO Vehiculos VALUES(9,'Honda','CR-V',2018,9);
INSERT INTO Vehiculos VALUES(10,'Nissan','Micra',2017,10);
INSERT INTO Vehiculos VALUES(11,'Chevrolet','Malibu',2019,11);
INSERT INTO Vehiculos VALUES(12,'Toyota','Camry',2020,12);
INSERT INTO Vehiculos VALUES(13,'Honda','Accord',2018,13);
INSERT INTO Vehiculos VALUES(14,'Ford','Explorer',2021,14);
INSERT INTO Vehiculos VALUES(15,'Nissan','Micra',2017,15);
INSERT INTO Vehiculos VALUES(16,'Volkswagen','Jetta',2019,16);
INSERT INTO Vehiculos VALUES(17,'Chevrolet','Equinox',2018,17);
INSERT INTO Vehiculos VALUES(18,'Toyota','Highlander',2020,18);
INSERT INTO Vehiculos VALUES(19,'Honda','Odyssey',2016,19);
INSERT INTO Vehiculos VALUES(20,'Nissan','Micra',2019,20);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('Propietarios',20);
INSERT INTO sqlite_sequence VALUES('Vehiculos',20);
COMMIT;
