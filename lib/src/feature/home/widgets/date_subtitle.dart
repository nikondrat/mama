import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mama/src/data.dart';

class DateSubtitle extends StatelessWidget {
  const DateSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    final String locale =
        TranslationProvider.of(context).flutterLocale.languageCode;

    final DateTime today = DateTime.now();

    String dayOfWeek = DateFormat.EEEE(locale).format(today);
    String day = DateFormat.d(locale).format(today);

    return AutoSizeText(
      '${t.home.today} $dayOfWeek $day ${t.home.monthsData[today.month]}',
      style: const TextStyle(fontSize: 17),
      maxLines: 1,
    );
  }
}
