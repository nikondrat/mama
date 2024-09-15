
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/state/auth_view/auth_view.dart';
import 'package:mama/src/core/widgets/custom_button.dart';
import 'package:mama/src/feature/auth/widget/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'input.dart';

class AuthInputBodyWidget extends StatelessWidget {
  final bool isLogin;
  const AuthInputBodyWidget({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final AuthViewStore store = context.watch();

    return InputPlace(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ReactiveForm(
              formGroup: store.formGroup,
              child: Column(
                children: [
                  AutoSizeText(
                    isLogin ? t.auth.login : t.register.registration,
                    style: textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.h,
                  const InputWidget(),
                  if (!isLogin)
                    Observer(
                        builder: (context) => Row(
                          children: [
                            Checkbox(
                              value: store.isAgree,
                              onChanged: (v) => store.setAgree(v!),
                            ),
                            AutoSizeText.rich(
                              t.register.termOfUse(
                                  tapHere: (v) => TextSpan(
                                    text: v,
                                    style: textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // TODO navigate to term of use screen
                                        print('tap');
                                      },
                                  )),
                              style: textTheme.bodySmall,
                            )
                          ],
                        )),
                  20.h,
                  ReactiveValueListenableBuilder(
                    formControlName: 'phone',
                    builder: (context, control, child) {
                      final bool isValid = control.valid;

                      return CustomButton(
                        title: t.auth.confirm,
                        height: 48,
                        onTap: isValid
                            ? () {
                          context.pushNamed(
                              isLogin
                                  ? AppViews.authVerify
                                  : AppViews.registerVerify,
                              extra: {
                                'phone': control.value,
                              });
                        }
                            : null,
                        textStyle: textTheme.titleMedium!.copyWith(
                          color: isValid
                              ? AppColors.primaryColor
                              : AppColors.greyBrighterColor,
                        ),
                      );
                    },
                  ),
                ],
              )),
        ));
  }
}