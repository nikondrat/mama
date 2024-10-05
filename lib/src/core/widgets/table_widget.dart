import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/feeding/data/entity/history_of_feeding.dart';

enum RowTextType { title, text, titleText, columnTitle }

class TableWidget extends StatelessWidget {
  final List<String> columnTitles;
  final List<HistoryOfFeeding> listOfData;

  const TableWidget(
      {super.key, required this.columnTitles, required this.listOfData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: columnTitles
                .map((v) => _RowText(
                      text: v,
                      type: RowTextType.columnTitle,
                    ))
                .toList()),
        10.h,
        SizedBox(
          height: listOfData.length * 140,
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = listOfData[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _RowText(
                          text: item.dateTime,
                          type: RowTextType.title,
                        ),
                        _RowText(
                          text: item.allLeftSideTime,
                          type: RowTextType.titleText,
                        ),
                        _RowText(
                          text: item.allRightSideTime,
                          type: RowTextType.titleText,
                        ),
                        _RowText(
                          text: item.allTime,
                          type: RowTextType.titleText,
                        ),
                      ],
                    ),
                    5.h,
                    SizedBox(
                      height: item.detailTimeOfFeeding.length * 25,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final detailInfo = item.detailTimeOfFeeding[index];
                            return Table(
                              children: [
                                TableRow(children: [
                                  _RowText(
                                    text: detailInfo.time,
                                    type: RowTextType.text,
                                  ),
                                  _RowText(
                                    text: detailInfo.leftTime,
                                    type: RowTextType.text,
                                    alignEnd: true,
                                  ),
                                  _RowText(
                                    text: detailInfo.rightTime,
                                    type: RowTextType.text,
                                    alignEnd: true,
                                  ),
                                  _RowText(
                                    text: detailInfo.allTime,
                                    type: RowTextType.text,
                                    alignEnd: true,
                                  ),
                                ]),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return 5.h;
                          },
                          itemCount: item.detailTimeOfFeeding.length),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return 5.h;
              },
              itemCount: listOfData.length),
        ),
      ],
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class _RowText extends StatelessWidget {
  final RowTextType type;
  final String text;
  final bool? alignEnd;

  const _RowText(
      {required this.text, required this.type, this.alignEnd});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignEnd == null ? null : TextAlign.end,
        style: getStyle(context));
  }

  TextStyle? getStyle(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return switch (type) {
      RowTextType.text => textTheme.labelLarge
          ?.copyWith(fontWeight: FontWeight.w400, color: Colors.black),

      RowTextType.title =>
        textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),

      RowTextType.titleText =>
        textTheme.labelLarge?.copyWith(color: Colors.black),

      RowTextType.columnTitle => textTheme.labelLarge
          ?.copyWith(fontSize: 10, color: AppColors.greyBrighterColor),
    };
  }
}
