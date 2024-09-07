import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';

class TrackRow extends StatefulWidget {
  final String name;
  final String author;
  final String timeRange;

  const TrackRow({
    super.key,
    required this.name,
    required this.author,
    required this.timeRange,
  });

  @override
  State<TrackRow> createState() => _TrackRowState();
}

class _TrackRowState extends State<TrackRow> {
  bool _isPlaying = false;

  void _onPlayButtonPressed() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// #play button, name, author, time range
        Expanded(
          child: Row(
            children: [
              /// #play button
              GestureDetector(
                onTap: _onPlayButtonPressed,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (
                          Widget child,
                          Animation<double> animation,
                        ) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: SvgPicture.asset(
                          _isPlaying
                              ? Assets.icons.icPauseFilled
                              : Assets.icons.icPlayFilled,
                          key: ValueKey<bool>(_isPlaying),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),

              /// #name, author
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// #name
                    Text(
                      widget.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),

                    /// #author
                    Text(
                      widget.author,
                      style: TextStyle(
                        color: AppColors.greyBrighterColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// #time range
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            widget.timeRange,
          ),
        ),
      ],
    );
  }
}
