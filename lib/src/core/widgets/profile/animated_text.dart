import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  final bool isSwitched;
  final String title;
  final TextStyle? style;
  const AnimatedText(
      {super.key, required this.isSwitched, required this.title, this.style});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final slideAnimation = Tween<Offset>(
          begin: const Offset(.9, 0.0),
          end: Offset.zero,
        ).animate(animation);

        final fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(animation);

        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
      child: Text(
        key: ValueKey<bool>(isSwitched),
        title,
        style: style ?? textTheme.titleMedium,
      ),
    );
  }
}
