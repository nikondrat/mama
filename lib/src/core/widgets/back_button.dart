import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

class CustomBackButton extends StatelessWidget {
  final Function()? onTap;
  const CustomBackButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return GestureDetector(
        onTap: () => context.pop(),
        child: Row(
          children: [
            /// #arrow left
            SvgPicture.asset(
              Assets.icons.icArrowLeftFilled,
              width: 12,
              height: 20,
            ),

            Gap(12),

            // #back text
            Text(
              t.services.back.title,
              style: textTheme.bodySmall,
            ),
          ],
        ));
  }
}
