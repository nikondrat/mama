import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/data.dart';

class SchoolsView extends StatelessWidget {
  const SchoolsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Observer(builder: (_) {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 5,
          itemBuilder: (context, index) {
            // final DoctorModel? doctor = widget.store.listData[index];

            return ConsultationItem(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConsultationItemTitle(
                  name: 'FirstName SecondName',
                  badgeTitle: null,
                ),
                Row(children: [
                  Expanded(
                    child: AutoSizeText(
                      'Акушер / Консультант по ГВ Опыт ;})работы более 20 лет Мама 2 детей Основное Образование: Государственный медицинский институт им. Н. И. Пирогова — педиатрия Опыт работы: Врач-неонатолог роддома № 11 Врач-педиатр / неонатолог госпиталя MD GROUP',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodySmall!
                          .copyWith(color: textTheme.bodyLarge!.color),
                    ),
                  ),
                ]),
                ConsultationTags(tags: [
                  'sdf',
                  'sdf',
                  'sdf',
                  'sdf',
                ])
              ],
            ));
          });
    });
  }
}
