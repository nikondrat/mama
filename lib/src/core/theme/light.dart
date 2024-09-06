
import 'package:flutter/material.dart';

import 'color.dart';

final lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.light(
  ),
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "SFProText"
    ),
    headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: "SFProText"
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
        fontFamily: "SFProText"
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
        fontFamily: "SFProText"
    ),
    bodyMedium: TextStyle(
      fontFamily: "SFProText",
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
        fontFamily: "SFProText"
    ),
    displaySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
        fontFamily: "SFProText"
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
        fontFamily: "SFProText"
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
        fontFamily: "SFProText"
    ),
  ),
);