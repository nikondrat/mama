import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'body/body_group.dart';
import 'body/items/body_item.dart';

class MomsProfile extends StatefulWidget {
  final MomInfo mom;
  final TextStyle? titlesStyle;
  final TextStyle? helpersStyle;
  final TextStyle? titlesColoredStyle;

  const MomsProfile({
    super.key,
    this.titlesStyle,
    this.helpersStyle,
    this.titlesColoredStyle,
    required this.mom,
  });

  @override
  State<MomsProfile> createState() => _MomsProfileState();
}

class _MomsProfileState extends State<MomsProfile> {
  late FormGroup formGroup;

  @override
  void initState() {
    formGroup = FormGroup({
      'name': FormControl<String>(
        value: widget.mom.name,
        validators: [Validators.required],
      ),
      'phone': FormControl<String>(
        value: widget.mom.phone,
        validators: [Validators.required],
      ),
      'email': FormControl<String>(
        value: widget.mom.mail,
        validators: [Validators.required],
      ),
      'about': FormControl<String>(
        value: widget.mom.notes,
        validators: [Validators.required],
      ),
    });
    super.initState();
  }

  @override
  void dispose() {
    formGroup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final TextStyle titlesStyle =
        textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400);

    final MaskTextInputFormatter formatter = MaskTextInputFormatter(
        mask: '+7 ### ###-##-##', filter: {'#': RegExp(r'[0-9]')});

    return Column(
      children: [
        widget.mom.image == null
            ? DashedPhotoProfile()
            : ProfilePhoto(img: widget.mom.image!),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h,
              BodyGroup(
                formGroup: formGroup,
                title: t.profile.accountTitle,
                items: [
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'name',
                      hintText: t.profile.hintChangeName,
                      titleStyle: textTheme.headlineSmall,
                      maxLines: 1,
                    ),
                  ),
                  BodyItemWidget(
                    item: InputItem(
                        controlName: 'phone',
                        hintText: t.profile.hintChangePhone,
                        titleStyle:
                            titlesStyle.copyWith(color: AppColors.blackColor),
                        inputHintStyle: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        inputHint: '+7 996 997-06-24',
                        maxLines: 1,
                        maskFormatter: formatter),
                  ),
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'email',
                      hintText: t.profile.hintChangeEmail,
                      keyboardType: TextInputType.emailAddress,
                      titleStyle: titlesStyle,
                      inputHintStyle: titlesStyle,
                      inputHint: t.profile.labelChangeEmail,
                    ),
                  ),
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'about',
                      hintText: t.profile.hintChangeNote,
                      titleStyle: titlesStyle,
                      inputHint: t.profile.labelChangeNote,
                      inputHintStyle: textTheme.bodySmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              32.h,
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PromoScreen()),
                  );
                },
                title: t.profile.addGiftCodeButtonTitle,
              ),
              8.h,
              CustomButton(
                onTap: () {},
                icon: Icons.language,
                title: t.profile.settingsAccountButtonTitle,
              ),
              32.h,
              // Text(
              //   t.profile.childTitle,
              //   style: widget.titlesColoredStyle,
              // ),
              8.h,
              ChildItems(childs: [
                ChildModel(id: '', firstName: 'Виктория', secondName: ''),
              ]),
              // DisplayChilds(
              //   childs: widget.mom.childs,
              //   onChangeBirth: (String value) {}, //TODO логика изменения
              //   onChangeGender: (String value) {},
              //   onSwitchBirthComplications: (String value) {},
              //   onChangeNotes: (String value) {},
              //   onChangeDateBirth: (String value) {},
              //   titleStyle: widget.titlesStyle,
              //   helperStyle: widget.helpersStyle,
              //   titlesColoredStyle: widget.titlesColoredStyle,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(28.0),
              //   child: InkWell(
              //     onTap: () {
              //       //! добавить ребенка
              //     },
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Image(
              //           height: 17,
              //           image: AssetImage(
              //             Assets.icons.icAddChild.path,
              //           ),
              //         ),
              //         16.w,
              //         Text(
              //           t.profile.addChildButtonTitle,
              //           style: widget.titlesColoredStyle,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
