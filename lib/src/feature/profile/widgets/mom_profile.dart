import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/profile/model/model.dart';
import 'package:mama/src/feature/profile/widgets/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MomsProfile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final TextStyle? titlesStyle =
        textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400);

    final MaskTextInputFormatter formatter = MaskTextInputFormatter(
        mask: '+7 ### ###-##-##', filter: {'#': RegExp(r'[0-9]')});

    return Column(
      children: [
        mom.image == null
            ? DashedPhotoProfile()
            : ProfilePhoto(img: mom.image!),
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
                        titleStyle: titlesStyle,
                        inputHintStyle: textTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.w700),
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
                      inputHintStyle: titlesStyle!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                      inputHint: t.profile.labelChangeEmail,
                    ),
                  ),
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'about',
                      hintText: t.profile.hintChangeNote,
                      titleStyle: titlesStyle,
                      inputHint: t.profile.labelChangeNote,
                      inputHintStyle: textTheme.bodySmall!,
                    ),
                  ),
                ],
              ),
              const Gap(8),
              ContainerAccountProfile(
                maxlines: null,
                texthint: t.profile.hintChangeName,
                helper: 'Кристина Константинова',
                helperStyle: helpersStyle,
                labelStyle: GoogleFonts.nunito(
                  textStyle: titlesStyle?.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                controller: momNameController,
                onChange: () {}, //TODO onChangeCallback
              ),
              ContainerAccountProfile(
                keyboardType: TextInputType.phone,
                maxlines: 1,
                texthint: t.profile.hintChangePhone,
                helper: '+7 996 997-06-24',
                maskFormatter: MaskTextInputFormatter(
                    mask: '### ###-##-##', filter: {"#": RegExp(r'[0-9]')}),
                helperStyle: helpersStyle,
                labelStyle: titlesStyle,

                controller: momPhoneController,
                onChange: () {}, //TODO onChangeCallback
              ),
              ContainerAccountProfile(
                keyboardType: TextInputType.emailAddress,
                texthint: t.profile.hintChangeEmail,
                helper: t.profile.labelChangeEmail,
                helperStyle: helpersStyle,
                labelStyle: titlesStyle?.copyWith(
                  color: AppColors.primaryColor,
                ),
                controller: momEmailController,
                onChange: () {}, //TODO onChangeCallback
              ),
              ContainerAccountProfile(
                maxlines: null,
                keyboardType: TextInputType.emailAddress,
                texthint: t.profile.hintChangeNote,
                helper: t.profile.labelChangeNote,
                helperStyle: helpersStyle,
                labelStyle: titlesStyle?.copyWith(
                  color: AppColors.greyBrighterColor,
                ),
                controller: momAboutController,
                onChange: () {}, //TODO onChangeCallback
              ),
              Gap(32),
              CustomButton(
                onPressed: () {},
                text: t.profile.addGiftCodeButtonTitle,
              ),
              Gap(8),
              CustomButton(
                onPressed: () {},
                icon: Icons.language,
                text: t.profile.settingsAccountButtonTitle,
              ),
              32.h,
              // Text(
              //   t.profile.childTitle,
              //   style: widget.titlesColoredStyle,
              // ),
              8.h,
              ChildItems(childs: [
                ChildModel(
                    id: '',
                    firstName: 'Виктория',
                    secondName: '',
                    weight: 3.56),
              ]),
              DisplayChilds(
                childs: mom.childs,
                onChangeBirth: (String value) {}, //TODO логика изменения
                onChangeGender: (String value) {},
                onSwitchBirthComplications: (String value) {},
                onChangeNotes: (String value) {},
                onChangeDateBirth: (String value) {},
                titleStyle: titlesStyle,
                helperStyle: helpersStyle,
                titlesColoredStyle: titlesColoredStyle,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: InkWell(
                  onTap: () {
                    //! добавить ребенка
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 17,
                        image: AssetImage(
                          Assets.icons.icAddChild.path,
                        ),
                      ),
                      Gap(16),
                      Text(
                        t.profile.addChildButtonTitle,
                        style: titlesColoredStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
