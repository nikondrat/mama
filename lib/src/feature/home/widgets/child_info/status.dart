import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class ChildStatus extends StatelessWidget {
  const ChildStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.whiteColor,
                AppColors.yellowColor,
              ],
            ).createShader(bounds);
          },
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.yellowColor,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 24),
              child: const _Title(),
            ),
          ),
        ),

        /// #icon
        const Positioned(
          top: -40,
          child: Text(
            '🥳',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = context.watch();

    return Observer(builder: (context) {
      final ChildModel? child = userStore.selectedChild;
      String getAgeText(DateTime birthDate, [bool isMale = false]) {
        final now = DateTime.now();
        final ageInDays = now.difference(birthDate).inDays;

        if (ageInDays < 7) {
          return isMale ? t.home.bornMale.title : t.home.bornFemale.title;
        } else if (ageInDays < 14) {
          return t.home.firstWeek.title;
        } else if (ageInDays < 21) {
          return t.home.twoWeeks.title;
        } else if (ageInDays < 28) {
          return t.home.threeWeeks.title;
        } else if (ageInDays < 31) {
          return t.home.alreadyMonth.title;
        } else if (ageInDays < 61) {
          return t.home.twoMonths.title;
        } else if (ageInDays < 91) {
          return t.home.threeMonths.title;
        } else if (ageInDays < 122) {
          return t.home.fourMonths.title;
        } else if (ageInDays < 153) {
          return t.home.fiveMonths.title;
        } else if (ageInDays < 214) {
          return t.home.soonSixMonths.title;
        } else if (ageInDays < 365) {
          return t.home.alreadySixMonths.title;
        } else {
          return '';
        }
      }

      return Text(
        getAgeText(
            child?.birthDate ?? DateTime.now(), child?.gender == Gender.male),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      );
    });
  }
}
