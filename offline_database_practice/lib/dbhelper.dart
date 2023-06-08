import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class dbhelper {
  Future<Database> createDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo_database.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE mycontactbook(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, number TEXT)');
    });

    return database;
  }
}
