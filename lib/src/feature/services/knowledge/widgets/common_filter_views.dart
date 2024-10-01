import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class FilterView extends StatelessWidget {
  final String title;
  final Widget Function() builder;
  const FilterView({
    super.key,
    required this.title,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) => builder(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: CustomButton(
                  title: 'Clear',
                  onTap: () {},
                  backgroundColor: AppColors.greyLighterColor,
                )),
                10.w,
                Expanded(
                  flex: 2,
                  child: CustomButton(
                    title: 'COnfirm',
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
