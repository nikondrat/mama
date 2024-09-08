import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/constant/colors.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/core/widgets/auth_screen_widgets.dart';
import 'package:mama/src/core/widgets/start_screen_body.dart';

import '../../../core/constant/constant.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return const StartScreenBody(
        child: Column(
          children: [
            AuthSplashIcon(),
            _TitleWidget(),
            _SubTitleWidget(),
            Spacer(),
            _LetsStartButton(),
            SizedBox(height: 60)
          ],
        ),
      );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
      child: Text(t.register.hurrah,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 64,
          color: AppColors.primaryColor
        ),),
    );
  }
}

class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          text('${t.register.youWithUs} 🙂'),
          const SizedBox(height: 8),
          text(t.register.letsFillAcc)
        ],
      ),
    );
  }

  Widget text(String text){
    return Text(text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: AppColors.primaryColor
      ),);
  }

}


class _LetsStartButton extends StatelessWidget {
  const _LetsStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          backgroundColor: AppColors.purpleLighterBackgroundColor
        ),
          onPressed: (){
          context.pushReplacementNamed(AppViews.registerFillName);
          },
          child: Text(t.register.letsStart,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 17
            ),)),
    );
  }
}


