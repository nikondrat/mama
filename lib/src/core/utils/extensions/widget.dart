import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Padding get allPadding => Padding(padding: const EdgeInsets.all(16), child: this);
}
