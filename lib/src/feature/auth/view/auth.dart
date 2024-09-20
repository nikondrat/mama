import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

class AuthView extends StatelessWidget {
  final bool isLogin;
  const AuthView({
    super.key,
    this.isLogin = false,
  });

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
          child: Column(
            children: [
              Spacer(),
              SvgPicture.asset(
                Assets.images.mamaCo,
              ),
              20.h,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        t.auth.slogan,
                        textAlign: TextAlign.center,
                        style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.h,
              AuthInputBodyWidget(
                isLogin: isLogin,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => context.pushNamed(
                          isLogin ? AppViews.register : AppViews.auth),
                      child: AutoSizeText(
                        isLogin ? t.auth.noAccount : t.auth.alreadyHaveAccount,
                        style: textTheme.titleMedium,
                      )),
                ],
              ),
              20.h,
            ],
          )),
    );
  }
}
