import 'package:flutter/material.dart';
import 'package:template/src/feature/services/services_user/widgets/custom_button.dart';

class MainBoxWithButtons extends StatelessWidget {
  final String image;
  final String mainText;
  final String firstButtonText;
  final String secondButtonText;
  final String thirdButtonText;

  const MainBoxWithButtons({
    super.key,
    required this.image,
    required this.mainText,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.thirdButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFE1E6FF),
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 205,
        child: Row(
          children: [
            /// #image and main text
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: Column(
                  children: [
                    /// #image
                    // Expanded(
                    //   child: SvgPicture.asset(image),
                    // ),
                    Expanded(
                      child: Image(
                        image: AssetImage(image),
                      ),
                    ),

                    /// #main text
                    Text(
                      mainText,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4D4DE8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12),

            /// #three buttons
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    CustomButton(
                      text: firstButtonText,
                    ),
                    SizedBox(height: 8),
                    CustomButton(
                      text: secondButtonText,
                    ),
                    SizedBox(height: 8),
                    CustomButton(
                      text: thirdButtonText,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
