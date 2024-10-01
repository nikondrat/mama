// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';
import 'package:mama/src/feature/trackers/widgets/widgets.dart';

class CustomBlog extends StatefulWidget {
  const CustomBlog({super.key});

  @override
  _CustomBlogState createState() => _CustomBlogState();
}

class _CustomBlogState extends State<CustomBlog> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // КГ / Г кнопки (вертикально)
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.purpleLighterBackgroundColor,
                    ),
                    child: ToggleButtons(
                      constraints: BoxConstraints(
                        minHeight: 30, // минимальная высота
                        minWidth: 60, // минимальная ширина
                      ),
                      direction: Axis.vertical,
                      isSelected: isSelected,
                      borderRadius: BorderRadius.circular(8),
                      fillColor: AppColors.whiteColor,
                      selectedColor: AppColors.whiteColor,
                      color: Colors.transparent,
                      splashColor: Colors.transparent,
                      children: [
                        Text(
                          t.trackers.kg.title,
                          style: TextStyle(
                            color: isSelected[0]
                                ? AppColors.primaryColor
                                : AppColors.greyBrighterColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          t.trackers.g.title,
                          style: TextStyle(
                            color: isSelected[1]
                                ? AppColors.primaryColor
                                : AppColors.greyBrighterColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(),
                      style: AppTextStyles.f44w400.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),

              SizedBox(height: 10),

              DateSwitchContainer(
                title1: t.trackers.now.title,
                title2: t.trackers.sixTeenThirtyTwo.title,
                title3: t.trackers.fourteensOfSeptember.title,
              ),
              SizedBox(height: 10),

              // кнопки "Заметка" и "Добавить"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: OutlinedButton.icon(
                      icon: Icon(Icons.edit, color: AppColors.primaryColor),
                      label: Text(
                        t.trackers.note.title,
                        style: AppTextStyles.f17w600.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 2,
                          color: AppColors.purpleLighterBackgroundColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.purpleLighterBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        t.trackers.add.title,
                        style: AppTextStyles.f17w600.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}