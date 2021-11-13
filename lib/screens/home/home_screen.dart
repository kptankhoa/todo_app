import 'package:flutter/material.dart';
import 'package:todo_app/common/widgets/modified/scroll_list_view/scroll_list_view.dart';
import 'package:todo_app/common/widgets/search_bar/search_bar.dart';
import 'package:todo_app/common/widgets/todo_item/todo_item.dart';
import 'package:todo_app/model/todo_list.dart';

class HomeScreen extends StatefulWidget {
  final ToDoList toDoList;

  const HomeScreen({Key? key, required this.toDoList}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ToDoList _toDoList = widget.toDoList;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: const SearchBar(),
              ),
              Expanded(
                child: ScrollListView(
                  itemCount: _toDoList.list.length,
                  itemBuilder: (context, index) =>
                      ToDoItem(toDo: _toDoList.list[index]),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/new_todo'),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
