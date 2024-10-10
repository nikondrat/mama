import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class DocWidget extends StatelessWidget {
  final String title;
  const DocWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: AutoSizeText(
                title,
                maxLines: 2,
              )),
              SizedBox(
                width: 50,
                height: 50,
                child: GestureDetector(
                  onTap: () {},
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 2,
                            color: AppColors.primaryColor,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconWidget(
                            model: IconModel(
                          iconPath: Assets.icons.book,
                        )),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
