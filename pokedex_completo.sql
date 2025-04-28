
CREATE DATABASE pokedex;
USE pokedex;
-- Table structure for `pokemon`
-- --------------------------------------------------------
-- DROP TABLE IF EXISTS `pokemon`;
-- --------------------------------------------------------

CREATE TABLE pokemon (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    type1 VARCHAR(20),
    type2 VARCHAR(20),
    generation INT,
    sprite_url VARCHAR(255)
);

INSERT INTO pokemon (id, name, type1, type2, generation, sprite_url)
VALUES (1, 'Bulbasaur', 'Grass', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png');
INSERT INTO pokemon (id, name, type1, type2, generation, sprite_url)
VALUES (2, 'Charmander', 'Fire', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png');
INSERT INTO pokemon (id, name, type1, type2, generation, sprite_url)
VALUES (3, 'Squirtle', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png');
INSERT INTO pokemon (id, name, type1, type2, generation, sprite_url)
VALUES (4, 'Pikachu', 'Electric', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png');
INSERT INTO pokemon (id, name, type1, type2, generation, sprite_url)
VALUES (5, 'Eevee', 'Normal', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png');



-- Crear tabla de tipos
CREATE TABLE IF NOT EXISTS tipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Insertar tipos básicos
INSERT INTO tipos (nombre, descripcion) VALUES
('Grass', 'Tipo planta, ataques basados en la naturaleza.'),
('Fire', 'Tipo fuego, ataques basados en calor y llamas.'),
('Water', 'Tipo agua, ataques basados en agua y hielo.'),
('Electric', 'Tipo eléctrico, ataques basados en electricidad.'),
('Normal', 'Tipo normal, ataques estándar.'),
('Flying', 'Tipo volador, ataques aéreos.'),
('Poison', 'Tipo veneno, ataques tóxicos.');

-- Crear tabla de habilidades
CREATE TABLE IF NOT EXISTS habilidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Insertar habilidades básicas
INSERT INTO habilidades (nombre, descripcion) VALUES
('Overgrow', 'Potencia los movimientos de tipo Planta en momentos críticos.'),
('Blaze', 'Potencia los movimientos de tipo Fuego en momentos críticos.'),
('Torrent', 'Potencia los movimientos de tipo Agua en momentos críticos.'),
('Static', 'Puede paralizar al contacto físico.'),
('Run Away', 'Permite huir de los combates contra Pokémon salvajes.');

-- Crear nueva tabla de Pokémon mejorada
DROP TABLE IF EXISTS pokemon;

CREATE TABLE IF NOT EXISTS pokemon (
    id INT PRIMARY KEY,
    numero_pokedex INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    sprite_url VARCHAR(255),
    type1 VARCHAR(50),
    type2 VARCHAR(50),
    generation INT,
    habilidad_id INT,
    FOREIGN KEY (type1) REFERENCES tipos(nombre),
    FOREIGN KEY (type2) REFERENCES tipos(nombre),
    FOREIGN KEY (habilidad_id) REFERENCES habilidades(id)
);

-- Insertar Pokémon de ejemplo
INSERT INTO pokemon (id, numero_pokedex, name, sprite_url, type1, type2, generation, habilidad_id) VALUES
(1001, 1, 'Bulbasaur', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png', 'Grass', 'Poison', 1, 1),
(1002, 4, 'Charmander', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png', 'Fire', NULL, 1, 2),
(1003, 7, 'Squirtle', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png', 'Water', NULL, 1, 3),
(1004, 25, 'Pikachu', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png', 'Electric', NULL, 1, 4),
(1005, 133, 'Eevee', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png', 'Normal', NULL, 1, 5);
