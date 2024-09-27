import 'package:flutter/material.dart';

class DateSubtitle extends StatelessWidget {
  final String subtitle;

  const DateSubtitle({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(fontSize: 17),
    );
  }
}
