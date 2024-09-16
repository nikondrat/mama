part of 'register_fill_name_screen.dart';

class RegisterFillAnotherBabyInfoScreen extends StatefulWidget {
  const RegisterFillAnotherBabyInfoScreen({super.key});

  @override
  State<RegisterFillAnotherBabyInfoScreen> createState() =>
      _RegisterFillAnotherBabyInfoScreenState();
}

class _RegisterFillAnotherBabyInfoScreenState
    extends State<RegisterFillAnotherBabyInfoScreen> {
  var isFull = false;

  late FormGroup formGroup;

  @override
  void initState() {
    formGroup = FormGroup({
      'weight': FormControl<double>(),
      'height': FormControl<double>(),
      'headCircumference': FormControl<double>(),
    });
    super.initState();
  }

  @override
  void dispose() {
    formGroup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final InputBorder inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(6),
    );
    final EdgeInsets inputPadding =
        EdgeInsets.symmetric(horizontal: 12, vertical: 4);

    final MaskTextInputFormatter weightFormatter = MaskTextInputFormatter(
        mask: '#,## ${t.profile.unitMeasureWeight}',
        filter: {'#': RegExp('[0-9]')},
        type: MaskAutoCompletionType.eager);

    final MaskTextInputFormatter sizeFormatter = MaskTextInputFormatter(
        mask: '## ${t.profile.unitMeasureHeight}',
        filter: {'#': RegExp('[0-9]')},
        type: MaskAutoCompletionType.eager);

    const TextAlign inputTextAlign = TextAlign.center;

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
              ReactiveForm(
                formGroup: FormGroup({
                  'weight': FormControl(),
                  'height': FormControl(),
                  'headCircumference': FormControl(),
                }),
                child: BodyGroup(title: '', items: [
                  BodyItemWidget(
                    item: ItemWithInput(
                        inputItem: InputItem(
                          controlName: 'weight',
                          isCollapsed: true,
                          textAlign: inputTextAlign,
                          textInputAction: TextInputAction.next,
                          maskFormatter: weightFormatter,
                          border: inputBorder,
                          contentPadding: inputPadding,
                          backgroundColor:
                              AppColors.purpleLighterBackgroundColor,
                        ),
                        bodyItem: CustomBodyItem(
                          title: t.profile.weightTitle,
                        )),
                  ),
                  BodyItemWidget(
                    item: ItemWithInput(
                        inputItem: InputItem(
                          controlName: 'height',
                          isCollapsed: true,
                          textAlign: inputTextAlign,
                          textInputAction: TextInputAction.next,
                          maskFormatter: sizeFormatter,
                          border: inputBorder,
                          contentPadding: inputPadding,
                          backgroundColor:
                              AppColors.purpleLighterBackgroundColor,
                        ),
                        bodyItem: CustomBodyItem(
                          title: t.profile.heightTitle,
                        )),
                  ),
                  BodyItemWidget(
                    item: ItemWithInput(
                        inputItem: InputItem(
                          controlName: 'headCircumference',
                          isCollapsed: true,
                          textAlign: inputTextAlign,
                          textInputAction: TextInputAction.next,
                          maskFormatter: sizeFormatter,
                          border: inputBorder,
                          contentPadding: inputPadding,
                          backgroundColor:
                              AppColors.purpleLighterBackgroundColor,
                        ),
                        bodyItem: CustomBodyItem(
                          title: t.profile.headCircumferenceTitle,
                        )),
                  ),
                ]),
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
