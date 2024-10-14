import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  late FormGroup form;

  @override
  void initState() {
    form = FormGroup({
      'code': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DialogItem giftDialog = DialogItem(
        title: 'ПОДАРОЧНЫЙ',
        subtitle: 'Вы получили',
        text: '1 месяц подписки',
        onTap: () {});

    final List<PromoItem> items = [
      PromoItem(
        title: 'ПОДАРОЧНЫЙ',
        subtitle: 'Месяц бесплатной подписки',
        onTap: () {},
      )
    ];

    Future<void> onTapButton() async {
      await showDialog(
        context: context,
        builder: (context) => Dialog(
          child: DialogWidget(
            item: giftDialog,
            onTapExit: () {
              context.pop();
            },
          ),
        ),
      );
    }

    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle titlesStyle = textTheme.titleMedium!
        .copyWith(fontWeight: FontWeight.w400, height: 1.2);
    final TextStyle hintStyle = textTheme.bodySmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    );

    return Provider(
      create: (context) =>
          PromoViewStore(restClient: context.read<Dependencies>().restClient),
      builder: (context, child) {
        final promoViewStore = context.watch<PromoViewStore>();

        return Scaffold(
          backgroundColor: AppColors.lightBlue,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              t.profile.promoScreenTitle,
              style: textTheme.headlineSmall!.copyWith(
                fontSize: 17,
              ),
            ),
            centerTitle: true,
            leadingWidth: 120,
            leading: const CustomBackButton(),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReactiveForm(
                formGroup: form,
                child: Column(children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PromoCodeWidget(
                          item: items[index],
                          onTap: () {
                            onTapButton();
                          },
                        );
                      },
                    ),
                  ),
                  ReactiveValueListenableBuilder(
                      formControlName: 'code',
                      builder: (context, control, child) {
                        final bool promoCorrect = control.valid;

                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              BodyItemWidget(
                                  backgroundBorder: Border.all(
                                    color: promoCorrect
                                        ? AppColors.blueLighter
                                        : AppColors.redColor,
                                    width: 1,
                                  ),
                                  item: InputItem(
                                    controlName: 'code',
                                    autoFocus: true,
                                    onChanged: (value) {},
                                    inputHint: t.profile.promoScreenHintAddCode,
                                    inputHintStyle: titlesStyle.copyWith(
                                      color: promoCorrect
                                          ? AppColors.greyBrighterColor
                                          : AppColors.redColor,
                                    ),
                                    hintText: promoCorrect
                                        ? t.profile.promoScreenHelper
                                        : t.profile.promoScreenErrorCode,
                                    hintStyle: promoCorrect
                                        ? hintStyle
                                        : hintStyle.copyWith(
                                            color: AppColors.redColor,
                                          ),
                                    titleStyle: titlesStyle.copyWith(
                                        color: promoCorrect
                                            ? AppColors.blackColor
                                            : AppColors.redColor),
                                    errorBorder: InputBorder.none,
                                    maxLines: 1,
                                    contentPadding: EdgeInsets.zero,
                                  )),
                              30.h,
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      backgroundColor:
                                          AppColors.redLighterBackgroundColor,
                                      onTap: () {
                                        form.control('code').value = ' ';
                                      },
                                      title: t.profile.cancel,
                                    ),
                                  ),
                                  10.w,
                                  Expanded(
                                    flex: 2,
                                    child: CustomButton(
                                      onTap: promoCorrect //!
                                          ? () {
                                              final AbstractControl<String>
                                                  code = form.control('code')
                                                      as AbstractControl<
                                                          String>;
                                              promoViewStore.activatePromo(code
                                                  .value!
                                                  .replaceAll(' ', ''));
                                            }
                                          : null,
                                      title: t.profile.apply,
                                      textStyle: titlesStyle.copyWith(
                                          color: form.valid
                                              ? AppColors.primaryColor
                                              : AppColors.whiteColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              )
                              // ButtonsRow(
                              //   tapCancelButton: () {},
                              //   tapApplyButton: () {},
                              // ),
                            ],
                          ),
                        );
                      })
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}

// class ButtonsRow extends StatelessWidget {
//   final VoidCallback tapCancelButton;
//   final VoidCallback tapApplyButton;
//   const ButtonsRow(
//       {super.key, required this.tapCancelButton, required this.tapApplyButton});

//   @override
//   Widget build(BuildContext context) {
//     final form = ReactiveForm.of(context);
//     final ThemeData theme = Theme.of(context);
//     final TextTheme textTheme = theme.textTheme;
//     final TextStyle titlesStyle =
//         textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400);

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 34.0),
//       child: Row(
//         children: [
//           Flexible(
//             flex: 1,
//             child: CustomButton(
//               onTap: tapCancelButton,
//               backgroundColor: AppColors.redLighterBackgroundColor,
//               title: t.profile.cancel,
//               textStyle: textTheme.titleMedium!.copyWith(
//                 color: AppColors.redColor,
//               ),
//             ),
//           ),
//           8.w,
//           Flexible(
//             flex: 2,
//             child: CustomButton(
//               title: t.profile.apply,
//               onTap: form!.valid //!
//                   ? tapApplyButton
//                   : null,
//               child: Text(
//                 t.profile.apply,
//                 style: titlesStyle.copyWith(
//                     color: form.valid
//                         ? AppColors.primaryColor
//                         : AppColors.whiteColor,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
