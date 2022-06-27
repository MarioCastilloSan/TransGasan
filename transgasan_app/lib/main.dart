import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:transgasan_app/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color _primaryColor = HexColor('#17202A');
  final Color _secondaryColor = HexColor('#1B2631');

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TransGasan Enterprise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: _primaryColor,
          accentColor: _secondaryColor,
          scaffoldBackgroundColor: Colors.grey.shade100,
          primarySwatch: Colors.grey),
      home: const SplashScreen(title: 'Flutter Login UI'),
    );
  }
}
