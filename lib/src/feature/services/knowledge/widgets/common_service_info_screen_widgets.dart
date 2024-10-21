import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class CommonHorizontalWidget extends StatelessWidget {
  final String mainTittle;
  const CommonHorizontalWidget({
    super.key,
    required this.mainTittle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 212,
      width: 164,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 164,
            width: 164,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xffF0F2F7),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            Assets.images.imgMomOne4x.path,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: SizedBox(
                            width: 59,
                            height: 14,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                t.services.sixMonth.title,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Assets.fonts.nunitoItalic,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      mainTittle,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 15);
        },
      ),
    );
  }
}

