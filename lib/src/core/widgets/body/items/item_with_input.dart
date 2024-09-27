import 'package:flutter/cupertino.dart';
import 'package:mama/src/data.dart';

class ItemWithInputWidget extends StatelessWidget {
  final ItemWithInput item;
  const ItemWithInputWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: BodyItemWidget(
            item: item.bodyItem,
          ),
        ),
        Expanded(
          flex: 2,
          child: InputItemWidget(
            item: item.inputItem,
          ),
        ),
      ],
    );
  }
}
