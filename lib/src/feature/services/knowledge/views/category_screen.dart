import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/services/knowledge/widgets/categories_widgets.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_filter_views.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterView(
      title: t.services.categoriesBtn.title,
      builder: (index) => const BuildCategory(
        title: 'Здоровье ребенка',
        count: 30,
        subCategories: [
          BuildSubCategory(
            title: 'Чек-листы по здоровью',
            count: 4,
          ),
        ],
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         leading: CustomBackButton(),
//         title: Text(
//           t.services.categoriesBtn.title,
//           style: TextStyle(
//             color: AppColors.blueBrightTextColor,
//             fontFamily: Assets.fonts.nunitoLight,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 children: const [
//                   BuildCategory(
//                     title: 'Здоровье ребенка',
//                     count: 30,
//                     subCategories: [
//                       BuildSubCategory(
//                         title: 'Чек-листы по здоровью',
//                         count: 2,
//                       ),
//                       BuildSubCategory(
//                         title: 'Стул',
//                         count: 2,
//                       ),
//                       BuildSubCategory(
//                         title: 'ОРВИ',
//                         count: 2,
//                       ),
//                       BuildSubCategory(
//                         title: 'Прогулка с малышом',
//                         count: 2,
//                       ),
//                       BuildSubCategory(
//                         title: 'Витамины',
//                         count: 2,
//                       ),
//                       BuildSubCategory(
//                         title: 'Зубы',
//                         count: 2,
//                       ),
//                       BuildSubCategory(
//                         title: 'Массаж',
//                         count: 2,
//                       ),
//                       BuildSubCategory(
//                         title: 'Остеопатия',
//                         count: 2,
//                       ),
//                     ],
//                   ),
//                   BuildCategory(
//                     title: 'Первая помощь',
//                     count: 19,
//                     subCategories: [
//                       BuildSubCategory(
//                         title: 'Чек-листы по здоровью',
//                         count: 2,
//                       )
//                     ],
//                   ),
//                   BuildCategory(
//                     title: 'Грудное и искусственное вскармливание',
//                     count: 19,
//                     subCategories: [
//                       BuildSubCategory(
//                         title: 'Чек-листы по здоровью',
//                         count: 2,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.greyColor,
//                         foregroundColor: AppColors.whiteColor,
//                         fixedSize: Size(109, 48),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text(
//                         'Очистить',
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               AppColors.purpleLighterBackgroundColor,
//                           fixedSize: Size(241, 48),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           foregroundColor: Color(0xff4D4DE8)),
//                       child: Text('Подтвердить'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
