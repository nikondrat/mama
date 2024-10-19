import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class CommonCheckBoxWidget extends StatefulWidget {
  const CommonCheckBoxWidget({
    super.key,
  });

  @override
  State<CommonCheckBoxWidget> createState() => _CommonCheckBoxWidgetState();
}

class _CommonCheckBoxWidgetState extends State<CommonCheckBoxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    

    return Checkbox(
      value: isChecked,
      
      activeColor: AppColors.blue,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
