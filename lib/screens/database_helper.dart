import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // Create your searches table here
        return db.execute('''
          CREATE TABLE searches(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            symbol TEXT,
            name TEXT,
            image TEXT
          )
        ''');
      },
    );
  }

  // Method to insert a search
  Future<void> insertSearch(Map<String, dynamic> search) async {
    final db = await database;
    await db.insert(
      'searches',
      search,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Method to get all searches
  Future<List<Map<String, dynamic>>> getSearches() async {
    final db = await database;
    return await db.query('searches');
  }

  // Method to delete a search
  Future<void> deleteSearch(int id) async {
    final db = await database;
    await db.delete(
      'searches',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}