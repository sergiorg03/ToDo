import 'dart:developer';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'DataBaseController.dart';
import 'Utilities.dart';
import 'CreateAccount.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ToDo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Utilities u = Utilities();
  DataBaseController dbc = DataBaseController();
  final usernameController = TextEditingController();
  final contraController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        //title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

        Padding(
          padding: EdgeInsets.all(0),
          child: SizedBox( key: Key("usuario"),
              width: 200,
              height: 50,
              child: TextField(
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                    labelText: "username"
                ),
                maxLines: 1,
                controller: usernameController,
              ),
            ),
        ),
            // Cuadro de texto de la contraseña
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(key: Key("contra"),
                        width: 200,
                        height: 50,
                        child: TextField(
                          textAlign: TextAlign.left,
                          obscureText: true,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(10),
                            labelText: "Password",

                          ),
                          maxLines: 1,
                          controller: contraController,
                        ),
                      ),
            ),
            // Boton LogIn
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton (
                key: Key("LogInButton"),
                onPressed: () {
                  // Obtenemos los valores de los cuadros de texto
                  String username = usernameController.text;
                  String pass = contraController.text;
                  // Comprobamos que tengan texto
                  if(u.contieneTexto(username) && u.contieneTexto(pass)){
                    dbc.login(username, u.cadToMD5(pass));
                  }else{
                    u.mostrarAlertas(context, "Debe introducir un usuario y una contraseña valida. ");
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(200.0, 50.0),
                  ),
                ),
              ),
            ),
            // Boton Crear Cuenta
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton (
                key: Key("SingUp"),
                onPressed: () {
                  // Nos dirigimos a la pantalla de creacion de cuenta
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAccount()),
                  );
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(200.0, 50.0),
                  ),
                ),
                child: Row(
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
            )
          ],
        ),
      ),
    );
  }
}
