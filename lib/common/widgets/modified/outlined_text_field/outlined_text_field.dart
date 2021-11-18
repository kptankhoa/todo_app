import 'package:flutter/material.dart';
import 'package:todo_app/common/widgets/modified/outlined_container/outlined_container.dart';

class OutlinedTextField extends StatelessWidget {
  final String label;
  final Function(String) onChanged;
  final TextInputType keyboardType;

  const OutlinedTextField({
    Key? key,
    required this.label,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      padding: 8,
      child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            border: InputBorder.none,
            hintText: label,
          ),
        keyboardType: keyboardType,
        onChanged: (text) => onChanged(text),
      ),
    );
  }
}
