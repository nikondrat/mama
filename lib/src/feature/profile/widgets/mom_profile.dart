import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class MomsProfile extends StatefulWidget {
  final ProfileViewStore store;

  final AccountModel accountModel;

  final TextStyle? titlesStyle;
  final TextStyle? helpersStyle;
  final TextStyle? titlesColoredStyle;

  const MomsProfile({
    super.key,
    required this.store,
    this.titlesStyle,
    this.helpersStyle,
    this.titlesColoredStyle,
    required this.accountModel,
  });

  @override
  State<MomsProfile> createState() => _MomsProfileState();
}

class _MomsProfileState extends State<MomsProfile> {
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
    final UserStore userStore = context.watch();

    final TextStyle titlesStyle =
        textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400);

    final MaskTextInputFormatter formatter = MaskTextInputFormatter(
        mask: '+7 ### ###-##-##', filter: {'#': RegExp(r'[0-9]')});

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
                formGroup: widget.store.formGroup,
                title: t.profile.accountTitle,
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
                      controlName: 'phone',
                      hintText: t.profile.hintChangePhone,
                      titleStyle:
                          titlesStyle.copyWith(color: AppColors.blackColor),
                      inputHintStyle: textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      inputHint: '+7 996 997-06-24',
                      maxLines: 1,
                      maskFormatter: formatter,
                      onChanged: (value) {
                        widget.store.updateData();
                      },
                    ),
                  ),
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'email',
                      maxLines: 1,
                      hintText: t.profile.hintChangeEmail,
                      keyboardType: TextInputType.emailAddress,
                      titleStyle: titlesStyle,
                      inputHintStyle: titlesStyle,
                      inputHint: t.profile.labelChangeEmail,
                      onChanged: (value) {
                        widget.store.updateData();
                      },
                    ),
                  ),
                  BodyItemWidget(
                    item: InputItem(
                      controlName: 'about',
                      maxLines: 1,
                      hintText: t.profile.hintChangeNote,
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
              32.h,
              CustomButton(
                isSmall: false,
                onTap: () {
                  context.pushNamed(AppViews.promoView);
                },
                title: t.profile.addGiftCodeButtonTitle,
              ),
              8.h,
              CustomButton(
                onTap: () {},
                isSmall: false,
                icon: IconModel(
                  icon: Icons.language,
                ),
                title: t.profile.settingsAccountButtonTitle,
              ),
              30.h,
              IgnorePointer(
                ignoring: !subscribed,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: !subscribed ? 0.25 : 1,
                      child: Observer(builder: (_) {
                        return ChildItems(
                          childs: userStore.children.toList(),
                        );
                      }),
                    ),
                    if (!subscribed) const SubscribeBlockItem(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: InkWell(
                  onTap: () {
                    context.pushNamed(AppViews.registerFillBabyName, extra: {
                      'isNotRegister': true,
                    });
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
                      16.w,
                      Text(
                        t.profile.addChildButtonTitle,
                        style: widget.titlesColoredStyle,
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
