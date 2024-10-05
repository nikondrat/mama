import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../data.dart';

class RegisterBabyNameScreen extends StatelessWidget {
  const RegisterBabyNameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final AuthViewStore store = context.watch();

    return Scaffold(
        body: BodyDecoration(
      backgroundImage: DecorationImage(
        image: AssetImage(
          Assets.images.authDecor.path,
        ),
        alignment: Alignment.topLeft,
      ),
      child: ReactiveForm(
        formGroup: store.formGroup,
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
              controlName: 'childName',
              hintText: t.register.childName,
            ),
            20.h,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlutterToggleButton(
                outerContainerMargin: 3,
                buttonWidth: MediaQuery.of(context).size.width * .4,
                buttonHeight: 38,
                buttonColor: Colors.white,
                enableTextColor: AppColors.primaryColor,
                buttonTextFontSize: 17,
                borderRadius: 6,
                outerContainerColor: const Color(0xFFE1E6FF),
                onTap: (index) {
                  store.child.setGender(Gender.values[index]);
                  // registerBabyName.setGender(index);
                },
                items: [
                  Gender.female.name,
                  Gender.male.name,
                ],
              ),
            ),
            const Spacer(),
            ReactiveValueListenableBuilder(
                formControlName: 'childName',
                builder: (context, control, child) {
                  final bool isNameValid = control.valid;

                  return CustomButton(
                    isSmall: false,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    // contentPadding:
                    //     const EdgeInsets.symmetric(horizontal: 16),
                    title: t.register.next,
                    textStyle: textTheme.bodyMedium?.copyWith(
                        color: isNameValid
                            ? AppColors.primaryColor
                            : AppColors.greyBrighterColor),
                    onTap: isNameValid
                        ? () {
                            final List<String> values =
                                (control.value as String).split(RegExp('[ -]'));
                            store.child.setFirstName(values[0]);
                            store.child.setSecondName(
                                values.length > 1 ? values[1] : ' ');
                            context.pushNamed(
                              AppViews.registerFillAnotherBabyInfo,
                            );
                          }
                        : null,
                  );
                }),
            50.h
          ],
        ),
      ),
    ));
  }
}
