import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';

class FixedCenterIndicator extends StatelessWidget {
  const FixedCenterIndicator({
    super.key,
    required this.kgOrG,
    this.painter,
    this.size,
    this.top,
  });

  final String kgOrG;
  final CustomPainter? painter;
  final Size? size;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Линейка горизонтальный с скроллом
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: Colors.white,
              child: CustomPaint(
                size: const Size(200 * 10, 100),
                painter: painter,
              ),
            ),
          ),
        ),
        // Средняя синяя линия и текст компьютерной графики останутся постоянными в центре экрана.
        Positioned(
          left: MediaQuery.of(context).size.width / 2 -
              1.5, // Позиция в центре экрана
          top: 0,
          bottom: 30,
          child: Container(
            width: 4.0,
            color: AppColors.primaryColor, // Синий линия
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 -
              10, // Расположить по центру (for KG text)
          top: top ?? 70,

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
