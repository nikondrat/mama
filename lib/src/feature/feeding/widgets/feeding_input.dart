import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputContainer extends StatelessWidget {
  final String controlName;
  final String title;
  final MaskTextInputFormatter? formatter;
  final String inputHint;

  const InputContainer(
      {super.key,
      required this.controlName,
      required this.title,
      this.formatter,
      required this.inputHint});

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

    final MaskTextInputFormatter mlFormatter = MaskTextInputFormatter(
        mask: '##м ##с',
        filter: {'#': RegExp('[0-9]')},
        type: MaskAutoCompletionType.eager);

    const TextAlign inputTextAlign = TextAlign.center;

    final inputHintStyle = textTheme.labelLarge
        ?.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w700);

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
        Row(
          children: [
            SizedBox(
              width: 100,
              child: InputItemWidget(
                item: InputItem(
                  inputHint: inputHint,
                  keyboardType: TextInputType.number,
                  inputHintStyle: inputHintStyle,
                  controlName: controlName,
                  isCollapsed: true,
                  needBackgroundOnFocus: true,
                  textAlign: inputTextAlign,
                  textInputAction: TextInputAction.next,
                  maskFormatter: formatter ?? mlFormatter,
                  border: inputBorder,
                  contentPadding: inputPadding,
                  backgroundColor: AppColors.purpleLighterBackgroundColor,
                ),
              ),
            ),
            // 10.w,
            // IconButton(
            //     onPressed: (){},
            //     icon: Icon(Icons.close))
          ],
        )
      ],
    );
  }
}
