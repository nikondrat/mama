

import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/feeding/widgets/widget.dart';

class FeedingBody extends StatelessWidget {
  final List<Widget> children;
  const FeedingBody({super.key, required this.children});

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
            Column(
              children: children,
            )
          ],
        ),
      ),
    );
  }
}
