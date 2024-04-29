-- Creacion de tablas
CREATE TABLE Tipo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

CREATE TABLE Pokemon (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    id_tipo INTEGER,
    nivel INTEGER,
    FOREIGN KEY (id_tipo) REFERENCES Tipo(id)
);

-- inserts en las tablas

INSERT INTO Tipo (nombre) VALUES 
('Agua'),
('Fuego'),
('Planta'),
('Eléctrico'),
('Tierra');

INSERT INTO Pokemon (nombre, id_tipo, nivel) VALUES 
('Bulbasaur', 3, 10),
('Charmander', 2, 12),
('Squirtle', 1, 8),
('Pikachu', 4, 15),
('Geodude', 5, 11),
('Vaporeon', 1, 25),
('Flareon', 2, 27),
('Ivysaur', 3, 18),
('Jolteon', 4, 22),
('Cubone', 5, 14),
('Gyarados', 1, 30),
('Arcanine', 2, 35),
('Exeggutor', 3, 40),
('Raichu', 4, 38),
('Sandslash', 5, 33),
('Venusaur', 3, 45),
('Charizard', 2, 50),
('Blastoise', 1, 55),
('Electabuzz', 4, 48),
('Rhydon', 5, 52),
('Dragonite', 2, 60),
('Flareon', 2, 65),
('Venusaur', 3, 70),
('Zapdos', 4, 75),
('Rhydon', 5, 80);

