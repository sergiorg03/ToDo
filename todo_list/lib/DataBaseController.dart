// Se importan las librerias necesarias
import 'Utilities.dart';
import 'package:http/http.dart' as http;
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

  /// Metodo que realiza la peticion a la API tara comprobar si existe el email o no.
  Future<bool> obtenerEmail(String email) async {
    final response = await http.get(Uri.parse("ruta a la API"));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  /// Método que realiza la peticion a la API para comprobar si existe el telefono indicado o no.
  Future<bool> obtenerTelf(String telf) async {
    final response = await http.get(Uri.parse(""));
    return json.decode(response.body);
  }
}
