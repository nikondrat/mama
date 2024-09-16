import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ChildBarWidget extends StatelessWidget {
  final ChildModel child;
  const ChildBarWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReactiveTextField(
                  formControlName: 'name',
                  // onChanged: (value) => onChangeName,
                  // controller: childNameController,
                  // style: GoogleFonts.nunito(
                  //   textStyle: titleStyle?.copyWith(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: t.profile.hintAddChildName,
                    // hintStyle: GoogleFonts.nunito(
                    //   textStyle: titleStyle?.copyWith(
                    //       fontSize: 24,
                    //       fontWeight: FontWeight.w700,
                    //       color: AppColors.greyColor),
                    // ),
                    // labelStyle: GoogleFonts.nunito(
                    //   textStyle: titleStyle?.copyWith(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
                  ),
                ),
                // Text(
                //   childNameController.text.isEmpty
                //       ? t.profile.helperAddChildName
                //       : t.profile.helperChangeChildName,
                //   style: helperStyle,
                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      side: BorderSide(color: AppColors.redColor, width: 1),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width / 4, 28)),
                  onPressed: () {},
                  child: Text(
                    t.profile.deleteChildButtonTitle,
                    // style: helperStyle?.copyWith(
                    //   color: AppColors.redColor,
                    // ),
                  ),
                ),
                25.h,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IntrinsicWidth(
                      child: ReactiveTextField(
                        formControlName: 'dateBirth',
                        // onChanged: (value) => onChangeDateBirth,
                        // controller: childDateBirthController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: t.profile.hintDateBirth,
                          // hintStyle: titleStyle?.copyWith(
                          //     color: AppColors.greyBrighterColor),
                          // labelStyle: titleStyle,
                        ),
                      ),
                    ),
                    16.h,
                    Row(
                      children: [
                        Expanded(
                            child: AutoSizeText(
                          '24 недели\n5 месяцев 8 дней',
                        )),
                      ],
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       '24 недели',
                    //       // style: helperStyle?.copyWith(
                    //       //     fontWeight: FontWeight.w400),
                    //     ),
                    //     Text(
                    //       '5 месяцев 8 дней',
                    //       // style: helperStyle?.copyWith(
                    //       //     fontWeight: FontWeight.w400),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
                Text(
                  t.profile.helperDateBirth,
                  // style: helperStyle,
                ),
              ],
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              child.avatarUrl != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(child.avatarUrl!),
                    )
                  : CircleAvatar(
                      radius: 64,
                      backgroundColor: AppColors.purpleLighterBackgroundColor,
                      child: Image.asset(
                        height: 56,
                        Assets.icons.kidNoPhoto.path,
                        color: AppColors.whiteColor,
                      ),
                    ),
              Positioned(
                bottom: -40,
                right: 16,
                left: 16,
                child: IconButton(
                  icon: Image.asset(
                    Assets.icons.icPhotoAdd.path,
                    alignment: Alignment.center,
                    height: 64,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
