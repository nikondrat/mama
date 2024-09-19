

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/state/register_state/register_another_baby_info/register_another_baby_info.dart';
import 'package:mama/src/feature/profile/widgets/body/body_group.dart';
import 'package:mama/src/feature/profile/widgets/body/items/body_item.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../widgets/widgets.dart';

class RegisterFillAnotherBabyInfoScreen extends StatefulWidget {
  const RegisterFillAnotherBabyInfoScreen({super.key});

  @override
  State<RegisterFillAnotherBabyInfoScreen> createState() =>
      _RegisterFillAnotherBabyInfoScreenState();
}

class _RegisterFillAnotherBabyInfoScreenState
    extends State<RegisterFillAnotherBabyInfoScreen> {
  var isFull = false;

  final registerAnotherInfo = RegisterAnotherBabyInfo();

  @override
  void dispose() {
    super.dispose();
    registerAnotherInfo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final InputBorder inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(6),
    );
    final EdgeInsets inputPadding =
        EdgeInsets.symmetric(horizontal: 12, vertical: 4);

    final MaskTextInputFormatter weightFormatter = MaskTextInputFormatter(
        mask: '#,## ${t.profile.unitMeasureWeight}',
        filter: {'#': RegExp('[0-9]')},
        type: MaskAutoCompletionType.eager);

    final MaskTextInputFormatter sizeFormatter = MaskTextInputFormatter(
        mask: '## ${t.profile.unitMeasureHeight}',
        filter: {'#': RegExp('[0-9]')},
        type: MaskAutoCompletionType.eager);

    const TextAlign inputTextAlign = TextAlign.center;

    final inputHintStyle = textTheme.bodyMedium?.copyWith(
        color: AppColors.greyBrighterColor,
        fontWeight: FontWeight.w400
    );

    return Scaffold(
      body: BodyDecoration(
        backgroundImage: DecorationImage(
          image: AssetImage(
            Assets.images.authDecor.path,
          ),
          alignment: Alignment.topLeft,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Spacer(),
              TitleWidget(
                  text: 'Алла-Виктория, ${t.register.beautifulName} 🙂'),
              8.h,
              TitleWidget(text: t.register.rememberWhenShe),
              10.h,
              ReactiveForm(
                formGroup: registerAnotherInfo.formGroup,
                child: BodyGroup(title: '', items: [
                  BodyItemWidget(
                    item: ItemWithInput(
                        inputItem: InputItem(
                          inputHint: t.register.enter,
                          inputHintStyle: inputHintStyle,
                          controlName: 'weight',
                          isCollapsed: true,
                          textAlign: inputTextAlign,
                          textInputAction: TextInputAction.next,
                          maskFormatter: weightFormatter,
                          border: inputBorder,
                          contentPadding: inputPadding,
                          backgroundColor:
                              AppColors.purpleLighterBackgroundColor,
                        ),
                        bodyItem: CustomBodyItem(
                          title: t.profile.weightTitle,
                        )),
                  ),
                  BodyItemWidget(
                    item: ItemWithInput(
                        inputItem: InputItem(
                          inputHint: t.register.enter,
                          inputHintStyle: inputHintStyle,
                          controlName: 'height',
                          isCollapsed: true,
                          textAlign: inputTextAlign,
                          textInputAction: TextInputAction.next,
                          maskFormatter: sizeFormatter,
                          border: inputBorder,
                          contentPadding: inputPadding,
                          backgroundColor:
                              AppColors.purpleLighterBackgroundColor,
                        ),
                        bodyItem: CustomBodyItem(
                          title: t.profile.heightTitle,
                        )),
                  ),
                  BodyItemWidget(
                    item: ItemWithInput(
                        inputItem: InputItem(
                          inputHintStyle: inputHintStyle,
                          inputHint: t.register.enter,
                          controlName: 'headCircumference',
                          isCollapsed: true,
                          textAlign: inputTextAlign,
                          textInputAction: TextInputAction.next,
                          maskFormatter: sizeFormatter,
                          border: inputBorder,
                          contentPadding: inputPadding,
                          backgroundColor:
                              AppColors.purpleLighterBackgroundColor,
                        ),
                        bodyItem: CustomBodyItem(
                          title: t.profile.headCircumferenceTitle,
                        )),
                  ),
                ]),
              ),
              20.h,
              Text(
                  isFull
                      ? t.register.thankYou
                      : t.register.ifInconvenientToSearch,
                  textAlign: TextAlign.center,
                  style: textTheme.labelLarge
                      ?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400
                  )),
              const Spacer(),
              CustomButton(
                  title: t.register.next,
                  textStyle: textTheme.bodyMedium
                      ?.copyWith(color: AppColors.primaryColor),
                  onTap: () {
                    context.pushNamed(AppViews.registerInfoAboutChildbirth);
                  }),
              40.h
            ],
          ),
        ),
      ),
    );
  }
}
