import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

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
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            CommonCheckBox(),
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
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            CommonCheckBox(),
          ],
        ),
      ],
    );
  }
}

class CommonCheckBox extends StatefulWidget {
  const CommonCheckBox({
    super.key,
  });

  @override
  State<CommonCheckBox> createState() => _CommonCheckBoxState();
}

class _CommonCheckBoxState extends State<CommonCheckBox> {
  bool firstValue = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Color(0xff4D4DE8),
        value: firstValue,
        onChanged: (bool? value) {
          setState(() {
            firstValue = value!;
          });
        });
  }
}

class CommonCheckBoxWidget extends StatefulWidget {
  const CommonCheckBoxWidget({
    super.key,
  });

  @override
  State<CommonCheckBoxWidget> createState() => _CommonCheckBoxWidgetState();
}

class _CommonCheckBoxWidgetState extends State<CommonCheckBoxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: Color(0xff4D4DE8),
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
