import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/auth/data/entity/content.dart';
import 'package:mama/src/feature/auth/data/repository/on_board_data.dart';
import 'package:mama/src/core/widgets/custom_button.dart';
import 'package:mama/src/feature/auth/widget/decoration.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widget/register_widget.dart';
import '../widget/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final controller = PageController();
  final swiperController = SwiperController();
  var isEnd = false;
  int initialPage = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Scaffold(
      body: BodyDecoration(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: Swiper(
                  loop: false,
                  controller: swiperController,
                  itemBuilder: (BuildContext context, int index) {
                    return WelcomeContainer(content: onBoardData[index]);
                  },
                  itemCount: onBoardData.length,
                  pagination:
                  const SwiperPagination(builder: SwiperPagination.rect),
                  //control: const SwiperControl(),
                  onIndexChanged: (index) {
                    setState(() {
                      initialPage = index;
                      if (index == 4) {
                        isEnd = true;
                      } else {
                        isEnd = false;
                      }
                    });
                  },
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: PageController(initialPage: initialPage),
                    count: onBoardData.length,
                    effect: const SlideEffect(
                        type: SlideType.slideUnder,
                        activeDotColor: AppColors.primaryColor,
                        dotColor: AppColors.greyColor), // your preferred effect
                    onDotClicked: (index) {
                      swiperController.move(index);
                    },
                  ),
                  20.w,
                  Expanded(
                    child: CustomButton(
                      backgroundColor: isEnd
                          ? AppColors.greenLighterBackgroundColor
                          : AppColors.purpleLighterBackgroundColor,
                      child: Text(
                        isEnd ? t.register.goToAcc : t.register.next,
                        style: textTheme.bodyMedium?.copyWith(
                          color: isEnd
                              ? AppColors.greenTextColor
                              : AppColors.primaryColor,
                        ),
                      ),
                      onTap: () {
                        if (!isEnd) {
                          setState(
                            () {
                              swiperController.move(++initialPage);
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              20.h
            ],
          ),
        ),
      ),
    );
  }
}
