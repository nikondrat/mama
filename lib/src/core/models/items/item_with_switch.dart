import 'package:mama/src/data.dart';

class ItemWithSwitch extends BodyItem {
  final String title;
  final String? subtitle;
  final Function(bool value)? onChanged;
  final bool value;
  ItemWithSwitch({
    required this.title,
    super.titleStyle,
    super.maxLines,
    this.subtitle,
    super.hintText,
    this.onChanged,
    required this.value,
  });
}
