import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:template/src/core/theme/color.dart';

class AuthScreen extends StatelessWidget {
  static String routeName = 'authScreen';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xFFE1EAFF),
                Color(0xFFFFFFFF),
              ])),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/auth_splash.svg'),
              const SizedBox(height: 40),
              SvgPicture.asset('assets/images/Mama&Co.svg'),
              const _SubLogoText(),
              const _RegistrationContainer(),
              const Spacer(),
              const _AlreadyHaveAccountButton(),
              const SizedBox(height: 20)
            ],
          )),
    );
  }
}

class _RegistrationContainer extends StatefulWidget {
  const _RegistrationContainer({super.key});

  @override
  State<_RegistrationContainer> createState() => _RegistrationContainerState();
}

class _RegistrationContainerState extends State<_RegistrationContainer> {

  var checkValue = false;
  var maskFormatter = MaskTextInputFormatter(mask: '### ###-##-##', filter: { "#": RegExp(r'[0-9]') });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          const BoxShadow(
            color: Color(0xFF0D4CEA26)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Регистрация'),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '+7',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  Expanded(
                    child: TextField(
                      inputFormatters: [maskFormatter],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Номер телефона',
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
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
                  child: RichText(text: const TextSpan(
                    children: [
                      TextSpan(text: 'Согласен с ',
                          style: TextStyle(
                              fontFamily: "SFProText",
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary
                          )),
                      TextSpan(text: 'условием использования',
                      style: TextStyle(
                          fontFamily: "SFProText",
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                minimumSize: const Size.fromHeight(48)
              ),
                onPressed: (){},
                child: const Text('Подтвердить'))
          ],
        ),
      ),
    );
  }
}


class _SubLogoText extends StatelessWidget {
  const _SubLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text('Приложение для мам, где есть\nвсё про детей до 2-х лет',
       textAlign: TextAlign.center,
       style: TextStyle(
           fontFamily: "SFProText",
           fontSize: 17,
           fontWeight: FontWeight.w600,
           color: AppColors.secondary
       )),
    );
  }
}


class _AlreadyHaveAccountButton extends StatelessWidget {
  const _AlreadyHaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){},
        child: const Text('Уже есть аккаунт',
          style: TextStyle(
              fontFamily: "SFProText",
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor
          ),));
  }
}

