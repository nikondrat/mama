import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class AddWeight extends StatelessWidget {
  const AddWeight({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLighter1,
      appBar: CustomAppBar(title: t.trackers.weight.add),
      body: ListView(
        children: [
          FixedCenterIndicator(
              kgOrG: t.trackers.kg.title, painter: CustomPointKG()),
          const SizedBox(height: 8),
          FixedCenterIndicator(
              kgOrG: t.trackers.g.title, painter: CustomPointG()),
          const SizedBox(height: 8),
          CustomBlog(
            onPressedElevated: () {},
            onPressedOutlined: () {},
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
