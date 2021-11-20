import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/todo.dart';

class ToDoDao {
  Database? database;
  final dbName = 'todo.db';

  Future open(String dbName) async {
    database = await openDatabase(
      join(await getDatabasesPath(), dbName),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'create table ToDo(id integer primary key unique, title text, toDoTime text, isDone integer)',
        );
      },
    );
  }

  void insert(ToDo toDo) async {
    await open(dbName);
    await database?.insert('ToDo', toDo.toMap());
    await close();
  }

  Future<List<ToDo>> getToDos() async {
    await open(dbName);
    final List<Map<String, dynamic>>? maps = await database?.query('ToDo');
    await close();
    return List.generate(
      maps!.length,
      (index) => ToDo(
        id: maps[index]['id'],
        title: maps[index]['title'],
        toDoTime: DateTime.parse(maps[index]['toDoTime']),
        isDone: maps[index]['isDone'] == 1 ? true : false,
      ),
    );
  }

  void done(int id) async {
    await open(dbName);
    await database?.update(
      'ToDo',
      {'isDone': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
    await close();
  }

  void delete(int id) async {
    await open(dbName);
    await database?.delete('ToDo', where: 'id = ?', whereArgs: [id]);
    await close();
  }

  Future close() async => database?.close();
}
