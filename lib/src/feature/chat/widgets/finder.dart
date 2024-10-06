import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Finder extends StatelessWidget {
  final String formControlName;
  final VoidCallback onPressedClear;
  final VoidCallback onChange;
  final String hintText;
  const Finder({
    super.key,
    required this.onPressedClear,
    required this.formControlName,
    required this.hintText,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return CustomAppBar(
        leading: Icon(
          Icons.search,
          size: 24,
          color: AppColors.primaryColor,
        ),
        titleWidget: SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: ReactiveTextField(
            formControlName: formControlName,
            autofocus: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: textTheme.titleSmall!.copyWith(
                  color: AppColors.greyBrighterColor,
                )),
            style: textTheme.titleSmall,
            onChanged: (value) {
              onChange();
            },
          ),
        ),
        action: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            onPressedClear();
          },
        ));
  }
}
