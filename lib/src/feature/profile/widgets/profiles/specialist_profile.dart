import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SpecialistProfile extends StatefulWidget {
  final ProfileViewStore store;
  final MaskTextInputFormatter formatter;
  final AccountModel accountModel;

  final TextStyle? titlesStyle;
  final TextStyle? helpersStyle;
  final TextStyle? titlesColoredStyle;

  const SpecialistProfile({
    super.key,
    required this.store,
    this.titlesStyle,
    this.helpersStyle,
    this.titlesColoredStyle,
    required this.accountModel,
    required this.formatter,
  });

  @override
  State<SpecialistProfile> createState() => _SpecialistProfileState();
}

class _SpecialistProfileState extends State<SpecialistProfile> {
  bool subscribed = true;

  @override
  void initState() {
    widget.store.init();
    super.initState();
  }

  @override
  void dispose() {
    widget.store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final TextStyle titlesStyle =
        textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400);

    return Column(
      children: [
        widget.accountModel.avatarUrl == null
            ? const DashedPhotoProfile()
            : ProfilePhoto(img: widget.accountModel.avatarUrl!),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h,
              BodyGroup(
                padding: const EdgeInsets.symmetric(vertical: 4),
                formGroup: widget.store.formGroup,
                title: t.profile.accountTitleSpecialist,
                items: [
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'name',
                      hintText: t.profile.hintChangeName,
                      titleStyle: textTheme.headlineSmall,
                      maxLines: 1,
                      onChanged: (value) {
                        widget.store.updateData();
                      },
                    ),
                  ),
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'profession',
                      hintText: t.profile.helperProfession,
                      titleStyle:
                          titlesStyle.copyWith(color: AppColors.blackColor),
                      inputHintStyle: textTheme.bodySmall!,
                      inputHint: t.profile.hintProfession,
                      maxLines: 1,
                      onChanged: (value) {
                        widget.store.updateData();
                      },
                    ),
                  ),
                  8.h,
                  Center(
                    child: RichText(
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${t.profile.titleNameProffession}\n',
                            style: textTheme.labelLarge!,
                          ),
                          const WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                            ),
                          ),
                          TextSpan(
                            text: widget.store.formGroup
                                .control('name')
                                .value
                                .toString(),
                            style: textTheme.bodyMedium,
                          ),
                          if (widget.store.formGroup
                              .control('profession')
                              .value
                              .toString()
                              .isNotEmpty)
                            WidgetSpan(
                              child: ProfessionBox(
                                profession: widget.store.formGroup
                                    .control('profession')
                                    .value
                                    .toString(),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  8.h,
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'phone',
                      hintText: t.profile.hintChangePhoneSchool,
                      titleStyle:
                          titlesStyle.copyWith(color: AppColors.blackColor),
                      inputHintStyle: textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      inputHint: '+7 996 997-06-24',
                      maxLines: 1,
                      maskFormatter: widget.formatter,
                      onChanged: (value) {
                        widget.store.updateData();
                      },
                    ),
                  ),
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'email',
                      maxLines: 1,
                      hintText: t.profile.hintChangeEmailSchool,
                      keyboardType: TextInputType.emailAddress,
                      titleStyle: titlesStyle,
                      inputHintStyle: titlesStyle,
                      inputHint: t.profile.labelChangeEmail,
                      onChanged: (value) {
                        widget.store.updateData();
                      },
                    ),
                  ),
                  8.h,
                  Text(
                    t.profile.titleInfo,
                    style: textTheme.labelLarge!,
                  ),
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'about',
                      maxLines: 1,
                      hintText: t.profile.hintChangeNoteSpecialist,
                      titleStyle: titlesStyle,
                      inputHint: t.profile.labelChangeNote,
                      inputHintStyle: textTheme.bodySmall!
                          .copyWith(fontWeight: FontWeight.w700),
                      onChanged: (value) {
                        widget.store.updateData();
                      },
                    ),
                  ),
                ],
              ),
              16.h,
              CustomButton(
                onTap: () {},
                isSmall: false,
                icon: IconModel(
                  icon: Icons.language,
                ),
                title: t.profile.settingsAccountButtonTitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
