import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class AddHead extends StatelessWidget {
  const AddHead({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLighter1,
      appBar: CustomAppBar(title: t.trackers.head.title),
      body: ListView(
        children: [
          FixedCenterIndicator(
            kgOrG: t.trackers.cm.title,
            painter: CustomPointCm(),
            size: Size(200 * 10, 200),
            top: 170,
          ),
          SizedBox(height: 8),
          CustomBlog(
            kgOrCm: t.trackers.cm.title,
            gOrM: t.trackers.m.title,
            onPressedElevated: () {},
            onPressedOutlined: () {},
            verticalSwitch: Text(
              t.trackers.cm.title,
              style: AppTextStyles.f14w700.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
