import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

class TrackersView extends StatelessWidget {
  final CustomAppBar appBar;
  const TrackersView({super.key, required this.appBar});

  @override
  Widget build(BuildContext context) {
    // const Size iconSize = Size(100, 180);

    return Scaffold(
      appBar: appBar,
      body: Padding(
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
                    title: 'Развитие',
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
                    title: 'Сон и плач',
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
                  title: 'Кормление',
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
                    title: 'Здоровье',
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
                    onTap: () {
                      // context.pushNamed(AppViews.diapersView);
                    },
                    title: 'Подгузники',
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
      ),
    );
  }
}
