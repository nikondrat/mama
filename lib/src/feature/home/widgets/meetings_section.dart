import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class MeetingsSection extends StatelessWidget {
  final int whichSection;
  final List<MeetingBox> meetingsList;
  const MeetingsSection({
    super.key,
    required this.whichSection,
    required this.meetingsList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border: Border.all(
            color: whichSection == 1
                ? AppColors.greenLighterBackgroundColor
                : AppColors.purpleLighterBackgroundColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: meetingsList.map((e) => e).toList(),
          ),
        ),
      ),
    );
  }
}
