import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class SpecialistsView extends StatelessWidget {
  const SpecialistsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return ConsultationItem(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConsultationItemTitle(
                  name: 'FirstName SecondName', badgeTitle: 'Dfsfdsfd'),
              Row(children: [
                Expanded(
                  child: AutoSizeText(
                    'Акушер / Консультант по ГВ Опыт работы более 20 лет Мама 2 детей Основное Образование: Государственный медицинский институт им. Н. И. Пирогова — педиатрия Опыт работы: Врач-неонатолог роддома № 11 Врач-педиатр / неонатолог госпиталя MD GROUP',
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
                'sdf',
                'sdf',
                'sdf',
                'sdf',
                'sdf',
                'sdf',
                'sdf',
                'sdf',
              ])
            ],
          ));
        });
  }
}
