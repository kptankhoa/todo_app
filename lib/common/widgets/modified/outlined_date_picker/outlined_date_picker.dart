import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/common/widgets/modified/outlined_container/outlined_container.dart';

class OutLinedDatePicker extends StatelessWidget {
  final Function(DateTime) onConfirm;
  final DateTime? currentTime;

  const OutLinedDatePicker({
    Key? key,
    required this.currentTime,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      padding: 8,
      onTap: () => _showDateTimePicker(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          (currentTime == null)
              ? 'Pick To Do Time'
              : DateFormat('H:m:s dd/MM/yyyy').format(currentTime!),
        ),
      ),
    );
  }

  void _showDateTimePicker(BuildContext context) => DatePicker.showDateTimePicker(
    context,
    showTitleActions: true,
    minTime: DateTime(2018, 3, 5),
    maxTime: DateTime(2019, 6, 7),
    onConfirm: (date) => onConfirm(date),
    currentTime: DateTime.now(),
    locale: LocaleType.en,
  );
}
