// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transgasan_app/components/dashboard.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

bool fuelCheck = false;
bool oilCheck = false;
bool greaseCheck = false;
bool hydraCheck = false;
String dateText = '';

// ignore: unnecessary_new
final guideCon = new TextEditingController();
final driverCon = TextEditingController();
final obvsCon = TextEditingController();
final plateCon = TextEditingController();
final consCon = TextEditingController();
final inkmCon = TextEditingController();
final outkmCon = TextEditingController();
final lapsCon = TextEditingController();
final fuelMCon = TextEditingController();
final oilMCon = TextEditingController();
final greaseMCon = TextEditingController();
final hydraMCon = TextEditingController();

// ignore: camel_case_types
class report extends StatefulWidget {
  const report({Key? key}) : super(key: key);

  @override
  State<report> createState() => _reportState();
}

// ignore: camel_case_types
class _reportState extends State<report> {
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
              const SizedBox(
                height: 20.0,
              ),
              _guideNumber(),
              const SizedBox(
                height: 20.0,
              ),
              _driverName(),
              const SizedBox(
                height: 20.0,
              ),
              _observations(),
              const SizedBox(
                height: 20.0,
              ),
              _licensePlate(),
              const SizedBox(
                height: 20.0,
              ),
              _conSite(),
              const SizedBox(
                height: 20.0,
              ),
              _date(),
              const SizedBox(
                height: 20.0,
              ),
              _inKM(),
              const SizedBox(
                height: 20.0,
              ),
              _outKM(),
              const SizedBox(
                height: 20.0,
              ),
              _activity(),
              const SizedBox(
                height: 20.0,
              ),
              const _checkbox(),
              const SizedBox(
                height: 20.0,
              ),
              const _fuel(),
              const SizedBox(
                height: 20.0,
              ),
              _oilM(),
              const SizedBox(
                height: 20.0,
              ),
              _greaseM(),
              const SizedBox(
                height: 20.0,
              ),
              _hydraulicM(),
              const SizedBox(
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: guideCon,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: driverCon,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: obvsCon,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: plateCon,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: consCon,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
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
  // ignore: unused_local_variable
  DateTime selectedDate = DateTime.now();
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: const Text('Ingrese la fecha '),
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
              maxTime: DateTime(2031, 6, 7), onConfirm: (date) {
            // print('confirm $date');
          }, currentTime: DateTime.now(), locale: LocaleType.es);
          dateText = DateTime.now().toString();
        },
      );
    },
  );
}

Widget _inKM() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: inkmCon,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: outkmCon,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: lapsCon,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            icon: Icon(Icons.add_box_rounded),
            hintText: 'Vueltas del dia',
            labelText: 'Vueltas realizadas',
          ),
        ),
      );
    },
  );
}

// ignore: camel_case_types
class _fuel extends StatefulWidget {
  const _fuel({Key? key}) : super(key: key);

  @override
  State<_fuel> createState() => _fuelState();
}

// ignore: camel_case_types
class _fuelState extends State<_fuel> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: fuelMCon,
            enabled: fuelCheck,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              icon: Icon(Icons.add_box_sharp),
              hintText: 'Combustible cargado',
              labelText:
                  'Ingresar el combustible cargado en el dia en caso de realizarse',
            ),
          ),
        );
      },
    );
  }
}

Widget _oilM() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: oilMCon,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            icon: Icon(Icons.add_box_sharp),
            hintText: 'Mantencion de Aceite ',
            labelText: 'Ingresar si se realizo una mantencion de aceite',
          ),
        ),
      );
    },
  );
}

Widget _greaseM() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: greaseMCon,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            icon: Icon(Icons.add_box_sharp),
            hintText: 'Mantencion de Aceite ',
            labelText: 'Ingresar si se realizo una mantencion de engrasado',
          ),
        ),
      );
    },
  );
}

Widget _hydraulicM() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: hydraMCon,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            icon: Icon(Icons.add_box_sharp),
            hintText: 'Mantencion Hidraulica ',
            labelText: 'Ingresar si se realizo una mantencion hidraulica',
          ),
        ),
      );
    },
  );
}

Widget _buttonClose() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: const Text('Enviar Reporte'),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
        onPressed: () {
          // print(dataToJson());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const startLogin()),
          );
        },
      );
    },
  );
}

String dataToJson() {
  var data = '{"number":' +
      guideCon.text +
      ', "name":' +
      driverCon.text +
      ',"licensePlate":' +
      plateCon.text +
      ',"conSite":' +
      consCon.text +
      ',"date":' +
      dateText +
      ',"inKm":' +
      inkmCon.text +
      ',"outKm":' +
      outkmCon.text +
      ',"activity":' +
      lapsCon.text +
      ',"fuel":' +
      fuelMCon.text +
      ',"oilM":' +
      oilMCon.text +
      ',"greaseM":' +
      greaseMCon.text +
      ',"hydraulicM":' +
      hydraMCon.text +
      ',"observation":' +
      obvsCon.text +
      '}';

  return data;
}

// ignore: camel_case_types
class _checkbox extends StatefulWidget {
  const _checkbox({Key? key}) : super(key: key);

  @override
  State<_checkbox> createState() => _checkboxState();
}

// ignore: camel_case_types
class _checkboxState extends State<_checkbox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('¿Se realizo una carga de combustible?'),
      checkColor: Colors.white,
      value: fuelCheck,
      onChanged: (bool? value) {
        setState(() {
          fuelCheck = value!;
          _fuelState().activate();
        });
      },
    );
  }
}
