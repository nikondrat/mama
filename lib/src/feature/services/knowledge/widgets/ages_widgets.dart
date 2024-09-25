
import 'package:flutter/material.dart';

class AgeSelection extends StatelessWidget {
  final String title;
  final int count;

  const AgeSelection({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          count.toString(),
          style: TextStyle(color: Colors.grey),
        ),
        CommonCheckBoxWidget()
      ],
    );
  }
}

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
      activeColor: Color(0xff4D4DE8),
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class CommonCheckBox extends StatefulWidget {
  const CommonCheckBox({
    super.key,
  });

  @override
  State<CommonCheckBox> createState() => _CommonCheckBoxState();
}

class _CommonCheckBoxState extends State<CommonCheckBox> {
  bool firstValue = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Color(0xff4D4DE8),
        value: firstValue,
        onChanged: (bool? value) {
          setState(() {
            firstValue = value!;
          });
        });
  }
}
