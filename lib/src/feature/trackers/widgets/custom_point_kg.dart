import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';

class CustomPointKG extends CustomPainter {
  late final String color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    Paint shortLinePaint = Paint()
      ..color = AppColors.greyColor
      ..strokeWidth = 1;

    double lineHeight = 40; // Высота длинной строки
    double midLineHeight = 30; // Более короткая длинная линия в 5-м интервале
    double shortLineHeight = 20; // Короткая высота строки
    double spacing = 10; // Расстояние между линиями
    int label = 0; // Начальные цифры с 0

    // Рисовать линии на линейке
    for (double i = 0; i < size.width; i += spacing) {
      if ((i / spacing) % 10 == 0) {
        // Длинные строки (каждый 5-й интервал)
        canvas.drawLine(Offset(i, 0), Offset(i, lineHeight), linePaint);

        // Размещаем числа под длинными строками (рядом с каждой длинной строкой)
        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: label.toString(), // Запишите цифры, начиная с 0
            style: AppTextStyles.f17w600.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(canvas,
            Offset(i - 5, lineHeight + 5)); // Цифры написаны под длинной чертой

        label++; // Увеличьте число на единицу рядом с каждой длинной линией
      } else if ((i / spacing) % 5 == 0) {
        // Немного короче длинная линия каждый 5-й интервал
        canvas.drawLine(Offset(i, 0), Offset(i, midLineHeight), shortLinePaint);
      } else {
        // Короткие линии
        canvas.drawLine(
            Offset(i, 0), Offset(i, shortLineHeight), shortLinePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
