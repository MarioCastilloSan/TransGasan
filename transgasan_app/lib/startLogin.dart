import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transgasan_app/login_page.dart';
import 'package:transgasan_app/report.dart';




class startLogin extends StatelessWidget {
  const startLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Bienvenido'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset('images/logo.png',
                  height: 380.0,),
              ),
              SizedBox(height: 20.0,),
              _buttonReport(),
              SizedBox(height: 20.0,),
              _buttonClose(),

            ],
          ),
        ),
      ),
    );
  }
}
Widget _buttonReport() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:35.0, vertical : 15.0),
          child: Text('Ingresar un reporte'),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                )
            )

        ),

        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const report()),
          );
        },
      );
    },
  );
}
Widget _buttonClose() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:80.0, vertical : 15.0),
          child: Text('Salir'),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                )
            )

        ),

        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>  LoginPage()),
          );
        },
      );
    },
  );
}
