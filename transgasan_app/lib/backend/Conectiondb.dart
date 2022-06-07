import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:transgasan_app/MongoDBModel.dart';
import 'package:transgasan_app/backend/Const.dart';

class Mongodb {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(url);
    await db.open();
    userCollection = db.collection(user_colection);
  }

  static insert(MongoDbModel data) async {
    try {
      var result = await userCollection.insertAll(data.toJson());
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
