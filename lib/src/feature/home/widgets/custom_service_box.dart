import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class CustomServiceBox extends StatelessWidget {
  final String imagePath;
  final String text;
  final Function()? onTap;

  const CustomServiceBox({
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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                /// #service image
                Image(
                  height: 115,
                  fit: BoxFit.contain,
                  image: AssetImage(imagePath),
                ),

                /// #service text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FittedBox(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
