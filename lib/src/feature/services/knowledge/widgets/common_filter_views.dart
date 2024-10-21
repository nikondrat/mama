import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class FilterView extends StatefulWidget {
  final String title;
  final Widget Function(int) builder;

  const FilterView({
    super.key,
    required this.title,
    required this.builder,
  });

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool isCleared = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) => widget.builder(index),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'Очистить',
                    onTap: () {
                      setState(() {
                        isCleared = !isCleared;
                        
                      });
                    },
                    backgroundColor: isCleared
                        ? AppColors.redChildStatusBackgroundColor
                        : AppColors.greyLighterColor,
                    type: CustomButtonType.filled,
                  ),
                ),
                10.w,
                Expanded(
                  flex: 2,
                  child: CustomButton(
                    title: 'Подтвердить',
                    onTap: () {},
                    backgroundColor: AppColors.purpleBrighterBackgroundColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
