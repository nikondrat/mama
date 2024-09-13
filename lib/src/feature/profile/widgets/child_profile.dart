import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/profile/model/model.dart';

class ChildProfile extends StatelessWidget {
  final Function(String value) onChangeName;
  final Function(String value) onChangeDateBirth;
  final Function(String value) onChangeGender;
  final Function(String value) onSwitchTweens;
  final Function(String value) onChangeBirth;
  final Function(String value) onSwitchBirthComplications;
  final Function(String value) onChangeNotes;
  final TextStyle? titleStyle;
  final TextStyle? helperStyle;
  final TextStyle? titlesColoredStyle;
  final ChildInfo child;

  const ChildProfile({
    super.key,
    required this.onChangeBirth,
    required this.child,
    required this.onSwitchTweens,
    required this.onChangeGender,
    required this.onSwitchBirthComplications,
    required this.onChangeNotes,
    required this.onChangeName,
    required this.onChangeDateBirth,
    this.titleStyle,
    this.helperStyle,
    this.titlesColoredStyle,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController childNameController =
        TextEditingController(text: child.name);
    final TextEditingController childDateBirthController =
        TextEditingController(
            text: DateFormat('dd MMMM y').format(child.dateBirth));
    final TextEditingController childWeightBirthController =
        TextEditingController(text: child.weight.toString());
    final TextEditingController childHeightBirthController =
        TextEditingController(text: child.height.toString());
    final TextEditingController childheadCircumferenceBirthController =
        TextEditingController(text: child.headCircumference.toString());
    final TextEditingController childNotesController =
        TextEditingController(text: child.notes);
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          onChanged: (value) => onChangeName,
                          controller: childNameController,
                          style: GoogleFonts.nunito(
                            textStyle: titleStyle?.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: t.profile.hintAddChildName,
                            hintStyle: GoogleFonts.nunito(
                              textStyle: titleStyle?.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.greyColor),
                            ),
                            labelStyle: GoogleFonts.nunito(
                              textStyle: titleStyle?.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          childNameController.text.isEmpty
                              ? t.profile.helperAddChildName
                              : t.profile.helperChangeChildName,
                          style: helperStyle,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              side: BorderSide(
                                  color: AppColors.redColor, width: 1),
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width / 4, 28)),
                          onPressed: () {},
                          child: Text(
                            t.profile.deleteChildButtonTitle,
                            style: helperStyle?.copyWith(
                              color: AppColors.redColor,
                            ),
                          ),
                        ),
                        Gap(25),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IntrinsicWidth(
                              child: TextField(
                                onChanged: (value) => onChangeDateBirth,
                                controller: childDateBirthController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  hintText: t.profile.hintDateBirth,
                                  hintStyle: titleStyle?.copyWith(
                                      color: AppColors.greyBrighterColor),
                                  labelStyle: titleStyle,
                                ),
                              ),
                            ),
                            Gap(16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '24 недели',
                                  style: helperStyle?.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '5 месяцев 8 дней',
                                  style: helperStyle?.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          t.profile.helperDateBirth,
                          style: helperStyle,
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      child.image != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: AssetImage(child.image!),
                            )
                          : CircleAvatar(
                              radius: 64,
                              backgroundColor:
                                  AppColors.purpleLighterBackgroundColor,
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.profile.genderTitle,
                  style: titleStyle,
                ),
                FlutterToggleButton(
                  outerContainerMargin: 3,
                  buttonWidth: 128,
                  buttonHeight: 38,
                  buttonColor: Colors.white,
                  enableTextColor: AppColors.primaryColor,
                  buttonTextFontSize: 14,
                  borderRadius: 6,
                  outerContainerColor: AppColors.purpleLighterBackgroundColor,
                  onTap: (index) => onChangeGender,
                  items: [
                    Gender.female.name,
                    Gender.male.name,
                  ],
                ),
              ],
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.profile.twinsTitle,
                        style: titleStyle,
                      ),
                      Text(
                        t.profile.twinsHelper,
                        style:
                            helperStyle?.copyWith(fontWeight: FontWeight.w400),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
                CupertinoSwitch(
                  value: child.twins,
                  activeColor: AppColors.primaryColor,
                  trackColor: AppColors.greyColor,
                  onChanged: (value) {
                    onSwitchTweens;
                  },
                ),
              ],
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.profile.weightTitle,
                  style: titleStyle,
                ),
                TextInputContainer(
                  controller: childWeightBirthController,
                  isEmpty: child.weight == null,
                  onChange: (String value) {},
                  unitMeasure: t.profile.unitMeasureWeight,
                )
              ],
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.profile.heightTitle,
                  style: titleStyle,
                ),
                TextInputContainer(
                  controller: childHeightBirthController,
                  isEmpty: child.height == null,
                  onChange: (String value) {},
                  unitMeasure: t.profile.unitMeasureHeight,
                )
              ],
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.profile.headCircumferenceTitle,
                  style: titleStyle,
                ),
                TextInputContainer(
                  controller: childheadCircumferenceBirthController,
                  isEmpty: child.headCircumference == null,
                  onChange: (String value) {},
                  unitMeasure: t.profile.unitMeasureHeight,
                )
              ],
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.profile.birthTitle,
                  style: titleStyle,
                ),
                FlutterToggleButton(
                  outerContainerMargin: 3,
                  buttonWidth: 128,
                  buttonHeight: 38,
                  buttonColor: Colors.white,
                  enableTextColor: AppColors.primaryColor,
                  buttonTextFontSize: 14,
                  borderRadius: 6,
                  outerContainerColor: AppColors.purpleLighterBackgroundColor,
                  onTap: (index) => onChangeBirth,
                  items: [
                    Birth.natural.name,
                    Birth.cesarean.name,
                  ],
                ),
              ],
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.profile.birthComplicationsTitle,
                  style: titleStyle,
                ),
                CupertinoSwitch(
                  value: child.birthComplications,
                  activeColor: AppColors.primaryColor,
                  trackColor: AppColors.greyColor,
                  onChanged: (value) {
                    onSwitchBirthComplications;
                  },
                ),
              ],
            ),
            Gap(16),
            DottedBorder(
              strokeWidth: 1.5,
              color: AppColors.greyLighterColor,
              borderType: BorderType.RRect,
              dashPattern: const [10, 7],
              radius: const Radius.circular(8),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    maxLines: null,
                    onChanged: (value) => onChangeNotes,
                    controller: childNotesController,
                    style: titleStyle?.copyWith(
                      color: AppColors.greyBrighterColor,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: t.profile.childNotesHint,
                      hintStyle: titleStyle?.copyWith(
                        color: AppColors.greyBrighterColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextInputContainer extends StatelessWidget {
  final TextEditingController controller;
  final bool isEmpty;
  final String unitMeasure;
  final Function(String value) onChange;
  const TextInputContainer(
      {super.key,
      required this.controller,
      required this.isEmpty,
      required this.onChange,
      required this.unitMeasure});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isEmpty
              ? AppColors.primaryColor
              : AppColors.purpleLighterBackgroundColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                onChanged: onChange,
                controller: controller,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color:
                        isEmpty ? AppColors.whiteColor : AppColors.blackColor),
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: isEmpty
                          ? AppColors.whiteDarkerButtonColor
                          : AppColors.greyColor),
                  hintText: t.profile.inputHint,
                  border: InputBorder.none,
                ),
              ),
            ),
            Text(
              unitMeasure,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: isEmpty ? AppColors.whiteColor : AppColors.blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
