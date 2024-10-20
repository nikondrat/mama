import 'package:flutter/material.dart';
import 'package:mama/src/core/widgets/body/decoration.dart';
import 'package:mama/src/data.dart';

class CourseItemWidget extends StatelessWidget {
  final CourseItem item;
  const CourseItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return BodyItemDecoration(
      padding: EdgeInsets.zero,
      shadow: true,
      child: SizedBox(
        height: 106,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: textTheme.headlineSmall!.copyWith(fontSize: 20),
                      maxLines: 1,
                    ),
                    3.h,
                    Text(
                      item.subtitle,
                      style: textTheme.titleSmall!,
                      maxLines: 2,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 60,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.purpleLighterBackgroundColor,
                borderRadius: 16.r,
              ),
              child: const Icon(
                Icons.language,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
