import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class TrackersView extends StatelessWidget {
  const TrackersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CategoryCard(
                    title: "Развитие",
                    icon: IconModel(
                      iconPath: Assets.images.grow.path,
                    ),
                    backgroundColor: AppColors.blueLighter1,
                  ),
                ),
                16.w,
                Expanded(
                  child: CategoryCard(
                    title: "Сон и плач",
                    icon: IconModel(
                      iconPath: Assets.images.sleep.path,
                    ),
                    backgroundColor: AppColors.lavenderBlue,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: CategoryCard(
                  title: "Кормление",
                  icon: IconModel(
                    iconPath: Assets.images.feeding.path,
                  ),
                  backgroundColor: AppColors.paleBlue,
                ),
              )
            ]),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CategoryCard(
                    title: "Здоровье",
                    icon: IconModel(
                      iconPath: Assets.images.health.path,
                    ),
                    backgroundColor: AppColors.lightPurple,
                  ),
                ),
                16.w,
                Expanded(
                  child: CategoryCard(
                    title: "Подгузники",
                    icon: IconModel(
                      iconPath: Assets.images.diaper.path,
                    ),
                    backgroundColor: AppColors.mintGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
