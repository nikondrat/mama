import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ConsultationItem extends StatelessWidget {
  final Widget child;
  final String? url;
  final Function()? onTap;
  const ConsultationItem({
    super.key,
    this.onTap,
    this.url,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.whiteDarkerButtonColor,
            borderRadius: 20.r,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const PhotoWidget(url: null, size: Size(100, 100), radius: 12),
                10.w,
                Expanded(
                  child: child,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
