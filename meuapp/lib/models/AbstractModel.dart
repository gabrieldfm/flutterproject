import 'package:sqflite/sqflite.dart';
import 'package:meuapp/application.dart';

abstract class AbstractModel{

  Database _db;

  String get dbname;

  int get dbversion;

  Future<Database> init() async{

    if(this._db == null){
      var databasesPath = await getDatabasesPath();
      String path = databasesPath+dbname;

      //delete database
      await deleteDatabase(path);

    }

    return this._db;
  }
  
}