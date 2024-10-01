import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  final Alignment alignment;
  const ProfileWidget({
    super.key,
    this.alignment = Alignment.centerRight,
  });

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool _isFirstCircleOnTop = true;

  void _toggleCircles() {
    setState(() {
      _isFirstCircleOnTop = !_isFirstCircleOnTop;
    });
  }

  String first =
      'https://i.pinimg.com/564x/b4/3a/89/b43a892e3f68c50a5b7ce996aa41a1af.jpg';

  String second =
      'https://i.pinimg.com/564x/e7/27/b3/e727b38bc4a2340d4b772edd0864e5c1.jpg';

  @override
  Widget build(BuildContext context) {
    const double startPos = 25;
    const double endPos = 0;

    final firstCircle = _isFirstCircleOnTop ? startPos : endPos;
    final secondCircle = _isFirstCircleOnTop ? endPos : startPos;

    final bool isOnRight = widget.alignment == Alignment.centerRight;

    return SizedBox(
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Нижний кружок
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: !isOnRight ? firstCircle : null,
            right: isOnRight ? firstCircle : null,
            child: GestureDetector(
              onTap: _toggleCircles,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: CircleAvatar(
                  key: ValueKey<bool>(
                      !_isFirstCircleOnTop), // Уникальный ключ для анимации
                  radius: _isFirstCircleOnTop ? 25 : 20,
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage(first),
                ),
              ),
            ),
          ),
          // Верхний кружок
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: !isOnRight ? secondCircle : null,
            right: isOnRight ? secondCircle : null, // Позиция по горизонтали
            child: GestureDetector(
              onTap: _toggleCircles,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: CircleAvatar(
                  key: ValueKey<bool>(
                      _isFirstCircleOnTop), // Уникальный ключ для анимации
                  radius: _isFirstCircleOnTop ? 20 : 25,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(second),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}