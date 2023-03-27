CREATE DATABASE  IF NOT EXISTS `TA16_ejercicio3`;
USE `TA16_ejercicio3`;

DROP TABLE IF EXISTS `almacenes`;
CREATE TABLE `almacenes` (
  `CODIGO` int NOT NULL,
  `LUGAR` varchar(255) NOT NULL,
  `CAPACIDAD` int NOT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `almacenes` VALUES (1,'Valencia',3),(2,'Barcelona',4),(3,'Bilbao',7),(4,'Los Angeles',2),(5,'San Francisco',8);

DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas` (
  `NUMREFERENCIA` varchar(255) NOT NULL,
  `CONTENIDO` varchar(255) NOT NULL,
  `VALOR` double NOT NULL,
  `ALMACEN` int NOT NULL,
  PRIMARY KEY (`NUMREFERENCIA`),
  KEY `ALMACEN` (`ALMACEN`),
  CONSTRAINT `cajas_ibfk_1` FOREIGN KEY (`ALMACEN`) REFERENCES `almacenes` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cajas` VALUES ('0MN7','Rocks',180,3),('4H8P','Rocks',250,1),('4RT3','Scissors',190,4),('7G3H','Rocks',200,1),('8JN6','Papers',75,1),('8Y6U','Papers',50,3),('9J6F','Papers',175,2),('LL08','Rocks',140,4),('P0H6','Scissors',125,1),('P2T6','Scissors',150,2),('TU55','Papers',90,5);

/*--------------------------------------------------------------------------------------------------------------------------*/

/*3.1. Obtener todos los almacenes*/
select * from almacenes;

/*3.2. Obtener todas las cajas cuyo contenido tenga un valor superior a 150€*/
select numreferencia from cajas where valor >150;

/*3.3. Obtener los tipos de contenido de las cajas*/
select distinct contenido from cajas;

/*3.4. Obtener el valor medio de todas las cajas*/
select avg(valor) as valor_medio from cajas;

/*3.5. Obtener el valor medio de las cajas de cada almacen*/
select  avg(valor) as valor_medio from cajas group by almacen;

/*3.6. Obtener los codigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150€*/
select almacenes.codigo from almacenes join cajas on almacenes.codigo=cajas.almacen group by almacenes.codigo
having avg(cajas.valor)>150 ;

/*3.7. Obtener el numero de referencia de cada caja junto con el numbre de la ciudad en el que se encuentra.*/
select cajas.numreferencia as referencia, almacenes.lugar as ciudad from cajas join almacenes 
on almacenes.codigo=cajas.almacen ;

/*3.8. Obtener el numero de cajas que hay en cada almacén*/
select almacenes.codigo as codigo_almacen, count(cajas.numreferencia) as cantidad_cajas from almacenes join cajas 
on almacenes.codigo=cajas.almacen group by almacenes.codigo;

/*3.9. Obtener los codigos de los almacenes que estan saturados (los almacenes donde el numero de cajas es superior 
a la capacidad)*/
select almacenes.codigo from almacenes join (select almacen, count(*) as num_cajas from cajas 
group by almacen) cajas on almacenes.codigo = cajas.almacen where cajas.num_cajas > almacenes.capacidad;

/*3.10. Obtener los numeros de referencia de las cajas que están en Bilbao*/
select cajas.numreferencia from cajas join almacenes on almacenes.codigo=cajas.almacen where almacenes.lugar='Bilbao';

/*3.11. Insertar un nuevo almacén en Barcelona xon capacidad para 3 cajas*/
insert into almacenes values (6, 'Barcelona', 3);

/*3.12. Insertar una nueva caja, con número de referencia 'H5RT', con contenido 'Papel' valor 200, 
y situada en el almacen 2. */
insert into cajas values('H5RT','Papel',200,2);

/*3.13. Rebajar el valor de todas las cajas un 15%*/




