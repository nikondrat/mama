import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConsultationTime extends StatelessWidget {
  final DateTime startDate;
  const ConsultationTime({
    super.key,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return SizedBox(
      height: 20,
      child: FittedBox(
        child: AutoSizeText(
          DateFormat.yMMMd().format(startDate),
          maxLines: 1,
          style: textTheme.titleMedium,
        ),
      ),
    );
  }
}
