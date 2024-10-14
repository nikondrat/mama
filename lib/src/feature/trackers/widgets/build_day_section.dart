import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class BuildDaySection extends StatelessWidget {
  const BuildDaySection(
    this.date,
    this.items, {
    super.key,
  });

  final String date;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: AppTextStyles.f14w400,
          ),
          10.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  children: items,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
