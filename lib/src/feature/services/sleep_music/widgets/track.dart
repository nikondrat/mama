import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/data.dart';

class TrackWidget extends StatelessWidget {
  final TrackModel model;

  const TrackWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Row(
      children: [
        /// #play button, name, author, time range
        Expanded(
          child: Row(
            children: [
              /// #play button
              GestureDetector(
                onTap: model.toggleIsPlaying,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Observer(
                          builder: (context) => AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (
                                  Widget child,
                                  Animation<double> animation,
                                ) =>
                                    FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                                child: SvgPicture.asset(
                                  model.isPlaying
                                      ? Assets.icons.icPauseFilled
                                      : Assets.icons.icPlayFilled,
                                  key: ValueKey<bool>(model.isPlaying),
                                ),
                              )),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              /// #name, author
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// #name
                    AutoSizeText(
                      model.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),

                    /// #author
                    AutoSizeText(model.author ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// #time range
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: AutoSizeText(
            model.duration,
          ),
        ),
      ],
    );
  }
}
