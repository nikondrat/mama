// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mama/src/core/core.dart';

class ProfessionBox extends StatelessWidget {
  final String profession;
  const ProfessionBox({
    super.key,
    required this.profession,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: 4.r,
          color: AppColors.purpleLighterBackgroundColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        child: Text(
          profession,
          style: textTheme.labelSmall!.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
