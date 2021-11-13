import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  final String label;
  final Function onChanged;
  final TextInputType keyboardType;

  const OutlinedTextField({
    Key? key,
    required this.label,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: label,
      ),
      keyboardType: keyboardType,
      onChanged: (text) => onChanged(text),
    );
  }
}
