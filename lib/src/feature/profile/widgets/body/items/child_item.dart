import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import 'package:mama/src/data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../body_group.dart';
import 'body_item.dart';

class ChildItem extends StatefulWidget {
  final ChildModel model;
  const ChildItem({
    super.key,
    required this.model,
  });

  @override
  State<ChildItem> createState() => _ChildItemState();
}

class _ChildItemState extends State<ChildItem> {
  late FormGroup formGroup;

  @override
  void initState() {
    formGroup = FormGroup({
      'name': FormControl<String>(value: widget.model.firstName),
      'weight': FormControl<double>(value: widget.model.weight),
      'height': FormControl<double>(value: widget.model.height),
      'headCircumference':
          FormControl<double>(value: widget.model.headCircumference),
      'dateBirth': FormControl<DateTime>(value: widget.model.birthDate),
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

    return Observer(builder: (context) {
      return BodyGroup(
          title: t.profile.childTitle,
          formGroup: formGroup,
          isDecorated: true,
          items: [
            BodyItemWidget(
                item: CustomBodyItem(
              title: t.profile.genderTitle,
              body: FlutterToggleButton(
                outerContainerMargin: 3,
                buttonWidth: 128,
                buttonHeight: 38,
                buttonColor: Colors.white,
                enableTextColor: AppColors.primaryColor,
                buttonTextFontSize: 14,
                borderRadius: 6,
                outerContainerColor: AppColors.purpleLighterBackgroundColor,
                onTap: (index) =>
                    widget.model.setGender(ChildGender.values[index]),
                items: [
                  t.profile.sex(context: GenderContext.female),
                  t.profile.sex(context: GenderContext.male),
                ],
              ),
            )),
            BodyItemWidget(
                item: ItemWithSwitch(
                    title: t.profile.twinsTitle,
                    subtitle: t.profile.twinsHelper,
                    value: widget.model.isTwins,
                    onChanged: (value) => widget.model.setIsTwins(value))),
            BodyItemWidget(
              item: ItemWithInput(
                  inputItem: InputItem(
                    controlName: 'weight',
                    isCollapsed: true,
                    textAlign: inputTextAlign,
                    textInputAction: TextInputAction.next,
                    maskFormatter: weightFormatter,
                    border: inputBorder,
                    contentPadding: inputPadding,
                    backgroundColor: AppColors.purpleLighterBackgroundColor,
                  ),
                  bodyItem: CustomBodyItem(
                    title: t.profile.weightTitle,
                  )),
            ),
            BodyItemWidget(
              item: ItemWithInput(
                  inputItem: InputItem(
                    controlName: 'height',
                    isCollapsed: true,
                    textAlign: inputTextAlign,
                    textInputAction: TextInputAction.next,
                    maskFormatter: sizeFormatter,
                    border: inputBorder,
                    contentPadding: inputPadding,
                    backgroundColor: AppColors.purpleLighterBackgroundColor,
                  ),
                  bodyItem: CustomBodyItem(
                    title: t.profile.heightTitle,
                  )),
            ),
            BodyItemWidget(
              item: ItemWithInput(
                  inputItem: InputItem(
                    controlName: 'headCircumference',
                    isCollapsed: true,
                    textAlign: inputTextAlign,
                    textInputAction: TextInputAction.next,
                    maskFormatter: sizeFormatter,
                    border: inputBorder,
                    contentPadding: inputPadding,
                    backgroundColor: AppColors.purpleLighterBackgroundColor,
                  ),
                  bodyItem: CustomBodyItem(
                    title: t.profile.headCircumferenceTitle,
                  )),
            ),
            BodyItemWidget(
                item: CustomBodyItem(
              title: t.profile.birthTitle,
              body: FlutterToggleButton(
                outerContainerMargin: 3,
                buttonWidth: 128,
                buttonHeight: 38,
                buttonColor: Colors.white,
                enableTextColor: AppColors.primaryColor,
                buttonTextFontSize: 14,
                borderRadius: 6,
                outerContainerColor: AppColors.purpleLighterBackgroundColor,
                onTap: (index) =>
                    widget.model.setChildbirth(Childbirth.values[index]),
                items: [
                  Childbirth.natural.name,
                  Childbirth.cesarian.name,
                ],
              ),
            )),
            BodyItemWidget(
                item: ItemWithSwitch(
                    title: t.profile.birthComplicationsTitle,
                    value: widget.model.childbirthWithComplications,
                    onChanged: (value) {
                      widget.model.setChildbirthWithComplications(value);
                    })),
          ]);
    });
  }
}
