import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ConsultationItem extends StatelessWidget {
  final Widget child;
  const ConsultationItem({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.whiteDarkerButtonColor,
          borderRadius: 20.r,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network('')),
              ),
              10.w,
              Expanded(
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
