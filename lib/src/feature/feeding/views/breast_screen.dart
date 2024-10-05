import 'package:flutter/material.dart';
import '../widgets/widget.dart';

class BreastScreen extends StatelessWidget {
  const BreastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeedingBody(
      children: [
        AddFeedingWidget(),
        HistoryWidget(),
      ],
    );
  }
}
