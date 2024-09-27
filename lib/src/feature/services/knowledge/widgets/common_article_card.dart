import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/services/knowledge/views/service_info_screen.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ServiceInfoScreen(),
          ),
        );
      },
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 58,
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                      color: AppColors.f8faff,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage(Assets.images.imgPerson1.path),
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
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color:
                                    AppColors.gradientPurpleBackgroundScaffold,
                                // light blue background
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Акушер',
                                style: TextStyle(
                                  color: AppColors.blueBrightTextColor,
                                  // blue text color
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greyButton,
                      foregroundColor: AppColors.greyBrighterColor,
                    ),
                    onPressed: () {},
                    child: Text('Развитие детей'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greyButton,
                      foregroundColor: AppColors.greyBrighterColor,
                    ),
                    onPressed: () {},
                    child: Text('6 месяцев'),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: SizedBox(
                height: 128,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(Assets.images.imgKid.path),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
