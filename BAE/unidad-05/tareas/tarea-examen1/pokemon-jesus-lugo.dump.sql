PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Tipo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);
INSERT INTO Tipo VALUES(1,'Agua');
INSERT INTO Tipo VALUES(2,'Fuego');
INSERT INTO Tipo VALUES(3,'Planta');
INSERT INTO Tipo VALUES(4,'Eléctrico');
INSERT INTO Tipo VALUES(5,'Tierra');
INSERT INTO Tipo VALUES(6,'Eléctrico/Rojo');
INSERT INTO Tipo VALUES(7,'Eléctrico/Azul');
CREATE TABLE Pokemon (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    id_tipo INTEGER,
    nivel INTEGER,
    FOREIGN KEY (id_tipo) REFERENCES Tipo(id)
);
INSERT INTO Pokemon VALUES(2,'Charmander',2,12);
INSERT INTO Pokemon VALUES(3,'Squirtle',1,18);
INSERT INTO Pokemon VALUES(4,'Pikachu',7,15);
INSERT INTO Pokemon VALUES(5,'Geodude',5,11);
INSERT INTO Pokemon VALUES(6,'Vaporeon',1,35);
INSERT INTO Pokemon VALUES(7,'Flareon',2,27);
INSERT INTO Pokemon VALUES(9,'Jolteon',4,22);
INSERT INTO Pokemon VALUES(10,'Cubone',5,14);
INSERT INTO Pokemon VALUES(12,'Arcanine',2,35);
INSERT INTO Pokemon VALUES(14,'Raichu',4,38);
INSERT INTO Pokemon VALUES(15,'Sandslash',5,33);
INSERT INTO Pokemon VALUES(17,'Charizard',2,50);
INSERT INTO Pokemon VALUES(18,'Blastoise',1,65);
INSERT INTO Pokemon VALUES(19,'Electabuzz',4,48);
INSERT INTO Pokemon VALUES(20,'Rhydon',5,52);
INSERT INTO Pokemon VALUES(21,'Dragonite',2,60);
INSERT INTO Pokemon VALUES(22,'Flareon',2,65);
INSERT INTO Pokemon VALUES(24,'Zapdos',4,75);
INSERT INTO Pokemon VALUES(25,'Rhydon',5,80);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('Tipo',7);
INSERT INTO sqlite_sequence VALUES('Pokemon',25);
COMMIT;
