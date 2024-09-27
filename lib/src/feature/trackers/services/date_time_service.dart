import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeService {
  static Future<void> selectedTime(
    BuildContext context,
    void Function(DateTime) onPressed,
  ) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height *
              0.35, // Бийиктигин бир аз чоңойттук
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time, // Убакытты тандоо үчүн режим
            onDateTimeChanged: onPressed,
            initialDateTime: DateTime.now(),
            use24hFormat: false, // AM/PM форматында көрсөтүү
            minimumYear: 2000,
            maximumYear: 3000,
          ),
        );
      },
    );
  }
}
