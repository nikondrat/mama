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
      physics: NeverScrollableScrollPhysics(),
      itemCount: childs.length,
      itemBuilder: (context, index) {
        return ChildItem(
          model: childs[index],
        );
      },
    );
  }
}
