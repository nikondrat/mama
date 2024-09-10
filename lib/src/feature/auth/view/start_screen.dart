import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.midnightPurple,
              AppColors.deepViolet,
              AppColors.deepViolet,
            ],
          ),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                Assets.images.startBack.path,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                SvgPicture.asset(
                  Assets.images.img,
                ),
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.asset(Assets.images.mamaCoStart),
                const SizedBox(
                  height: 25,
                ),
                AutoSizeText(
                  t.auth.slogan,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
                const Spacer(),
                CustomButton(
                  title: t.start.join,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  onTap: () => context.pushNamed(AppViews.register),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () => context.pushNamed(AppViews.auth),
                    child: AutoSizeText(
                      t.start.alreadyHaveAcc,
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                    )),
                const SizedBox(
                  height: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
