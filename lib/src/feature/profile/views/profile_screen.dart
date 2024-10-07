import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyStore verifyStore = context.watch();
    final ChildStore childStore = context.watch();
    final UserStore userStore = context.watch();
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

    return Provider(
        dispose: (context, value) => value.dispose(),
        create: (context) => ProfileViewStore(
              model: userStore.account,
            ),
        builder: (context, _) {
          final ProfileViewStore store = context.watch();
          return PopScope(
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                store.updateData();
                if (userStore.account.isChanged) {
                  userStore.updateData(
                    city: userStore.user.city,
                    firstName: userStore.account.firstName,
                    secondName: userStore.account.secondName,
                    email: userStore.account.email,
                    info: userStore.account.info,
                  );
                }

                if (userStore.changedDataOfChild.isNotEmpty) {
                  for (var e in userStore.changedDataOfChild) {
                    childStore.update(model: e);
                  }
                }
              }
            },
            child: Scaffold(
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
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        Observer(builder: (_) {
                          return MomsProfile(
                            titlesStyle: titlesStyle,
                            helpersStyle: helpersStyle,
                            titlesColoredStyle: titlesColoredStyle,
                            accountModel: userStore.account,
                            store: context.watch(),
                          );
                        }),
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
                                    onTapContinue: () {
                                      context.pop();
                                      verifyStore.logout();
                                    },
                                  ),
                                ),
                              );
                            },
                            backgroundColor:
                                AppColors.redLighterBackgroundColor,
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
                        labelStyle:
                            titlesStyle!.copyWith(fontWeight: FontWeight.w400),
                        onTapButton: () {
                          context.pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
