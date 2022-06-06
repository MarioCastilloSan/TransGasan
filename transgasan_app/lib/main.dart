import 'package:flutter/material.dart';
import 'package:transgasan_app/components/singin.dart';
// ignore: unused_import
import 'package:cupertino_icons/cupertino_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TransGasan Enterprise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Singin.id,
      routes: {
        Singin.id: (context) => const Singin(),
      },
    );
  }
}
