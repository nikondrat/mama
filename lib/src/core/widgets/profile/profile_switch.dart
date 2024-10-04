import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

import 'animated_text.dart';
import 'avatar.dart';

class ProfileSwitch extends StatefulWidget {
  final List<String> avatarsUrl;
  final Alignment alignment;
  final bool isShowText;
  const ProfileSwitch({
    super.key,
    required this.avatarsUrl,
    this.alignment = Alignment.centerRight,
    this.isShowText = false,
  }) : assert(avatarsUrl.length >= 2);

  @override
  State<ProfileSwitch> createState() => _ProfileSwitchState();
}

class _ProfileSwitchState extends State<ProfileSwitch> {
  bool _isFirstCircleOnTop = true;

  void _toggleCircles() {
    setState(() {
      _isFirstCircleOnTop = !_isFirstCircleOnTop;
    });
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
                    // TODO add names
                    title: _isFirstCircleOnTop ? 'Roma' : 'Maksim',
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
                  avatarUrl: widget.avatarsUrl[0],
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
                  avatarUrl: widget.avatarsUrl[1],
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
