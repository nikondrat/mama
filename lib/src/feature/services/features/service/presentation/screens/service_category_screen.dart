// import 'package:flutter/material.dart';
// import 'package:mama_and_co/features/service/data/model.dart';

// class ServiceCategoryScreen extends StatefulWidget {
//   const ServiceCategoryScreen({super.key});

//   @override
//   State<ServiceCategoryScreen> createState() => _ServiceCategoryScreenState();
// }

// class _ServiceCategoryScreenState extends State<ServiceCategoryScreen> {
//   String? selectedCategory;

//   bool _isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'Категории',
//           style: TextStyle(
//             color: Color(0xff4D4DE8),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView(
//         children: [
//           SizedBox(
//             child: ListView.separated(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           DropdownButton(
//                             icon: Icon(Icons.keyboard_arrow_down),
//                             value: selectedCategory,
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 newValue = selectedCategory!;
//                               });
//                             },
//                             items: [
//                               DropdownMenuItem(
//                                 value: selectedCategory,
//                                 child: Column(
//                                   children: [],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: Text(
//                               categories.first.categoryName.toString(),
//                             ),
//                           ),
//                           Expanded(
//                             child: CheckboxListTile(
//                               title: Text(
//                                 '2',
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                               value: _isChecked,
//                               onChanged: (bool? newValue) {
//                                 setState(() {
//                                   _isChecked = newValue!;
//                                 });
//                               },
//                               activeColor: Color(0xff4D4DE8),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return SizedBox(height: 10);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       for (var category in categories) {
//                         _isChecked = false;
//                       }
//                     });
//                   },
//                   style: OutlinedButton.styleFrom(
//                     backgroundColor: Colors.grey[300],
//                   ),
//                   child: Text('Очистить', style: TextStyle(color: Colors.grey)),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle confirm action
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xff4D4DE8),
//                   ),
//                   child: Text('Подтвердить'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// /// To Delete later
// //
// // class Example extends StatelessWidget {
// //   const Example({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         DropdownButton<String>(
// //           value: selectedCategory,
// //           hint: Text('Выберите категорию'),
// //           isExpanded: true,
// //           items: categories.keys.map((String category) {
// //             return DropdownMenuItem<String>(
// //               value: category,
// //               child: Text(category),
// //             );
// //           } as Function(dynamic e)).toList(),
// //           onChanged: (String? newValue) {
// //             setState(() {
// //               selectedCategory = newValue;
// //             });
// //           },
// //         ),
// //         if (selectedCategory != null &&
// //             categories[selectedCategory]!.isNotEmpty)
// //           ListView(
// //             shrinkWrap: true,
// //             physics: NeverScrollableScrollPhysics(),
// //             children: categories[selectedCategory]!
// //                 .map((subCategory) {
// //               return CheckboxListTile(
// //                 title: Row(
// //                   mainAxisAlignment:
// //                   MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(subCategory['name']),
// //                     Text(
// //                       subCategory['count'].toString(),
// //                       style: TextStyle(color: Colors.grey),
// //                     ),
// //                   ],
// //                 ),
// //                 value: subCategory['isChecked'],
// //                 onChanged: (bool? newValue) {
// //                   setState(() {
// //                     subCategory['isChecked'] = newValue!;
// //                   });
// //                 },
// //                 controlAffinity:
// //                 ListTileControlAffinity.leading,
// //                 activeColor: Color(0xff4D4DE8),
// //               );
// //             }).toList(),
// //           )
// //         else if (selectedCategory != null)
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Text('Нет подкатегорий для этой категории'),
// //           ),
// //       ],
// //     );
// //   }
// // }
// //
