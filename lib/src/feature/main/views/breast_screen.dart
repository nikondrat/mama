import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../widgets/widget.dart';

class BreastScreen extends StatelessWidget {
  const BreastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            16.h,
            const LearnMoreWidget(),
            const AddFeedingWidget(),
            const HistoryWidget()
          ],
        ),
      ),
    );
  }
}
