import 'package:flutter/material.dart';
import 'package:todo_app/common/widgets/modified/scroll_list_view/scroll_list_view.dart';
import 'package:todo_app/common/widgets/todo_item/todo_item.dart';
import 'package:todo_app/model/todo_list.dart';

class ToDoListView extends StatelessWidget {
  final ToDoList toDoList;
  final Function(int) setDone;
  const ToDoListView({Key? key, required this.toDoList, required this.setDone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollListView(
      itemCount: toDoList.list.length,
      itemBuilder: (context, index) =>
          ToDoItem(toDo: toDoList.list[index], setItemDone: () => setDone(index)),
    );
  }
}
