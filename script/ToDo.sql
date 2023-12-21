-- ToDo

DROP SCHEMA IF EXISTS ToDo_List;
CREATE SCHEMA IF NOT EXISTS ToDo_List DEFAULT CHARACTER SET utf8;

USE ToDo_List;

-- --------------------------------------
-- BORRADO DE TABLAS
-- --------------------------------------

DROP TABLE usuarios CASCADE CONSTRAINT;

-- --------------------------------------
-- CREACION DE TABLAS
-- --------------------------------------

CREATE TABLE IF NOT EXISTS usuarios(
	email			VARCHAR(255) PRIMARY KEY,
	nombre			VARCHAR(255),
	apellidos   	VARCHAR(255),
	telefono  		VARCHAR(9) UNIQUE,
	contra			VARCHAR(255),
	numero_us		INT(3) UNIQUE AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS listas(
	id				INT(5) PRIMARY KEY AUTO_INCREMENT,
	nombre			VARCHAR(255),
	list_owner		INT(3),
	CONSTRAINT fk_numUs_List ADD FOREIGN KEY list_owner REFERENCES usuarios(numero_us)
);

