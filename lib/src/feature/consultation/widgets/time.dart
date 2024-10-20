import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mama/src/data.dart';

class ConsultationTime extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  const ConsultationTime({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    String formatDate(DateTime start, DateTime end) {
      final now = DateTime.now();
      final dateFormat = DateFormat('H:mm');

      if (start.year == now.year &&
          start.month == now.month &&
          start.day == now.day) {
        return '${t.home.today} ${dateFormat.format(start)}–${dateFormat.format(end)}';
      } else {
        return '${start.day} ${t.home.monthsData[start.month]} ${dateFormat.format(start)}–${dateFormat.format(end)}';
      }
    }

    return SizedBox(
      height: 20,
      child: FittedBox(
        child: AutoSizeText(
          formatDate(startDate, endDate),
          maxLines: 1,
          style: textTheme.titleMedium,
        ),
      ),
    );
  }
}
