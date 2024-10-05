import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ChatsScreen extends StatefulWidget {
  final CustomAppBar appBar;
  // final MomInfo mom;
  const ChatsScreen({
    super.key,
    required this.appBar,
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
      appBar: widget.appBar,
      backgroundColor: AppColors.purpleLighterBackgroundColor,
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
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 4,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      indent: MediaQuery.of(context).size.width * 0.15,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return const GroupChatItem();
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
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    indent: MediaQuery.of(context).size.width * 0.15,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return const ChatItem();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
