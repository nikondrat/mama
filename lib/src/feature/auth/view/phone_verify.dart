import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/widgets/verify_input_body.dart';
import 'package:provider/provider.dart';

class PhoneVerify extends StatelessWidget {
  final bool isLogin;

  const PhoneVerify({
    super.key,
    this.isLogin = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return MultiProvider(
      providers: [
        Provider(
          create: (context) => StopwatchStore(),
        ),
      ],
      builder: (context, child) {
        return Scaffold(
            body: BodyDecoration(
                backgroundImage: DecorationImage(
                  image: AssetImage(
                    Assets.images.authDecor.path,
                  ),
                  alignment: Alignment.topLeft,
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      Assets.images.mamaCo,
                    ),
                    20.h,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: AutoSizeText(
                              t.auth.slogan,
                              textAlign: TextAlign.center,
                              style: textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.h,
                    VerifyInputBody(
                      isLogin: isLogin,
                      store: context.watch(),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              context.pushNamed(
                                isLogin ? AppViews.register : AppViews.auth,
                              );
                            },
                            child: AutoSizeText(
                              isLogin
                                  ? t.auth.noAccount
                                  : t.auth.alreadyHaveAccount,
                              style: textTheme.titleMedium,
                            )),
                      ],
                    ),
                    20.h,
                  ],
                )));
      },
    );
  }
}
