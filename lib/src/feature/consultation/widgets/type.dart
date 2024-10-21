import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ConsultationTypeWidget extends StatelessWidget {
  final ConsultationType type;
  const ConsultationTypeWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ConsultationType.chat:
        return _Widget(
          iconPath: Assets.icons.chatIcon,
          title: t.consultation.type.chat,
        );
      case ConsultationType.video:
        return _Widget(
          iconPath: Assets.icons.videoIcon,
          title: t.consultation.type.video,
        );
      case ConsultationType.express:
        return _Widget(
          iconPath: Assets.icons.videoIcon,
          title: t.consultation.type.express,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class _Widget extends StatelessWidget {
  final String iconPath;
  final String title;
  const _Widget({required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Row(
      children: [
        IconWidget(
            model: IconModel(
          iconPath: iconPath,
        )),
        2.w,
        SizedBox(
            height: 20,
            child: FittedBox(
                child: AutoSizeText(
              title,
              style:
                  textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
            ))),
      ],
    );
  }
}
