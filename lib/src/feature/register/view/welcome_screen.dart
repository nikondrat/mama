
import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/register/data/entity/content.dart';
import 'package:mama/src/feature/register/data/repository/on_board_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widget/register_widget.dart';

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
    return StartScreenBody(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: Swiper(
                loop: false,
                controller: swiperController,
                itemBuilder: (BuildContext context,int index){
                  return WelcomeContainer(content: onBoardData[index]);
                },
                itemCount: onBoardData.length,
                pagination: const SwiperPagination(
                  builder: SwiperPagination.rect
                ),
                //control: const SwiperControl(),
                onIndexChanged: (index) {
                  setState(() {
                    initialPage = index;
                    if(index == 4){
                      isEnd = true;
                    }else{
                      isEnd = false;
                    }
                  });
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SmoothPageIndicator(
                      controller: PageController(initialPage: initialPage),
                      count:  onBoardData.length,
                      effect:  const SlideEffect(
                        type: SlideType.slideUnder,
                        activeDotColor: AppColors.primaryColor,
                        dotColor: AppColors.greyColor
                      ),  // your preferred effect
                    onDotClicked: (index) {
                      swiperController.move(index);
                    },

                  ),
                  Expanded(
                      child: CustomButton(
                        btnColor: isEnd ? AppColors.greenLighterBackgroundColor : AppColors.purpleLighterBackgroundColor,
                          child: Text(isEnd ? t.register.goToAcc : t.register.next,
                            style: TextStyle(
                              color: isEnd ? AppColors.greenTextColor : AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17
                            ),),
                        onTap: (){
                          if(!isEnd){
                            setState(() {
                              swiperController.move(++initialPage);
                            });
                          }
                        },
                      ))
                ],
              ),
            ),
            const SizedBox(height: 20,)
          ],
        )  );
  }
}


