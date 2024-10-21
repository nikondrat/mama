import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/feature/feeding/state/add_pumping.dart';
import 'package:mama/src/feature/feeding/widgets/widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/core.dart';

class AddPumpingInput extends StatelessWidget {
  const AddPumpingInput({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final MaskTextInputFormatter formatter = MaskTextInputFormatter(
        mask: '###мл',
        filter: {'#': RegExp('[0-9]')},
        type: MaskAutoCompletionType.eager);

    return Provider(
        create: (context) => AddPumping(),
        dispose: (context, value) => value.dispose(),
        builder: (context, child) {
          final model = context.watch<AddPumping>();
          return Observer(
            builder: (context) {
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InputContainer(
                              formatter: formatter,
                              title: 'Левая',
                              controlName: 'left',
                              inputHint: '0 мл',
                            ),
                            InputContainer(
                              formatter: formatter,
                              title: 'Правая',
                              controlName: 'right',
                              inputHint: '0 мл',
                            )
                          ],
                        ),
                      ),
                      25.h,
                      Text(
                        'Всего',
                        style: textTheme.headlineSmall?.copyWith(
                            color: AppColors.greyBrighterColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      8.h,
                      Text(
                        '0 мл',
                        style: textTheme.titleSmall?.copyWith(
                            color: Colors.black),
                      ),
                      10.h,
                    ],
                  ),
                ),
              );
            }
          );
        });
  }
}
