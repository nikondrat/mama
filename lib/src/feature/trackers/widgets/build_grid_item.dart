import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class BuilldGridItem extends StatelessWidget {
  const BuilldGridItem(
    this.time,
    this.type,
    this.description,
    this.color,
    this.textColor, {
    super.key,
  });

  final String time;
  final String type;
  final String description;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: AppTextStyles.f10w400,
          ),
          Text(
            type,
            style: AppTextStyles.f14w700.copyWith(color: textColor),
          ),
          Text(
            description,
            style: AppTextStyles.f10w400,
          ),
        ],
      ),
    );
  }
}
