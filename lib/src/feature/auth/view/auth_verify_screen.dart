part of 'auth_screen.dart';

class AuthVerifyScreen extends StatefulWidget {
  final String phone;

  const AuthVerifyScreen({super.key, required this.phone});

  @override
  State<AuthVerifyScreen> createState() => _AuthVerifyScreenState();
}

class _AuthVerifyScreenState extends State<AuthVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return StartScreenBody(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const AuthSplashIcon(),
                const SizedBox(height: 40),
                const TextLogo(),
                const SubLogoText(),
                _VerifyContainer(
                  phone: widget.phone,
                ),
                const Spacer(),
                const NoAccountButton(),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      );
  }
}

class _VerifyContainer extends StatefulWidget {
  final String phone;

  const _VerifyContainer({super.key, required this.phone});

  @override
  State<_VerifyContainer> createState() => _VerifyContainerState();
}

class _VerifyContainerState extends State<_VerifyContainer> {
  final codeController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(
      mask: '### ###-##-##', filter: {"#": RegExp(r'[0-9]')});
  var textFieldFocused = false;
  var clearSuffixShow = false;
  var checkValue = false;
  var showPinCodeTextField = false;

  final authState = AuthState();
  final stopWatch = StopWatchState();

  @override
  void initState() {
    super.initState();
    stopWatch.startTimer();
  }

  @override
  void dispose() {
    stopWatch.stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(t.auth.login,
                    style: getTextStyle(AppColors.greyBrighterColor)),
                const SizedBox(height: 25),
                Text("${t.auth.sendSmsCode} ${widget.phone}",
                    style:
                        const TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                const SizedBox(height: 30),
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: authState.state == AuthStateAction.errorCode
                                ? Border.all(color: AppColors.redColor, width: 1)
                                : textFieldFocused
                                    ? Border.all(
                                        color: AppColors.primaryColor, width: 2)
                                    : Border.all(
                                        color: AppColors.greyColor, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: PinCodeTextField(

                              onChanged: (value){
                                  authState.onCodeTextFieldChange(value);
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
                                  textFieldFocused = true;
                                });
                              },
                                    controller: codeController,
                                    appContext: context,
                                    length: 4),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    authState.state == AuthStateAction.errorCode
                        ? Positioned(
                            bottom: 18,
                            right: 90,
                            left: 90,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.redColor),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(t.auth.invalidPassword,
                                      style: const TextStyle(
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
                    onPressed:
                        authState.state == AuthStateAction.enableConfirmButton
                            ? () {
                                authState.checkCode(codeController.text);
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
                                : AppColors.textGreyColor))),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.auth.messageDoesntArrive,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.greyBrighterColor),
                    ),
                    stopWatch.countdownTimeString == "0:00"
                        ? TextButton(
                            onPressed: () {
                              stopWatch.resetTimer();
                            },
                            child: Text(t.auth.sendOneMore,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor)))
                        : Text(
                            "${t.auth.sendAnotherOneIn} ${stopWatch.countdownTimeString}",
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: AppColors.greyBrighterColor),
                          )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
