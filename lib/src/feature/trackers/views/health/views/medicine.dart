import 'package:flutter/material.dart';
import 'package:mama/src/feature/trackers/widgets/big_find_out_more_button.dart';

class Medicine extends StatelessWidget {
  const Medicine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BigFindOutMoreButton(
            closeButtonOnPressed: () {},
            findOutMoreButtonOnPressed: () {},
          ),
        ],
      ),
    );
  }
}
