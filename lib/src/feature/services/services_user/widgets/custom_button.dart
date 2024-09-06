import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Ink(
          decoration: BoxDecoration(
            color: Color(0xFFE1E6FF),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4D4DE8),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
