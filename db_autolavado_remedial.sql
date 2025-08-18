-- Crear base de datos
CREATE DATABASE IF NOT EXISTS db_autolavado_remedial;
USE db_autolavado_remedial;

-- ------------------------------------------------
-- Tabla tbi_roles
-- ------------------------------------------------
DROP TABLE IF EXISTS tbi_roles;
CREATE TABLE tbi_roles (
  idRol INT NOT NULL AUTO_INCREMENT,
  nombreRol VARCHAR(45) NOT NULL,
  PRIMARY KEY (idRol)
);

-- ------------------------------------------------
-- Tabla tbi_clientes
-- ------------------------------------------------
DROP TABLE IF EXISTS tbi_clientes;
CREATE TABLE tbi_clientes (
  idCliente INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  primerApellido VARCHAR(45) NOT NULL,
  segundoApellido VARCHAR(45) DEFAULT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono VARCHAR(12) NOT NULL,
  correo VARCHAR(65) NOT NULL,
  password VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCliente)
);

-- ------------------------------------------------
-- Tabla tbc_usuarios
-- ------------------------------------------------
DROP TABLE IF EXISTS tbc_usuarios;
CREATE TABLE tbc_usuarios (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  primerApellido VARCHAR(45) NOT NULL,
  segundoApellido VARCHAR(45) DEFAULT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  correo VARCHAR(70) NOT NULL,
  usuario VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL,
  fechaNacimiento DATE NOT NULL,
  idRol INT NOT NULL,
  PRIMARY KEY (idUsuario),
  KEY fk_idRol_idx (idRol),
  CONSTRAINT fk_idRol FOREIGN KEY (idRol) REFERENCES tbi_roles (idRol)
);

-- ------------------------------------------------
-- Tabla tbc_vehiculo
-- ------------------------------------------------
DROP TABLE IF EXISTS tbc_vehiculo;
CREATE TABLE tbc_vehiculo (
  idVehiculo INT NOT NULL AUTO_INCREMENT,
  matricula VARCHAR(15) NOT NULL,
  marca VARCHAR(45) NOT NULL,
  modelo VARCHAR(45) NOT NULL,
  color VARCHAR(45) NOT NULL,
  year INT NOT NULL,
  idCliente INT NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  PRIMARY KEY (idVehiculo),
  KEY fk_clientes_idx (idCliente),
  CONSTRAINT fk_clientes FOREIGN KEY (idCliente) REFERENCES tbi_clientes (idCliente)
);

-- ------------------------------------------------
-- Tabla tbi_servicios
-- ------------------------------------------------
DROP TABLE IF EXISTS tbi_servicios;
CREATE TABLE tbi_servicios (
  idServiicios INT NOT NULL AUTO_INCREMENT,
  nombreServicio VARCHAR(45) NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  estatus VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (idServiicios)
);

-- ------------------------------------------------
-- Tabla tbc_venta_servicios
-- ------------------------------------------------
DROP TABLE IF EXISTS tbc_venta_servicios;
CREATE TABLE tbc_venta_servicios (
  idVentaServicios INT NOT NULL AUTO_INCREMENT,
  idUsuarioC INT NOT NULL,
  idUsuarioO INT NOT NULL,
  idServicio INT NOT NULL,
  idVehiculo INT DEFAULT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  estatus VARCHAR(45) NOT NULL,
  pagado VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY (idVentaServicios),
  KEY fk_usuarioC_idx (idUsuarioC),
  KEY fk_usuarioO_idx (idUsuarioO),
  KEY fk_servicio_idx (idServicio),
  KEY id_vehiculo_idx (idVehiculo),
  CONSTRAINT fk_servicio FOREIGN KEY (idServicio) REFERENCES tbi_servicios (idServiicios),
  CONSTRAINT fk_usuarioC FOREIGN KEY (idUsuarioC) REFERENCES tbc_usuarios (idUsuario),
  CONSTRAINT fk_usuarioO FOREIGN KEY (idUsuarioO) REFERENCES tbc_usuarios (idUsuario),
  CONSTRAINT id_vehiculo FOREIGN KEY (idVehiculo) REFERENCES tbc_vehiculo (idVehiculo)
);