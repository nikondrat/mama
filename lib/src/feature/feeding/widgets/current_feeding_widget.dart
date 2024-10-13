import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/feeding/state/add_feeding.dart';
import 'package:mama/src/feature/feeding/widgets/widget.dart';
import 'package:provider/provider.dart';

class CurrentFeedingWidget extends StatelessWidget {
  const CurrentFeedingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AddFeeding addFeeding = context.watch();
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Текущее кормление',
          style:
              textTheme.titleLarge?.copyWith(color: Colors.black, fontSize: 20),
        ),
        20.h,
        Row(
          children: [
            const Expanded(
                child: DetailContainer(
              title: 'Начало',
              text: '16:35',
              detail: 'Изменить',
              filled: true,
            )),
            10.w,
            const Expanded(
                child: DetailContainer(
              title: 'Завершение',
              text: '',
              detail: 'Таймер запущен',
              filled: false,
            )),
            10.w,
            const Expanded(
                child: DetailContainer(
              title: 'Всего',
              text: '19м 58с',
              detail: '',
              filled: false,
            )),
          ],
        ),
        20.h,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomButton(
                type: CustomButtonType.outline,
                onTap: () {},
                icon: IconModel(iconPath: Assets.icons.icPencilFilled),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                textStyle: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                title: 'Заметка',
              ),
            ),
            10.w,
            Expanded(
              flex: 2,
              child: CustomButton(
                backgroundColor: AppColors.greenLighterBackgroundColor,
                onTap: () {
                  addFeeding.confirmButtonPressed();
                },
                title: 'Подтвердить',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                textStyle: textTheme.titleMedium
                    ?.copyWith(color: AppColors.greenTextColor),
              ),
            ),
          ],
        ),
        10.h,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomButton(
                type: CustomButtonType.filled,
                backgroundColor: AppColors.redLighterBackgroundColor,
                onTap: () {
                  addFeeding.cancelFeeding();
                },
                icon: IconModel(iconPath: Assets.icons.icClose),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                textStyle: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.redColor),
                title: 'Отменить',
              ),
            ),
            10.w,
            Expanded(
              flex: 1,
              child: CustomButton(
                backgroundColor: AppColors.purpleLighterBackgroundColor,
                onTap: () {},
                title: 'Вручную',
                icon: IconModel(iconPath: Assets.icons.icCalendar),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                textStyle: textTheme.bodyMedium
                    ?.copyWith(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
        20.h,
        Text(
          'Счетчик будет добавлять время',
          style: textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w400, color: AppColors.greyBrighterColor),
        ),
        5.h,
        Text('Подтвердите окончание кормления или отмените его',
            textAlign: TextAlign.center,
            style: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.greyBrighterColor)),
      ],
    );
  }
}
