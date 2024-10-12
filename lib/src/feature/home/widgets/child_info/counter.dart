import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class ChildCounter extends StatelessWidget {
  const ChildCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = context.watch();

    return Observer(builder: (_) {
      return AutoSizeText(userStore.selectedChild?.birthDateCounter ?? '');
    });
  }
}
