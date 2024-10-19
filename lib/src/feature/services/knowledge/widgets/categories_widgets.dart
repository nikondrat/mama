import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/colors.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_checkbox.dart';

class BuildCategory extends StatefulWidget {
  final String title;
  final int count;
  final List<Widget> subCategories;

  const BuildCategory({
    super.key,
    required this.title,
    required this.count,
    required this.subCategories,
  });

  @override
  State<BuildCategory> createState() => _BuildCategoryState();
}

class _BuildCategoryState extends State<BuildCategory> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        iconColor: AppColors.blue,
        collapsedIconColor: AppColors.blue,
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: Assets.fonts.sFProTextBold,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Text(
                widget.count.toString(),
              ),
            ),
            Expanded(
              child: CommonCheckBoxWidget(),
            )
          ],
        ),
        children: widget.subCategories,
      ),
    );
  }
}

class BuildSubCategory extends StatelessWidget {
  final String title;
  final int count;

  const BuildSubCategory({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 17,
              fontFamily: Assets.fonts.sFProTextMedium,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: Assets.fonts.sFProTextMedium,
                  fontWeight: FontWeight.w400,
                ),
              ),
              CommonCheckBoxWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
