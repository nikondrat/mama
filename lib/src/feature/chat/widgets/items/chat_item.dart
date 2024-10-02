import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/chat/widgets/widgets.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

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
                  RichText(
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Екатерина Попова ',
                          style: textTheme.bodyMedium,
                        ),
                        WidgetSpan(
                          child: ProfessionBox(
                            profession: 'Педиатр',
                          ),
                        ),
                      ],
                    ),
                  ),
                  UnreadBox(
                    text: '1000',
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
                            text: 'Вы: ',
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
