
import 'package:flutter/material.dart';

class StartScreenBody extends StatelessWidget {
  final Widget child;
  const StartScreenBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFE1EAFF),
                  Color(0xFFFFFFFF),
                ])),
        child: child,
      ),
    );
  }
}
