// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class CustomPopupWidget extends StatefulWidget {
  const CustomPopupWidget({
    super.key,
    required this.selectedIndex,
    this.closeButton,
  });
  final int selectedIndex;
  final void Function()? closeButton;

  @override
  _CustomPopupWidgetState createState() => _CustomPopupWidgetState();
}

class _CustomPopupWidgetState extends State<CustomPopupWidget> {
  // Состояние для отслеживания выбранного элемента
  String selectedOption = '';

  // Опции для отображения
  final List<String> options0 = [
    'Твердый',
    'Мягкий',
    'Жидкий',
  ];

  final List<String> options1 = [
    'Твердый',
    'Мягкий',
    'Жидкий',
    'Плотный',
    'Липкий',
    'Зернистый',
    'Диарея'
  ];

  final List<String> options2 = [
    'Твердый',
    'Мягкий',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2), // Смещение тени
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      // Кнопка закрытия
                      IconButton(
                          icon: const Icon(Icons.close),
                          color: AppColors.primaryColor,
                          onPressed: widget.closeButton),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.selectedIndex == 0
                        ? options0.map((option) {
                            return ChoiceChip(
                              label: Text(option),
                              labelStyle: AppTextStyles.f17w400.copyWith(
                                color: AppColors.primaryColor,
                              ),
                              selected: selectedOption == option,
                              selectedColor: AppColors.primaryColor,
                              color: const WidgetStatePropertyAll(
                                  AppColors.whiteColor),
                              onSelected: (bool selected) {
                                setState(() {
                                  selectedOption = selected ? option : '';
                                });
                              },
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          }).toList()
                        : widget.selectedIndex == 1
                            ? options1.map((option) {
                                return ChoiceChip(
                                  label: Text(option),
                                  labelStyle: AppTextStyles.f17w400.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                  selected: selectedOption == option,
                                  selectedColor: AppColors.primaryColor,
                                  color: const WidgetStatePropertyAll(
                                      AppColors.whiteColor),
                                  onSelected: (bool selected) {
                                    setState(() {
                                      selectedOption = selected ? option : '';
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: AppColors.primaryColor),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                );
                              }).toList()
                            : options2.map((option) {
                                return ChoiceChip(
                                  label: Text(option),
                                  labelStyle: AppTextStyles.f17w400.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                  selected: selectedOption == option,
                                  selectedColor: AppColors.primaryColor,
                                  color: const WidgetStatePropertyAll(
                                      AppColors.whiteColor),
                                  onSelected: (bool selected) {
                                    setState(() {
                                      selectedOption = selected ? option : '';
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: AppColors.primaryColor),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                );
                              }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
        // Стрелка внизу
        Positioned(
          bottom: 0,
          right: widget.selectedIndex == 0
              ? 320
              : widget.selectedIndex == 1
                  ? 190
                  : 55,
          child: CustomPaint(
            size: const Size(20, 15),
            painter: TrianglePainter(),
          ),
        ),
      ],
    );
  }
}

// Класс для рисования треугольной стрелки
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    final path = Path();
    path.moveTo(0, 0); // Левый угол
    path.lineTo(size.width / 2, size.height); // Нижняя точка
    path.lineTo(size.width, 0); // Правый угол
    path.close(); // Замыкаем путь

    // Рисуем тень для треугольника
    canvas.drawShadow(path, Colors.grey, 3.0, true);

    // Рисуем сам треугольник
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
