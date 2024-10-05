import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';

class BigFindOutMoreButton extends StatelessWidget {
  final VoidCallback closeButtonOnPressed;
  final VoidCallback findOutMoreButtonOnPressed;

  const BigFindOutMoreButton({
    super.key,
    required this.closeButtonOnPressed,
    required this.findOutMoreButtonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: ColoredBox(
        color: AppColors.lightBlue,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// #close button
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: closeButtonOnPressed,
                    icon: SvgPicture.asset(
                      Assets.icons.icCrossMark,
                    ),
                  ),
                ),

                /// #find out more text
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Column(
                    children: [
                      /// #find out more one text
                      Text(
                        t.trackers.findOutMoreTextOne.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyBrighterColor,
                        ),
                      ),
                      const SizedBox(height: 8),

                      /// #find out more two text
                      Text(
                        t.trackers.findOutMoreTextTwo.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyBrighterColor,
                        ),
                      ),
                      const SizedBox(height: 16),

                      /// #find out more button
                      CustomButton(
                        onTap: findOutMoreButtonOnPressed,
                        type: CustomButtonType.outline,
                        title: t.trackers.findOutMore.title,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 140,
                          vertical: 12,
                        ),
                        isSmall: false,
                        icon: IconModel(
                          iconPath: Assets.icons.icGraduationCapFilled,
                        ),
                      ),
                    ],
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
