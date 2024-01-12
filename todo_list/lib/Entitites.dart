import 'Utilities.dart';

class Usuarios{

  Utilities u = new Utilities();

  late String _nombre;
  late String _apellidos;
  late String _email;
  late String _numeroTelf;
  late String _contra;

  Usuarios (String nombre, String apellidos, String email, String numeroTelf, String contra){
    this._nombre = nombre;
    this._apellidos = apellidos;
    this._email = email;
    this._numeroTelf = numeroTelf;
    this._contra = contra;
  }

  String get contra => _contra;

  set contra(String value) {
    _contra = value;
  }

  String get numeroTelf => _numeroTelf;

  set numeroTelf(String value) {
    _numeroTelf = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get apellidos => _apellidos;

  set apellidos(String value) {
    _apellidos = value;
  }

  String get nombre => _nombre;

  set nombre(String value) {
    _nombre = value;
  }
}

class Listas{

  late String nombreLista;

  Listas(String nombreLista){
    this.nombreLista = nombreLista;
  }

}

class Opciones{

}