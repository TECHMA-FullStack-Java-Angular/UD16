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

/*2.7. Obtenga todos los datos de los empleados cuyo apellido comience por 'P'.*/
select * from empleados where apellidos like 'P%';

/*2.8. Obtener el presupuesto total de todos los departamentos*/
select sum(presupuesto) as presupuesto_total from departamentos;

/*2.9. Obtener el numero de empleados de cada departamento*/
select count(dni) as numero_empleado, departamento from empleados group by departamento;

/*2.10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado 
y de su departamento*/
select * from empleados join departamentos on departamentos.codigo=empleados.departamento;

/*2.11. Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto 
al nombre y presupuesto de su departamento.*/
select empleados.nombre, empleados.apellidos, departamentos.nombre as nombre_departamento, departamentos.presupuesto
from empleados join departamentos on departamentos.codigo=empleados.departamento;

/*2.12. Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea 
mayor de 60.000€*/
select empleados.nombre, empleados.apellidos from empleados join departamentos 
on departamentos.codigo=empleados.departamento where departamentos.presupuesto in( select presupuesto 
from departamentos where presupuesto > 60000);

/*2.13. Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos
 los departamentos*/

/*2.14. Obtener los nombres (únicamente los nombres) de los departamentos que tienen más de dos empleados*/