import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel(
      {required this.id,
      required this.number,
      required this.licensePlate,
      required this.date,
      required this.inKm,
      required this.outKm,
      required this.activity,
      required this.fuel,
      required this.oilM,
      required this.graseM,
      required this.hydraulicM,
      required this.observations});

  ObjectId id;
  int number;
  String licensePlate;
  String date;
  int inKm;
  int outKm;
  String activity;
  int fuel;
  int oilM;
  int graseM;
  int hydraulicM;
  String observations;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
      id: json["_id"],
      number: json["number"],
      licensePlate: json["lisencePlate"],
      date: json["date"],
      inKm: json["inKm"],
      outKm: json["outKm"],
      activity: json["activity"],
      fuel: json["fuel"],
      oilM: json["oilM"],
      graseM: json["graseM"],
      hydraulicM: json["hydraulicM"],
      observations: json["observations"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "number": number,
        "licensePlate": licensePlate,
        "date": date,
        "inKm": inKm,
        "outKm": outKm,
        "activity": activity,
        "fuel": fuel,
        "oilM": oilM,
        "graseM": graseM,
        "hydraulicM": hydraulicM,
        "observations": observations
      };
}
