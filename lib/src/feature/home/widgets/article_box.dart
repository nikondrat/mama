import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ArticleBox extends StatelessWidget {
  final ArticleModel model;

  const ArticleBox({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.blackColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// #image, category
            Stack(
              children: [
                /// #image
                model.photo != null && model.photo!.isNotEmpty
                    ? Image(
                        width: 165,
                        height: 165,
                        image: AssetImage(model.photo!),
                      )
                    : SizedBox(
                        width: 165,
                        height: 165,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.purpleLighterBackgroundColor,
                          ),
                          child: const Center(
                            child: Icon(Icons.image_not_supported_outlined),
                          ),
                        ),
                      ),

                if (model.category != null && model.category!.isNotEmpty)

                  /// #category
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        child: Text(
                          model.category!,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyBrighterColor,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            /// #article title
            Expanded(
              child: SizedBox(
                width: 165,
                child: Padding(
                  padding: const EdgeInsets.all(8).copyWith(top: 4),
                  child: AutoSizeText(
                    model.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
