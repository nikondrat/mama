import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/auth/widget/decoration.dart';
import '../widget/widgets.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Scaffold(
      body: BodyDecoration(
        backgroundImage: DecorationImage(
          image: AssetImage(
            Assets.images.authDecor.path,
          ),
          alignment: Alignment.topLeft,
        ),
        child: Column(
          children: [
            160.h,
            const CongratsBodyWidget(),
            const Spacer(),
            CustomButton(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              title: t.register.letsStart,
              onTap: () {
                context.pushReplacementNamed(AppViews.registerFillName);
              },
              textStyle: textTheme.titleMedium!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}
