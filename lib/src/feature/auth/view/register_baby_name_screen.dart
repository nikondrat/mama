part of 'register_fill_name_screen.dart';

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
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Scaffold(
      body: BodyDecoration(
        backgroundImage: DecorationImage(
          image: AssetImage(
            Assets.images.authDecor.path,
          ),
          alignment: Alignment.topLeft,
        ),
        child: Column(
          children: [
            const Spacer(),
            TitleWidget(text: t.register.whatIsBabyName),
            8.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                textAlign: TextAlign.center,
                t.register.isThereMoreChild,
                style: textTheme.displaySmall?.copyWith(color: AppColors.primaryColor
                ),
              ),
            ),
            20.h,
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
                    hintStyle: textTheme.labelLarge?.copyWith(
                      color: AppColors.greyBrighterColor,
                    )),
              ),
            ),
            20.h,
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              title: t.register.next,
              textStyle: textTheme.bodyMedium?.copyWith(
                  color: nameTextFieldIsNotEmpty
                      ? AppColors.primaryColor
                      : AppColors.greyBrighterColor
              ),
              onTap: nameTextFieldIsNotEmpty
                  ? () {
                      registerState.fillBabyName(name: nameController.text, gender: gender,);
                      context.pushNamed(AppViews.registerFillAnotherBabyInfo);
                    }
                  : null,
            ),
            50.h
          ],
        ),
      ),
    );
  }
}
