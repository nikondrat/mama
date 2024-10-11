import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileBodyWidget extends StatelessWidget {
  final ProfileItem item;

  const ProfileBodyWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final TextStyle? titlesStyle = textTheme.bodyMedium;
    final TextStyle titlesColoredStyle = textTheme.labelLarge!.copyWith(
      fontSize: 17,
      fontWeight: FontWeight.w600,
    );

    final TextStyle helpersStyle = textTheme.bodySmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w700,
    );

    final MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
        mask: '+7 ### ###-##-##', filter: {'#': RegExp(r'[0-9]')});

    switch (item.user) {
      case Profile.mom:
        return MomsProfile(
          store: item.store,
          accountModel: item.accountModel,
          titlesStyle: titlesStyle,
          helpersStyle: helpersStyle,
          titlesColoredStyle: titlesColoredStyle,
          formatter: phoneFormatter,
        );
      case Profile.specialist:
        return SpecialistProfile(
          store: item.store,
          accountModel: item.accountModel,
          titlesStyle: titlesStyle,
          helpersStyle: helpersStyle,
          titlesColoredStyle: titlesColoredStyle,
          formatter: phoneFormatter,
        );
      case Profile.school:
        return SchoolProfile(
          store: item.store,
          accountModel: item.accountModel,
          titlesStyle: titlesStyle,
          helpersStyle: helpersStyle,
          titlesColoredStyle: titlesColoredStyle,
          formatter: phoneFormatter,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
