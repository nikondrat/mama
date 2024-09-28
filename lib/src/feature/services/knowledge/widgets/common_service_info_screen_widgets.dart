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

Widget medicCard() {
  return SizedBox(
    height: 120,
    width: double.infinity,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xffF0F2F7),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  Assets.images.imgPerson1.path,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Жанна Коршунова',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: Assets.fonts.nunitoItalic,
                    ),
                  ),
                  SizedBox(width: 8),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Акушер',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Expanded(
                child: Text(
                  maxLines: 4,
                  'Акушер / Консультант по ГВ\nОпыт работы более 20 лет Мама 2 детей...',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                    fontFamily: Assets.fonts.nunitoItalic,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  buildButton('2 статьи'),
                  SizedBox(width: 8),
                  buildButton('Консультации'),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildButton(String text) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      minimumSize: Size(73, 26),
      backgroundColor: AppColors.f8faff,
      foregroundColor: Colors.black,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: Assets.fonts.nunitoItalic,
      ),
    ),
  );
}
