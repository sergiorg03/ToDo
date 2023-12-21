import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utilities {

  final List<String> LETRAS_DNI = ["T", "R", "W", "A", "G", "M", "Y", "F", "P", "D", "X", "B", "N", "J", "Z", "S", "Q", "V", "H", "L", "C", "K", "E"];
  final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  Utilities (){}

   /// Función que comprueba si una cadena contiene texto o no.
   /// @return {bool} -- Devuelve True si la cadena pasada por parametro contiene texto. False si no.
   bool contieneTexto(String cadena){
     bool contiene = false;

     if(cadena.isNotEmpty && cadena != ''){
       contiene = true;
     }

     return contiene;
   }

   /// Función que comprueba si el DNI introducido tiene el formato correcto.
   /// @return {bool} -- Devuelve True si el dni es correcto, False si no.
   bool comprobarDni (String dni){
     bool valido = false;

     if(contieneTexto(dni) && dni.length == 9 && esNumerico(dni.substring(0,8)) && LETRAS_DNI.elementAt((int.parse(dni.substring(0,8))%23)) == dni.substring(8).toUpperCase()){
       valido = true;
     }

     return valido;
   }

   /// Funcion que comprueba si una cadena es numerica o no
   /// @return {bool} -- Devuelve true si una cadena introducida es númerica. True si lo es, False si no.
   bool esNumerico (String cadena){
     bool valido = false;
     
     if(int.tryParse(cadena) != null){
       valido = true;
     }
     
     return valido;
   }

   /// Funcion que muestra una alerta
   void mostrarAlertas(BuildContext context, String mensaje){
    showDialog(
        context: context,
        builder: (BuildContext cont){
          return AlertDialog(
            title: Text("Warning"),
            content: Text(mensaje),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cerrar"))
            ],
          );
        }
    );
   }

   /// Método que convierte una cadena a el hash MD5
   /// @param {Sting} -- Cadena a convertir en el Hash MD5
   /// @return {String} -- Devuelve el Hash MD5 de la cadena pasada por parametro.
   String cadToMD5(String cadena){
      var bytesUTF8 = utf8.encode(cadena);
      var md5Resultado = md5.convert(bytesUTF8);
      return md5Resultado.toString();
   }

   /// Método que comprueba si un email está bien formado o no.
   /// @param {String} -- Email a comprobar el formato
   /// @return {bool} -- Devuelve true si el formato es correcto. False si no.
   bool formatoEmail(String email){
    bool valido = false;

    // Comprobamos que el formato es correcto.
    if(regex.hasMatch(email)){
      valido = true;
    }

    return valido;
   }

  bool formatoTelefono(String telefono){
    bool valido = false;

    if(telefono.length == 9 && esNumerico(telefono)){
      valido = true;
    }
    
    return valido;
  }
}