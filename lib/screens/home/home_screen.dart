import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Todo List'),
        ),
        body: Column(

        ),
        floatingActionButton: FloatingActionButton(onPressed: () {  }, child: const Icon(Icons.add)),
      ),
    );
  }
}