import 'package:flutter/material.dart';
import 'package:transgasan_app/login_page.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute:LoginPage.id ,
      routes: {
        LoginPage.id :(context) => LoginPage(),
      },
    );
  }
}
