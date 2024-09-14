
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/feature/auth/state/register_state/register_state.dart';
import 'package:mama/src/feature/auth/widget/auth_screen_widget.dart';
import 'package:mama/src/feature/auth/widget/decoration.dart';
import '../../../core/core.dart';
import '../widget/widgets.dart';

part 'register_baby_name_screen.dart';
part 'register_fill_another_baby_info_screen.dart';
part 'register_info_about_childbirth.dart';

class RegisterFillName extends StatefulWidget {
  const RegisterFillName({super.key});

  @override
  State<RegisterFillName> createState() => _RegisterFillNameState();
}

class _RegisterFillNameState extends State<RegisterFillName> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final registerState = RegisterState();

  var nameTextFieldIsNotEmpty = false;
  var surnameTextFieldIsNotEmpty = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    surnameController.dispose();
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
        child: Column(
          children: [
            const Spacer(),
            TitleWidget(text: t.register.whatIsYourName),
            20.h,
            FillTextField(
              controller: nameController,
              isName: true,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      nameTextFieldIsNotEmpty = true;
                    } else {
                      nameTextFieldIsNotEmpty = false;
                    }
                  });
                },
                controller: nameController,
                style: textTheme.labelLarge?.copyWith(
                  color: AppColors.primaryColor
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: t.register.name,
                    hintStyle: textTheme.labelLarge?.copyWith(
                        color: AppColors.greyBrighterColor
                    )),
              ),
            ),
            10.h,
            FillTextField(
              controller: surnameController,
              isName: false,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      surnameTextFieldIsNotEmpty = true;
                    } else {
                      surnameTextFieldIsNotEmpty = false;
                    }
                  });
                },
                controller: surnameController,
                style: textTheme.labelLarge?.copyWith(
                    color: AppColors.primaryColor
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: t.register.surname,
                    hintStyle: textTheme.labelLarge?.copyWith(
                        color: AppColors.greyBrighterColor
                    )),
              ),
            ),
            const Spacer(),
            CustomButton(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              title: t.register.next,
              textStyle: textTheme.bodyMedium?.copyWith(
                  color: nameTextFieldIsNotEmpty && surnameTextFieldIsNotEmpty
                      ? AppColors.primaryColor
                      : AppColors.greyBrighterColor
              ),
              onTap: nameTextFieldIsNotEmpty && surnameTextFieldIsNotEmpty
                  ? () {
                  registerState.fillNameAndSurname(
                      nameController.text,
                      surnameController.text);
                  context.pushNamed(AppViews.registerFillBabyName);
              }
                  : null,
            ),
            50.h
          ],
        ),
      ),
    );
  }
}

