import 'package:flutter/material.dart';

class CustomList<T> extends StatelessWidget {
  final List<T> data;
  final Function(T item) itemBuilder;

  final EdgeInsets? padding;

  final double? itemVerticalMargin;
  const CustomList({
    super.key,
    required this.data,
    required this.itemBuilder,
    this.padding,
    this.itemVerticalMargin,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: padding ?? const EdgeInsets.all(8),
        itemBuilder: (context, index) => itemBuilder(data[index]),
        separatorBuilder: (context, index) =>
            SizedBox(height: itemVerticalMargin ?? 8),
        itemCount: data.length);
  }
}
