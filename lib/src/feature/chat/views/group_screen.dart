import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/chat/chat.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GroupScreen extends StatefulWidget {
  final GroupChatInfo groupChatInfo;
  const GroupScreen({
    super.key,
    required this.groupChatInfo,
  });

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  late FormGroup formGroup;
  List<ChatItemModel> sortedParticipant = [];

  @override
  void initState() {
    formGroup = FormGroup({
      'searchParticipant': FormControl<String>(
          // value: widget.model.firstName,
          ),
    });
    sortedParticipant = listPerson;
    super.initState();
  }

  @override
  void dispose() {
    formGroup.dispose();
    super.dispose();
  }

  void filterParticipant() {
    sortedParticipant = formGroup.control('searchParticipant').isNotNull
        ? listPerson.where((item) {
            return item.name.toLowerCase().contains(
                formGroup.control('searchParticipant').value.toLowerCase());
          }).toList()
        : listPerson;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    CustomAppBar appBar = CustomAppBar(
      padding: EdgeInsets.zero,
      height: 130,
      alignment: Alignment.topCenter,
      leading: BackButton(),
      action: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 43,
              backgroundImage: AssetImage(
                widget.groupChatInfo.avatar,
              ),
            ),
            8.h,
            Text(
              widget.groupChatInfo.name,
              style: textTheme.headlineSmall!.copyWith(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.lightPirple,
      appBar: appBar,
      body: ReactiveForm(
        formGroup: formGroup,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16),
              child: Text(
                t.chat.buttonToogleSpecialist,
                style: textTheme.labelLarge,
              ),
            ),
            CardWithoutMargin(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listSpecialist.length,
                itemBuilder: (BuildContext context, int index) {
                  return PersonItem(
                    person: listSpecialist[index],
                  );
                },
              ),
            ),
            8.h,
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  Finder(
                    onPressedClear: () {
                      setState(() {
                        formGroup
                            .control('searchParticipant')
                            .updateValue(null);
                        filterParticipant();
                      });
                    },
                    formControlName: 'searchParticipant',
                    hintText: t.chat.hintSearchParticipant,
                    onChange: () {
                      setState(() {
                        filterParticipant();
                      });
                    },
                  ),
                  Divider(
                    indent: 16,
                    endIndent: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: sortedParticipant.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PersonItem(
                          person: sortedParticipant[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<ChatItemModel> listSpecialist = [
  ChatItemModel(
      avatarUrl: Assets.images.imgPerson1.path,
      name: 'Жанна Коршунова',
      profession: 'Акушер'),
  ChatItemModel(
      avatarUrl: Assets.images.imgPerson1.path,
      name: 'Наталья Баранова',
      profession: 'Педиатр'),
  ChatItemModel(
      avatarUrl: Assets.images.imgPerson1.path,
      name: 'Анна Сумина',
      profession: 'Психолог'),
];

List<ChatItemModel> listPerson = [
  ChatItemModel(
    avatarUrl: Assets.images.imgPerson1.path,
    name: 'Жанна Коршунова',
  ),
  ChatItemModel(
    avatarUrl: Assets.images.imgPerson1.path,
    name: 'Наталья Баранова',
  ),
  ChatItemModel(
    avatarUrl: Assets.images.imgPerson1.path,
    name: 'Анна Сумина',
  ),
  ChatItemModel(
    avatarUrl: Assets.images.imgPerson1.path,
    name: 'Жанна Кортунова',
  ),
  ChatItemModel(
    avatarUrl: Assets.images.imgPerson1.path,
    name: 'Наталья Варанова',
  ),
  ChatItemModel(
    avatarUrl: Assets.images.imgPerson1.path,
    name: 'Анна Сумкина',
  ),
];
