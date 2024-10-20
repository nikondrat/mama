// ignore_for_file: use_build_context_synchronously, prefer_single_quotes

import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';
import 'package:mama/src/feature/trackers/trackers.dart';

class DateSwitchContainer extends StatefulWidget {
  const DateSwitchContainer({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  final String title1;
  final String title2;
  final String title3;

  @override
  State<DateSwitchContainer> createState() => _DateSwitchContainerState();
}

class _DateSwitchContainerState extends State<DateSwitchContainer> {
  List<bool> isSelected = [true, false];
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Күн жана убакытты тандаган функция
  Future<void> selectDateTime(BuildContext context) async {
    // Алгач күндү тандайбыз
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Андан соң убакытты тандайбыз
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDate = pickedDate;
          selectedTime = pickedTime;
        });
        // SnackBar аркылуу тандалган күн жана убакытты көрсөтүү
        final snackBar = SnackBar(
          content: Text(
            "Выбранная время: ${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year} ${selectedTime!.format(context)}",
          ),
          duration: const Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(2),
      height: 35,
      decoration: BoxDecoration(
        color: AppColors.purpleLighterBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ToggleButtons(
        fillColor: AppColors.whiteColor,
        selectedColor: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        isSelected: isSelected,
        renderBorder: false,
        splashColor: Colors.transparent,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title1,
              style: AppTextStyles.f14w700.copyWith(
                color: isSelected[0]
                    ? AppColors.primaryColor
                    : AppColors.greyBrighterColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () async {
                  await DateTimeService.selectedTime(context, (value) {
                    // dateTime.text = DateFormat("d MMM, y").format(value);
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.access_alarms_outlined,
                      color: isSelected[1]
                          ? AppColors.blueLighter
                          : AppColors.greyBrighterColor,
                    ),
                    Text(
                      widget.title2,
                      style: AppTextStyles.f14w700.copyWith(
                        color: isSelected[1]
                            ? AppColors.blueLighter
                            : AppColors.greyBrighterColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50),
              GestureDetector(
                onTap: () async {
                  // await DateTimeService.selectedTime(context, (value) {
                  //   // dateTime.text = DateFormat("d MMM, y").format(value);
                  // });

                  return selectDateTime(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: isSelected[1]
                          ? AppColors.blueLighter
                          : AppColors.greyBrighterColor,
                    ),
                    Text(
                      widget.title3,
                      style: AppTextStyles.f14w700.copyWith(
                        color: isSelected[1]
                            ? AppColors.blueLighter
                            : AppColors.greyBrighterColor,
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
            ],
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index; // Тандалган элементти өзгөртүү
            }
          });
        },
      ),
    );
  }
}
