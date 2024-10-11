import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ConsultationItemTitle extends StatelessWidget {
  final String name;
  final String badgeTitle;
  const ConsultationItemTitle(
      {super.key, required this.name, required this.badgeTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(name),
        2.w,
        ConsultationBadge(
          title: badgeTitle,
        )
      ],
    );
  }
}
