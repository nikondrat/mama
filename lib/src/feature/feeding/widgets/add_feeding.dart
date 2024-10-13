import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/feeding/state/add_feeding.dart';
import 'package:mama/src/feature/feeding/widgets/add_feeding_buttons.dart';
import 'package:mama/src/feature/feeding/widgets/feeding_state_container.dart';
import 'package:mama/src/feature/feeding/widgets/current_feeding_widget.dart';
import 'package:mama/src/feature/feeding/widgets/play_button.dart';
import 'package:provider/provider.dart';

class AddFeedingWidget extends StatelessWidget {
  const AddFeedingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AddFeeding(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Observer(builder: (context) {
          final AddFeeding addFeeding = context.watch();
          var isStart =
              addFeeding.isRightSideStart || addFeeding.isLeftSideStart;
          final confirmButtonPressed = addFeeding.confirmFeedingTimer;
          final isFeedingCanceled = addFeeding.isFeedingCanceled;
          return Column(
            children: [
              30.h,
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: PlayerButton(
                      side: t.feeding.left,
                      onTap: () {
                        addFeeding.changeStatusOfLeftSide();
                      },
                      isStart: addFeeding.isLeftSideStart,
                    )),
                    Expanded(
                        child: PlayerButton(
                      side: t.feeding.right,
                      onTap: () {
                        addFeeding.changeStatusOfRightSide();
                      },
                      isStart: addFeeding.isRightSideStart,
                    )),
                  ],
                ),
              ),
              30.h,
              isStart
                  ? const CurrentFeedingWidget()
                  : const AddFeedingButtons(),
              confirmButtonPressed
                  ? FeedingStateContainer(
                addFeeding: addFeeding,
                type: ContainerType.feedingSaved,
              )
                  : const SizedBox(),

              isFeedingCanceled
                  ? FeedingStateContainer(
                addFeeding: addFeeding,
                type: ContainerType.feedingCanceled,
              )
                  : const SizedBox(),


            ],
          );
        }),
      ),
    );
  }
}
