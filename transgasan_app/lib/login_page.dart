import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transgasan_app/startLogin.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'images/logo.png',
                  height: 380.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextField(),
              SizedBox(
                height: 20.0,
              ),
              _passwordTextField(),
              SizedBox(
                height: 20.0,
              ),
              _buttonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'ejemplousuario',
              labelText: 'Tu Usuario',
            ),
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Contraseña',
              labelText: 'Contraseña',
            ),
          ),
        );
      },
    );
  }

  Widget _buttonLogin() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Iniciar Sesion'),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const startLogin()),
            );
          },
        );
      },
    );
  }
}
