import 'package:todo_app/model/todo.dart';
import 'package:todo_app/model/todo_list.dart';

ToDoList dummyToDoList = ToDoList(
  list: [
    ToDo(
      id: 1,
      title: 'Do something',
      todoTime: DateTime.utc(2021, 11, 12, 8, 20, 0),
      isDone: true,
    ),
    ToDo(
      id: 2,
      title: 'Do something else',
      todoTime: DateTime.utc(2021, 11, 12, 8, 40, 0),
    ),
    ToDo(
      id: 3,
      title: 'Do something more',
      todoTime: DateTime.utc(2021, 11, 19, 12, 48, 0),
      isDone: true,
    ),
    ToDo(
      id: 4,
      title: 'Do something bad',
      todoTime: DateTime.utc(2021, 11, 16, 3, 20, 0),
      isDone: true,
    ),
    ToDo(
      id: 5,
      title: 'Do something good',
      todoTime: DateTime.utc(2021, 11, 12, 2, 50, 0),
    ),
    ToDo(
      id: 5,
      title: 'Do something good',
      todoTime: DateTime.utc(2021, 11, 18, 2, 50, 0),
    ),
  ],
);
