import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class SubscribeBlockItem extends StatelessWidget {
  const SubscribeBlockItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final TextStyle titlesStyle =
        textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            height: 80,
            Assets.icons.padlock.path,
          ),
          30.h,
          Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: 16.r,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.profile.subscribeBlockTitle,
                    style: textTheme.headlineSmall!
                        .copyWith(fontSize: 20, color: AppColors.primaryColor)),
                16.h,
                Text(t.profile.subscribeBlockSubitle, style: titlesStyle),
                16.h,
                CustomButton(
                  title: t.profile.subscribeBlocButtonTitle,
                  onTap: () {},
                  icon: IconModel(icon: Icons.language),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
