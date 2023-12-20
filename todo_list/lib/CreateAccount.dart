import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/DataBaseController.dart';
import 'package:todo_list/Utilities.dart';

class CreateAccount extends StatelessWidget {

  Utilities u = Utilities();
  DataBaseController dbc = DataBaseController();

  var dniController = TextEditingController();
  var nombreController = TextEditingController();
  var apellidosController = TextEditingController();
  var emailController = TextEditingController();
  var contraController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
       Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Padding(
                  padding: EdgeInsets.all(0),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10),
                          labelText: "DNI"
                      ),
                      controller: dniController,
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Nombre"
                      ),
                      controller: nombreController,
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Apellidos"
                      ),
                      controller: apellidosController,
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Email"
                      ),
                      maxLines: 1,
                      controller: emailController,
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(key: const Key("contra"),
                  width: 200,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.left,
                    obscureText: true,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Contraseña",
                    ),
                    maxLines: 1,
                    controller: contraController,
                  ),
                ),
              ),
              // Boton de Creacion de cuenta
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton (
                  key: const Key("CreateAccount"),
                  onPressed: () {
                    if(u.contieneTexto(dniController.text) && u.contieneTexto(nombreController.text) && u.contieneTexto(apellidosController.text) && u.contieneTexto(emailController.text) && u.contieneTexto(contraController.text)){
                      if(u.comprobarDni(dniController.text)){ // Comprobacion del DNI
                        if(u.formatoEmail(emailController.text) && !dbc.existeEmail(emailController.text)){ // Comprobacion email
                          // insertamos los datos en la base de datos.
                          dbc.createAccount(dniController.text, nombreController.text, apellidosController.text,
                                            emailController.text, u.cadToMD5(contraController.text));
                        }else{ // Email incorrecto
                          u.mostrarAlertas(context, "El email introducido tiene un formato incorrecto. ");
                        }
                      }else{ // DNI erroneo
                        u.mostrarAlertas(context, "El DNI introducido no es correcto. Por favor introduzca un DNI correcto. ");
                      }
                    }else u.mostrarAlertas(context, "Debe rellenar todos los campos. ");
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(200.0, 50.0),
                    ),
                    //backgroundColor: ,
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.black,
                      ),
                      Text(
                        "Crear cuenta",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}