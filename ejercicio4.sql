CREATE DATABASE  IF NOT EXISTS `TA16_ejercicio4`;
USE `TA16_ejercicio4`;

DROP TABLE IF EXISTS `peliculas`;
CREATE TABLE `peliculas` (
  `CODIGO` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `CALIFICACIONEDAD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `peliculas` VALUES (1,'Citizen Kane','PG'),(2,'Singin\' in the Rain','G'),(3,'The Wizard of Oz','G'),(4,'The Quiet Man',NULL),(5,'North by Northwest',NULL),(6,'The Last Tango in Paris','NC-17'),(7,'Some Like it Hot','PG-13'),(8,'A Night at the Opera',NULL),(9,'Citizen King','G');


DROP TABLE IF EXISTS `salas`;
CREATE TABLE `salas` (
  `CODIGO` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `PELICULA` int DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `PELICULA` (`PELICULA`),
  CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`PELICULA`) REFERENCES `peliculas` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `salas` VALUES (1,'Odeon',5),(2,'Imperial',1),(3,'Majestic',NULL),(4,'Royale',6),(5,'Paraiso',3),(6,'Nickelodeon',NULL);

/*--------------------------------------------------------------------------------------------------------------------------------*/
/*4.1. Mostrar el nombre de todas las peliculas*/
select * from peliculas;

/*4.2. Mostras las distintas calificaciones de edad que existen*/

/*4.3. Mostrar todas las películas que no han sido calificadas*/

/*4.4. Mostrar todas las salas qe no proyectan ninguna pelicula*/

/*4.5. Mostrar la informacion de todas las salas y, si se proyecta alguna pelicula en la sala, mostrar también la 
información de la pelicula.*/