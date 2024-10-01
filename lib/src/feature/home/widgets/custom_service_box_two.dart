import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class CustomServiceBoxTwo extends StatelessWidget {
  final String imagePath;
  final String text;
  final Function()? onTap;

  const CustomServiceBoxTwo({
    super.key,
    required this.imagePath,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.purpleLighterBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// #text
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),

              /// #image
              Expanded(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
