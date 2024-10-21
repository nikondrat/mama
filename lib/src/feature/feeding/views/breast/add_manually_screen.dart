import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/feeding/widgets/widget.dart';

class AddManuallyScreen extends StatelessWidget {
  const AddManuallyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Scaffold(
      backgroundColor: const Color(0xFFE7F2FE),
      appBar: CustomAppBar(
        height: 55,
        titleWidget: Text('Добавить вручную',
            style: textTheme.titleMedium?.copyWith(color: Color(0xFF163C63))),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 4.5,),
            const ManuallyInputContainer(),
            30.h,
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
                      text: '16:35',
                      detail: 'Таймер запущен',
                      filled: true,
                    )),
                10.w,
                const Expanded(
                    child: DetailContainer(
                      title: 'Всего',
                      text: '0м 0с',
                      detail: '',
                      filled: false,
                    )),
              ],
            ),
            30.h,
            CustomButton(
              height: 48,
              width: double.infinity,
              type: CustomButtonType.outline,
              icon: IconModel(
                  color: AppColors.primaryColor,
                  iconPath: Assets.icons.icPencilFilled),
              title: "Заметка",
              onTap: () {},
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
            35.h,
          ],
        ),
      ),
    );
  }
}
