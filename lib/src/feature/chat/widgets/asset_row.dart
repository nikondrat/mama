import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class AssetsWidget extends StatelessWidget {
  final VoidCallback onTapDelete;
  final List<PlatformFile> files;

  const AssetsWidget({
    super.key,
    required this.files,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.lightPirple,
      ),
      child: ListView.builder(
        itemCount: files.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
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
