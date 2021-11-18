import 'package:flutter/material.dart';
import 'package:todo_app/common/widgets/modified/outlined_date_picker/outlined_date_picker.dart';
import 'package:todo_app/common/widgets/modified/outlined_text_field/outlined_text_field.dart';
import 'package:todo_app/common/widgets/modified/styled_text_button/styled_text_button.dart';
import 'package:todo_app/model/todo.dart';

class NewTodoScreen extends StatefulWidget {
  const NewTodoScreen({Key? key}) : super(key: key);

  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  Map<String, dynamic> newToDoValue = {
    'title': null,
    'time': null,
  };

  void updateForm(String key, dynamic value) {
    setState(() => newToDoValue[key] = value);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Function(ToDo) addNewToDo = args['function'] as Function(ToDo);
    int newIndex = args['newIndex'] as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Create new To do')),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedTextField(
                    label: 'To Do Title',
                    onChanged: (value) => updateForm('title', value),
                  ),
                  OutLinedDatePicker(
                    currentTime: newToDoValue['time'],
                    onConfirm: (value) => updateForm('time', value),
                  ),
                  StyledTextButton(
                    'Add To Do',
                    onPressed: () {
                      addNewToDo(
                        ToDo(
                          id: newIndex,
                          title: newToDoValue['title'],
                          toDoTime: newToDoValue['time'],
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
