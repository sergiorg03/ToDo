// Se importan las librerias necesarias
import 'Utilities.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class DataBaseController{

  Utilities u = Utilities();
  late final String IP;
  late final URL;

  DataBaseController(){
    this.IP = "";
    this.URL = "";
  }

  /// Set
  void setIP(String IP){
    this.IP = IP;
  }

  /// Get
  String getIP(){
    return this.IP;
  }

  /// Get URL
  String getURL(){
    return URL;
  }

  /// Metodo que realiza la petición a la api para hacer el login
  /// @param us {String} -- Usuario con el que realizar login
  /// @param pass {String} -- Contraseña de la cuenta en formato Hash MD5
  void login (String us, String pass){
    
  }

  void createAccount(String DNI, String nombre, String apellidos, String email, String pass) {

  }

  /// Metodo que realiza la peticion a la API
  ///
  Future<bool> obtenerEmail(String email) async{
    final response = await http.get(Uri.parse("ruta a la API"));
    print(json.decode(response.body));
    return json.decode(response.body);
  }
}