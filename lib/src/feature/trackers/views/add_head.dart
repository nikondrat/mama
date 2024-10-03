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
            kgOrG: 'СМ',
            painter: CustomPointCm(),
            size: Size(200 * 10, 200),
            top: 170,
          ),
          SizedBox(height: 8),
          CustomBlog(
            kgOrCm: 'CM',
            gOrM: 'M',
            onPressedElevated: () {},
            onPressedOutlined: () {},
            verticalSwitch: Text(
              'CM',
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
