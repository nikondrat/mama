part of 'register_fill_name.dart';

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
              const SizedBox(height: 50,),
              const _TitleWidget(text: 'Алла-Виктория, красивое имя 🙂'),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: _TitleWidget(text: 'А вы помните, какой она была, когда только родилась?'),
              ),
              const SizedBox(height: 10),
              _RowContainer(
                controller: weightController,
                title: 'Вес при рождении',),
              _RowContainer(
                controller: heightController,
                title: 'Рост при рождении',),
              _RowContainer(
                controller: headCircumference,
                title: 'Окружность головы при рождении',),
              const SizedBox(height: 20),
              const _TextWidget(
                text: 'Если сейчас неудобно искать какие-то данные, можете добавить их позже',),
              const Spacer(),
              CustomButton(
                onTap: (){},
                  child: Text(t.register.next)),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}

class _RowContainer extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  const _RowContainer({super.key, required this.controller, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(title ,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400
              ),),
          ),
          const Spacer(),
          _TextFieldContainer(controller: controller,),
        ],
      ),
    );
  }
}

class _TextFieldContainer extends StatefulWidget {
  final TextEditingController controller;
  const _TextFieldContainer({super.key, required this.controller});

  @override
  State<_TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<_TextFieldContainer> {

  var inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: inProgress ? AppColors.primaryColor : AppColors.purpleLighterBackgroundColor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
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
          decoration: const InputDecoration(
            hintText: "Ввести",
             border: InputBorder.none,
          ),
        ),
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


