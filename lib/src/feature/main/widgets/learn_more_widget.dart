
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class LearnMoreWidget extends StatelessWidget {
  const LearnMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.lightBlue),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.close,
                  color: AppColors.greyColor,),

              ),
            ),
            AutoSizeText('Здесь вы можете отслеживать, как проходит кормление грудью.'
                '\n\nУзнайте больше про процесс грудного вскармливания в нашем Центре Знаний:',
              style: textTheme.displaySmall?.copyWith(
                  color: AppColors.greyBrighterColor
              ),),
            20.h,
            CustomButton(
              backgroundColor: AppColors.lightBlue,
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.icLearnMore),
                  5.w,
                  Text('Узнать\nбольше', style: textTheme.bodySmall
                      ?.copyWith(
                      color: AppColors.primaryColor
                  ),)
                ],
              ),
            ),
            16.h
          ],
        ),
      ),
    );
  }
}