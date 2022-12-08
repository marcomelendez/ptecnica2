
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Estructura de tabla para la tabla `repositories`
--

CREATE TABLE `repositories` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `url_git` varchar(200) NOT NULL,
  `project` tinyint(1) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `repositories`
--

INSERT INTO `repositories` (`id`, `name`, `author`, `description`, `url_git`, `project`, `create_at`, `update_at`) VALUES
(1, 'proyecto1', 'Marco', 'Esto es una prueba', 'http://localhost/proyecto1.git', 1, '2022-12-07 08:51:16', '2022-12-07 08:51:16'),
(2, 'proyecto 2', 'Marco', 'Descripcion del proyecto', 'http://localhost/proyecto2.git', 1, '2022-12-07 08:52:30', '2022-12-07 08:52:30'),
(3, 'library 1', 'Marco', 'Descripcion de libreria', 'http://localhost/library.git', 0, '2022-12-08 08:53:05', '2022-12-07 08:53:05'),
(4, 'library 2', 'Marco', 'Descripcion de libreria 2', 'http://localhost/library.git', 0, '2022-12-07 08:53:30', '2022-12-07 08:53:30'),
(5, 'library 4', 'Marco', 'Descripcion de libreria 4', 'http://localhost/library4.git', 0, '2022-12-07 08:54:00', '2022-12-07 08:54:00');

--
-- Indices de la tabla `repositories`
--
ALTER TABLE `repositories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de la tabla `repositories`
--
ALTER TABLE `repositories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;


--
--
--

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repository_dependences`
--

CREATE TABLE `repository_dependences` (
  `id` int NOT NULL,
  `repository_id` int NOT NULL COMMENT 'Codigo repositorio',
  `repository_parent` int NOT NULL COMMENT 'Codigo de repositorio que depende'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `repository_dependences`
--

INSERT INTO `repository_dependences` (`id`, `repository_id`, `repository_parent`) VALUES
(1, 1, 3),
(2, 2, 3),
(3, 2, 4),
(4, 4, 5);

--
-- Indices de la tabla `repository_dependences`
--
ALTER TABLE `repository_dependences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repository_id` (`repository_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `repository_dependences`
--
ALTER TABLE `repository_dependences`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `repository_dependences`
--
ALTER TABLE `repository_dependences`
  ADD CONSTRAINT `repository_dependences_ibfk_1` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;