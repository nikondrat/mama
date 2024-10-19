import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/services/knowledge/model/ages_model.dart';
import 'package:mama/src/feature/services/knowledge/widgets/ages_widgets.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_filter_views.dart';

class AgesScreen extends StatelessWidget {
  const AgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterView(
      title: t.services.ageBtn.title,
      builder: (index) => AgeSelection(
        title: agesList[index].tittle,
        count: agesList[index].count,
      ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     leading: CustomBackButton(),
    //     title: Text(
    //       'Возраст',
    //       style: TextStyle(
    //         color: AppColors.blue,
    //       ),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //     child: Column(
    //       children: [
    //         Expanded(
    //           child: ListView(
    //             physics: NeverScrollableScrollPhysics(),
    //             shrinkWrap: true,
    //             children: const [
    //               AgeSelection(
    //                 title: 'Первый месяц',
    //                 count: 3,
    //               ),
    //               AgeSelection(
    //                 title: '2 месяца',
    //                 count: 3,
    //               ),
    //               AgeSelection(
    //                 title: '3 месяца',
    //                 count: 3,
    //               ),
    //               AgeSelection(
    //                 title: '4 месяца',
    //                 count: 3,
    //               ),
    //               AgeSelection(
    //                 title: '5 месяцев',
    //                 count: 3,
    //               ),
    //               AgeSelection(
    //                 title: '6 месяцев',
    //                 count: 3,
    //               ),
    //               AgeSelection(
    //                 title: '12 месяцев',
    //                 count: 3,
    //               ),
    //               AgeSelection(
    //                 title: 'После года',
    //                 count: 3,
    //               ),
    //             ],
    //           ),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Expanded(
    //               child: ElevatedButton(
    //                 onPressed: () {},
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: Color(0xffCED1D9),
    //                   fixedSize: Size(109, 48),
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(8),
    //                   ),
    //                 ),
    //                 child: Text(
    //                   'Очистить',
    //                 ),
    //               ),
    //             ),
    //             SizedBox(
    //               width: 10,
    //             ),
    //             Expanded(
    //               flex: 2,
    //               child: ElevatedButton(
    //                 onPressed: () {},
    //                 style: ElevatedButton.styleFrom(
    //                     backgroundColor: Color(0xffE1E6FF),
    //                     fixedSize: Size(241, 48),
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(8),
    //                     ),
    //                     foregroundColor: Color(0xff4D4DE8)),
    //                 child: Text('Подтвердить'),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
