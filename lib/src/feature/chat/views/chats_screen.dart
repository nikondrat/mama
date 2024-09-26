// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/core/widgets/bottom_app_bar.dart';
import 'package:mama/src/feature/chat/widgets/widgets.dart';

class ChatsScreen extends StatefulWidget {
  // final MomInfo mom;
  const ChatsScreen({
    super.key,
    // required this.mom,
  });

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: AppColors.purpleLighterBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: CircleAvatar(
          radius: 54,
          backgroundImage: AssetImage(
            mom.image!,
          ),
        ),
      ),
      body: ListView(
        children: [
          CardWithoutMargin(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Группы',
                  textAlign: TextAlign.center,
                  style: textTheme.labelLarge!
                      .copyWith(color: AppColors.greyBrighterColor),
                ),
                8.h,
                Flexible(
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 4,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      indent: MediaQuery.of(context).size.width * 0.15,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GroupChatItem();
                    },
                  ),
                ),
              ],
            ),
          ),
          CardWithoutMargin(
            child: Column(
              children: [
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    indent: MediaQuery.of(context).size.width * 0.15,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ChatItem();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

MomInfo mom = MomInfo(
  'Кристина Константинова',
  '+7 996 997-06-24',
  null,
  null,
  Assets.images.imgProfile.path,
  [
    ChildModel(
        id: '',
        firstName: 'Виктория',
        secondName: '',
        avatarUrl: Assets.images.imgProfile.path),
    ChildModel(
        id: '',
        firstName: 'Андрей',
        secondName: '',
        avatarUrl: Assets.images.imgPerson1.path),
  ],
);
