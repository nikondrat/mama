import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mama/src/core/core.dart';

class MeetingBox extends StatelessWidget {
  final String scheduledTime;
  final String meetingType;
  final bool isCancelled;
  final String tutorFullName;
  final int whichSection;

  const MeetingBox({
    super.key,
    required this.scheduledTime,
    required this.meetingType,
    required this.isCancelled,
    required this.tutorFullName,
    required this.whichSection,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: whichSection == 1
              ? isCancelled
                  ? AppColors.redLighterBackgroundColor
                  : AppColors.greenLighterBackgroundColor
              : AppColors.purpleLighterBackgroundColor,
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
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              /// #type, mark
              Row(
                children: [
                  /// #type
                  Text(
                    meetingType,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: whichSection == 1
                          ? isCancelled
                              ? AppColors.redColor
                              : AppColors.greenTextColor
                          : AppColors.primaryColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 4),

                  /// #mark
                  whichSection == 1
                      ? SvgPicture.asset(
                          isCancelled
                              ? Assets.icons.icXmark
                              : Assets.icons.icCheckmark,
                        )
                      : SizedBox.shrink(),
                ],
              ),

              /// #full name
              FittedBox(
                child: Text(
                  tutorFullName,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
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
