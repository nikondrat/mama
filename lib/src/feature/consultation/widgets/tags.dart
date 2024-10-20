import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ConsultationTags extends StatelessWidget {
  final List<String> tags;
  const ConsultationTags({
    super.key,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ListView.separated(
            separatorBuilder: (context, index) => 8.w,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tags.length,
            itemBuilder: (context, index) {
              return RawChip(
                color: const WidgetStatePropertyAll(
                    AppColors.whiteDarkerButtonColor),
                label: Text(tags[index]),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              );
            }));
  }
}
