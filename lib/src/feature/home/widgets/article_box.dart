import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class ArticleBox extends StatelessWidget {
  final String imagePath;
  final String articleCategory;
  final String articleTitle;

  const ArticleBox({
    super.key,
    required this.imagePath,
    required this.articleCategory,
    required this.articleTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// #image, category
        Stack(
          children: [
            /// #image
            Image(
              width: 165,
              height: 165,
              image: AssetImage(imagePath),
            ),
    
            /// #category
            Padding(
              padding: EdgeInsets.all(8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 1,
                  ),
                  child: Text(
                    articleCategory,
                    style: TextStyle(
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
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.blackColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8).copyWith(top: 4),
                child: Text(
                  articleTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
