import 'package:flutter/material.dart';
import 'package:transgasan_app/components/dashboard.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';

import '../models/user.dart';

class Singin extends StatefulWidget {
  static String id = 'login_page';

  const Singin({Key? key}) : super(key: key);

  @override
  State<Singin> createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  final _formKey = GlobalKey<FormState>();
  User user = User('', '', '', '');

  Future submit() async {
    BaseOptions options = BaseOptions(
      baseUrl: "http://192.168.1.18:3000",
      connectTimeout: 3000,
      receiveTimeout: 3000,
    );
    Dio dio = Dio(options);
    dio.options.headers['content-Type'] = 'application/json;charSet=UTF-8';
    try {
      var response = await dio.post("/api/signin",
          data: {'username': user.userName, 'password': user.password});

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.data);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const startLogin()),
        );
      } else if (response.statusCode == 401) {
        // ignore: avoid_print
        print(response.statusCode);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw ('Error en el POST');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150.0,
              ),
              Positioned(
                  child: Image.asset(
                'images/logo.png',
                height: 380.0,
                width: MediaQuery.of(context).size.width,
              )),
              _userTextField(),
              const SizedBox(
                height: 20.0,
              ),
              _passwordTextField(),
              const SizedBox(
                height: 20.0,
              ),
              _buttonLogin(),
            ],
          ),
        ),
      )),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            controller: TextEditingController(text: user.userName),
            onChanged: (value) {
              user.userName = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.account_circle),
              hintText: 'Username',
              labelText: 'Username',
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            controller: TextEditingController(text: user.password),
            onChanged: (value) {
              user.password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            obscureText: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Password',
              labelText: 'Password',
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Iniciar Sesion'),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              submit();
            } else {
              // ignore: avoid_print
              print('error');
            }
          },
        );
      },
    );
  }
}
