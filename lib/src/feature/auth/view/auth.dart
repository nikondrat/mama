import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/services/services_user/views/services_user_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

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
          child: ListView(
            children: [
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
              AuthInputWidget(),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => context.pushNamed(AppViews.auth),
                      child: AutoSizeText(
                        t.auth.alreadyHaveAccount,
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
