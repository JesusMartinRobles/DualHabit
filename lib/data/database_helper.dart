import 'dart:async';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import '../domain/entities/habit.dart';

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

  // Inicialización de la base de datos
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'habits.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE habits(
            id TEXT PRIMARY KEY,
            name TEXT,
            creationDate TEXT,
            isCompletedToday INTEGER
          )
        ''');
      },
      version: 1,
    );
  }

  // Insertar un hábito
  Future<int> insertHabit(Habit habit) async {
    final db = await database;
    return await db.insert('habits', habit.toMap());
  }

  // Obtener todos los hábitos
  Future<List<Habit>> getHabits() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('habits');
    return List.generate(maps.length, (i) {
      return Habit.fromMap(maps[i]);
    });
  }

  // Actualizar un hábito
  Future<int> updateHabit(Habit habit) async {
    final db = await database;
    return await db.update(
      'habits',
      habit.toMap(),
      where: 'id = ?',
      whereArgs: [habit.id],
    );
  }

  // Eliminar un hábito
  Future<int> deleteHabit(String id) async {
    final db = await database;
    return await db.delete(
      'habits',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
