import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Spacer(
              flex: 2,
            ),
            const CongratsBodyWidget(),
            const Spacer(),
            CustomButton(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              isSmall: false,
              title: t.register.letsStart,
              onTap: () {
                context.pushReplacementNamed(AppViews.registerFillName);
              },
            ),
            120.h,
          ],
        ),
      ),
    );
  }
}
