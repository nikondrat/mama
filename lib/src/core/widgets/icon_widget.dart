import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/models/icon.dart';
import 'package:mama/src/data.dart';

class IconWidget extends StatelessWidget {
  final IconModel model;
  const IconWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    if (model.iconPath != null) {
      return SvgPicture.asset(
        model.iconPath!,
        width: model.size?.width,
        height: model.size?.height,
        color: model.color,
      );
    }
    return Icon(model.icon!, color: model.color, size: model.size?.height);
  }
}