import 'package:expensetracker/core/sqflite_db/sqfliteDB_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _db;
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'allTables.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("PRAGMA foreign_keys = ON");
        await _createTables(db);
      },
    );
  }

  Future<void> _createTables(Database db) async {
    await db.execute('''
    CREATE TABLE ${SqfliteTableNames.categoryTable} (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      categoryName TEXT NOT NULL,
      iconCodePoint TEXT,
      iconFamily TEXT,
      createdTime TEXT NOT NULL,
      updatedTime TEXT NOT NULL,
      priority INTEGER NOT NULL,
      isActive INTEGER NOT NULL
    )
  ''');
  }
}
