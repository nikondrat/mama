import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_checkbox.dart';

class AuthorsSub extends StatelessWidget {
  final String title;
  final String titleAuthor;
  final int count;

  const AuthorsSub({
    super.key,
    required this.title,
    required this.count,
    required this.titleAuthor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(Assets.images.imgPerson2.path),
        ),
        SizedBox(width: 10),
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontFamily: Assets.fonts.sFProTextRegular,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(width: 3),
            SizedBox(
              height: 14,
              width: 43,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.lightPurple,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  titleAuthor,
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.blue,
                    fontFamily: Assets.fonts.sFProTextRegular,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Text(
              count.toString(),
              style: TextStyle(color: AppColors.greyLighterColor, fontSize: 17),
            ),
            CommonCheckBoxWidget(),
          ],
        ),
      ],
    );
  }
}

class SchoolSub extends StatelessWidget {
  final String title;
  final int count;

  const SchoolSub({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(Assets.images.imgPerson1.path),
        ),
        SizedBox(width: 10),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: Assets.fonts.sFProTextRegular,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(width: 3),
            ],
          ),
        ),
        SizedBox(width: 40),
        Row(
          children: [
            Text(
              count.toString(),
              style: TextStyle(color: AppColors.greyLighterColor, fontSize: 17),
            ),
            CommonCheckBoxWidget(),
          ],
        ),
      ],
    );
  }
}
