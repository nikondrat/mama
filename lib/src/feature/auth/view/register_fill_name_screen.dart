import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/state/register_state/register_state.dart';
import 'package:mama/src/feature/auth/widgets/register_widget.dart';

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
  Widget build(BuildContext context) {
    return StartScreenBody(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const AuthSplashIcon(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.17,
              ),
              _TitleWidget(text: t.register.whatIsYourName),
              const SizedBox(height: 20),
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
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: t.register.name,
                      hintStyle: const TextStyle(
                          color: AppColors.greyBrighterColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 10),
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
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: t.register.surname,
                      hintStyle: const TextStyle(
                          color: AppColors.greyBrighterColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: nameTextFieldIsNotEmpty && surnameTextFieldIsNotEmpty
                    ? () {
                        registerState.fillNameAndSurname(
                            nameController.text, surnameController.text);
                        context.pushNamed(AppViews.registerFillBabyName);
                      }
                    : null,
                child: Text(
                  t.register.next,
                  style: TextStyle(
                      color:
                          nameTextFieldIsNotEmpty && surnameTextFieldIsNotEmpty
                              ? AppColors.primaryColor
                              : AppColors.greyBrighterColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final String text;
  const _TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w700),
    );
  }
}
