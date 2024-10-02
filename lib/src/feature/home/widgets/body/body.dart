import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

import 'user_body.dart';

class HomeBodyWidget extends StatelessWidget {
  final CustomAppBar appBar;
  const HomeBodyWidget({
    super.key,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar, body: HomeUserBody());
  }
}
