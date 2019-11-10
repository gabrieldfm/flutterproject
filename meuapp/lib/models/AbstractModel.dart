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
      //await deleteDatabase(path);

      this._db = await openDatabase(
        path, 
        version: dbversion,
        onCreate: (Database db, int version) async{
          //criação tabelas
          dbCreate.forEach((String sql) {
            db.execute(sql);
          });
        }
      );

    }

    return this._db;
  }

  Future<Database> getDb() async {
    return await this.init();
  }

  Future<List<Map>> getItem(dynamic where);
  
}