-- ToDo
-- MYSQL
DROP SCHEMA IF EXISTS ToDo_List;

CREATE SCHEMA IF NOT EXISTS ToDo_List DEFAULT CHARACTER
SET utf8;

USE ToDo_List;

-- --------------------------------------
-- BORRADO DE TABLAS
-- --------------------------------------
DROP TABLE usuarios CASCADE CONSTRAINT;

-- --------------------------------------
-- CREACION DE TABLAS
-- --------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
	email VARCHAR(255) PRIMARY KEY,
	nombre VARCHAR(255),
	apellidos VARCHAR(255),
	telefono VARCHAR(9) UNIQUE,
	contra VARCHAR(255),
	numero_us INT (3) UNIQUE AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS listas (
	id INT (5) PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(255),
	list_owner INT (3),
	CONSTRAINT fk_numUs_List
	ADD
		FOREIGN KEY list_owner REFERENCES usuarios (numero_us)
);

/*
 
 SQLITE
 
 */
-- Eliminar la tabla contenidoListas
DROP TABLE IF EXISTS contenidoListas;

-- Eliminar la tabla listas
DROP TABLE IF EXISTS listas;

-- Eliminar la tabla usuarios
DROP TABLE IF EXISTS usuarios;

-- Usuarios
CREATE TABLE usuarios (
	email TEXT PRIMARY KEY CHECK (email LIKE '%@%.%'),
	nombre TEXT,
	apellidos TEXT,
	telf TEXT CHECK (
		length (telf) = 9
		AND telf GLOB '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	),
	contra TEXT NOT NULL
);

-- Listas
CREATE TABLE listas (
	idLista INTEGER,
	emailUsuario TEXT,
	nombreLista TEXT,
	descripcion TEXT,
	activa BOOLEAN DEFAULT 1,
	fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	fechaUltimaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	completada BOOLEAN DEFAULT 0,
	PRIMARY KEY (idLista, emailUsuario),
	FOREIGN KEY (emailUsuario) REFERENCES usuarios(email) ON DELETE CASCADE,
	CHECK (fechaCreacion <= CURRENT_TIMESTAMP),
	CHECK (fechaUltimaActualizacion <= CURRENT_TIMESTAMP)
);

-- ContenidoListas
CREATE TABLE contenidoListas (
	idApartado INTEGER,
	idLista INTEGER,
	emailUsuario TEXT,
	nombreApartado TEXT,
	completado BOOLEAN DEFAULT 0,
	prioridad INTEGER,
	notas TEXT,
	responsable TEXT,
	fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	fechaUltimaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (idApartado, idLista, emailUsuario),
	FOREIGN KEY (idLista) REFERENCES listas(idLista) ON DELETE CASCADE,
	FOREIGN KEY (emailUsuario) REFERENCES usuarios(email),
	CHECK (fechaCreacion <= CURRENT_TIMESTAMP),
	CHECK (fechaUltimaActualizacion <= CURRENT_TIMESTAMP)
);

-- Índice para mejorar la búsqueda por nombre de lista
CREATE INDEX idx_nombre_lista ON listas(nombreLista);

-- Índice para mejorar la búsqueda por email de usuario
CREATE INDEX idx_email_usuario ON listas(emailUsuario);

-- Índice para mejorar el rendimiento de consultas JOIN
CREATE INDEX idx_id_lista ON contenidoListas(idLista);

-- Índice para mejorar la búsqueda por nombre de apartado
CREATE INDEX idx_nombre_apartado ON contenidoListas(nombreApartado);

-- Índice para mejorar el rendimiento de consultas JOIN
CREATE INDEX idx_id_lista_contenido ON contenidoListas(idLista);

COMMIT;