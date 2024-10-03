import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/data/repository/on_board_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final PageController controller;
  late final SwiperController swiperController;
  var isEnd = false;
  int initialPage = 0;

  @override
  void initState() {
    controller = PageController();
    swiperController = SwiperController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDecoration(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      title: isEnd ? t.register.goToAcc : t.register.next,
                      backgroundColor: isEnd
                          ? AppColors.greenLighterBackgroundColor
                          : AppColors.purpleLighterBackgroundColor,
                      onTap: () {
                        if (!isEnd) {
                          setState(
                            () {
                              swiperController.move(++initialPage);
                            },
                          );
                        } else {
                          router.pushReplacementNamed(AppViews.homeScreen);
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
