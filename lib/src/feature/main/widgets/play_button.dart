import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/core.dart';

class PlayerButton extends StatelessWidget {
  final String side;

  const PlayerButton({super.key, required this.side});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Column(
      children: [
        Text(
          side,
          style: textTheme.bodyLarge,
        ),
        15.h,
        CircleAvatar(
          backgroundColor: AppColors.purpleLighterBackgroundColor,
          radius: 48,
          child: Center(
            child: SvgPicture.asset(Assets.icons.icPlayer),
          ),
        ),
        15.h,
        Text('00:00', style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400
        ),)
      ],
    );
  }
}