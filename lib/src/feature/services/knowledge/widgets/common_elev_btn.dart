import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const CommonElevatedButton(
      {super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(name));
  }
}


class CommonChipButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const CommonChipButton(
      {super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(name),
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
