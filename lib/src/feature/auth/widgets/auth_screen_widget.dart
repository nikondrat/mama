import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';

class AlreadyHaveAccountButton extends StatelessWidget {
  const AlreadyHaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(AppViews.auth);
      },
      child: Text(
        t.auth.alreadyHaveAccount,
        style: const TextStyle(
          fontFamily: 'SFProText',
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

class NoAccountButton extends StatelessWidget {
  const NoAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(AppViews.register);
      },
      child: Text(
        t.auth.noAccount,
        style: const TextStyle(
          fontFamily: 'SFProText',
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

class TextLogo extends StatelessWidget {
  const TextLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/Mama&Co.svg');
  }
}

class SubLogoText extends StatelessWidget {
  const SubLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
      child: Text(
        t.auth.slogan,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'SFProText',
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppColors.greyBrighterColor,
        ),
      ),
    );
  }
}

class AuthSplashIcon extends StatelessWidget {
  const AuthSplashIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/auth_splash.svg');
  }
}

TextStyle getTextStyle(Color color) {
  return TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: color,
  );
}