import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';
import 'package:mama/src/feature/trackers/widgets/widgets.dart';

class ToKnowMoreContainer extends StatefulWidget {
  const ToKnowMoreContainer({
    super.key,
  });

  @override
  State<ToKnowMoreContainer> createState() => _ToKnowMoreContainerState();
}

class _ToKnowMoreContainerState extends State<ToKnowMoreContainer> {
  bool isClosed = true;

  @override
  Widget build(BuildContext context) {
    return isClosed
        ? Container(
            padding: EdgeInsets.only(right: 0, left: 16, top: 0, bottom: 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.learnMoreColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isClosed = !isClosed;
                    });
                  },
                  icon: Icon(Icons.close, color: AppColors.greyColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Column(
                    children: [
                      Text(
                        t.trackers.knowMoreOne.title,
                        style: AppTextStyles.f14w0.copyWith(
                          color: AppColors.greyBrighterColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        t.trackers.knowMoreTwo.title,
                        style: AppTextStyles.f14w0.copyWith(
                          color: AppColors.greyBrighterColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: KnowMoreButton(
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          )
        : SizedBox();
  }
}
