import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterBabyNameScreen extends StatelessWidget {
  final bool isNotRegister;
  const RegisterBabyNameScreen({
    super.key,
    required this.isNotRegister,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final AuthViewStore store = context.watch();

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: isNotRegister ? const CustomAppBar() : null,
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
                  child: CustomToggleButton(
                    btnHeight: 38,
                    btnWidth: MediaQuery.of(context).size.width * .4,
                    initialIndex: 0,
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
                                    (control.value as String)
                                        .split(RegExp('[ -]'));
                                store.child.setFirstName(values[0]);
                                store.child.setSecondName(
                                    values.length > 1 ? values[1] : ' ');
                                context.pushNamed(
                                    AppViews.registerFillAnotherBabyInfo,
                                    extra: {'isNotRegister': isNotRegister});
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
