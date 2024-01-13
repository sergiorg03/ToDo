// Se importan las librerias necesarias
import 'Utilities.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'dart:async';

class DataBaseController {
  Utilities u = Utilities();
  late final String IP;
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
  }

  /// Metodo que realiza la petición a la api para hacer el login
  /// @param us {String} -- Usuario con el que realizar login
  /// @param pass {String} -- Contraseña de la cuenta en formato Hash MD5
  void login(String us, String pass) {}

  void createAccount(
      String nombre, String apellidos, String email, String pass) {}

  /// Metodo que realiza la peticion a la DB tara comprobar si existe el email o no.
  /*Future<bool> obtenerEmail(String email) async {

  }*/

  /// Método que realiza la peticion a la DB para comprobar si existe el telefono indicado o no.
  /*Future<bool> obtenerTelf(String telf) async {

  }*/
}
