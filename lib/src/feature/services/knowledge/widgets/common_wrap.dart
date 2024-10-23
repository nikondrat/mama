import 'package:flutter/material.dart';

class CommonFilterChipWidget extends StatefulWidget {
  const CommonFilterChipWidget({super.key});

  @override
  State<CommonFilterChipWidget> createState() => _CommonFilterChipWidgetState();
}

enum CategoryFilter { categories, age, author }

class _CommonFilterChipWidgetState extends State<CommonFilterChipWidget> {
  Set<CategoryFilter> filters = <CategoryFilter>{};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 50,
        width: 400,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            Wrap(
              spacing: 5.0,
              children:
                  CategoryFilter.values.map((CategoryFilter categoriesFilter) {
                return FilterChip(
                  label: Text(categoriesFilter.name),
                  selectedColor: Color(0xff4D4DE8),
                  selected: filters.contains(categoriesFilter),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        filters.add(categoriesFilter);
                      } else {
                        filters.remove(categoriesFilter);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
