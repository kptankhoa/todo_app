import 'package:todo_app/model/todo.dart';

class ToDoList {
  List<ToDo> list;

  ToDoList({required this.list});

  void add(ToDo newTodo) => list.add(newTodo);

  void doneAnItem(int doneTodoId) {
    ToDo doneItem = list.firstWhere((todo) => todo.id == doneTodoId);
    doneItem.setDone();
  }

  List<ToDo> getAll() => list;

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
      list: list.where((todo) => todo.todoTime.isAfter(tomorrowStart)).toList(),
    );
  }

  ToDoList getTodayToDos() {
    var now = DateTime.now();
    var todayStart = DateTime(now.year, now.month, now.day);
    var tomorrowStart = DateTime(now.year, now.month, now.day + 1);
    return ToDoList(
      list: list.where((todo) => todo.todoTime.isAfter(todayStart) && todo.todoTime.isBefore(tomorrowStart)).toList(),
    );
  }
}
