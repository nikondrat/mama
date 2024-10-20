import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class AssetItemWidget extends StatelessWidget {
  final AssetItem asset;
  final bool? needIcon;
  final VoidCallback onTapDelete;
  final VoidCallback? onTapDownload;
  const AssetItemWidget(
      {super.key,
      required this.asset,
      required this.onTapDelete,
      this.onTapDownload,
      this.needIcon = false});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    String extension = asset.extention;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip.none,
              children: [
                extension.toLowerCase() == 'JPG'.toLowerCase() ||
                        extension.toLowerCase() == 'PNG'.toLowerCase()
                    ? ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          height: 64,
                          width: 64,
                          fit: BoxFit.cover,
                          File(asset.path),
                        ),
                      )
                    : Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryColor,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                extension.toUpperCase(),
                                style: textTheme.headlineSmall!.copyWith(
                                  fontSize: 20,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              if (needIcon!)
                                GestureDetector(
                                  onTap: () => onTapDownload,
                                  child: Image.asset(
                                    Assets.icons.download.path,
                                    height: 28,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                Positioned(
                  right: -5.0,
                  top: -5,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        onTapDelete();
                      },
                      child: const CircleAvatar(
                        radius: 8.0,
                        backgroundColor: AppColors.redColor,
                        child: Icon(Icons.close,
                            size: 15, color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              textAlign: TextAlign.center,
              maxLines: 1,
              asset.name,
              overflow: TextOverflow.clip,
              style: textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
