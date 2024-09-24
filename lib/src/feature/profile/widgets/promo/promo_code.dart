import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/profile/model/model.dart';

class PromoCodeWidget extends StatelessWidget {
  final PromoItem item;
  final VoidCallback onTap;
  const PromoCodeWidget({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle titlesStyle =
        textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.greenLighterBackgroundColor,
        borderRadius: 16.r,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: titlesStyle.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.greenTextColor),
            ),
            4.h,
            Text(
              item.subtitle,
              style: titlesStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greenTextColor),
            ),
            TextButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              onPressed: onTap,
              child: Text(
                t.profile.promoItemButtonTitle,
                style: textTheme.labelLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
