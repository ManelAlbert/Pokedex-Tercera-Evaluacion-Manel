CREATE USER IF NOT EXISTS 'manel'@'localhost' IDENTIFIED BY '1234-Abcd';
GRANT ALL PRIVILEGES ON *.* TO 'manel'@'localhost' WITH GRANT OPTION;

CREATE DATABASE IF NOT EXISTS `pokedex`;
USE `pokedex`;
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2025 a las 19:14:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pokedex`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades`
--

CREATE TABLE `habilidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habilidades`
--

INSERT INTO `habilidades` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Overgrow', 'Potencia los movimientos de tipo Planta en momentos críticos.'),
(2, 'Blaze', 'Potencia los movimientos de tipo Fuego en momentos críticos.'),
(3, 'Torrent', 'Potencia los movimientos de tipo Agua en momentos críticos.'),
(4, 'Static', 'Puede paralizar al contacto físico.'),
(5, 'Run Away', 'Permite huir de los combates contra Pokémon salvajes.'),
(6, 'Steadfast', 'Aumenta la Velocidad si el Pokémon retrocede.'),
(7, 'Levitate', 'Inmunidad a ataques de tipo Tierra.'),
(8, 'Guts', 'Aumenta el Ataque si sufre un problema de estado.'),
(9, 'Cursed Body', 'Puede inutilizar el movimiento del rival al contacto.'),
(10, 'Inner Focus', 'Evita el retroceso.'),
(11, 'No Guard', 'Todos los movimientos usados por o contra este Pokémon nunca fallan.'),
(12, 'Adaptability', 'Potencia los movimientos del mismo tipo que el Pokémon.'),
(13, 'Cute Charm', 'Puede enamorar al rival al contacto.'),
(14, 'Intimidate', 'Baja el Ataque del rival al entrar en combate.'),
(15, 'Iron Fist', 'Potencia los movimientos de puño.'),
(16, 'Illuminate', 'Aumenta la probabilidad de encontrar Pokémon salvajes.'),
(17, 'Synchronize', 'Transfiere problemas de estado al rival.'),
(18, 'Pressure', 'El rival gasta el doble de PP.'),
(19, 'Refrigerate', 'Convierte los movimientos de tipo Normal en tipo Hielo.'),
(20, 'Sheer Force', 'Aumenta la potencia de los movimientos con efectos secundarios, pero elimina dichos efectos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL,
  `numero_pokedex` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sprite_url` varchar(255) DEFAULT NULL,
  `type1` varchar(50) DEFAULT NULL,
  `type2` varchar(50) DEFAULT NULL,
  `generation` int(11) DEFAULT NULL,
  `habilidad_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokemon`
--

INSERT INTO `pokemon` (`id`, `numero_pokedex`, `name`, `sprite_url`, `type1`, `type2`, `generation`, `habilidad_id`) VALUES
(1001, 1, 'Bulbasaur', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png', 'Grass', 'Poison', 1, 1),
(1002, 4, 'Charmander', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png', 'Fire', NULL, 1, 2),
(1003, 7, 'Squirtle', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png', 'Water', NULL, 1, 3),
(1004, 25, 'Pikachu', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png', 'Electric', NULL, 1, 4),
(1005, 133, 'Eevee', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png', 'Normal', NULL, 1, 5),
(2001, 152, 'Chikorita', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/152.png', 'Grass', NULL, 2, 1),
(2002, 155, 'Cyndaquil', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/155.png', 'Fire', NULL, 2, 2),
(2003, 158, 'Totodile', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/158.png', 'Water', NULL, 2, 3),
(2004, 252, 'Treecko', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/252.png', 'Grass', NULL, 3, 1),
(2005, 255, 'Torchic', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/255.png', 'Fire', NULL, 3, 2),
(2006, 258, 'Mudkip', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/258.png', 'Water', NULL, 3, 3),
(2007, 387, 'Turtwig', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/387.png', 'Grass', NULL, 4, 1),
(2008, 390, 'Chimchar', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/390.png', 'Fire', NULL, 4, 2),
(2009, 393, 'Piplup', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/393.png', 'Water', NULL, 4, 3),
(2010, 495, 'Snivy', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/495.png', 'Grass', NULL, 5, 1),
(2011, 498, 'Tepig', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/498.png', 'Fire', NULL, 5, 2),
(2012, 501, 'Oshawott', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/501.png', 'Water', NULL, 5, 3),
(2013, 650, 'Chespin', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/650.png', 'Grass', NULL, 6, 1),
(2014, 653, 'Fennekin', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/653.png', 'Fire', NULL, 6, 2),
(2015, 656, 'Froakie', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/656.png', 'Water', NULL, 6, 3),
(2016, 722, 'Rowlet', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/722.png', 'Grass', 'Flying', 7, 1),
(2017, 725, 'Litten', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/725.png', 'Fire', NULL, 7, 2),
(2018, 728, 'Popplio', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/728.png', 'Water', NULL, 7, 3),
(2019, 810, 'Grookey', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/810.png', 'Grass', NULL, 8, 1),
(2020, 813, 'Scorbunny', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/813.png', 'Fire', NULL, 8, 2),
(2021, 816, 'Sobble', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/816.png', 'Water', NULL, 8, 3),
(2022, 906, 'Sprigatito', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/906.png', 'Grass', NULL, 9, 1),
(2023, 909, 'Fuecoco', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/909.png', 'Fire', NULL, 9, 2),
(2024, 912, 'Quaxly', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/912.png', 'Water', NULL, 9, 3),
(2025, 66, 'Machop', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/66.png', 'Fighting', NULL, 1, 5),
(2026, 92, 'Gastly', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/92.png', 'Ghost', 'Poison', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Grass', 'Tipo planta, ataques basados en la naturaleza.'),
(2, 'Fire', 'Tipo fuego, ataques basados en calor y llamas.'),
(3, 'Water', 'Tipo agua, ataques basados en agua y hielo.'),
(4, 'Electric', 'Tipo eléctrico, ataques basados en electricidad.'),
(5, 'Normal', 'Tipo normal, ataques estándar.'),
(6, 'Flying', 'Tipo volador, ataques aéreos.'),
(7, 'Poison', 'Tipo veneno, ataques tóxicos.'),
(15, 'Fighting', 'Tipo lucha, basado en ataques físicos fuertes.'),
(16, 'Ghost', 'Tipo fantasma, ataques de tipo espiritual.'),
(20, 'Steel', 'Tipo acero, resistente a muchos ataques.'),
(21, 'Fairy', 'Tipo hada, conocido por su magia y encanto.'),
(22, 'Dark', 'Tipo oscuro, ataques sigilosos y astutos.'),
(23, 'Dragon', 'Tipo dragón, poderoso y mítico.'),
(24, 'Ice', 'Tipo hielo, ataques de frío y congelación.'),
(25, 'Ground', 'Tipo tierra, ataques de suelo y arena.'),
(26, 'Psychic', 'Tipo psíquico, ataques mentales.'),
(27, 'Bug', 'Tipo bicho, ataques de insectos.'),
(28, 'Rock', 'Tipo roca, ataques de piedras y minerales.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type1` (`type1`),
  ADD KEY `type2` (`type2`),
  ADD KEY `habilidad_id` (`habilidad_id`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`type1`) REFERENCES `tipos` (`nombre`),
  ADD CONSTRAINT `pokemon_ibfk_2` FOREIGN KEY (`type2`) REFERENCES `tipos` (`nombre`),
  ADD CONSTRAINT `pokemon_ibfk_3` FOREIGN KEY (`habilidad_id`) REFERENCES `habilidades` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
