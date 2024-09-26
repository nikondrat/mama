import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';
import 'package:mama/src/feature/trackers/widgets/widgets.dart';

class ToKnowMoreContainer extends StatefulWidget {
  const ToKnowMoreContainer({
    super.key,
  });

  @override
  State<ToKnowMoreContainer> createState() => _ToKnowMoreContainerState();
}

class _ToKnowMoreContainerState extends State<ToKnowMoreContainer> {
  bool isClosed = true;

  @override
  Widget build(BuildContext context) {
    return isClosed
        ? Container(
            padding: EdgeInsets.only(right: 0, left: 16, top: 0, bottom: 0),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.learnMoreColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isClosed = !isClosed;
                    });
                  },
                  icon: Icon(Icons.close, color: AppColors.greyColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Column(
                    children: [
                      Text(
                        'Здесь вы можете следить за весом своего ребенка и контролировать его развитие, сравнивая с нормативами Всемирной Организации Здравоохранения.',
                        style: AppTextStyles.f14w0.copyWith(
                          color: AppColors.greyBrighterColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Узнайте больше про эти нормативы и научитесь правильно измерять вес в нашем Центре Знаний:',
                        style: AppTextStyles.f14w0.copyWith(
                          color: AppColors.greyBrighterColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: KnowMoreButton(
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          )
        : SizedBox();
  }
}
