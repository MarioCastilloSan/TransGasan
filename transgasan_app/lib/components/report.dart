import 'package:flutter/material.dart';
import 'package:transgasan_app/common/theme_helper.dart';
import 'package:transgasan_app/pages/widgets/header_widget.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dashboard.dart';
import '../models/report.dart';
import 'package:dio/dio.dart';

String dateText = '';

bool fuelCheck = false;

// ignore: camel_case_types
class report extends StatefulWidget {
  const report({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _reportPageState();
  }
}

// ignore: camel_case_types
class _reportPageState extends State<report> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  ReportData reportdata =
      ReportData('', '', '', '', '', '', '', '', '', '', '', '', '');
  Future submit() async {
    BaseOptions options = BaseOptions(
      baseUrl: "http://192.168.1.10:3000",
      connectTimeout: 3000,
      receiveTimeout: 3000,
    );
    print(reportdata.printData());
    // print(reportdata.);
    // print(reportdata.toString());
    // print(reportdata.toString());
    // print(reportdata.toString());
    // print(reportdata.toString());
    // print(reportdata.toString());
    // print(reportdata.toString());
    // print(reportdata.toString());
    // print(reportdata.toString());
    // print(reportdata.toString());
    // print(reportdata.toString());
    // print(reportdata.toString());

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const ProfilePage()),
        (Route<dynamic> route) => false);

    // Dio dio = Dio(options);
    // dio.options.headers['content-Type'] = 'application/json;charSet=UTF-8';
    // try {
    //   var response = await dio.post("/guide", data: {reportdata});

    //   if (response.statusCode == 200) {
    //     // ignore: avoid_print
    //     print(response.data);
    //     Navigator.of(context).pushAndRemoveUntil(
    //         MaterialPageRoute(builder: (context) => const ProfilePage()),
    //         (Route<dynamic> route) => false);
    //   } else if (response.statusCode == 401) {
    //     // ignore: avoid_print
    //     print(response.statusCode);
    //   }
    // } catch (e) {
    //   // ignore: avoid_print
    //   print(e);
    //   throw ('Error en el POST');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/miniLogo.png',
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.scaleDown,
                                  ), //put your logo here
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                'Numero de la guia', 'Numero de la guia'),
                            onChanged: (valueGuia) {
                              reportdata.numberGuide = valueGuia;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                'Este dato se autocompleta desde la bd',
                                'Conductor del camion'),
                            onChanged: (valueDrive) {
                              reportdata.driverName = valueDrive;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Se ingresa los datos considerados pertinentes, engrasado,cargado de combustible etc.",
                                "Observaciones del dia"),
                            onChanged: (valueO) {
                              reportdata.observations = valueO;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Este dato se autocompleta desde la bd",
                                "Patente del Camión"),
                            onChanged: (valueLisence) {
                              reportdata.linsencePlate = valueLisence;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Ingrese el nombre del Pozo",
                                "Nombre del pozo actual"),
                            onChanged: (valueTruck) {
                              reportdata.nameTruck = valueTruck;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        _date(reportdata),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Ingrese el kilometraje inicial",
                                "El kilometraje inicial"),
                            onChanged: (valueKm) {
                              reportdata.inKm = valueKm;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Ingrese el kilometraje final",
                                "El kilometraje final"),
                            onChanged: (valueKm) {
                              reportdata.outKm = valueKm;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Vueltas realizadas", "Vueltas del dia"),
                            onChanged: (valueLaps) {
                              reportdata.laps = valueLaps;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            fuelCheck = value!;
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    const Text(
                                      "¿Se realizó mantención?",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return null;
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Combustible cargado",
                                "Ingresar el combustible cargado en el dia en caso de realizarse"),
                            onChanged: (valueFuel) {
                              reportdata.fuel = valueFuel;
                            },
                            keyboardType: TextInputType.number,
                            enabled: fuelCheck,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Mantencion de Aceite",
                                "Ingresar si se realizo una mantencion de aceite"),
                            onChanged: (valueOil) {
                              reportdata.oilM = valueOil;
                            },
                            enabled: fuelCheck,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Mantencion de Engrasado",
                                "Ingresar si se realizo una mantencion de engrasado"),
                            onChanged: (valueGrase) {
                              reportdata.graseM = valueGrase;
                            },
                            enabled: fuelCheck,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Mantencion Hidraulica",
                                "Ingresar si se realizo una mantencion hidraulica"),
                            onChanged: (valueHyd) {
                              reportdata.hydraulicM = valueHyd;
                            },
                            enabled: fuelCheck,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Enviar Reporte",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                submit();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _date(reportdata) {
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
            reportdata.date = date.toString();
            // print(reportdata.date);
          }, currentTime: DateTime.now(), locale: LocaleType.es);
          dateText = DateTime.now().toString();
        },
      );
    },
  );
}
