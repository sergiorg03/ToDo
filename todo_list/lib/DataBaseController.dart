// Se importan las librerias necesarias
import 'Utilities.dart';
import 'Entitites.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'dart:async';

class DataBaseController {
  Utilities u = Utilities();
  static final DataBaseController _instance = DataBaseController._internal();

  factory DataBaseController() => _instance;

  static Database? _database;

  DataBaseController._internal();

  Future<Database> get database async {
    if (database != null) return _database!;

    // Si no hay una instancia de la base de datos, la crea.
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'ToDo_DB.db');
    print(path);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    const String sql = '''
DROP TABLE IF EXISTS contenidoListas;

DROP TABLE IF EXISTS listas;

DROP TABLE IF EXISTS usuarios;

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

CREATE TABLE contenidoListas (
	idApartado INTEGER,
	idLista INTEGER,
	emailUsuario TEXT,
	nombreApartado TEXT,
	completado BOOLEAN DEFAULT 0,
	notas TEXT,
	fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	fechaUltimaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (idApartado, idLista, emailUsuario),
	FOREIGN KEY (idLista) REFERENCES listas(idLista) ON DELETE CASCADE,
	FOREIGN KEY (emailUsuario) REFERENCES usuarios(email),
	CHECK (fechaCreacion <= CURRENT_TIMESTAMP),
	CHECK (fechaUltimaActualizacion <= CURRENT_TIMESTAMP)
);

CREATE INDEX idx_nombre_lista ON listas(nombreLista);

CREATE INDEX idx_email_usuario ON listas(emailUsuario);

CREATE INDEX idx_id_lista ON contenidoListas(idLista);

CREATE INDEX idx_nombre_apartado ON contenidoListas(nombreApartado);

CREATE INDEX idx_id_lista_contenido ON contenidoListas(idLista);

COMMIT;
''';
    await db.execute(sql);
  }

  Future<int> createAccount(Usuario us) async {
    Database db = await database;

    return await db.insert("usuarios", us.toMap());
  }

  /*late final String IP;
  late final URL;

  DataBaseController() {
    this.IP = "192.168.1.156";
    this.URL = "http://" + IP + "/todo/";
  }

  /// Set
  void setIP(String IP) {
    this.IP = IP;
  }

  /// Get
  String getIP() {
    return this.IP;
  }

  /// Get URL
  String getURL() {
    return URL;
  }*/

  /// Metodo que realiza la petición a la api para hacer el login
  /// @param us {String} -- Usuario con el que realizar login
  /// @param pass {String} -- Contraseña de la cuenta en formato Hash MD5
  void login(String us, String pass) {}

  /// Metodo que realiza la peticion a la API tara comprobar si existe el email o no.
  /*Future<bool> obtenerEmail(String email) async {

  }*/

  /// Método que realiza la peticion a la API para comprobar si existe el telefono indicado o no.
  /*Future<bool> obtenerTelf(String telf) async {

  }*/
}
