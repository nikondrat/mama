import 'package:flutter/material.dart';
import 'package:mama/src/feature/home/widgets/body/home_school_body.dart';
import 'package:mama/src/feature/home/widgets/body/home_specialist_body.dart';

import 'user_body.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeSpecialistBody();
  }
}
