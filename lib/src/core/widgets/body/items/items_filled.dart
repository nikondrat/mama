import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:collection/collection.dart';

class ItemsNeedToFill extends StatelessWidget {
  final FormGroup formGroup;
  const ItemsNeedToFill({
    super.key,
    required this.formGroup,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle titlesStyle =
        textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400);
    final List<String> data = [
      t.profile.name,
      t.profile.dateBirth,
      t.profile.weight,
      t.profile.height,
      t.profile.headCirc,
      'обо мне',
    ];
    return Text.rich(
      TextSpan(
        text: '${t.profile.needToFill} ',
        style: titlesStyle.copyWith(
          color: AppColors.greyBrighterColor,
        ),
        children: formGroup.controls.values.mapIndexed((i, e) {
          final bool isLast = formGroup.value.length - 1 == i;
          final bool isPenultimate = formGroup.value.length - 2 == i;

          if (e.value == null) {
            if (isPenultimate || formGroup.value.length == 1) {
              return TextSpan(
                text: '${data[formGroup.value.length - 2]} ',
                style: titlesStyle.copyWith(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryColor,
                ),
              );
            } else if (isLast) {
              return TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: t.profile.and,
                    style: titlesStyle.copyWith(
                      color: AppColors.greyBrighterColor,
                    ),
                  ),
                  TextSpan(
                    text: ' ${data.last}',
                    style: titlesStyle.copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  )
                ],
              );
            } else {
              return TextSpan(
                text: '${data[i]}, ',
                style: titlesStyle.copyWith(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryColor,
                ),
              );
            }
          } else {
            return const TextSpan(
              text: '',
              // style: style,
            );
          }
        }).toList(),
      ),
    );
  }
}
