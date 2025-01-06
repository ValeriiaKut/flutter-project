import 'package:dsw51765/views/widgets/notes_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{
  static final DataBaseHelper _instance = DataBaseHelper._internal();
  static Database? _dataBase;

  factory DataBaseHelper()=> _instance;
  DataBaseHelper._internal();

  Future<Database> get dataBase async{
    if(_dataBase !=null) return _dataBase!;
    _dataBase = (await _initDataBase()) as Database?;
    return _dataBase!;
  }

  Future<Database> _initDataBase() async{
    final path = join(await getDatabasesPath(), 'my_notes.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }


  Future<void> _onCreate(Database db, int version) async {
    await db.execute(''' 




    CREATE TABLE Notes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      content TEXT,
      color TEXT,
      dateTime TEXT
    )
  ''');
  }


  Future<int> insertNote(Note note) async{
    final db = await dataBase;
    return db.insert('notes', note.toMap());
  }
  Future<List<Note>> getNotes()async{
    final db = await dataBase;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }

  Future<int> updateNote(Note note) async{
    final db = await dataBase;
     return db.update(
       'notes',
       note.toMap(),
       where: 'id = ?',
       whereArgs: [note.id],
     );
  }

  Future<int> deleteNote(int id) async {
    final db = await dataBase;
    return db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
