import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ChildItems extends StatelessWidget {
  final List<ChildModel> childs;
  const ChildItems({
    super.key,
    required this.childs,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: childs.length,
      itemBuilder: (context, index) {
        return ChildItem(
          index: index,
          model: childs[index],
        );
      },
    );
  }
}
