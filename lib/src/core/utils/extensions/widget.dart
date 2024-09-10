import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Padding get allPadding => Padding(padding: EdgeInsets.all(8), child: this);
}
