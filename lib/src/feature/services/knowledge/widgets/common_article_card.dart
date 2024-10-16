import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/core/utils/router.dart';

class ArticleCard extends StatelessWidget {
  final String author;
  final String role;
  final String title;

  const ArticleCard({
    super.key,
    required this.author,
    required this.role,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        context.pushNamed(AppViews.serviceKnowledgeInfo);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CommonMedicBox(
                    author: author,
                    role: role,
                  ),
                ],
              ),
              SizedBox(width: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    height: 52,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greyColorMedicard,
                      foregroundColor: AppColors.greyBrighterColor,
                      minimumSize: Size(122, 26),
                    ),
                    onPressed: () {},
                    child: Text('Развитие детей'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greyColorMedicard,
                      foregroundColor: AppColors.greyBrighterColor,
                      minimumSize: Size(122, 26),
                    ),
                    onPressed: () {},
                    child: Text('6 месяцев'),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: SizedBox(
                height: 128,
                width: 144,
                child: Image.asset(Assets.images.imgKid.path),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommonMedicBox extends StatelessWidget {
  const CommonMedicBox({super.key, required this.author, required this.role});

  final String author;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 58,
          width: MediaQuery.of(context).size.width * 0.55,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Assets.images.imgPerson1.path),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      author,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: Assets.fonts.sFProTextMedium,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                      width: 52,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.lightBlueBackgroundStatus,
                          // light blue background
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          role,
                          style: const TextStyle(
                            color: AppColors.blueBrightTextColor,
                            // blue text color
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
