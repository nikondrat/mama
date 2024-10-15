import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/services/knowledge/widgets/authors_widgets.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_checkbox.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_filter_views.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterView(
      title: t.services.authorBtn.title,
      builder: (index) => const Column(
        children: [
          Authors(
            count: 30,
            title: 'Специалисты',
            subCategories: [
              AuthorsSub(
                  title: 'Чек-листы по здоровью',
                  count: 2,
                  titleAuthor: 'Акушер'),
            ],
          ),
          Authors(
            count: 30,
            title: 'Онлайн-школы',
            subCategories: [
              SchoolSub(
                title: 'Мамино счастье',
                count: 2,
              ),
              SchoolSub(
                title: 'Мамино счастье',
                count: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//     Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Автор',
//           style: TextStyle(
//             color: Color(0xff4D4DE8),
//           ),
//         ),
//         leading: Row(
//           children: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: CustomBackButton(),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Image.asset(Assets.images.save.path),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 children: const [
//                   Authors(
//                     title: 'Специалисты',
//                     count: 30,
//                     subCategories: [
//                       AuthorsSub(
//                         title: 'Чек-листы по здоровью',
//                         count: 2,
//                         titleAuthor: 'Акушер',
//                       ),
//                       AuthorsSub(
//                         title: 'Стул',
//                         count: 2,
//                         titleAuthor: 'Акушер',
//                       ),
//                       AuthorsSub(
//                         title: 'ОРВИ',
//                         count: 2,
//                         titleAuthor: 'Акушер',
//                       ),
//                       AuthorsSub(
//                         title: 'Прогулка с малышом',
//                         count: 2,
//                         titleAuthor: 'Акушер',
//                       ),
//                       AuthorsSub(
//                         title: 'Витамины',
//                         count: 2,
//                         titleAuthor: 'Акушер',
//                       ),
//                       AuthorsSub(
//                         title: 'Зубы',
//                         count: 2,
//                         titleAuthor: 'Акушер',
//                       ),
//                       AuthorsSub(
//                         title: 'Массаж',
//                         count: 2,
//                         titleAuthor: 'Акушер',
//                       ),
//                       AuthorsSub(
//                         title: 'Остеопатия',
//                         count: 2,
//                         titleAuthor: 'Акушер',
//                       ),
//                     ],
//                   ),
//                   Authors(
//                     title: 'Онлайн-школы',
//                     count: 45,
//                     subCategories: [
//                       SchoolSub(
//                         title: 'Мамино счастье',
//                         count: 2,
//                       ),
//                       SchoolSub(
//                         title: 'Мамино счастье',
//                         count: 2,
//                       ),
//                       SchoolSub(
//                         title: 'Мамино счастье',
//                         count: 2,
//                       ),
//                       SchoolSub(
//                         title: 'Мамино счастье',
//                         count: 2,
//                       ),
//                       SchoolSub(
//                         title: 'Мамино счастье',
//                         count: 2,
//                       ),
//                       SchoolSub(
//                         title: 'Мамино счастье',
//                         count: 2,
//                       ),
//                       SchoolSub(
//                         title: 'Мамино счастье',
//                         count: 2,
//                       ),
//                       SchoolSub(
//                         title: 'Мамино счастье',
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
//                         backgroundColor: Color(0xffCED1D9),
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
//                           backgroundColor: Color(0xffE1E6FF),
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

class Authors extends StatelessWidget {
  final String title;
  final int count;
  final List<Widget> subCategories;

  const Authors({
    super.key,
    required this.title,
    required this.count,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        collapsedIconColor: AppColors.blue,
        iconColor: AppColors.blue,
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                count.toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(
              child: CommonCheckBoxWidget(),
            )
          ],
        ),
        children: subCategories,
      ),
    );
  }
}
