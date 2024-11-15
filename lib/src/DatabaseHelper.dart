import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'profile.db');

    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE profile(id INTEGER PRIMARY KEY, name TEXT, email TEXT, phone TEXT, imagePath TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<Map<String, dynamic>?> getProfile() async {
    final db = await database;
    final profiles = await db.query('profile');
    return profiles.isNotEmpty ? profiles.first : null;
  }

  Future<void> insertOrUpdateProfile(Map<String, dynamic> profile) async {
    final db = await database;
    await db.insert('profile', profile, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
