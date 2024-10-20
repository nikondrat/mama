import 'package:flutter/material.dart';

class RowStroriesData extends StatelessWidget {
  const RowStroriesData({
    super.key,
    required this.data,
    required this.week,
    required this.weight,
    required this.style,
  });

  final String data;
  final String week;
  final String weight;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data, style: style),
        Row(
          children: [
            Text(week, style: style),
            const SizedBox(width: 40),
            Text(weight, style: style),
            const SizedBox(width: 30),
          ],
        ),
      ],
    );
  }
}
