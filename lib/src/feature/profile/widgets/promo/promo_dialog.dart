import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/profile/model/model.dart';

class DialogWidget extends StatelessWidget {
  final bool? errorDialog;
  final DialogItem item;
  final VoidCallback onTapExit;
  final VoidCallback? onTapContinue;
  const DialogWidget(
      {super.key,
      required this.item,
      required this.onTapExit,
      this.errorDialog,
      this.onTapContinue});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle titlesStyle =
        textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: 16.r,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: errorDialog != null
                    ? AppColors.redLighterBackgroundColor
                    : AppColors.greenLighterBackgroundColor,
                borderRadius: 16.r,
              ),
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    item.title,
                    style: textTheme.headlineSmall!.copyWith(
                        fontSize: 24,
                        color: errorDialog != null
                            ? AppColors.redColor
                            : AppColors.greenTextColor),
                  ),
                  8.h,
                  Text(
                    item.subtitle,
                    textAlign: TextAlign.center,
                    style: titlesStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: errorDialog != null
                            ? AppColors.redColor
                            : AppColors.greenTextColor),
                  ),
                  if (item.text != null)
                    Text(
                      item.text!,
                      textAlign: TextAlign.center,
                      style: titlesStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: errorDialog != null
                              ? AppColors.redColor
                              : AppColors.greenTextColor),
                    ),
                ],
              ),
            ),
            8.h,
            if (errorDialog != null)
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      title: t.profile.apply,
                      backgroundColor: AppColors.redLighterBackgroundColor,
                      onTap: onTapExit,
                      child: Text(
                        t.profile.promoErrorDialogBackButton,
                        style: titlesStyle.copyWith(
                            color: AppColors.redColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  8.w,
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      title: t.profile.apply,
                      onTap: onTapContinue,
                      child: Text(
                        t.profile.promoErrorDialogContinueButton,
                        style: titlesStyle.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              )
            else
              CustomButton(
                title: t.profile.apply,
                onTap: onTapExit,
                child: Text(
                  t.profile.promoDialogBackButton,
                  style: titlesStyle.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
