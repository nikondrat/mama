import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'widgets.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late final FocusNode focusNode;

  bool isFocused = false;
  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.addListener(() {
      isFocused = focusNode.hasFocus;
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final AuthViewStore store = context.watch();

    final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
        mask: '### ###-##-##', filter: {'#': RegExp(r'[0-9]')});

    return ReactiveForm(
        formGroup: store.formGroup,
        child: ReactiveValueListenableBuilder(
          formControlName: 'phone',
          builder: (context, status, child) {
            final bool isValid = !status.hasErrors;

            return SizedBox(
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: 8.r,
                          border: Border.all(
                            color: !isValid
                                ? AppColors.redColor
                                : isFocused
                                    ? AppColors.primaryColor
                                    : AppColors.greyColor,
                            width: isFocused ? 2 : 1,
                          )),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: AutoSizeText(
                              '+7',
                              style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              width: 10,
                              color: AppColors.greyColor,
                            ),
                          ),
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'phone',
                              focusNode: focusNode,
                              showErrors: (control) => false,
                              keyboardType: TextInputType.number,
                              style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                              onTapOutside: (event) {
                                isFocused = false;
                                focusNode.unfocus();
                                setState(() {});
                              },
                              inputFormatters: [maskFormatter],
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 14),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintStyle: textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.greyBrighterColor),
                                  hintText: t.auth.phoneNumber,
                                  suffixIcon: ReactiveValueListenableBuilder(
                                    formControlName: 'phone',
                                    builder: (context, control, child) {
                                      if (control.value != null &&
                                          control.value != '') {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: InkWell(
                                            onTap: () {
                                              store.phone.updateValue('');
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color:
                                                  AppColors.greyBrighterColor,
                                            ),
                                          ),
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                        bottom: 0,
                        child: InputErrorWidget(
                          // error: 'Номер не зарегистрирован',
                          error: null,
                        )),
                  ],
                ));
          },
        ));
  }
}
