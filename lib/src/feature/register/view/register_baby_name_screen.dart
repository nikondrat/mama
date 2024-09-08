part of 'register_fill_name.dart';

class RegisterBabyNameScreen extends StatefulWidget {
  const RegisterBabyNameScreen({super.key});

  @override
  State<RegisterBabyNameScreen> createState() => _RegisterBabyNameScreenState();
}

class _RegisterBabyNameScreenState extends State<RegisterBabyNameScreen> {
  final nameController = TextEditingController();
  final registerState = RegisterState();
  var nameTextFieldIsNotEmpty = false;
  var selected = [true, false];
  var gender = 0;

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
              _TitleWidget(text: t.register.whatIsBabyName),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  textAlign: TextAlign.center,
                  t.register.isThereMoreChild,
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
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
                      hintText: t.register.childName,
                      hintStyle: const TextStyle(
                          color: AppColors.greyBrighterColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlutterToggleButton(
                  outerContainerMargin: 3,
                  buttonWidth: (MediaQuery.of(context).size.width /2) * 0.85,
                  buttonHeight: 38,
                  buttonColor: Colors.white,
                  enableTextColor: AppColors.primaryColor,
                  buttonTextFontSize: 17,
                  borderRadius: 6,
                  outerContainerColor: const Color(0xFFE1E6FF),
                  onTap: (index){
                    setState(() {
                      gender = index;
                    });
                  },
                  items: [
                    t.register.girl,
                    t.register.boy
                  ],

                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: nameTextFieldIsNotEmpty
                    ? () {
                        registerState.fillBabyName(name: nameController.text, gender: gender);
                        context.pushNamed(AppViews.registerFillAnotherBabyInfo);
                      }
                    : null,
                child: registerState.state == RegisterStateAction.progress
                    ? const CircularProgressIndicator(color: AppColors.primaryColor)
                    : Text(
                  t.register.next,
                  style: TextStyle(
                      color: nameTextFieldIsNotEmpty
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
