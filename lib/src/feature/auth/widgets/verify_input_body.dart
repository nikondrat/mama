import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/widgets/verify_code_input.dart';
import 'package:provider/provider.dart';

class VerifyInputBody extends StatefulWidget {
  final bool isLogin;
  final String phone;
  final VerifyStore store;

  const VerifyInputBody({
    super.key,
    this.isLogin = false,
    required this.phone,
    required this.store,
  });

  @override
  State<VerifyInputBody> createState() => _VerifyInputBodyState();
}

class _VerifyInputBodyState extends State<VerifyInputBody> {
  @override
  void initState() {
    widget.store.sendCode(
      widget.phone,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final StopwatchStore stopwatch = context.watch<StopwatchStore>();

    return InputPlace(
        child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AutoSizeText(
            widget.isLogin ? t.auth.login : t.register.registration,
            style: textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          20.h,
          AutoSizeText(
            '${t.auth.sendSmsCode} +7 ${widget.phone}',
            style: textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          20.h,
          const VerifyInputWidget(),
          Observer(builder: (context) {
            // final bool isValid = verifyState.isValid;

            // logger.debug('code is valid --- $isValid');

            return CustomButton(
              title: t.auth.confirm,
              isSmall: false,
              height: 48,
              onTap: widget.store.isValid
                  ? () {
                      context.pushNamed(widget.isLogin
                          ? AppViews.welcomeScreen
                          : AppViews.congratsScreen);
                    }
                  : null,
              textStyle: textTheme.titleMedium!.copyWith(
                color: widget.store.isValid
                    ? AppColors.primaryColor
                    : AppColors.greyBrighterColor,
              ),
            );
          }),
          20.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t.auth.messageDoesntArrive,
                  style: textTheme.bodySmall!.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  )),
              Observer(builder: (context) {
                return stopwatch.isRunning
                    ? Text(
                        '${t.auth.sendAnotherOneIn} ${stopwatch.countdownTimeString}',
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.greyBrighterColor),
                      )
                    : TextButton(
                        onPressed: () {
                          stopwatch.startTimer();
                        },
                        child: Text(
                          t.auth.sendOneMore,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor),
                        ),
                      );
              })
            ],
          )
        ],
      ),
    ));
  }
}
