
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/feature/auth/state/verify_state/verify_state.dart';
import 'package:mama/src/feature/auth/widget/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../data.dart';

class VerifyInputWidget extends StatefulWidget {
  const VerifyInputWidget({super.key});

  @override
  State<VerifyInputWidget> createState() => _VerifyInputWidgetState();
}

class _VerifyInputWidgetState extends State<VerifyInputWidget> {
  late final FocusNode focusNode;

  bool isFocused = false;
  final controller = TextEditingController();
  final verifyState = VerifyState();
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
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final VerifyState store = context.watch();

    return Observer(
      builder: (context) {
        final isValid = store.isValid;
        return SizedBox(
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: 8.r,
                      border: Border.all(
                        color: !isValid
                            ? AppColors.redColor
                            : isFocused
                            ? AppColors.primaryColor
                            : AppColors.greyColor,
                        width: isFocused ? 2 : 1,
                      )),
                  child: Container(
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
                        )
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Stack(
                          children: [
                            Expanded(
                              child: PinCodeTextField(
                                  autoDisposeControllers: true,
                                  onChanged: (value){
                                    Provider.of<VerifyState>(context, listen: false).update(value);
                                  },
                                  hintCharacter: "0",
                                  hintStyle: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.greyBrighterColor),
                                  pinTheme: PinTheme(
                                    inactiveBorderWidth: 1,
                                    selectedBorderWidth: 1,
                                    errorBorderColor: Colors.red,
                                    inactiveColor: AppColors.greyColor,
                                    borderWidth: 1,
                                    shape: PinCodeFieldShape.underline,
                                    fieldHeight: 50,
                                    fieldWidth: 50,
                                    activeFillColor: Colors.white,
                                    activeColor: AppColors.greyColor,
                                  ),
                                  onTap: (){
                                    setState(() {
                                      isFocused = true;
                                    });
                                  },
                                  controller: controller,
                                  appContext: context,
                                  length: 4),
                            ),
                            const Positioned(
                                top: 0,
                                left: 70,
                                child: SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    width: 1,
                                  ),
                                )),
                            const Positioned(
                                top: 0,
                                left: 160,
                                child: SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    width: 1,
                                  ),
                                )),
                            const Positioned(
                                top: 0,
                                right: 70,
                                child: SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    width: 1,
                                  ),
                                )),
                          ],
                        )
                    ),
                  ),
                ),
                const Positioned(
                    bottom: 0,
                    child: InputErrorWidget(
                      error: null,
                    )),
              ],
            ));
      }
    );

  }
}