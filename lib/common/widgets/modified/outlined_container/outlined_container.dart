import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class OutlinedContainer extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final double padding;
  final Color borderColor;
  final double verticalMargin;

  const OutlinedContainer({
    Key? key,
    required this.child,
    this.padding = 12,
    this.verticalMargin = 6,
    this.borderColor = AppColor.disabled,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(vertical: verticalMargin),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
