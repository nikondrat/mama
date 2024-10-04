import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class MainBox extends StatelessWidget {
  final String mainText;
  final String image;

  const MainBox({super.key, required this.mainText, required this.image});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.purpleLighterBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 205,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              /// #main text
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: AutoSizeText(
                    mainText,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4D4DE8),
                    ),
                  ),
                ),
              ),

              /// #image
              // Expanded(
              //   child: SvgPicture.asset(
              //     image,
              //   ),
              // ),
              Expanded(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
