import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mama/src/core/core.dart';

class MeetingBox extends StatelessWidget {
  final String scheduledTime;
  final String meetingType;
  final bool isCancelled;
  final String tutorFullName;

  const MeetingBox({
    super.key,
    required this.scheduledTime,
    required this.meetingType,
    required this.isCancelled,
    required this.tutorFullName,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isCancelled
              ? AppColors.redLighterBackgroundColor
              : AppColors.greenLighterBackgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// #time schedule
              Text(
                scheduledTime,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),

              /// #type, mark
              Row(
                children: [
                  /// #type
                  Text(
                    meetingType,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isCancelled
                          ? AppColors.redColor
                          : AppColors.greenTextColor,
                    ),
                  ),
                  SizedBox(width: 4),

                  /// #mark
                  SvgPicture.asset(
                    isCancelled
                        ? Assets.icons.icXmark
                        : Assets.icons.icCheckmark,
                  ),
                ],
              ),

              /// #full name
              FittedBox(
                child: Text(
                  tutorFullName,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
