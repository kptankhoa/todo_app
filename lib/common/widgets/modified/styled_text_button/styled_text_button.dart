import 'package:flutter/material.dart';

class StyledTextButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final Color bgColor;
  final Color textColor;

  const StyledTextButton(
    this.content, {
    Key? key,
    required this.onPressed,
    this.bgColor = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          foregroundColor: MaterialStateProperty.all(textColor),
          padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
          elevation: MaterialStateProperty.all(0),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Text(content),
      ),
    );
  }
}
