import 'package:flutter/material.dart';
import 'package:mama/src/feature/feeding/state/add_feeding.dart';
import '../../../core/core.dart';

enum ContainerType { feedingSaved, feedingCanceled }

class FeedingStateContainer extends StatelessWidget {
  final AddFeeding addFeeding;
  final ContainerType type;

  const FeedingStateContainer(
      {super.key, required this.addFeeding, required this.type});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
              color: type == ContainerType.feedingSaved
                  ? AppColors.greenTextColor
                  : AppColors.redColor,
              width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 35,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: 5,
                      right: 10,
                      left: 10,
                      child: Text(
                        type == ContainerType.feedingSaved
                            ? 'Сохранено'
                            : "Кормление отменено",
                        textAlign: TextAlign.center,
                        style: textTheme.headlineSmall?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: type == ContainerType.feedingCanceled
                                ? AppColors.redColor
                                : AppColors.greenTextColor),
                      ),
                    ),
                    Positioned(
                        top: 5,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            addFeeding.goBackAndContinue();
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.greyColor,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                type == ContainerType.feedingSaved
                    ? 'Кормление сохранено.'
                    : "Отмененное кормление не будет сохранено.",
                style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyBrighterColor),
              ),
              8.h,
              Text(
                type == ContainerType.feedingSaved
                    ? 'Если нужно продолжить это кормление, нажмите на кнопку:'
                    : 'Чтобы продолжить отмененное кормление, нажмите на кнопку:',
                style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyBrighterColor),
              ),
              15.h,
              CustomButton(
                backgroundColor: AppColors.greenLighterBackgroundColor,
                height: 48,
                width: double.infinity,
                title: "Вернуться и продолжить",
                textStyle: textTheme.bodyMedium
                    ?.copyWith(color: AppColors.greenTextColor),
                onTap: () {
                  addFeeding.goBackAndContinue();
                },
              ),
              10.h,
              type == ContainerType.feedingCanceled
                  ? const SizedBox()
                  : CustomButton(
                      height: 48,
                      width: double.infinity,
                      type: CustomButtonType.outline,
                      icon: IconModel(
                          color: AppColors.primaryColor,
                          iconPath: Assets.icons.icPencilFilled),
                      title: "Заметка",
                      onTap: () {},
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
