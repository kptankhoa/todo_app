import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/screens/new_todo/new_todo_screen.dart';
import 'package:todo_app/screens/todo_detail/todo_detail_screen.dart';
import 'package:todo_app/common/const.dart';


Map<String, WidgetBuilder> getRoutes() => {
  '/home': (context) => HomeScreen(toDoList: dummyToDoList),
  '/new_todo': (context) => const NewTodoScreen(),
};

Route<dynamic> getGeneratedRoute(RouteSettings settings) {
  switch(settings.name){
    case '/todo_detail': {
      var id = settings.arguments as String;
      print(id);
      return MaterialPageRoute(builder: (context) => const ToDoDetailScreen());
    }
  }
  return MaterialPageRoute(builder: (context) => Container());
}