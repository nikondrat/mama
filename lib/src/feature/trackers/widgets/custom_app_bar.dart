import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';

class CustomAppBa extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBa({
    super.key,
    this.bottom,
    this.isSizeTrue = true,
  });

  final PreferredSizeWidget? bottom;
  final bool isSizeTrue;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blueLighter1,
      foregroundColor: AppColors.blackColor,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          children: [
            const SizedBox(width: 8),
            const Icon(Icons.arrow_back_ios_new),
            const SizedBox(width: 5),
            Text(
              'Назад',
              style: AppTextStyles.f17w0.copyWith(
                color: AppColors.greyBrighterColor,
              ),
            ),
          ],
        ),
      ),
      leadingWidth: 90,
      title: Text(
        isSizeTrue ? 'Развитие' : 'Добавить вес',
        style: isSizeTrue
            ? const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)
            : const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      bottom: bottom,
      actions: [
        isSizeTrue
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    // First (background) circular image
                    const ClipOval(
                      child: SizedBox(
                        height: double.infinity,
                        width: 80,
                      ),
                    ),

                    Positioned(
                      right: 0,
                      top: 7,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor,
                        ),
                        child: Center(
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/img_person_1.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor,
                        ),
                        child: Center(
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/img_person_2.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => Size(100, isSizeTrue ? 110 : 60);
}
