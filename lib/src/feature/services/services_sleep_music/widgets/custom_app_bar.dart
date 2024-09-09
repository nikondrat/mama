import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    /// This function goes back from current screen
    void navigateToServicesUserView() => GoRouter.of(context).pop();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// #arrow left, back text
          InkWell(
            onTap: navigateToServicesUserView,
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  /// #arrow left
                  SvgPicture.asset(
                    Assets.icons.icArrowLeftFilled,
                    width: 12,
                    height: 20,
                  ),
                  SizedBox(width: 12),

                  // #back text
                  Text(
                    t.services.back.title,
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF666E80),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// #sleep music text
          Text(
            t.services.sleepMusic.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF4D4DE8),
            ),
          ),

          /// #some space, placeholder(child image)
          Row(
            children: [
              SizedBox(width: 16),

              /// #placeholder(child image)
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.blackColor,
                ),
                child: SizedBox(
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
