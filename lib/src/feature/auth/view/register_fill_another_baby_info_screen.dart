import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterFillAnotherBabyInfoScreen extends StatefulWidget {
  final bool isNotRegister;
  const RegisterFillAnotherBabyInfoScreen({
    super.key,
    required this.isNotRegister,
  });

  @override
  State<RegisterFillAnotherBabyInfoScreen> createState() =>
      _RegisterFillAnotherBabyInfoScreenState();
}

class _RegisterFillAnotherBabyInfoScreenState
    extends State<RegisterFillAnotherBabyInfoScreen> {
  var isFull = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final AuthViewStore store = context.watch();

    final InputBorder inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(6),
    );
    const EdgeInsets inputPadding =
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
        color: AppColors.greyBrighterColor, fontWeight: FontWeight.w400);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: widget.isNotRegister ? const CustomAppBar() : null,
      body: BodyDecoration(
        backgroundImage: DecorationImage(
          image: AssetImage(
            Assets.images.authDecor.path,
          ),
          alignment: Alignment.topLeft,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(),
              TitleWidget(
                  text:
                      '${store.child.firstName}, ${t.register.beautifulName} 🙂'),
              8.h,
              TitleWidget(
                  text: t.register.rememberWhenWasBorn(
                      context: GenderContext.values[store.child.gender.index])),
              10.h,
              ReactiveForm(
                formGroup: store.childData,
                child: BodyGroup(title: '', items: [
                  BodyItemWidget(
                    item: ItemWithInput(
                        inputItem: InputItem(
                          inputHint: t.profile.inputHint,
                          inputHintStyle: inputHintStyle,
                          controlName: 'weight',
                          needBackgroundOnFocus: true,
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
                          needBackgroundOnFocus: true,
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
                          needBackgroundOnFocus: true,
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
                  20.h,
                  ReactiveFormConsumer(builder: (context, form, child) {
                    final isValid = form.valid;

                    return Center(
                      child: Text(
                          isValid
                              ? t.register.thankYou(emoji: '😇')
                              : t.register.ifInconvenientToSearch,
                          textAlign: TextAlign.center,
                          style: textTheme.labelLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400)),
                    );
                  }),
                ]),
              ),
              const Spacer(),
              CustomButton(
                  isSmall: false,
                  title: t.register.next,
                  onTap: () {
                    store.child.setWeight(
                        (store.weight.value as String).extractNumber());
                    store.child.setHeight(
                        (store.height.value as String).extractNumber());
                    store.child.setHeadCircumference(
                        (store.headCircumference.value as String)
                            .extractNumber());

                    context.pushNamed(AppViews.registerInfoAboutChildbirth,
                        extra: {
                          'isNotRegister': widget.isNotRegister,
                        });
                  }),
              40.h
            ],
          ),
        ),
      ),
    );
  }
}
