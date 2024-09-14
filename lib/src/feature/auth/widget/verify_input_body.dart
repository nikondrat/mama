import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/feature/auth/state/verify_state/verify_state.dart';
import 'package:mama/src/feature/auth/widget/verify_code_input.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../core/core.dart';
import '../../../core/widgets/custom_button.dart';
import 'input_decoration.dart';

class VerifyInputBody extends StatelessWidget {
  final bool isLogin;
  final String phone;

  const VerifyInputBody({
    super.key,
    this.isLogin = false, required this.phone
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Provider(
      create: (context) => VerifyState(),
      child: InputPlace(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                AutoSizeText(
                  isLogin ? t.auth.login : t.register.registration,
                  style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                20.h,
                AutoSizeText(
                  "${t.auth.sendSmsCode} $phone",
                  style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                20.h,
                const VerifyInputWidget(),
                Observer(
                    builder: (context) {
                      final bool isValid = context.watch<VerifyState>().isValid;
                      log('code --- $isValid');
                      return CustomButton(
                        title: t.auth.confirm,
                        height: 48,
                        onTap: isValid
                            ? () {
                          context.pushNamed(
                              isLogin
                                  ? AppViews.welcomeScreen
                                  : AppViews.congratsScreen);
                        }
                            : null,
                        textStyle: textTheme.titleMedium!.copyWith(
                          color: isValid
                              ? AppColors.primaryColor
                              : AppColors.greyBrighterColor,
                        ),
                      );
                    }
                ),
                20.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.auth.messageDoesntArrive,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.greyBrighterColor),
                    ),
                    Text(
                      "${t.auth.sendAnotherOneIn} 2:00",
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.greyBrighterColor),
                    )
                  ],
                )

              ],
            ),
          )),
    );
  }
}
