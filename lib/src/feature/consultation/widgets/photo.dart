import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class PhotoWidget extends StatelessWidget {
  final String? url;
  final Size size;
  final double radius;
  const PhotoWidget({
    super.key,
    required this.url,
    required this.size,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height,
        width: size.width,
        child: url != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.network(
                  url!,
                  fit: BoxFit.cover,
                ))
            : DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: AppColors.purpleLighterBackgroundColor,
                ),
                child: const Center(
                  child: Icon(Icons.person),
                ),
              ));
  }
}
