// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/profile/model/model.dart';
import 'package:mama/src/feature/profile/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    TextStyle? titlesStyle =
        Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 17,
              fontFamily: 'SFProText',
            );
    TextStyle? titlesColoredStyle =
        Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              fontFamily: 'SFProText',
              color: AppColors.primaryColor,
            );
    TextStyle? helpersStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 10,
          fontFamily: 'SFProText',
          fontWeight: FontWeight.w700,
          color: AppColors.greyBrighterColor,
        );

    return Scaffold(
      backgroundColor: AppColors.purpleLighterBackgroundColorScaffold,
      body: Stack(
        children: [
          ListView(
            children: <Widget>[
              MomsProfile(
                titlesStyle: titlesStyle,
                helpersStyle: helpersStyle,
                titlesColoredStyle: titlesColoredStyle,
                mom: MomInfo(
                  'Кристина Константинова',
                  '+7 996 997-06-24',
                  null,
                  null,
                  Assets.images.imgProfile.path,
                  [
                    ChildInfo(
                      'Алла Виктория',
                      DateTime(2023, 4, 2),
                      Gender.female,
                      false,
                      3.56,
                      49,
                      35,
                      Birth.natural,
                      false,
                      null,
                      Assets.images.imgProfile.path,
                    )
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      //! добавить tap о компании
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      t.profile.aboutCompanyTitle,
                      style: titlesColoredStyle,
                    ),
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    //! добавить tap условия использования
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    t.profile.termOfUseTitle,
                    style: titlesColoredStyle,
                  ),
                ),
              ),
              const Gap(16),
              CustomButton(
                onPressed: () {},
                icon: Icons.language,
                text: t.profile.feedbackButtonTitle,
              ),
              const Gap(8),
              CustomButton(
                onPressed: () {},
                color: AppColors.redColor,
                text: t.profile.leaveAccountButtonTitle,
              ),
            ],
          ),
          //   ),
          // ],
          // ),
          Positioned(
            top: 50.0,
            left: 0.0,
            child: ButtonLeading(
              labelStyle: titlesStyle,
              onTapButton: () {
                //! добавить tap back button
              },
            ),
          ),
        ],
      ),
    );
  }
}
