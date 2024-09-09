import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';

class PlayerRow extends StatelessWidget {
  const PlayerRow({super.key});

  @override
  Widget build(BuildContext context) {
    final phonePadding = MediaQuery.of(context).padding;

    return ColoredBox(
      color: AppColors.whiteColor,
      child: SizedBox(
        height: phonePadding.bottom + 100,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            /// #slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// #start
                  const Text(
                    '1:17',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.greyBrighterColor,
                    ),
                  ),

                  /// #slider
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 8,
                      ),
                      child: Slider(
                        value: 0.3,
                        onChanged: (value) {},
                        secondaryActiveColor: Colors.red,
                        thumbColor: AppColors.blueLighter,
                        activeColor: AppColors.purpleBrighterBackgroundColor,
                        inactiveColor: AppColors.purpleLighterBackgroundColor,
                      ),
                    ),
                  ),

                  /// #end
                  const Text(
                    '4:21',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.greyBrighterColor,
                    ),
                  ),
                ],
              ),
            ),

            /// #
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  /// #pause icon
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.icons.icPauseFilled,
                      color: AppColors.primaryColor,
                      width: 14,
                    ),
                  ),

                  /// #name, author
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// #name
                        Text(
                          t.services.placeholderOne.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),

                        /// #author
                        Text(
                          t.services.placeholderTwo.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.greyBrighterColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),

                  /// #infinity icon, music forward icon
                  Row(
                    children: [
                      /// #infinity icon,
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          Assets.icons.icInfinityCircled,
                          width: 22,
                        ),
                      ),

                      /// #music forward icon
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.icons.icMusicForward,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
