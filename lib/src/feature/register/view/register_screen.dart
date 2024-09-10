
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/constant/colors.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/core/widgets/auth_screen_widgets.dart';
import 'package:mama/src/core/widgets/start_screen_body.dart';
import 'package:mama/src/feature/auth/state/auth_state/auth_state.dart';
import 'package:mama/src/feature/auth/state/stop_watch/stop_watch_state.dart';
import 'package:mama/src/feature/register/state/register_state/register_state.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/constant/constant.dart';

part 'register_verify_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StartScreenBody(
      child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Column(
              children: [
                AuthSplashIcon(),
                SizedBox(height: 40),
                TextLogo(),
                SubLogoText(),
                _RegisterContainer(),
                Spacer(),
                AlreadyHaveAccountButton(),
                SizedBox(height: 20)
              ],
            ),
          ),
        ),
    );
  }
}


class _RegisterContainer extends StatefulWidget {
  const _RegisterContainer({super.key});

  @override
  State<_RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<_RegisterContainer> {

  var checkValue = false;
  var maskFormatter = MaskTextInputFormatter(mask: '### ###-##-##', filter: { "#": RegExp(r'[0-9]') });
  final phoneController = TextEditingController();
  var clearSuffixShow = false;
  var textFieldFocused = false;

  final registerState = RegisterState();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if(registerState.state == RegisterStateAction.sendCode){
          final phone = "+7 ${phoneController.text}";
          Future.microtask(()=> context.pushNamed(AppViews.registerVerify, extra: phone));
        }
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFF0D4CEA).withOpacity(0.15),
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: const Offset(0, 3)
                ),
                BoxShadow(
                    color: const Color(0xFF0834A6).withOpacity(0.10),
                    blurRadius: 1,
                    spreadRadius: 0,
                    offset: const Offset(0, 2)
                ),
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(t.register.registration,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyBrighterColor
                    )),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: registerState.state == RegisterStateAction.errorPhone
                                ? Border.all(color: AppColors.redColor, width: 1)
                                : textFieldFocused
                                ? Border.all(
                                color: AppColors.primaryColor, width: 2)
                                : Border.all(
                                color: AppColors.greyColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  '+7',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                                child: VerticalDivider(
                                  width: 1,
                                  color: AppColors.greyColor,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: phoneController,
                                  onChanged: (value) {
                                    registerState.onChangeTextField(value);
                                    setState(() {
                                      if (value.isNotEmpty) {
                                        clearSuffixShow = true;
                                      } else {
                                        clearSuffixShow = false;
                                      }
                                    });
                                  },
                                  onTap: () {
                                    setState(() {
                                      textFieldFocused = true;
                                    });
                                  },
                                  inputFormatters: [maskFormatter],
                                  decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.greyBrighterColor),
                                    border: InputBorder.none,
                                    hintText: t.auth.phoneNumber,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                              clearSuffixShow
                                  ? Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: () {
                                    phoneController.clear();
                                    setState(() {
                                      clearSuffixShow = false;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.greyBrighterColor,
                                  ),
                                ),
                              )
                                  : Container(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: checkValue,
                        onChanged: (value){
                          setState(() {
                            checkValue = value!;
                          });
                        }),
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                          children: [
                            TextSpan(text: "${t.register.agreement} ",
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyBrighterColor
                                )),
                            TextSpan(text: t.register.withTermOfUse,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryColor
                                )),
                          ]
                      )),
                    ),

                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        disabledBackgroundColor: AppColors.greyColor,
                        backgroundColor: AppColors.purpleLighterBackgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        minimumSize: const Size.fromHeight(48)),
                    onPressed: (registerState.state == RegisterStateAction.enableConfirmButton) && checkValue ? () {
                      registerState.confirmPhone(phone: "+7 ${phoneController.text}");
                      // context.pushNamed(AppViews.authVerify);
                    } : null,
                    child: registerState.state == RegisterStateAction.progress
                        ? const CircularProgressIndicator(color: AppColors.primaryColor,)
                        : Text(t.auth.confirm,
                        style: getTextStyle(
                            (registerState.state == RegisterStateAction.enableConfirmButton) && checkValue
                                ? AppColors.primaryColor
                                : AppColors.textGreyColor)))
              ],
            ),
          ),
        );
      }
    );
  }
}