import 'package:flutter/material.dart';

class GreetingTitle extends StatelessWidget {
  final String title;

  const GreetingTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
