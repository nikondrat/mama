import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

    List<DialogItem> alertDialog = [
      DialogItem(
          title: 'Сбросить настройки?',
          subtitle:
              'Если сейчас выйти из аккаунта, не сохраненные данные потеряются',
          onTap: () {}),
      DialogItem(
          title: 'Сбросить настройки?',
          subtitle:
              'Если сейчас выйти из аккаунта, не сохраненные данные потеряются',
          text: 'Заполните обязательные поля, чтобы сохранить данные ребенка',
          onTap: () {})
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: const BoxDecoration(
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
                      ChildModel(id: '', firstName: 'Виктория', secondName: ''),
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
                    icon: IconModel(
                      icon: Icons.language,
                    ),
                  ),
                ),
                8.h,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomButton(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          insetPadding: EdgeInsets.all(8.0),
                          child: DialogWidget(
                            errorDialog: true,
                            item: alertDialog[0],
                            onTapExit: () {
                              context.pop();
                            },
                            onTapContinue: () {},
                          ),
                        ),
                      );
                    },
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
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
