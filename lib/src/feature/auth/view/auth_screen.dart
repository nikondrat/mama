import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/auth/widgets/start_screen_body.dart';
import 'package:mama/src/feature/auth/state/auth_state/auth_state.dart';
import 'package:mama/src/feature/auth/widgets/auth_screen_widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const StartScreenBody(
      child: Column(
        children: [
          AuthSplashIcon(),
          SizedBox(height: 40),
          TextLogo(),
          SubLogoText(),
          _LoginContainer(),
          Spacer(),
          NoAccountButton(),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}

class _LoginContainer extends StatefulWidget {
  const _LoginContainer({super.key});

  @override
  State<_LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<_LoginContainer> {
  final phoneController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(
      mask: '### ###-##-##', filter: {"#": RegExp(r'[0-9]')});
  var textFieldFocused = false;
  var clearSuffixShow = false;
  var checkValue = false;

  final authState = AuthState();

  @override
  Widget build(BuildContext context) {
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
                offset: const Offset(0, 3)),
            BoxShadow(
                color: const Color(0xFF0834A6).withOpacity(0.10),
                blurRadius: 1,
                spreadRadius: 0,
                offset: const Offset(0, 2)),
          ]),
      child: Observer(builder: (context) {
        if (authState.state == AuthStateAction.sendCode) {
          final phone = "+7 ${phoneController.text}";
          Future.microtask(
              () => context.pushNamed(AppViews.authVerify, extra: phone));
        }
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(t.auth.login,
                  style: getTextStyle(AppColors.greyBrighterColor)),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: authState.state == AuthStateAction.errorPhone
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
                                    fontFamily: "SFProText",
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
                                  authState.onChangeTextField(value);
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
                                      fontFamily: "SFProText",
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
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                  authState.state == AuthStateAction.errorPhone
                      ? Positioned(
                          bottom: 18,
                          right: 90,
                          left: 90,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.redColor),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('Номер не зарегистрирован',
                                    style: TextStyle(
                                        fontFamily: "SFProText",
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                              ),
                            ),
                          ))
                      : Container(),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      disabledBackgroundColor: AppColors.greyColor,
                      backgroundColor: AppColors.purpleLighterBackgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      minimumSize: const Size.fromHeight(48)),
                  onPressed: authState.state ==
                          AuthStateAction.enableConfirmButton
                      ? () {
                          authState.confirmPhone("+7 ${phoneController.text}");
                        }
                      : null,
                  child: authState.state == AuthStateAction.progress
                      ? const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )
                      : Text(t.auth.confirm,
                          style: getTextStyle(authState.state ==
                                  AuthStateAction.enableConfirmButton
                              ? AppColors.primaryColor
                              : AppColors.textGreyColor)))
            ],
          ),
        );
      }),
    );
  }
}
