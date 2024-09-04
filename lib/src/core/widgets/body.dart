import 'package:flutter/widgets.dart';
import 'package:template/src/data.dart';

class AppBody extends StatelessWidget {
  final Widget Function(double windowWidth, WindowSize windowSize) builder;
  const AppBody({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(builder: (context, constraints) {
      final windowSize = constraints.materialBreakpoint;

      return builder(windowWidth, windowSize);
    });
  }
}
