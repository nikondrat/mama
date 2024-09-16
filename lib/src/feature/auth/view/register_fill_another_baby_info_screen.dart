part of 'register_fill_name_screen.dart';

class RegisterFillAnotherBabyInfoScreen extends StatefulWidget {
  const RegisterFillAnotherBabyInfoScreen({super.key});

  @override
  State<RegisterFillAnotherBabyInfoScreen> createState() => _RegisterFillAnotherBabyInfoScreenState();
}

class _RegisterFillAnotherBabyInfoScreenState extends State<RegisterFillAnotherBabyInfoScreen> {

  final registerState = RegisterState();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final headCircumference = TextEditingController();
  var isFull = false;


  @override
  Widget build(BuildContext context) {

    return Observer(
      builder: (context) {
        if(registerState.state == RegisterStateAction.savedSuccess){
          Future.microtask(()=> context.pushNamed(AppViews.registerInfoAboutChildbirth));
        }
        return StartScreenBody(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const AuthSplashIcon(),
                  const SizedBox(height: 50,),
                  _TitleWidget(text: 'Алла-Виктория, ${t.register.beautifulName} 🙂'),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: _TitleWidget(text: t.register.rememberWhenShe),
                  ),
                  const SizedBox(height: 10),
                  _RowContainer(
                    controller: weightController,
                    title: t.register.birthWeight,
                    onChange: (String value) {

                    },),
                  _RowContainer(
                    controller: heightController,
                    title: t.register.heightAtBirth,
                    onChange: (String value) {

                    },),
                  _RowContainer(
                    controller: headCircumference,
                    title: t.register.headCircumference,
                    onChange: (String value) {
                      setState(() {
                        if(value.isNotEmpty){
                          isFull = true;
                        }
                      });
                    },),
                  const SizedBox(height: 20),
                  _TextWidget(
                    text: isFull
                        ? t.register.thankYou
                        : t.register.ifInconvenientToSearch,),
                  const Spacer(),
                  CustomButton(
                    onTap: (){
                      registerState.fillBabyDetailInfo(
                        height: heightController.text,
                        headCircumference: headCircumference.text,
                        weight: weightController.text,
                      );

                    },
                      child: registerState.state == RegisterStateAction.progress
                          ? const CircularProgressIndicator(color: AppColors.primaryColor,)
                          : Text(t.register.next,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: AppColors.primaryColor
                        ),)),
                  const SizedBox(height: 40)
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class _RowContainer extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final Function(String value) onChange;
  const _RowContainer({super.key, required this.controller, required this.title, required this.onChange});

  @override
  State<_RowContainer> createState() => _RowContainerState();
}

class _RowContainerState extends State<_RowContainer> {

  var inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(widget.title ,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400
              ),),
          ),
          const Spacer(),
          Container(
            width: 80,
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: inProgress ? AppColors.primaryColor : AppColors.purpleLighterBackgroundColor
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                onChanged: widget.onChange,
                onTap: (){
                  setState(() {
                    inProgress = true;
                  });
                },
                controller: widget.controller,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: inProgress ? Colors.white : Colors.black
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: inProgress ? Color(0xFFF0F2F7) : AppColors.greyColor
                  ),
                  hintText: t.register.enter,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String text;
  const _TextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor
          )),
    );
  }
}


