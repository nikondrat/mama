import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
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
    final ChildStore childStore = context.watch();

    return CustomBackground(
      height: 220,
      padding: 16,
      child: Observer(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

            /// #baby image, edit button
            Flexible(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  /// #
                  userStore.selectedChild != null &&
                          userStore.selectedChild!.avatarUrl != null
                      ? Image(
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.purpleLighterBackgroundColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Center(
                                child: Icon(Icons.account_circle_outlined),
                              ),
                            );
                          },
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
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        picker
                            .pickImage(source: ImageSource.gallery)
                            .then((value) {
                          if (value != null) {
                            childStore.updateAvatar(
                                file: value, id: userStore.selectedChild!.id!);
                          }
                        });
                      },
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
            ),
          ],
        );
      }),
    );
  }
}
