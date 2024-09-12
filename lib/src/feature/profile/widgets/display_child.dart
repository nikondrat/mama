import 'package:flutter/material.dart';
import 'package:mama/src/feature/profile/model/model.dart';
import 'package:mama/src/feature/profile/widgets/widgets.dart';

class DisplayChilds extends StatelessWidget {
  const DisplayChilds(
      {super.key,
      required this.childs,
      required this.onChangeBirth,
      required this.onChangeGender,
      required this.onSwitchBirthComplications,
      required this.onChangeNotes,
      required this.onChangeDateBirth,
      this.titleStyle,
      this.helperStyle,
      this.titlesColoredStyle});
  final List<ChildInfo> childs;

  final Function(String value) onChangeBirth;
  final Function(String value) onChangeGender;
  final Function(String value) onSwitchBirthComplications;
  final Function(String value) onChangeNotes;
  final Function(String value) onChangeDateBirth;
  final TextStyle? titleStyle;
  final TextStyle? helperStyle;
  final TextStyle? titlesColoredStyle;

  @override
  Widget build(BuildContext context) {
    return childs.isEmpty
        ? SizedBox()
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: childs.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index) {
              final child = childs[index];

              return ChildProfile(
                child: child,
                onChangeName: (value) {},
                onSwitchTweens: (String value) {},
                onChangeBirth: (String value) {
                  onChangeBirth;
                },
                onChangeGender: (String value) {
                  onChangeGender;
                },
                onSwitchBirthComplications: (String value) {
                  onSwitchBirthComplications;
                },
                onChangeNotes: (String value) {
                  onChangeNotes;
                },
                onChangeDateBirth: (String value) {
                  onChangeDateBirth;
                },
                titleStyle: titleStyle,
                helperStyle: helperStyle,
                titlesColoredStyle: titlesColoredStyle,
              );
            },
          );
  }
}
