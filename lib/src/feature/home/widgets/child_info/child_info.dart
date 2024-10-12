import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

import 'counter.dart';
import 'status.dart';

class ChildInfo extends StatelessWidget {
  const ChildInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = context.watch();
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return CustomBackground(
      height: 220,
      padding: 16,
      child: Observer(builder: (context) {
        return Row(
          children: [
            /// #left side
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ChildStatus(),
                  16.h,
                  const ChildCounter(),
                ],
              ),
            ),
            8.w,

            /// #baby image, edit button
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                /// #
                userStore.selectedChild != null &&
                        userStore.selectedChild!.avatarUrl != null
                    ? Image(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage(userStore.selectedChild!.avatarUrl!),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * .42,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.purpleLighterBackgroundColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Icon(Icons.account_circle_outlined),
                          ),
                        ),
                      ),
                Positioned(
                  bottom: -30,
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: colorScheme.primary,
                    shape: const CircleBorder(),
                    child: IconWidget(
                      model: IconModel(
                        icon: Icons.edit,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
