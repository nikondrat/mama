import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class PersonItem extends StatelessWidget {
  final ChatItemModel person;
  const PersonItem({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          if (person.avatarUrl != null)
            CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage(
                person.avatarUrl!,
              ),
            ),
          8.w,
          RichText(
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                TextSpan(
                  text: person.name,
                  style: textTheme.bodyMedium,
                ),
                if (person.profession != null)
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: ProfessionBox(
                        profession: person.profession!,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
