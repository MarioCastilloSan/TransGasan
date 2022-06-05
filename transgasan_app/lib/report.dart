import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transgasan_app/startLogin.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

bool fuelCheck = false;
bool oilCheck = false;
bool greaseCheck = false;
bool hydraCheck = false;
String dateText= '';

final guideCon = new TextEditingController();
final driverCon = new TextEditingController();
final obvsCon = new TextEditingController();
final plateCon = new TextEditingController();
final consCon = new TextEditingController();
final inkmCon = new TextEditingController();
final outkmCon = new TextEditingController();
final lapsCon = new TextEditingController();
final fuelMCon = new TextEditingController();
final oilMCon = new TextEditingController();
final greaseMCon = new TextEditingController();
final hydraMCon = new TextEditingController();
class report extends StatefulWidget {
  const report({Key? key}) : super(key: key);

  @override
  State<report> createState() => _reportState();
}

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
              _checkbox(),
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
          controller: guideCon,
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
          controller: driverCon,
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
          controller:obvsCon ,
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
          controller: plateCon,
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
          controller: consCon,
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
              maxTime: DateTime(2031, 6, 7),onConfirm: (date) {
            print('confirm $date');
          }, currentTime: DateTime.now(), locale: LocaleType.es);
          dateText=DateTime.now().toString();
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
          controller: inkmCon,
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
          controller: outkmCon,
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
          controller: lapsCon,
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


class _fuel extends StatefulWidget {
  const _fuel({Key? key}) : super(key: key);

  @override
  State<_fuel> createState() => _fuelState();
}

class _fuelState extends State<_fuel> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller:fuelMCon,
            enabled: fuelCheck,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
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
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller:oilMCon,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
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
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: greaseMCon,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
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
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller:hydraMCon ,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
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
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Enviar Reporte'),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
        onPressed: () {
          print(dataToJson());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const startLogin()),
          );
        },
      );
    },
  );
}
String dataToJson(){

  var data='{"number":'+guideCon.text+', "name":'+driverCon.text+',"licensePlate":'+plateCon.text+',"conSite":'+consCon.text+',"date":'+dateText+',"inKm":'+inkmCon.text+',"outKm":'+outkmCon.text+',"activity":'+lapsCon.text+',"fuel":'+fuelMCon.text+',"oilM":'+oilMCon.text+',"greaseM":'+greaseMCon.text+',"hydraulicM":'+hydraMCon.text+',"observation":'+obvsCon.text+'}';

  return data;

}
class _checkbox extends StatefulWidget {
  const _checkbox({Key? key}) : super(key: key);

  @override
  State<_checkbox> createState() => _checkboxState();
}

class _checkboxState extends State<_checkbox> {


  @override
  Widget build(BuildContext context) {


    return CheckboxListTile(
      title: Text('¿Se realizo una carga de combustible?'),
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


