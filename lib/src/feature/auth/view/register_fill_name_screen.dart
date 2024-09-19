import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/state/register_state/register_name/register_name_state.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterFillName extends StatefulWidget {
  const RegisterFillName({super.key});

  @override
  State<RegisterFillName> createState() => _RegisterFillNameState();
}

class _RegisterFillNameState extends State<RegisterFillName> {
  final registerState = RegisterNameState();

  @override
  void dispose() {
    super.dispose();
    registerState.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;


    return Scaffold(
      body: BodyDecoration(
        backgroundImage: DecorationImage(
          image: AssetImage(
            Assets.images.authDecor.path,
          ),
          alignment: Alignment.topLeft,
        ),
        child: ReactiveForm(
          formGroup: registerState.formGroup,
          child: Column(
            children: [
              const Spacer(),
              TitleWidget(text: t.register.whatIsYourName),
              20.h,
              Column(
                children: [
                  RegisterInputInfo(
                    isName: true,
                    controlName: 'name',
                    hintText: t.register.name,
                  ),
                  10.h,
                  RegisterInputInfo(
                    isName: false,
                    controlName: 'surname',
                    hintText: t.register.surname,
                  ),
                ],
              ),
              const Spacer(),
              ReactiveValueListenableBuilder(
                  formControlName: 'name',
                  builder: (context, control, child) {
                    final bool isNameValid = control.valid;
                    return ReactiveValueListenableBuilder(
                        formControlName: 'surname',
                        builder: (context, control, child) {
                          final bool isValid = control.valid && isNameValid;
                          return CustomButton(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 16),
                            title: t.register.next,
                            textStyle: textTheme.bodyMedium?.copyWith(
                                color: isValid
                                    ? AppColors.primaryColor
                                    : AppColors.greyBrighterColor),
                            onTap: isValid
                                ? () {
                              context.pushNamed(
                                  AppViews.registerFillBabyName);
                            }
                                : null,
                          );
                        });
                  }),
              50.h
            ],
          ),
        ),
      ),
    );
  }
}
