import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/widgets/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyInputWidget extends StatefulWidget {
  const VerifyInputWidget({super.key});

  @override
  State<VerifyInputWidget> createState() => _VerifyInputWidgetState();
}

class _VerifyInputWidgetState extends State<VerifyInputWidget> {
  late final FocusNode focusNode;

  bool isFocused = false;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      isFocused = focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final VerifyState store = context.watch();

    return Observer(builder: (context) {
      final isValid = store.isValid;

      return SizedBox(
          height: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: !isValid
                          ? AppColors.redColor
                          : isFocused
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                      width: isFocused ? 2 : 1,
                    )),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Stack(
                      children: [
                        PinCodeTextField(
                            autoDisposeControllers: true,
                            onChanged: (value) {
                              store.update(value);
                            },
                            hintCharacter: '0',
                            hintStyle: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyBrighterColor),
                            pinTheme: PinTheme(
                              inactiveBorderWidth: 1,
                              selectedBorderWidth: 1,
                              errorBorderColor: Colors.red,
                              inactiveColor: AppColors.greyColor,
                              borderWidth: 0,
                              shape: PinCodeFieldShape.underline,
                              fieldHeight: 50,
                              fieldWidth: 50,
                              activeFillColor: Colors.white,
                              activeColor: AppColors.greyColor,
                            ),
                            onTap: () {
                              setState(() {
                                isFocused = true;
                              });
                            },
                            controller: controller,
                            appContext: context,
                            length: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: List.generate(3, (e) {
                              return Expanded(child: VerticalDivider());
                            }).toList(),
                          ),
                        )
                      ],
                    )),
              ),
              Positioned(
                  bottom: 0,
                  child: InputErrorWidget(
                    error: store.error,
                  )),
            ],
          ));
    });
  }
}
