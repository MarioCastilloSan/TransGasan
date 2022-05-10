import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transgasan_app/startLogin.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class report extends StatelessWidget {
  const report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reportes'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Flexible(
                child: Image.asset(
                  'images/logo.png',
                  height: 380.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              _guideNumber(),
              SizedBox(
                height: 20.0,
              ),
              _driverName(),
              SizedBox(
                height: 20.0,
              ),
              _observations(),
              SizedBox(
                height: 20.0,
              ),
              _licensePlate(),
              SizedBox(
                height: 20.0,
              ),
              _conSite(),
              SizedBox(
                height: 20.0,
              ),
              _date(),
              SizedBox(
                height: 20.0,
              ),
              _inKM(),
              SizedBox(
                height: 20.0,
              ),
              _outKM(),
              SizedBox(
                height: 20.0,
              ),
              _activity(),
              SizedBox(
                height: 20.0,
              ),
              _fuel(),
              SizedBox(
                height: 20.0,
              ),
              _oilM(),
              SizedBox(
                height: 20.0,
              ),
              _greaseM(),
              SizedBox(
                height: 20.0,
              ),
              _hydraulicM(),
              SizedBox(
                height: 20.0,
              ),
              _buttonClose(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _guideNumber() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.web_rounded),
            hintText: 'Numero de la guia',
            labelText: 'Numero de la guia',
          ),
        ),
      );
    },
  );
}

Widget _driverName() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.account_circle),
            hintText: 'Conductor del camion',
            labelText: 'Este dato se autocompleta desde la bd',
          ),
        ),
      );
    },
  );
}

Widget _observations() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.add_box),
            hintText: 'Observaciones del dia',
            labelText:
                'Se ingresa los datos considerados pertinentes, engrasado,cargado de combustible etc.',
          ),
        ),
      );
    },
  );
}

Widget _licensePlate() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.assignment),
            hintText: 'Patente del Camión',
            labelText: 'Este dato se autocompleta desde la bd',
          ),
        ),
      );
    },
  );
}

Widget _conSite() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.wallet_travel),
            hintText: 'Nombre del pozo actual',
            labelText: 'Ingrese el nombre del Pozo',
          ),
        ),
      );
    },
  );
}

Widget _date() {
  DateTime selectedDate = DateTime.now();
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Ingrese la fecha '),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
        onPressed: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(2018, 3, 5),
              maxTime: DateTime(2031, 6, 7), onChanged: (date) {
            print('change $date');
          }, onConfirm: (date) {
            print('confirm $date');
          }, currentTime: DateTime.now(), locale: LocaleType.es);
        },
      );
    },
  );
}

Widget _inKM() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(Icons.wysiwyg),
            hintText: 'El kilometraje inicial',
            labelText: 'Ingrese el kilometraje inicial',
          ),
        ),
      );
    },
  );
}

Widget _outKM() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(Icons.wysiwyg),
            hintText: 'El kilometraje final',
            labelText: 'Ingrese el kilometraje final',
          ),
        ),
      );
    },
  );
}

Widget _activity() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.add_box_rounded),
            hintText: 'Vueltas del dia',
            labelText: 'Vueltas realizadas',
          ),
        ),
      );
    },
  );
}

Widget _fuel() {
  bool isChecked = false;
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.add_box_sharp),
            hintText: 'Combustible cargado',
            labelText:
                'Ingresar el combustible cargado en el dia en caso de realizarse',
          ),
        ),
      );
      return Checkbox(
        checkColor: Colors.white,
        value: isChecked,
        onChanged: (bool? value) {
          isChecked = value!;
        },
      );
    },
  );
}

Widget _oilM() {
  bool isChecked = false;
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.add_box_sharp),
            hintText: 'Mantencion de Aceite ',
            labelText: 'Ingresar si se realizo una mantencion de aceite',
          ),
        ),
      );
      return Checkbox(
        checkColor: Colors.white,
        value: isChecked,
        onChanged: (bool? value) {
          isChecked = value!;
        },
      );
    },
  );
}

Widget _greaseM() {
  bool isChecked = false;
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.add_box_sharp),
            hintText: 'Mantencion de Aceite ',
            labelText: 'Ingresar si se realizo una mantencion de engrasado',
          ),
        ),
      );
      return Checkbox(
        checkColor: Colors.white,
        value: isChecked,
        onChanged: (bool? value) {
          isChecked = value!;
        },
      );
    },
  );
}

Widget _hydraulicM() {
  bool isChecked = false;
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.add_box_sharp),
            hintText: 'Mantencion Hidraulica ',
            labelText: 'Ingresar si se realizo una mantencion hidraulica',
          ),
        ),
      );
      return Checkbox(
        checkColor: Colors.white,
        value: isChecked,
        onChanged: (bool? value) {
          isChecked = value!;
        },
      );
    },
  );
}

Widget _buttonClose() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Enviar Reporte'),
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
