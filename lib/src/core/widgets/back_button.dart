import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

    return InkWell(
      onTap: onTap != null
          ? () {
              onTap!();
              context.pop();
            }
          : context.pop,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            /// #arrow left
            SvgPicture.asset(
              Assets.icons.icArrowLeftFilled,
              width: 12,
              height: 20,
            ),
            const SizedBox(width: 12),

            // #back text
            Text(
              t.services.back.title,
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
