import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async =>
      _database ??= await _initializeDatabase();

  Future<Database> _initializeDatabase() async {
    String directory = await getDatabasesPath();
    String path = "${directory}local.db";

    return await openDatabase(path, version: 1, onCreate: (db, version) {
      _executeIngredientTable(db);
    });
  }

  Future<void> clearTables() async {
    await _database?.delete(dbIngredientTable);
  }

  void _executeIngredientTable(Database db) {
    db.execute('''
        create table $dbIngredientTable (
        $dbIngredientId integer primary key autoincrement,
        $dbIngredientProductId text not null,
        $dbIngredientDescription text,
        $dbIngredientMeasurement text not null,
        $dbIngredientValue text not null,
        $dbIngredientActive integer)
      ''');
  }
}

const String dbIngredientTable = 'ingredientTable';
const String dbIngredientId = 'id';
const String dbIngredientProductId = 'productId';
const String dbIngredientDescription = 'description';
const String dbIngredientMeasurement = 'measurement';
const String dbIngredientValue = 'value';
const String dbIngredientActive = 'active';
