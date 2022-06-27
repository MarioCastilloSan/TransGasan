import 'dart:async';

import 'package:flutter/material.dart';

import 'package:transgasan_app/components/singin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState() {
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Singin()),
            (route) => false);
      });
    });

    Timer(const Duration(milliseconds: 10), () {
      setState(() {
        _isVisible =
            true; // Now it is showing fade effect and navigating to Login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).accentColor,
            Theme.of(context).primaryColor
          ],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: const Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 160.0,
            width: 160.0,
            child: Center(
              child: ClipRRect(
                child: Image.asset(
                  'images/miniLogo.png',
                  height: 160,
                  width: 160,
                ), //put your logo here
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(0, 0, 0, 0),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                      blurRadius: 2.0,
                      offset: const Offset(4.0, .4),
                      spreadRadius: 2.0),
                ]),
          ),
        ),
      ),
    );
  }
}
