import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterInputInfo extends StatelessWidget {
  final String controlName;
  final bool isName;
  final String hintText;

  const RegisterInputInfo(
      {super.key,
      required this.isName,
      required this.controlName,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                    spreadRadius: 0,
                    color: const Color(0xFF340589).withOpacity(0.1)),
                BoxShadow(
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                    spreadRadius: 0,
                    color: const Color(0xFF2B0F60).withOpacity(0.15)),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: ReactiveTextField(
                    formControlName: controlName,
                    showErrors: (control) => false,
                    keyboardType: TextInputType.text,
                    style: textTheme.headlineSmall
                        ?.copyWith(color: AppColors.primaryColor),
                    onTapOutside: (event) {},
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: textTheme.headlineSmall
                            ?.copyWith(color: AppColors.greyBrighterColor),
                        hintText: hintText,
                        suffixIcon: ReactiveValueListenableBuilder(
                          formControlName: controlName,
                          builder: (context, control, child) {
                            if (control.value != null && control.value != '') {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: () {
                                    control.value = '';
                                    // store.phone.updateValue('');
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.greyBrighterColor,
                                  ),
                                ),
                              );
                            }
                            return SizedBox.shrink();
                          },
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    isName
                        ? t.register.clickToEnterName
                        : t.register.clickToEnterSurname,
                    style: textTheme.bodySmall?.copyWith(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
