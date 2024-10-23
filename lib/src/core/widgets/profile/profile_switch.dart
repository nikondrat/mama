import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

import 'animated_text.dart';
import 'avatar.dart';

class ProfileSwitch extends StatefulWidget {
  final List<ChildModel?> children;
  final Alignment alignment;
  final bool isShowText;
  final UserStore userStore;
  final Function()? onTap;
  const ProfileSwitch({
    super.key,
    this.onTap,
    required this.userStore,
    required this.children,
    this.alignment = Alignment.centerRight,
    this.isShowText = false,
  }) : assert(children.length >= 2);

  @override
  State<ProfileSwitch> createState() => _ProfileSwitchState();
}

class _ProfileSwitchState extends State<ProfileSwitch> {
  bool _isFirstCircleOnTop = true;

  void _toggleCircles() {
    setState(() {
      _isFirstCircleOnTop = !_isFirstCircleOnTop;
    });
    widget.userStore
        .selectChild(child: widget.children[_isFirstCircleOnTop ? 0 : 1]!);
    if (widget.onTap != null) widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    const double startPos = 25;
    const double endPos = 0;

    final firstCircle = _isFirstCircleOnTop ? startPos : endPos;
    final secondCircle = _isFirstCircleOnTop ? endPos : startPos;

    final bool isOnRight = widget.alignment == Alignment.centerRight;

    return SizedBox(
      height: 56,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (widget.isShowText)
            Positioned(
              right: 100,
              child: Column(
                children: [
                  AnimatedText(
                    isSwitched: _isFirstCircleOnTop,
                    title: _isFirstCircleOnTop
                        ? widget.children[0]!.firstName
                        : widget.children[1]!.firstName,
                  ),
                  Text(
                    t.home.switch_hint,
                    style: textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          // Нижний кружок
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: !isOnRight ? firstCircle : null,
            right: isOnRight ? firstCircle : null,
            child: GestureDetector(
              onTap: _toggleCircles,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: CustomAvatar(
                  radius: _isFirstCircleOnTop ? 25 : 20,
                  key: ValueKey<bool>(!_isFirstCircleOnTop),
                  avatarUrl: widget.children[0]?.avatarUrl,
                ),
              ),
            ),
          ),
          // Верхний кружок
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: !isOnRight ? secondCircle : null,
            right: isOnRight ? secondCircle : null, // Позиция по горизонтали
            child: GestureDetector(
              onTap: _toggleCircles,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: CustomAvatar(
                  key: ValueKey<bool>(_isFirstCircleOnTop),
                  avatarUrl: widget.children[1]?.avatarUrl,
                  radius: _isFirstCircleOnTop ? 20 : 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
