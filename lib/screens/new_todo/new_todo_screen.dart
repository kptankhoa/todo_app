import 'package:flutter/material.dart';

class NewTodoScreen extends StatefulWidget {
  const NewTodoScreen({Key? key}) : super(key: key);

  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Create new To do')),
        body: const Center(
          child: Text('yes?'),
        ),
      ),
    );
  }
}
