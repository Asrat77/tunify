import 'db_connect.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnection? _databaseConnection;

  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _databaseConnection!.setDatabase();
    return _database!;
  }
  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }

}