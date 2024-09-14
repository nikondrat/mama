import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/state/auth_view/auth_view.dart';
import 'package:mama/src/feature/auth/widget/widgets.dart';
import 'package:provider/provider.dart';

import '../widget/decoration.dart';

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

    return Provider(
      create: (context) => AuthViewStore(),
      dispose: (context, value) => value.dispose(),
      child: Scaffold(
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
                20.h,
                AuthInputBodyWidget(
                  isLogin: isLogin,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () => context.pushNamed(
                            isLogin ? AppViews.register : AppViews.auth, extra: "+79999999999"),
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
            )),
      ),
    );
  }
}