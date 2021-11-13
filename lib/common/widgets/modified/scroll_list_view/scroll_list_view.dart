import 'package:flutter/material.dart';

class ScrollListView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int? itemCount;

  const ScrollListView({
    Key? key,
    this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        ],
      ),
    );
  }
}
