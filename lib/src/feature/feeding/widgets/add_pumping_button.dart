import 'package:flutter/material.dart';
import '../../../core/core.dart';

class AddPumpingButton extends StatelessWidget {
  const AddPumpingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomButton(
            type: CustomButtonType.outline,
            onTap: () {},
            icon: IconModel(iconPath: Assets.icons.icLearnMore),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            textStyle: textTheme.titleLarge?.copyWith(fontSize: 10),
            title: t.feeding.learnMoreBtn,
          ),
        ),
        10.w,
        Expanded(
          flex: 2,
          child: CustomButton(
            backgroundColor: AppColors.purpleLighterBackgroundColor,
            onTap: () {},
            title: "Добавить сцеживание",
            icon: IconModel(iconPath: Assets.icons.icCalendar),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
            textStyle:
                textTheme.bodyMedium?.copyWith(
                  fontSize: 15,
                    color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
