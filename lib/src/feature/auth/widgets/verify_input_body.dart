import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/widgets/verify_code_input.dart';
import 'package:provider/provider.dart';

class VerifyInputBody extends StatefulWidget {
  final bool isLogin;
  final VerifyStore store;

  const VerifyInputBody({
    super.key,
    this.isLogin = false,
    required this.store,
  });

  @override
  State<VerifyInputBody> createState() => _VerifyInputBodyState();
}

class _VerifyInputBodyState extends State<VerifyInputBody> {
  @override
  void initState() {
    widget.store.sendCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final StopwatchStore stopwatch = context.watch<StopwatchStore>();

    return InputPlace(
        child: Padding(
      padding: const EdgeInsets.all(16),
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
            '${t.auth.sendSmsCode} ${widget.store.phoneNumber}',
            style: textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          20.h,
          VerifyInputWidget(
            isLogin: widget.isLogin,
          ),
          Observer(builder: (context) {
            // final bool isValid = verifyState.isValid;

            // logger.debug('code is valid --- $isValid');

            return CustomButton(
              title: t.auth.confirm,
              isSmall: false,
              height: 48,
              onTap: widget.store.isValid
                  ? () {
                      context.pushNamed(widget.store.isRegistered
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
              Expanded(
                child: AutoSizeText(t.auth.messageDoesntArrive,
                    maxLines: 2,
                    minFontSize: 6,
                    style: textTheme.bodySmall!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              Observer(builder: (context) {
                return Expanded(
                  child: stopwatch.isRunning
                      ? AutoSizeText(
                          '${t.auth.sendAnotherOneIn} ${stopwatch.countdownTimeString}',
                          maxLines: 2,
                          minFontSize: 6,
                          textAlign: TextAlign.end,
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
