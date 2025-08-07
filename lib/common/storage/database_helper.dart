import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async =>
      _database ??= await _initializeDatabase();

  Future<Database> _initializeDatabase() async {
    String directory = await getDatabasesPath();
    String path = '${directory}local.db';

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        _executeShoppingListTable(db);
      },
    );
  }

  Future<void> clearTables() async {
    await _database?.delete(dbShoppingListTable);
  }

  void _executeShoppingListTable(Database db) {
    db.execute('''
        create table $dbShoppingListTable (
        $dbShoppingListId integer primary key autoincrement,
        $dbShoppingListProductId text,
        $dbShoppingListCustomName text,
        $dbShoppingListDescription text,
        $dbShoppingListMeasurement text not null,
        $dbShoppingListValue text not null,
        $dbShoppingListActive integer not null)
      ''');
  }
}

const String dbShoppingListTable = 'shoppingListTable';
const String dbShoppingListId = 'id';
const String dbShoppingListProductId = 'productId';
const String dbShoppingListCustomName = 'customName';
const String dbShoppingListDescription = 'description';
const String dbShoppingListMeasurement = 'measurement';
const String dbShoppingListValue = 'value';
const String dbShoppingListActive = 'active';
