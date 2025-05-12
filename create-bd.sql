CREATE DATABASE sistemaodontologico;
USE sistemaodontologico;


CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `rut` varchar(8) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `dv` varchar(1) NOT NULL,
  `apellido_paterno` varchar(70) NOT NULL,
  `apellido_materno` varchar(70) NOT NULL,
  `fecha_nacimiento` Date NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(400) NOT NULL,
  `id_perfil` int NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_paciente`),
  UNIQUE (`rut`) 
);

CREATE TABLE `profesional` (
  `id_profesional` int NOT NULL AUTO_INCREMENT,
  `rut` varchar(8) NOT NULL,
  `dv` varchar(1) NOT NULL,
  `id_perfil` int NOT NULL,
  `id_especialidad` int NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellido_paterno` varchar(70) NOT NULL,
  `apellido_materno` varchar(70) NOT NULL,
  `fecha_nacimiento` Date NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(400) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_profesional`),
 UNIQUE (`rut`) );

CREATE TABLE `contrasena_profesional` (
  `id_contrasena_profesional` int NOT NULL AUTO_INCREMENT,
  `id_profesional`int NOT NULL,
  `contrasena` varchar(200) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_contrasena_profesional`),
    KEY `id_profesional` (`id_profesional`),
CONSTRAINT `contrasena_profesional_fk_1` FOREIGN KEY (`id_profesional`) REFERENCES `profesional` (`id_profesional`) ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE `contrasena_paciente` (
  `id_contrasena_paciente` int NOT NULL AUTO_INCREMENT,
  `id_paciente`int NOT NULL,
  `contrasena` varchar(200) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_contrasena_paciente`),
  KEY `id_paciente` (`id_paciente`),
CONSTRAINT `contrasena_paciente_fk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `especialidad_profesional` (
  `id_especialidad` int NOT NULL AUTO_INCREMENT,
  `descripcion_especialidad` varchar(200) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_especialidad`)
);
CREATE TABLE `agendamiento` (
  `id_agendamiento` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NULL ,
  `id_profesional` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_agendamiento`),
      KEY `id_paciente` (`id_paciente`),
CONSTRAINT `agendamiento_fk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE `consulta_medica` (
  `id_consulta_medica` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL ,
  `id_profesional` int NOT NULL,
  `motivo_consulta` varchar(200) NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  `id_agendamiento` int NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_consulta_medica`),
    KEY `id_paciente` (`id_paciente`),
CONSTRAINT `consulta_medica_fk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE
);




CREATE TABLE `estado_agendamiento` (
  `id_estado_agendamiento` int NOT NULL AUTO_INCREMENT,
  `id_agendamiento` int NOT NULL ,
  `consulta_realizada` char(1) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `notificado` char(1) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estado_agendamiento`),
    KEY `id_agendamiento` (`id_agendamiento`),
CONSTRAINT `estado_agendamiento_fk_1` FOREIGN KEY (`id_agendamiento`) REFERENCES `agendamiento` (`id_agendamiento`) ON DELETE CASCADE ON UPDATE CASCADE

);
create table `perfil`(
 `id_perfil` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL ,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perfil`)
);

CREATE TABLE `puntuacion` (
  `id_puntuacion` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL ,
  `id_profesional` int NOT NULL ,
  `id_agendamiento` int NOT NULL ,
  `puntaje_general` int NOT NULL,
  `recomendacion` int NOT NULL,
  `claridad` int NOT NULL,
  `puntualidad` int NOT NULL,
  `empatia` int NOT NULL,
  `cordialidad` int NOT NULL,
  `nivel_satisfaccion` int NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_puntuacion`),
  KEY `id_paciente` (`id_paciente`),
CONSTRAINT `puntuacion_fk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
KEY `id_profesional` (`id_profesional`),
CONSTRAINT `puntuacion_fk_2` FOREIGN KEY (`id_profesional`) REFERENCES `profesional` (`id_profesional`)
);
CREATE TABLE `respuesta_paciente` (
  `id_respuesta_paciente` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL ,
  `id_pregunta` int NOT NULL ,
  `respuesta` int NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_respuesta_paciente`),
  KEY `id_paciente` (`id_paciente`),
CONSTRAINT `respuesta_paciente_fk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE

);
CREATE TABLE `pregunta` (
  `id_pregunta` int NOT NULL AUTO_INCREMENT,
  `texto` varchar(500) NOT NULL ,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pregunta`)
);
CREATE TABLE `alternativa_pregunta` (
  `id_alternativa_pregunta` int NOT NULL AUTO_INCREMENT,
  `id_pregunta` int NOT NULL,
  `id_alternativa_respuesta` int NOT NULL,
  `texto` varchar(500) NOT NULL ,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alternativa_pregunta`),
  KEY `id_pregunta` (`id_pregunta`),
CONSTRAINT `pregunta_alternativa_fk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`)
);


CREATE TABLE `examen_medico` (
  `id_examen` int NOT NULL AUTO_INCREMENT,
  `id_consulta_medica` int NOT NULL ,
  `imagen_examen` longblob NOT NULL ,
  `nombre_examen` varchar(200) NOT NULL,
   `mime_type` varchar(200) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_examen`),
   KEY `id_consulta_medica` (`id_consulta_medica`),
CONSTRAINT `examen_medico_fk_1` FOREIGN KEY (`id_consulta_medica`) REFERENCES `consulta_medica` (`id_consulta_medica`) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE `presupuesto_consulta` (
  `id_presupuesto_consulta` int NOT NULL AUTO_INCREMENT,
  `id_consulta_medica` int NOT NULL ,
  `total` int NOT NULL ,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_presupuesto_consulta`),
   KEY `id_consulta_medica` (`id_consulta_medica`),
CONSTRAINT `presupuesto_consulta_fk_1` FOREIGN KEY (`id_consulta_medica`) references
`consulta_medica` (`id_consulta_medica`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `tratamiento` (
  `id_tratamiento` int NOT NULL AUTO_INCREMENT,
  `id_presupuesto_consulta` int NOT NULL,
  `nombre` varchar(200) NOT NULL ,
  `descripcion` varchar(200) NOT NULL ,
  `valor_unitario` int NOT NULL ,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tratamiento`),
   KEY `id_presupuesto_consulta` (`id_presupuesto_consulta`),
CONSTRAINT `presupuesto_tratamiento_fk_1` FOREIGN KEY (`id_presupuesto_consulta`) references
`presupuesto_consulta` (`id_presupuesto_consulta`) ON DELETE CASCADE ON UPDATE CASCADE
);
 
 

 
 
 
