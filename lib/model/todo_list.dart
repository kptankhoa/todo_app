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

  List<ToDo> getUndoneList() => list.where((todo) => !todo.isDone).toList();

  List<ToDo> getDoneList() => list.where((todo) => todo.isDone).toList();
}
