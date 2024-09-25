import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';

class FixedCenterIndicator extends StatelessWidget {
  const FixedCenterIndicator({
    super.key,
    required this.kgOrG,
    this.painter,
  });

  final String kgOrG;
  final CustomPainter? painter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Линейка горизонталдуу скрол менен
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: Colors.white, // Фонду ак кылып орноттук
              child: CustomPaint(
                size: Size(200 * 10,
                    100), // Линейканын узундугу: 20 санына чейин (200 интервал)
                painter: painter,
              ),
            ),
          ),
        ),
        // Ортодогу көк сызык жана КГ тексти экрандын ортосунда туруктуу болуп калат
        Positioned(
          left: MediaQuery.of(context).size.width / 2 -
              1.5, // Экрандын ортосуна жайгаштыруу (сызык үчүн)
          top: 0,
          bottom: 30,
          child: Container(
            width: 4.0,
            color: AppColors.primaryColor, // Сиздин көк сызык
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 -
              6, // Экрандын ортосуна жайгаштыруу (КГ тексти үчүн)
          top: 70, // "КГ" жазуусунун орду
          child: Text(
            kgOrG,
            style: AppTextStyles.f17w700.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
