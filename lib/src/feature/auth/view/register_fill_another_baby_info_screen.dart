part of 'register_fill_name_screen.dart';

class RegisterFillAnotherBabyInfoScreen extends StatefulWidget {
  const RegisterFillAnotherBabyInfoScreen({super.key});

  @override
  State<RegisterFillAnotherBabyInfoScreen> createState() =>
      _RegisterFillAnotherBabyInfoScreenState();
}

class _RegisterFillAnotherBabyInfoScreenState
    extends State<RegisterFillAnotherBabyInfoScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final headCircumference = TextEditingController();
  var isFull = false;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Spacer(),
              TitleWidget(
                  text: 'Алла-Виктория, ${t.register.beautifulName} 🙂'),
              8.h,
              TitleWidget(text: t.register.rememberWhenShe),
              10.h,
              _RowContainer(
                controller: weightController,
                title: t.register.birthWeight,
                onChange: (String value) {},
              ),
              _RowContainer(
                controller: heightController,
                title: t.register.heightAtBirth,
                onChange: (String value) {},
              ),
              _RowContainer(
                controller: headCircumference,
                title: t.register.headCircumference,
                onChange: (String value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      isFull = true;
                    }
                  });
                },
              ),
              20.h,
              Text(
                  isFull
                      ? t.register.thankYou
                      : t.register.ifInconvenientToSearch,
                  textAlign: TextAlign.center,
                  style: textTheme.displaySmall
                      ?.copyWith(color: AppColors.primaryColor)),
              const Spacer(),
              CustomButton(
                  title: t.register.next,
                  textStyle: textTheme.bodyMedium
                      ?.copyWith(color: AppColors.primaryColor),
                  onTap: () {
                    context.pushNamed(AppViews.registerInfoAboutChildbirth);
                  }),
              40.h
            ],
          ),
        ),
      ),
    );
  }
}

class _RowContainer extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final Function(String value) onChange;
  const _RowContainer(
      {super.key,
      required this.controller,
      required this.title,
      required this.onChange});

  @override
  State<_RowContainer> createState() => _RowContainerState();
}

class _RowContainerState extends State<_RowContainer> {
  var inProgress = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(widget.title,
                style: textTheme.displaySmall?.copyWith(fontSize: 17)),
          ),
          const Spacer(),
          Container(
            width: 80,
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: inProgress
                    ? AppColors.primaryColor
                    : AppColors.purpleLighterBackgroundColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                onChanged: widget.onChange,
                onTap: () {
                  setState(() {
                    inProgress = true;
                  });
                },
                controller: widget.controller,
                style: textTheme.displaySmall?.copyWith(
                    fontSize: 17,
                    color: inProgress ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  hintStyle: textTheme.displaySmall?.copyWith(
                      fontSize: 17,
                      color: inProgress
                          ? const Color(0xFFF0F2F7)
                          : AppColors.greyColor),
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
