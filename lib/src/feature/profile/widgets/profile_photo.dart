import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class ProfilePhoto extends StatelessWidget {
  final String img;
  const ProfilePhoto({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          height: 390,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            image: DecorationImage(
                image: AssetImage(
                  img,
                ),
                fit: BoxFit.cover),
          ),
        ),
        Positioned.fill(
          bottom: -32,
          right: 32,
          child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Image.asset(
                Assets.icons.icPhotoAdd.path,
                height: 64,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class DashedPhotoProfile extends StatelessWidget {
  const DashedPhotoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      decoration: const BoxDecoration(
        color: AppColors.purpleLighterBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1.0, left: 1.0, right: 1.0),
        child: DottedBorder(
          strokeWidth: 1.5,
          color: AppColors.primaryColor,
          borderType: BorderType.RRect,
          dashPattern: const [10, 7],
          radius: const Radius.circular(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: 64,
                  image: AssetImage(
                    Assets.icons.icPhotoAdd.path,
                  ),
                ),
                Text(t.profile.addPhotoTitle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
