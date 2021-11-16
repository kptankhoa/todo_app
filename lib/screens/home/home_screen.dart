import 'package:flutter/material.dart';
import 'package:todo_app/common/const.dart';
import 'package:todo_app/common/widgets/search_bar/search_bar.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo_list.dart';
import 'package:todo_app/screens/home/widgets/todo_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final ToDoList _toDoList = dummyToDoList;
  String _searchContent = '';
  int _selectedIndex = 0;
  ToDoList _activeToDoList = _toDoList;
  ToDoList _searchedToDoList = _toDoList;

  ValueChanged<String>? onSearchContentChange(String value) {
    setState(() {
      _searchContent = value;
      _searchedToDoList = _activeToDoList.searchByTitle(value);
    });
  }

  void setDone(int index) => setState(() {
        _toDoList.list[index].setDone();
      });

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        return setState(() => _activeToDoList = _toDoList);
      case 1:
        return setState(() => _activeToDoList = _toDoList.getTodayToDos());
      case 2:
        return setState(() => _activeToDoList = _toDoList.getUpcomingToDos());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => Navigator.pushNamed(context, '/new_todo'),
              tooltip: 'Add new Todo',
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: SearchBar(
                  onTextChange: onSearchContentChange,
                ),
              ),
              Expanded(
                child: ToDoListView(
                  toDoList: _searchContent.isEmpty
                      ? _activeToDoList
                      : _searchedToDoList,
                  setDone: setDone,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildNavBar(),
      ),
    );
  }

  Widget _buildNavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'All',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_view_day),
          label: 'Today',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: 'Upcoming',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: AppColor.active,
      onTap: _onItemTapped,
    );
  }
}
