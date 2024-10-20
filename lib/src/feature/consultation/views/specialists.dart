import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class SpecialistsView extends StatefulWidget {
  final DoctorsStore store;
  const SpecialistsView({
    super.key,
    required this.store,
  });

  @override
  State<SpecialistsView> createState() => _SpecialistsViewState();
}

class _SpecialistsViewState extends State<SpecialistsView> {
  @override
  initState() {
    widget.store.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return LoadingWidget(
      future: widget.store.fetchFuture,
      builder: (v) => ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: widget.store.listData.length,
          itemBuilder: (context, index) {
            final DoctorModel? doctor = widget.store.listData[index];

            return ConsultationItem(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConsultationItemTitle(
                    name:
                        '${doctor?.account?.firstName} ${doctor?.account?.secondName}',
                    badgeTitle: doctor?.profession),
                if (doctor?.account?.info != null)
                  Row(children: [
                    Expanded(
                      child: AutoSizeText(
                        doctor?.account?.info ?? '',
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
          }),
    );
  }
}
