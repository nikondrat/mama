import 'package:mama/src/data.dart';

class ItemWithInput extends BodyItem {
  final InputItem inputItem;
  final CustomBodyItem bodyItem;

  ItemWithInput({
    required this.inputItem,
    required this.bodyItem,
  });
}
