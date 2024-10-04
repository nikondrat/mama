import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class CustomAvatar extends StatelessWidget {
  final String avatarUrl;
  final double radius;
  const CustomAvatar({
    super.key,
    required this.avatarUrl,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.whiteColor,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(.1), // Цвет тени
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ]),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(avatarUrl),
      ),
    );
  }
}
