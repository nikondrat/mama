import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';

class CurrentAndDymanicContainer extends StatelessWidget {
  const CurrentAndDymanicContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Current Container
        Expanded(
          child: Container(
            height: 90,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: AppColors.purpleLighterBackgroundColor,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.trackers.current.title,
                  style: AppTextStyles.f14w700.copyWith(
                    color: AppColors.greyBrighterColor,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '6 кг  250 г',
                      style: AppTextStyles.f17w400.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        'Вес в норме',
                        style: AppTextStyles.f10w700.copyWith(
                          color: AppColors.greenTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '1 сентября',
                      style: AppTextStyles.f10w700.copyWith(
                        color: AppColors.greyBrighterColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        '6 дней назад',
                        style: AppTextStyles.f10w700.copyWith(
                          color: AppColors.orangeTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),

        /// Dynamic Container
        Expanded(
          child: Container(
            height: 90,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: AppColors.purpleLighterBackgroundColor,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.trackers.dynamics.title,
                  style: AppTextStyles.f14w700.copyWith(
                    color: AppColors.greyBrighterColor,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '+ 150 г',
                      style: AppTextStyles.f17w400.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Text(
                        'за 8 дней',
                        style: AppTextStyles.f14w400.copyWith(
                          color: AppColors.greyBrighterColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '19 г в сутки',
                      style: AppTextStyles.f10w700.copyWith(
                        color: AppColors.greenTextColor,
                      ),
                    ),
                    Text(
                      '23 августа-31 августа',
                      style: AppTextStyles.f10w700.copyWith(
                        color: AppColors.greyBrighterColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
