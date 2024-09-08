import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E0F30),
              Color(0xFF371C5A),
              Color(0xFF371C5A),
            ],
          ),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/start_back.png', fit: BoxFit.fill,),
            ),
            Column(
              children: [
                const Spacer(),
                SvgPicture.asset('assets/images/img.svg'),
                const SizedBox(height: 30,),
                SvgPicture.asset('assets/images/Mama&CoStart.svg'),
                const SizedBox(height: 25,),
                Text(t.auth.slogan,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: Colors.white
                  ),),
                const Spacer(),
                _ButtonWidget(
                  text: t.start.join,
                  onTap: () {
                    context.pushNamed(AppViews.register);
                  },
                  btnColor: AppColors.purpleLighterBackgroundColor,
                  textColor: AppColors.primaryColor,),
                _ButtonWidget(
                  text: t.start.alreadyHaveAcc,
                  onTap: () {
                    context.pushNamed(AppViews.auth);
                  },
                  btnColor: Colors.transparent,
                  textColor: Colors.white,),
                const SizedBox(height: 30,),

              ],
            )

          ],
        ),
      ),
    );
  }
}


class _ButtonWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color btnColor;
  final Color textColor;
  const _ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.btnColor,
    required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: btnColor,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )
        ),
          onPressed: onTap,
          child: Text(text, style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 17
          ),)),
    );
  }
}

