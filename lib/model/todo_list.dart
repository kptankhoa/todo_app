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
}
