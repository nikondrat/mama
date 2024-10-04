import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';

class Head extends StatelessWidget {
  const Head({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Text('Head'),
      ),
    );
  }
}
