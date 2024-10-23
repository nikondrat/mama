import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class AssetsWidget extends StatelessWidget {
  final VoidCallback onTapDelete;
  final List<PlatformFile> files;
  final Color? color;
  final EdgeInsets? padding;
  final double? height;

  const AssetsWidget({
    super.key,
    required this.files,
    required this.onTapDelete,
    this.color,
    this.padding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color ?? AppColors.lightPirple,
      ),
      child: ListView.builder(
        itemCount: files.length,
        shrinkWrap: true,
        padding: padding ?? const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          PlatformFile file = files[index];
          return AssetItemWidget(
            asset: AssetItem(
                extention: file.extension.toString(),
                path: file.path.toString(),
                name: file.name),
            onTapDelete: () {
              files.remove(file);
              onTapDelete();
            },
          );
        },
      ),
    );
  }
}
