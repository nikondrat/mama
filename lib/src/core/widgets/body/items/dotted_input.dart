import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DottedInput extends StatelessWidget {
  final ChildModel model;
  const DottedInput({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle titlesStyle =
        textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400);

    return DottedBorder(
      strokeWidth: 1.5,
      color: AppColors.greyLighterColor,
      borderType: BorderType.RRect,
      dashPattern: const [10, 7],
      radius: const Radius.circular(8),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ReactiveTextField(
            formControlName: 'about',
            maxLines: null,
            style: titlesStyle.copyWith(
              color: AppColors.greyBrighterColor,
            ),
            onChanged: (control) {
              if (control.value is String &&
                  (control.value as String).isNotEmpty) {
                model.setAbout(control.value as String?);
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: t.profile.childNotesHint,
              hintStyle: titlesStyle.copyWith(
                color: AppColors.greyBrighterColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
