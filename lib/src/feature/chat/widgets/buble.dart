import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/chat/chat.dart';

class BubbleContainer extends StatelessWidget {
  final Widget child;
  final bool isSender;
  final ChatEntity chatEntity;
  final String? profession;
  final String? avatarParticipant;
  final Color color;
  final VoidCallback onTapReply;
  final TextStyle textStyle;
  final BoxConstraints? constraints;

  const BubbleContainer({
    super.key,
    required this.isSender,
    this.constraints,
    this.color = Colors.white70,
    this.textStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
    required this.chatEntity,
    this.profession,
    required this.child,
    required this.onTapReply,
    this.avatarParticipant,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (chatEntity == ChatEntity.groupChat && !isSender)
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  avatarParticipant!,
                ),
              ),
            4.w,
            CustomPaint(
              painter: BubblePaint(
                color: color,
                alignment: isSender ? Alignment.topRight : Alignment.topLeft,
              ),
              child: Container(
                  width: isSender
                      ? MediaQuery.of(context).size.width * .7
                      : MediaQuery.of(context).size.width * .64,
                  margin: isSender
                      ? const EdgeInsets.fromLTRB(7, 3, 17, 3)
                      : const EdgeInsets.fromLTRB(17, 3, 7, 3),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4, top: 1),
                    child: child,
                  )
                  // Stack(
                  //   children: <Widget>[
                  //     Padding(
                  //       padding: const EdgeInsets.only(
                  //           right: 4, left: 4, bottom: 4, top: 8),
                  //       child: Text(
                  //         text,
                  //         style: textTheme.labelMedium,
                  //         textAlign: TextAlign.left,
                  //       ),
                  //     ),
                  //     Positioned(
                  //       right: 0,
                  //       top: 0,
                  //       child: SizedBox(
                  //         child: Text(
                  //           '13:12',
                  //           style: textTheme.labelSmall!
                  //               .copyWith(color: AppColors.textGreyColor),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ),
            ),
            isSender
                ? const SizedBox.shrink()
                : IconButton(
                    onPressed: () => onTapReply(),
                    icon: Image.asset(
                      Assets.icons.reply.path,
                      height: 28,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class BubblePaint extends CustomPainter {
  final Color color;
  final Alignment alignment;

  BubblePaint({
    required this.color,
    required this.alignment,
  });

  final double _radius = 8.0;

  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    if (alignment == Alignment.topRight) {
      var path = Path();

      /// starting point
      path.moveTo(_radius * 2, 0);

      /// top-left corner
      path.quadraticBezierTo(0, 0, 0, _radius * 1.5);

      /// left line
      path.lineTo(0, h - _radius * 1.5);

      /// bottom-left corner
      path.quadraticBezierTo(0, h, _radius * 2, h);

      /// bottom line
      path.lineTo(w - _radius * 3, h);

      /// bottom-right bubble curve
      path.quadraticBezierTo(
          w - _radius * 1.5, h, w - _radius * 1.5, h - _radius * 0.6);

      /// bottom-right tail curve 1
      path.quadraticBezierTo(w - _radius * _radius, h, w + _radius, h);

      /// bottom-right tail curve 2
      path.quadraticBezierTo(
          w - _radius * 0.8, h, w - _radius, h - _radius * 1.5);

      /// right line
      path.lineTo(w - _radius, _radius * 1.5);

      /// top-right curve
      path.quadraticBezierTo(w - _radius, 0, w - _radius * 3, 0);

      canvas.clipPath(path);
      canvas.drawRRect(
          RRect.fromLTRBR(0, 0, w, h, Radius.zero),
          Paint()
            ..color = color
            ..style = PaintingStyle.fill);
    } else {
      var path = Path();

      /// starting point
      path.moveTo(_radius * 3, 0);

      /// top-left corner
      path.quadraticBezierTo(_radius, 0, _radius, _radius * 1.5);

      /// left line
      path.lineTo(_radius, h - _radius * 1.5);

      path.quadraticBezierTo(_radius * .8, h, -10, h);

      path.quadraticBezierTo(
          _radius * _radius, h, _radius * 1.5, h - _radius * 0.6);

      /// bottom-left bubble curve
      path.quadraticBezierTo(_radius * 1.5, h, _radius * 3, h);

      /// bottom line
      path.lineTo(w - _radius * 2, h);

      /// bottom-right curve
      path.quadraticBezierTo(w, h, w, h - _radius * 1.5);

      /// right line
      path.lineTo(w, _radius * 1.5);

      /// top-right curve
      path.quadraticBezierTo(w, 0, w - _radius * 2, 0);
      canvas.clipPath(path);
      canvas.drawRRect(
          RRect.fromLTRBR(0, 0, w, h, Radius.zero),
          Paint()
            ..color = color
            ..style = PaintingStyle.fill);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
