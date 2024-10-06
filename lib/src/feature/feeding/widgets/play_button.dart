import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/core.dart';

class PlayerButton extends StatefulWidget {
  final Function() onTap;
  final String side;
  final bool isStart;

  const PlayerButton(
      {super.key,
      required this.side,
      required this.onTap,
      required this.isStart});

  @override
  State<PlayerButton> createState() => _PlayerButtonState();
}

class _PlayerButtonState extends State<PlayerButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Column(
      children: [
        Text(
          widget.side,
          style: textTheme.headlineSmall?.copyWith(fontSize: 20),
        ),
        15.h,
        GestureDetector(
          onTap: widget.onTap,
          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                widget.isStart ? _controller.forward() : _controller.reverse();
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: ColorTween(
                          begin: Colors.transparent,
                          end: Colors.blue,
                        ).animate(_animation).value,
                        shape: BoxShape.circle,
                      ),
                      child: Text(''),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorTween(
                          begin: AppColors.purpleLighterBackgroundColor,
                          end: Colors.white,
                        ).animate(_animation).value,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(48),
                        child: Center(
                          child: SvgPicture.asset(
                            widget.isStart
                                ? Assets.icons.icPauseFilled
                                : Assets.icons.icPlayer,
                            colorFilter: ColorFilter.mode(
                                AppColors.primaryColor, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                    // widget.isStart
                    //     ? Positioned(
                    //         bottom: 0,
                    //         child: DecoratedBox(
                    //           decoration: BoxDecoration(
                    //             color: AppColors.purpleLighterBackgroundColor,
                    //             borderRadius: BorderRadius.circular(8),
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Column(
                    //               children: [
                    //                 Text(
                    //                   '8м 46с',
                    //                   style: textTheme.labelLarge,
                    //                 ),
                    //                 10.h,
                    //                 Text('Изменить время',
                    //                     style: textTheme.labelSmall?.copyWith(
                    //                         fontWeight: FontWeight.w400))
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //     : SizedBox()
                  ],
                );
              }),
        ),
        20.h,
        Text(
          '00:00',
          style: textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w400, color: Colors.black),
        )
      ],
    );
  }
}
