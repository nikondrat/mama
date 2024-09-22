import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final TextStyle? titlesStyle = textTheme.bodyMedium;
    final TextStyle titlesColoredStyle = textTheme.labelLarge!.copyWith(
      fontSize: 17,
      fontWeight: FontWeight.w600,
    );

    final TextStyle helpersStyle = textTheme.bodySmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientPurpleBackgroundScaffold,
              AppColors.gradientPurpleLighterBackgroundScaffold,
            ],
          ),
        ),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                MomsProfile(
                  titlesStyle: titlesStyle,
                  helpersStyle: helpersStyle,
                  titlesColoredStyle: titlesColoredStyle,
                  mom: MomInfo(
                    'Кристина Константинова',
                    '+7 996 997-06-24',
                    null,
                    null,
                    Assets.images.imgProfile.path,
                    [
                      ChildInfo(
                        name: 'Алла Виктория',
                        dateBirth: DateTime(2023, 4, 2),
                        gender: Gender.female,
                        twins: false,
                        weight: 3.56,
                        height: 49,
                        headCircumference: 35,
                        birth: Birth.natural,
                        birthComplications: false,
                        notes: null,
                        image: Assets.images.imgProfile.path,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          //TODO добавить tap о компании
                        },
                        child: Text(
                          t.profile.aboutCompanyTitle,
                          style: titlesColoredStyle,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          //TODO добавить tap условия использования
                        },
                        child: Text(
                          t.profile.termOfUseTitle,
                          style: titlesColoredStyle,
                        )),
                  ],
                ),
                16.h,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomButton(
                    title: t.profile.feedbackButtonTitle,
                    onTap: () {},
                    icon: Icons.language,
                  ),
                ),
                8.h,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomButton(
                    onTap: () {},
                    backgroundColor: AppColors.redLighterBackgroundColor,
                    title: t.profile.leaveAccountButtonTitle,
                    textStyle: textTheme.titleMedium!.copyWith(
                      color: AppColors.redColor,
                    ),
                  ),
                ),
                32.h,
              ],
            ),
            //   ),
            // ],
            // ),
            Positioned(
              top: 50.0,
              left: 0.0,
              child: ButtonLeading(
                labelStyle: titlesStyle!.copyWith(fontWeight: FontWeight.w400),
                onTapButton: () {
                  //! добавить tap back button
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
