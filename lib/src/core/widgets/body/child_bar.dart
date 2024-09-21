import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mama/src/data.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ChildBarWidget extends StatelessWidget {
  final ChildModel child;
  const ChildBarWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle helpersStyle = textTheme.bodySmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    );
    final TextStyle titleStyle =
        textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReactiveTextField(
                formControlName: 'name',
                // onChanged: (value) => onChangeName,
                // controller: childNameController,
                style: textTheme.headlineSmall!.copyWith(
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: t.profile.hintAddChildName,
                  hintStyle: textTheme.headlineSmall!
                      .copyWith(fontSize: 24, color: AppColors.greyColor),
                  labelStyle: textTheme.headlineSmall!.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              Text(
                child.firstName.isEmpty
                    ? t.profile.helperAddChildName
                    : t.profile.helperChangeChildName,
                style: helpersStyle,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    side: BorderSide(color: AppColors.redColor, width: 1),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width / 4, 28)),
                onPressed: () {},
                child: Text(
                  t.profile.deleteChildButtonTitle,
                  style: helpersStyle.copyWith(
                    color: AppColors.redColor,
                  ),
                ),
              ),
              25.h,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IntrinsicWidth(
                    child: ReactiveDateTimePicker(
                      type: ReactiveDatePickerFieldType.date,
                      dateFormat: DateFormat('dd MMMM yyy'),
                      locale: LocaleSettings.currentLocale.flutterLocale,
                      formControlName: 'dateBirth',
                      showClearIcon: false,
                      style: titleStyle,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        suffixIconColor: Colors.red,
                        border: InputBorder.none,
                        hintText: t.profile.hintDateBirth,
                        hintStyle: titleStyle.copyWith(
                            color: AppColors.greyBrighterColor),
                        labelStyle: titleStyle.copyWith(
                            color: AppColors.greyBrighterColor),
                      ),
                    ),
                  ),
                  16.w,
                  if (child.birthDate != null)
                    Expanded(
                      child: AutoSizeText(
                        // TODO: add format to child.birthDate
                        // '24 недели\n5 месяцев 8 дней',
                        DateFormat.yMMMd().format(child.birthDate!),
                        style: titleStyle.copyWith(
                            color: AppColors.greyBrighterColor, fontSize: 10),
                      ),
                    ),
                ],
              ),
              Text(
                t.profile.helperDateBirth,
                style: helpersStyle,
              ),
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            child.avatarUrl != null
                ? CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(child.avatarUrl!),
                  )
                : CircleAvatar(
                    radius: 64,
                    backgroundColor: AppColors.purpleLighterBackgroundColor,
                    child: Image.asset(
                      height: 56,
                      Assets.icons.kidNoPhoto.path,
                      color: AppColors.whiteColor,
                    ),
                  ),
            Positioned(
              bottom: -30,
              right: 16,
              left: 16,
              child: RawMaterialButton(
                onPressed: () {},
                fillColor: AppColors.primaryColor,
                shape: CircleBorder(),
                child: Image.asset(
                  Assets.icons.icPhotoAdd.path,
                  alignment: Alignment.center,
                  height: 64,
                ),
              ),
              // child: IconButton(
              //   icon: Image.asset(
              //     Assets.icons.icPhotoAdd.path,
              //     alignment: Alignment.center,
              //     height: 64,
              //   ),
              //   onPressed: () {},
              // ),
            ),
          ],
        ),
      ],
    );
  }
}
