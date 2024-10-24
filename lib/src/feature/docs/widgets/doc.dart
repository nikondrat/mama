import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class DocWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const DocWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: GestureDetector(
                    onTap: onTap,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 2,
                              color: AppColors.primaryColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconWidget(
                              model: IconModel(
                            iconPath: Assets.icons.book,
                          )),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
