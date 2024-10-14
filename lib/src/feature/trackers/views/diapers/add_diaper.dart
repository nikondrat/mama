import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class AddDiaper extends StatefulWidget {
  const AddDiaper({super.key});

  @override
  State<AddDiaper> createState() => _AddDiaperState();
}

class _AddDiaperState extends State<AddDiaper> {
  int selectedIndex = 0;
  bool isPopupVisible = false;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      isPopupVisible = true;
    });
  }

  void _closeButton() {
    setState(() {
      isPopupVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.diapersBackroundColor,
      appBar: CustomAppBar(title: t.trackers.diaper.add),
      body: DecoratedBox(
        decoration: const BoxDecoration(color: AppColors.whiteColor),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isPopupVisible)
                CustomPopupWidget(
                  selectedIndex: selectedIndex,
                  closeButton: () => _closeButton(),
                ),
              16.h,
              DiaperStateSwitch(
                onTap: (index) => _onItemTapped(index),
                selectedIndex: selectedIndex,
                isPopupVisible: isPopupVisible,
              ),
              16.h,
              Row(
                children: [
                  Expanded(
                    child: OutlinButtonWidget(
                      onPressedOutlined: () {},
                    ),
                  ),
                ],
              ),
              16.h,
              DateSwitchContainer(
                title1: t.trackers.now.title,
                title2: t.trackers.sixTeenThirtyTwo.title,
                title3: t.trackers.fourteensOfSeptember.title,
              ),
              16.h,
              Row(
                children: [
                  AddButton(
                    title: t.trackers.add.title,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
