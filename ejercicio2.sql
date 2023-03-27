CREATE DATABASE  IF NOT EXISTS `TA16_ejercicio2`;
USE `TA16_ejercicio2`;

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `CODIGO` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `PRESUPUESTO` decimal(10,0) NOT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `departamentos` VALUES (14,'IT',65000),(37,'Accounting',15000),(59,'Human Resources',240000),(77,'Research',55000);


DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `DNI` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `APELLIDOS` varchar(255) NOT NULL,
  `DEPARTAMENTO` int NOT NULL,
  PRIMARY KEY (`DNI`),
  KEY `DEPARTAMENTO` (`DEPARTAMENTO`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`DEPARTAMENTO`) REFERENCES `departamentos` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `empleados` VALUES (123234877,'Michael','Rogers',14),(152934485,'Anand','Manikutty',14),(222364883,'Carol','Smith',37),(326587417,'Joe','Stevens',37),(332154719,'Mary-Anne','Foster',14),(332569843,'George','O\'Donnell',77),(546523478,'John','Doe',59),(631231482,'David','Smith',77),(654873219,'Zacary','Efron',59),(745685214,'Eric','Goldsmith',59),(845657233,'Luis','López',14),(845657245,'Elizabeth','Doe',14),(845657246,'Kumar','Swamy',14),(845657266,'Jose','Pérez',77);

/*2.1. Obtener los apellidos de los empleados*/
select apellidos from empleados;

/*2.2. Obtener los apellidos de los empleados sin repeticiones*/
select distinct apellidos from empleados ;

/*2.3. Obtener todos los datos de los empleados que se apellidan 'Smith'*/
select * from empleados where apellidos='Smith';

/*2.4. Obtener todos los datos de los empleados que se apellodan 'Smith' y los que se apellidan 'Rogers'*/
select * from empleados where apellidos='Smith' or apellidos='Rogers';

/*2.5. Obtener todos los datos de los empleados que trabajan para el departamento 14.*/
select * from empleados where departamento=14;

/*2.6. Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77.
Entiendo que pide los datos de los empleados que trabajan para el departamento 37 y de los empleados que trabajan
para el departamento 77 ya que no hay empleados que trabajen en 2 departamentos al mismo tiempo*/
select * from empleados where departamento=37 or departamento=77;