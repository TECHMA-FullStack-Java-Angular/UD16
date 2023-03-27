CREATE DATABASE  IF NOT EXISTS `TA16_ejercicio1`;
USE `TA16_ejercicio1`;

DROP TABLE IF EXISTS `fabricantes`;
CREATE TABLE `fabricantes` (
  `CODIGO` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `fabricantes` VALUES (1,'Sony'),(2,'Creative Labs'),(3,'Hewlett-Packard'),(4,'Iomega'),(5,'Fujitsu'),(6,'Winchester');


DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `CODIGO` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `PRECIO` decimal(10,0) NOT NULL,
  `FABRICANTE` int NOT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FABRICANTE` (`FABRICANTE`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`FABRICANTE`) REFERENCES `fabricantes` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `articulos` VALUES (1,'Hard drive',240,5),(2,'Memory',120,6),(3,'ZIP drive',150,4),(4,'Floppy disk',5,6),(5,'Monitor',240,1),(6,'DVD drive',180,2),(7,'CD drive',90,2),(8,'Printer',270,3),(9,'Toner cartridge',66,3),(10,'DVD burner',180,2);

/*1.1. Obtener los nombres de los productos de la tienda*/
SELECT NOMBRE FROM articulos;

/*1.2. Obtener los nombres y los precios de los productos de la tienda*/
select nombre, precio from articulos;

/*1.3. Obtener el nombre de los productos cuyo precio sea menor o igual a 200€*/
select nombre from articulos where precio <=200;

/*1.4. Obtener todos los datos de los artículos cuyo precio esté entre los 60€ y los
120€ (ambas cantidades incluidas)*/
select * from articulos where precio between 60 and 120;

/*1.5. Obtener el nombre y el precio en pesetas (es decir, el precio en euros multiplicado
por 166'386)*/
select nombre, precio*166.386 as precio_pesetas from articulos;

/*1.6. Seleccionar el precio medio de todos los productos*/
select avg (precio) as precio_medio from articulos;

/*1.7. Obtener el precio medio de los articulos cuyo código de fabricante sea 2*/
select avg(precio) as precio_medio from articulos where FABRICANTE=2;

/*1.8. Obtener el numero de articulos cuyo precio sea mayor o igual a 180€*/
select count(nombre)  from articulos where precio >=180;

/*1.9. Obtener el nombre y precio de los articulos cuyo precio sea mayor o 
igual a 180€ y ordenarlos descendentemente por precio, y luego ascendentemente
 por nombre.*/
 select nombre, precio from articulos where precio >=180 order by precio;
 select nombre, precio from articulos where precio >=180 order by nombre desc;

/*1.10. Obtener un listado completo de artículos, incluyendo por cada artículo
 los datos del artículo y de su fabricante*/
 select articulos.*, fabricantes.* from articulos join fabricantes 
 on articulos.FABRICANTE=fabricantes.CODIGO;
 
 /*1.11. Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, 
 y el nombre de su fabrincante*/
 select articulos.nombre, articulos.precio, fabricantes.nombre as fabricante 
 from articulos join fabricantes on articulos.fabricante=fabricantes.codigo;
 
 /*1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los 
 códigos de fabricante.*/
 select avg(articulos.precio) as precio_medio, fabricantes.codigo as codigo_fabricante from articulos
 join fabricantes on articulos.fabricante=fabricantes.codigo group by fabricantes.codigo;
 
 /*1.13. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.*/
 select avg(articulos.precio) as precio_medio, fabricantes.nombre as fabricante from articulos
  join fabricantes on articulos.fabricante=fabricantes.codigo group by fabricantes.nombre;
  
  /*1.14. Obtener los nombre de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150€*/
  select fabricantes.nombre as fabricantes from articulos  join fabricantes 
  on articulos.fabricante=fabricantes.codigo group by fabricantes.nombre
  having avg (articulos.precio) >=150;
  
  /*1.15. Obtener el nombre y precio del articulo mas barato*/
  select nombre, precio from articulos order by precio asc limit 1;
  
  /*1.16. Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor 
  (incluyendo el nombre del proveedor).*/
 select fabricantes.nombre as fabricante, articulos.nombre as articulo, articulos.precio 
from articulos join fabricantes on articulos.fabricante = fabricantes.codigo
where articulos.precio in (select max(precio) from articulos where fabricante=articulos.fabricante 
group by fabricante)
order by fabricantes.nombre;
  