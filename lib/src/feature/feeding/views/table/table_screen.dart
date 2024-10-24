import 'package:flutter/material.dart';
import 'package:mama/src/feature/feeding/data/repository/history_repository.dart';
import 'package:mama/src/feature/feeding/widgets/table_history.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TableHistory(
          listOfData: listOfTableData,
          firstColumnName: 'Дата',
          secondColumnName: 'Время ГВ',
          thirdColumnName: 'Всего\nжидкости,\nмл',
          fourthColumnName: 'Всего\nприкорма,\nг',
          showTitle: false,
        ),
      ),
    );
  }
}
