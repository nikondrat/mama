import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/home/widgets/body/home_specialist_body.dart';

class HomeBodyWidget extends StatelessWidget {
  final CustomAppBar appBar;
  const HomeBodyWidget({
    super.key,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const HomeSpecialistBody(),
    );
  }
}
