import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/feeding/widgets/add_pumping_input.dart';

class AddPumpingScreen extends StatelessWidget {
  const AddPumpingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Scaffold(
      appBar: CustomAppBar(
        height: 55,
        titleWidget: Text('Сцеживание',
            style: textTheme.titleMedium
                ?.copyWith(color: const Color(0xFF163C63))),
      ),
      backgroundColor: const Color(0xFFE7F2FE),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          child: Column(
            children: [
              const Spacer(),
              const AddPumpingInput(),
              35.h,
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Color(0xFFE7F2FE),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        'Сейчас',
                        style: textTheme.labelLarge,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.icClock),
                        3.w,
                        Text(
                          '16:32',
                          style: textTheme.labelLarge
                              ?.copyWith(color: AppColors.greyBrighterColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.calendar),
                        5.w,
                        Text(
                          '14 сентября  ',
                          style: textTheme.labelLarge
                              ?.copyWith(color: AppColors.greyBrighterColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              30.h,
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      height: 48,
                      width: double.infinity,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      type: CustomButtonType.outline,
                      icon: IconModel(
                          color: AppColors.primaryColor,
                          iconPath: Assets.icons.icPencilFilled),
                      title: 'Заметка',
                      onTap: () {},
                    ),
                  ),
                  10.w,
                  Expanded(
                    child: CustomButton(
                      backgroundColor: AppColors.redLighterBackgroundColor,
                      height: 48,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      type: CustomButtonType.filled,
                      icon: IconModel(iconPath: Assets.icons.icClose),
                      title: "Отменить",
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              10.h,
              CustomButton(
                backgroundColor: AppColors.greenLighterBackgroundColor,
                height: 48,
                width: double.infinity,
                title: "Подтвердить",
                textStyle: textTheme.bodyMedium
                    ?.copyWith(color: AppColors.greenTextColor),
                onTap: () {},
              ),
              20.h,
            ],
          ),
        ),
      ),
    );
  }
}
