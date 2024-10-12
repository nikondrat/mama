import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_checkbox.dart';

class AgeSelection extends StatelessWidget {
  final String title;
  final int count;

  const AgeSelection({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17,
                fontFamily: Assets.fonts.sFProTextRegular,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            count.toString(),
            style: TextStyle(color: Colors.grey),
          ),
          const CommonCheckBoxWidget()
        ],
      ),
    );
  }
}
