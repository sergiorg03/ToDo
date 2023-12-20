import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {

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
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(key: Key("contra"),
                  width: 200,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.left,
                    obscureText: true,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Contraseña",
                    ),
                    maxLines: 1,
                    controller: contraController,
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}