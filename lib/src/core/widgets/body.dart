import 'package:flutter/widgets.dart';
import 'package:mama/src/data.dart';

class AppBody extends StatelessWidget {
  final Widget Function(double windowWidth, WindowSize windowSize) builder;
  const AppBody({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final windowWidth = constraints.maxWidth;
      final windowSize = constraints.materialBreakpoint;

      return builder(windowWidth, windowSize);
    });
  }
}
