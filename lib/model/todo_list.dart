import 'package:todo_app/model/todo.dart';

class ToDoList {
  List<ToDo> list;

  ToDoList({required this.list});

  void add(ToDo newTodo) => list.add(newTodo);

  List<ToDo> getAll() => list;

  ToDoList getReverseList() => ToDoList(list: list.reversed.toList());

  ToDoList getUndoneToDoList() =>
      ToDoList(list: list.where((todo) => !todo.isDone).toList());

  ToDoList getDoneToDoList() =>
      ToDoList(list: list.where((todo) => todo.isDone).toList());

  ToDoList searchByTitle(String content) => ToDoList(
        list: list
            .where(
              (todo) =>
                  todo.title.toLowerCase().contains(content.toLowerCase()),
            )
            .toList(),
      );

  ToDoList getUpcomingToDos() {
    var now = DateTime.now();
    var tomorrowStart = DateTime(now.year, now.month, now.day + 1);
    return ToDoList(
      list: list.where((todo) => todo.toDoTime.isAfter(tomorrowStart)).toList(),
    );
  }

  ToDoList getTodayToDos() {
    var now = DateTime.now();
    var todayStart = DateTime(now.year, now.month, now.day);
    var tomorrowStart = DateTime(now.year, now.month, now.day + 1);
    return ToDoList(
      list: list
          .where(
            (todo) =>
                todo.toDoTime.isAfter(todayStart) &&
                todo.toDoTime.isBefore(tomorrowStart),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {'list': list.map((toDo) => toDo.toJson()).toList()};

  ToDoList.fromJson(Map<String, dynamic> json)
      : list = List<ToDo>.from(
          json['list'].map((toDoJson) => ToDo.fromJson(toDoJson)).toList(),
        );
}
