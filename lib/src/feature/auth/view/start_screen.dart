import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final AuthStore store = context.watch<AuthStore>();

    return ReactionBuilder(
        builder: (context) {
          return reaction((_) => store.status.value, (v) async {
            // await store.tokenStorage.clearToken();

            if (store.isAuthorized) {
              router.pushReplacementNamed(AppViews.homeScreen);
            }
          });
        },
        child: Scaffold(
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
                    30.h,
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    SvgPicture.asset(Assets.images.mamaCoStart),
                    // const SizedBox(
                    //   height: 25,
                    // ),
                    25.h,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AutoSizeText(
                        t.auth.slogan,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      title: t.start.join,
                      isSmall: false,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      onTap: () =>
                          router.pushReplacementNamed(AppViews.register),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    20.h,
                    TextButton(
                        onPressed: () =>
                            router.pushReplacementNamed(AppViews.auth),
                        child: AutoSizeText(
                          t.start.alreadyHaveAcc,
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        )),
                    // const SizedBox(
                    //   height: 50,
                    // ),

                    50.h,
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
