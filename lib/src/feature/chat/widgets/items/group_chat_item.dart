import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class GroupChatItem extends StatelessWidget {
  const GroupChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(
                Assets.images.imgProfile.path,
              )),
        ),
        8.w,
        Flexible(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sos поддержка',
                    style: textTheme.bodyMedium,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: 100.r,
                      color: AppColors.primaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    child: Text(
                      '1000',
                      style: textTheme.labelMedium!
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 7,
                    child: RichText(
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Наталья ',
                            style: textTheme.labelMedium,
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: 4.r,
                                  color: AppColors.purpleLighterBackgroundColor,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                child: Text(
                                  'Педиатр',
                                  style: textTheme.labelSmall!
                                      .copyWith(color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                          ),
                          TextSpan(
                            text: ': ',
                            style: textTheme.labelMedium,
                          ),
                          TextSpan(
                            text:
                                'Текст последнего сообщения в переписке. Ограничен двумя строчками.',
                            style: textTheme.labelMedium!
                                .copyWith(color: AppColors.greyBrighterColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Image.asset(
                      Assets.icons.clip.path,
                      height: 33,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
