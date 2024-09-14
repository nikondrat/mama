import 'package:flutter/material.dart';

extension RadiusExtension on num {
  BorderRadius get r => BorderRadius.circular(toDouble());
}