import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/feature/feeding/state/add_manually.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/core.dart';

class ManuallyInputContainer extends StatelessWidget {
  const ManuallyInputContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AddManually(),
      dispose: (context, value) => value.dispose(),
      builder: (context, child){
        final model = context.watch<AddManually>();
        log('left side: ${model.left.value.isEmpty}');
        return DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.greyColor, width: 1)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReactiveForm(
                  formGroup: model.formGroup,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InputContainer(title: 'Левая', controlName: 'left',),
                      InputContainer(title: 'Правая', controlName: 'right',)
                    ],
                  ),
                ),
                15.h,
                const _TextWidget(text: "Необязательно"),
                const SizedBox(height: 8),
                const _TextWidget(text: "Можно просто указать общее время ниже")
              ],
            ),
          ),
        );
      },
    );
  }
}

class InputContainer extends StatelessWidget {
  final String controlName;
  final String title;

  const InputContainer({super.key, required this.title, required this.controlName});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final InputBorder inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(6),
    );
    const EdgeInsets inputPadding =
    EdgeInsets.symmetric(horizontal: 12, vertical: 15);

    final MaskTextInputFormatter timeFormatter = MaskTextInputFormatter(
        mask: '##м ##с',
        filter: {'#': RegExp('[0-9]')},
        type: MaskAutoCompletionType.eager);

    const TextAlign inputTextAlign = TextAlign.center;

    final inputHintStyle = textTheme.labelLarge?.copyWith(
        color: AppColors.primaryColor, fontWeight: FontWeight.w700);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: textTheme.headlineSmall?.copyWith(
              color: AppColors.greyBrighterColor,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        10.h,
        Observer(
          builder: (context) {
            final model = context.watch<AddManually>();
            log('left textField ${model.left.value}');
            return Row(
              children: [
                SizedBox(
                  width: 100,
                  child: InputItemWidget(
                    item: InputItem(
                      inputHint: "0м 0с",
                      keyboardType: TextInputType.number,
                      inputHintStyle: inputHintStyle,
                      controlName: controlName,
                      isCollapsed: true,
                      needBackgroundOnFocus: true,
                      textAlign: inputTextAlign,
                      textInputAction: TextInputAction.next,
                      maskFormatter: timeFormatter,
                      border: inputBorder,
                      contentPadding: inputPadding,
                      backgroundColor:
                      AppColors.purpleLighterBackgroundColor,
                    ),
                  ),
                ),
                // 10.w,
                // IconButton(
                //     onPressed: (){},
                //     icon: Icon(Icons.close))
              ],
            );
          }
        ),
      ],
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String text;

  const _TextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Text(
      textAlign: TextAlign.center,
      text,
      style: textTheme.labelMedium
          ?.copyWith(fontSize: 14, color: AppColors.greyBrighterColor),
    );
  }
}