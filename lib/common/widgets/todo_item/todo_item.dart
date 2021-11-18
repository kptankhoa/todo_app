import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/common/widgets/modified/outlined_container/outlined_container.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo toDo;
  final Function() setItemDone;

  const ToDoItem({Key? key, required this.toDo, required this.setItemDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      borderColor: toDo.isDone ? AppColor.disabled : AppColor.active,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  toDo.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('H:m:s dd/MM/yyyy').format(toDo.toDoTime),
                  style: const TextStyle(color: AppColor.disabled),
                ),
              ],
            ),
          ),
          if (!toDo.isDone)
            IconButton(onPressed: setItemDone, icon: const Icon(Icons.check), color: AppColor.active)
        ],
      ),
    );
  }
}
