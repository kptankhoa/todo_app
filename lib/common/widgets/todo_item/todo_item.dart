import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/common/widgets/modified/outlined_container/outlined_container.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';

class ToDoItem extends StatefulWidget {
  final ToDo toDo;

  const ToDoItem({Key? key, required this.toDo}) : super(key: key);

  @override
  _ToDoItemState createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    ToDo _toDo = widget.toDo;
    return OutlinedContainer(
      borderColor: _toDo.isDone ? AppColor.disabled : AppColor.active,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _toDo.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('H:m:s dd/MM/yyyy').format(_toDo.todoTime),
                  style: const TextStyle(color: AppColor.disabled),
                ),
              ],
            ),
          ),
          if (!_toDo.isDone)
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.active),
              ),
              child:
                  const Text('SET DONE', style: TextStyle(color: Colors.white)),
            )
        ],
      ),
    );
  }
}
