import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

class TrackersView extends StatelessWidget {
  const TrackersView({super.key});

  @override
  Widget build(BuildContext context) {
    // const Size iconSize = Size(100, 180);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: CategoryCard(
                  onTap: () {
                    context.pushNamed(AppViews.evolutionView);
                  },
                  title: t.trackers.evolution,
                  icon: IconModel(
                    // size: iconSize,
                    iconPath: Assets.images.grow.path,
                  ),
                  backgroundColor: AppColors.blueLighter1,
                ),
              ),
              16.w,
              Expanded(
                child: CategoryCard(
                  onTap: () {},
                  title: t.trackers.sleepAndCrying,
                  icon: IconModel(
                    // size: iconSize,
                    iconPath: Assets.images.sleep.path,
                  ),
                  backgroundColor: AppColors.lavenderBlue,
                ),
              ),
            ],
          ),
          16.h,
          Row(children: [
            Expanded(
              child: CategoryCard(
                onTap: () {
                  context.pushNamed(AppViews.feeding);
                },
                title: t.trackers.feeding,
                icon: IconModel(
                  // size: iconSize,
                  iconPath: Assets.images.feeding.path,
                ),
                backgroundColor: AppColors.paleBlue,
              ),
            )
          ]),
          16.h,
          Row(
            children: [
              Expanded(
                child: CategoryCard(
                  onTap: () {
                    context.pushNamed(AppViews.trackersHealthView);
                  },
                  title: t.trackers.health.title,
                  icon: IconModel(
                    // size: iconSize,
                    iconPath: Assets.images.health.path,
                  ),
                  backgroundColor: AppColors.lightPurple,
                ),
              ),
              16.w,
              Expanded(
                child: CategoryCard(
                  onTap: () {},
                  title: t.trackers.diapers,
                  icon: IconModel(
                    // size: iconSize,
                    iconPath: Assets.images.diaper.path,
                  ),
                  backgroundColor: AppColors.mintGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
