import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/consultation/widgets/paragraph.dart';

class NewConsultationWidget extends StatefulWidget {
  const NewConsultationWidget({super.key});

  @override
  State<NewConsultationWidget> createState() => _NewConsultationWidgetState();
}

class _NewConsultationWidgetState extends State<NewConsultationWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _controller;

  @override
  initState() {
    _tabController = TabController(length: 3, vsync: this);
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final TextStyle inputTextStyle = textTheme.titleSmall!.copyWith(
      color: AppColors.primaryColor,
    );

    return Column(
      children: [
        ParagraphWidget(
          title: t.consultation.format,
          children: [
            CustomToggleButton(
                items: [
                  ToggleButtonItem(
                      text: t.consultation.type_short.chat.title,
                      icon: IconModel(iconPath: Assets.icons.chatIcon)),
                  ToggleButtonItem(
                      text: t.consultation.type_short.video.title,
                      icon: IconModel(iconPath: Assets.icons.videoIcon)),
                  ToggleButtonItem(
                      text: t.consultation.type_short.express.title,
                      icon: IconModel(iconPath: Assets.icons.videoIcon)),
                ],
                onTap: (index) {
                  _tabController.animateTo(index);
                },
                btnWidth: MediaQuery.of(context).size.width * .3,
                btnHeight: 48),
            8.h,
            SizedBox(
              height: 120,
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    t.consultation.type_short.chat.desc,
                    t.consultation.type_short.video.desc,
                    t.consultation.type_short.express.desc,
                  ]
                      .map((e) => AutoSizeText(
                            e,
                            style: textTheme.labelMedium,
                          ))
                      .toList()),
            ),
          ],
        ),
        16.h,
        ParagraphWidget(
          title: t.consultation.comment.title,
          children: [
            AutoSizeText(
              t.consultation.comment.desc,
              style: textTheme.labelMedium,
            ),
            20.h,
            TextField(
              controller: _controller,
              style: inputTextStyle,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                  fillColor: AppColors.lavenderBlue.withOpacity(.5),
                  filled: true,
                  hintText: t.consultation.comment.action,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  hintStyle: inputTextStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  )),
            ),
          ],
        ),
        16.h,
        ParagraphWidget(
          title: t.consultation.timeOfConsultation,
          children: [
            CustomToggleButton(
                items: [
                  ToggleButtonItem(
                    text: t.home.today,
                  ),
                  ToggleButtonItem(
                    text: t.consultation.tomorrow,
                  ),
                  ToggleButtonItem(
                      text: t.consultation.select,
                      icon: IconModel(
                        iconPath: Assets.icons.calendar,
                      )),
                ],
                onTap: (index) {},
                btnWidth: MediaQuery.of(context).size.width * .3,
                btnHeight: 48),
            10.h,
            IntrinsicHeight(
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  '10:00',
                  '10:00',
                  '10:00',
                  '10:00',
                  '10:00',
                ].map((e) {
                  return Chip(
                    side: BorderSide(
                      color: AppColors.primaryColor,
                    ),
                    // color: WidgetStatePropertyAll(
                    //   AppColors.primaryColor,
                    // ),
                    label: Text(
                      e,
                      style: textTheme.titleMedium!.copyWith(),
                    ),
                  );
                }).toList(),
              ),
            ),
            30.h,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    // onTap: () {},
                    title: t.consultation.selectTime,
                  ),
                ),
              ],
            ),
            100.h,
          ],
        )
      ],
    );
  }
}
