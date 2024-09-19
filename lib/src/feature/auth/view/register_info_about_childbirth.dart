import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/feature/auth/state/register_state/register_childbirth_info/register_childbirth_info.dart';
import '../../../data.dart';
import '../widgets/widgets.dart';

class RegisterInfoAboutChildbirth extends StatefulWidget {
  const RegisterInfoAboutChildbirth({super.key});

  @override
  State<RegisterInfoAboutChildbirth> createState() => _RegisterInfoAboutChildbirthState();
}

class _RegisterInfoAboutChildbirthState extends State<RegisterInfoAboutChildbirth> {
  final registerChildBirth = RegisterChildbirthInfo();

  var switchValue = false;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
                children: [
                  Spacer(),
                  TitleWidget(text: t.register.howWasBirth),
                  20.h,
                  FlutterToggleButton(
                    outerContainerMargin: 3,
                    buttonWidth: (MediaQuery.of(context).size.width / 2) * 0.85,
                    buttonHeight: 38,
                    buttonColor: Colors.white,
                    enableTextColor: AppColors.primaryColor,
                    disableTextColor: AppColors.greyBrighterColor,
                    disableTextFontWeight: FontWeight.w700,
                    buttonTextFontSize: 17,
                    borderRadius: 6,
                    outerContainerColor: const Color(0xFFE1E6FF),
                    onTap: (index) {
                      registerChildBirth.setBirthType(index == 0 ? true : false);
                    },
                    items: [t.register.natural, t.register.caesarean],
                  ),
                  20.h,
                  Row(
                    children: [
                      Text(t.register.wasComplications),
                      const Spacer(),
                      CupertinoSwitch(
                          value: switchValue,
                          onChanged: (value) {
                        registerChildBirth.setBirthType(value);
                        setState(() {
                          switchValue = value;
                        });
                      }),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(120, 48),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 2,
                                  color: AppColors.purpleLighterBackgroundColor,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {
                            context.pushNamed(AppViews.registerCity);
                          },
                          child: Text(
                            t.register.skip,
                            style: textTheme.bodyMedium
                                ?.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                        20.w,
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(48),
                                backgroundColor:
                                    AppColors.purpleLighterBackgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {
                              context.pushNamed(AppViews.registerCity);
                            },
                            child: Text(
                              t.register.next,
                              style: textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  40.h
                ],
              ),
        ),
      ),
    );
  }
}
