import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/feature/auth/state/register_state/register_baby_name/register_baby_name.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../data.dart';

class RegisterBabyNameScreen extends StatefulWidget {
  const RegisterBabyNameScreen({super.key});

  @override
  State<RegisterBabyNameScreen> createState() => _RegisterBabyNameScreenState();
}

class _RegisterBabyNameScreenState extends State<RegisterBabyNameScreen> {
  final registerBabyName = RegisterBabyName();

  @override
  void dispose() {
    super.dispose();
    registerBabyName.dispose();
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
          formGroup: registerBabyName.formGroup,
          child: Column(
            children: [
              const Spacer(),
              TitleWidget(text: t.register.whatIsBabyName),
              8.h,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  textAlign: TextAlign.center,
                  t.register.isThereMoreChild,
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              20.h,
              RegisterInputInfo(
                isName: true,
                controlName: 'name',
                hintText: t.register.childName,
              ),
              20.h,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlutterToggleButton(
                  outerContainerMargin: 3,
                  buttonWidth: (MediaQuery.of(context).size.width / 2) * 0.85,
                  buttonHeight: 38,
                  buttonColor: Colors.white,
                  enableTextColor: AppColors.primaryColor,
                  buttonTextFontSize: 17,
                  borderRadius: 6,
                  outerContainerColor: const Color(0xFFE1E6FF),
                  onTap: (index) {
                    registerBabyName.setGender(index);
                  },
                  items: [
                    t.profile.sex(context: GenderContext.female),
                    t.profile.sex(context: GenderContext.male)
                  ],
                ),
              ),
              const Spacer(),
              ReactiveValueListenableBuilder(
                  formControlName: 'name',
                  builder: (context, control, child) {
                    final bool isNameValid = control.valid;
                  return CustomButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    title: t.register.next,
                    textStyle: textTheme.bodyMedium?.copyWith(
                        color: isNameValid
                            ? AppColors.primaryColor
                            : AppColors.greyBrighterColor),
                    onTap: isNameValid
                        ? () {
                            context.pushNamed(AppViews.registerFillAnotherBabyInfo);
                          }
                        : null,
                  );
                }
              ),
              50.h
            ],
          ),
        ),
      ),
    );
  }
}
