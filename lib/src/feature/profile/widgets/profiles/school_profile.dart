import 'package:flutter/material.dart';
import 'package:mama/src/core/widgets/body/decoration.dart';
import 'package:mama/src/data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SchoolProfile extends StatefulWidget {
  final ProfileViewStore store;

  final AccountModel accountModel;
  final MaskTextInputFormatter formatter;
  final TextStyle? titlesStyle;
  final TextStyle? helpersStyle;
  final TextStyle? titlesColoredStyle;

  const SchoolProfile({
    super.key,
    required this.store,
    this.titlesStyle,
    this.helpersStyle,
    this.titlesColoredStyle,
    required this.accountModel,
    required this.formatter,
  });

  @override
  State<SchoolProfile> createState() => _SchoolProfileState();
}

class _SchoolProfileState extends State<SchoolProfile> {
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
                title: t.profile.accountTitleSchool,
                items: [
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'name',
                      hintText: t.profile.hintChangeNameSchool,
                      titleStyle: textTheme.headlineSmall,
                      maxLines: 1,
                      onChanged: (value) {
                        widget.store.updateData();
                      },
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      t.profile.titleInfo,
                      style: textTheme.labelLarge!,
                    ),
                  ),
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'about',
                      maxLines: 1,
                      hintText: t.profile.hintChangeNoteSchool,
                      titleStyle: titlesStyle,
                      inputHint: t.profile.labelChangeNoteSchool,
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
              30.h,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  t.profile.titleCourses,
                  style: textTheme.labelLarge!,
                ),
              ),

              /// #courses
              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: 3,
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: CourseItemWidget(
                      item: CourseItem(
                          subtitle:
                              'Запись 6-ти полезных вебинаров с ответами на вопросы',
                          title: 'Полезные вебинары'),
                    ),
                  );
                },
              ),
              20.h,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  t.profile.titleArticle,
                  style: textTheme.labelLarge!,
                ),
              ),
              8.h,

              /// #articles
              BodyItemDecoration(
                padding: EdgeInsets.symmetric(vertical: 16),
                shadow: true,
                child: SizedBox(
                  height: 220,
                  child: ListView.separated(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return ArticleBox(
                        imagePath: Assets.images.imgMomOne4x.path,
                        articleCategory: t.home.sixMonths.title,
                        articleTitle: t.home.articleTitleOne.title,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                  ),
                ),
              ),
              20.h,
            ],
          ),
        ),
      ],
    );
  }
}
