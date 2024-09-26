import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';

class CustomPointKG extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    Paint shortLinePaint = Paint()
      ..color = AppColors.greyColor
      ..strokeWidth = 1;

    double lineHeight = 40; // Узун сызыктын бийиктиги
    double midLineHeight = 30; // 5-инчи интервалдагы кыскараак узун сызык
    double shortLineHeight = 20; // Кыска сызыктын бийиктиги
    double spacing = 10; // Сызыктар ортосундагы аралык
    int label = 0; // Сандарды 0дон баштоо

    // Линейкадагы сызыктарды чийүү
    for (double i = 0; i < size.width; i += spacing) {
      if ((i / spacing) % 10 == 0) {
        // Узун сызыктар (ар бир 5-инчи интервалда)
        canvas.drawLine(Offset(i, 0), Offset(i, lineHeight), linePaint);

        // Сандарды узун сызыктардын ылдый жагына коюу (ар бир узун сызыктын жанына)
        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: label.toString(), // Сандарды 0дон баштап жазуу
            style: AppTextStyles.f17w600.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(
            canvas,
            Offset(
                i - 5, lineHeight + 5)); // Сандар узун сызыктын астына жазылат

        label++; // Санды ар бир узун сызыктын жанында бирден өстүрүү
      } else if ((i / spacing) % 5 == 0) {
        // Ар бир 5-чи интервалда бир аз кыскараак узун сызык
        canvas.drawLine(Offset(i, 0), Offset(i, midLineHeight), shortLinePaint);
      } else {
        // Кыска сызыктар
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
