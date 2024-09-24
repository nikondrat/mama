import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class AddWeight extends StatelessWidget {
  const AddWeight({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLighter1,
      appBar: CustomAppBar(title: t.trackers.weight.add),
      // appBar: CustomAppBar(isSizeTrue: false),
      body: ListView(
        children: [
          FixedCenterIndicator(kgOrG: 'КГ', painter: CustomPointKG()),
          SizedBox(height: 8),
          FixedCenterIndicator(kgOrG: 'Г', painter: CustomPointG()),
          SizedBox(height: 8),
          CustomBloc(),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
