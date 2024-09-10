part of 'register_fill_name_screen.dart';

class RegisterInfoAboutChildbirth extends StatefulWidget {
  const RegisterInfoAboutChildbirth({super.key});

  @override
  State<RegisterInfoAboutChildbirth> createState() =>
      _RegisterInfoAboutChildbirthState();
}

class _RegisterInfoAboutChildbirthState
    extends State<RegisterInfoAboutChildbirth> {
  var typeOfChildBirth = 0;
  var switchValue = false;
  final registerState = RegisterState();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if(registerState.state == RegisterStateAction.savedSuccessChildBirth){
          Future.microtask(() =>  context.goNamed(AppViews.registerCity));
        }else if(registerState.state == RegisterStateAction.none){
          Future.microtask(() =>  context.goNamed(AppViews.registerCity));
        }
        return StartScreenBody(
          child: Column(
            children: [
              const AuthSplashIcon(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              _TitleWidget(text: t.register.howWasBirth),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlutterToggleButton(
                  outerContainerMargin: 3,
                  buttonWidth: (MediaQuery.of(context).size.width / 2) * 0.85,
                  buttonHeight: 38,
                  buttonColor: Colors.white,
                  enableTextColor: AppColors.primaryColor,
                  disableTextColor: AppColors.greyBrighterColor,
                  disableTextFontWeight: FontWeight.w700,
                  buttonTextFontSize: 17,
                  borderRadius: 6,
                  outerContainerColor: const Color(0xFFE1E6FF),
                  onTap: (index) {
                    setState(
                      () {
                        typeOfChildBirth = index;
                      },
                    );
                  },
                  items: [t.register.natural, t.register.caesarean],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    Text(t.register.wasComplications),
                    const Spacer(),
                    CupertinoSwitch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        }),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(120, 48),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 2,
                                color: AppColors.purpleLighterBackgroundColor,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          registerState.skip();
                          },
                        child: Text(
                          t.register.skip,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              backgroundColor:
                                  AppColors.purpleLighterBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          onPressed: () {
                            registerState.fillChildBirthInfo(
                                childBirth: typeOfChildBirth,
                                wasComplications: switchValue);
                          },
                          child: registerState.state == RegisterStateAction.progress
                              ? const CircularProgressIndicator(color: AppColors.primaryColor,)
                              : Text(
                            t.register.next,
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40)
            ],
          ),
        );
      }
    );
  }
}
