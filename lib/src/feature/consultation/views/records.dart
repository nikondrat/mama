import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ConsultationRecords extends StatefulWidget {
  final ConsultationRecordsStore store;
  const ConsultationRecords({
    super.key,
    required this.store,
  });

  @override
  State<ConsultationRecords> createState() => _ConsultationRecordsState();
}

class _ConsultationRecordsState extends State<ConsultationRecords> {
  @override
  void initState() {
    widget.store.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      future: widget.store.fetchConsultationsFuture,
      builder: (v) => ListView.builder(
          itemCount: v.data?.length,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final Consultation? consultation = v.data?[index];

            if (consultation != null) {
              return ConsultationItem(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConsultationTime(startDate: DateTime.now()),
                  ConsultationItemTitle(
                      name: 'FirstName SecondName', badgeTitle: 'Dfsfdsfd'),
                ],
              ));
            }

            return const SizedBox.shrink();
          }),
    );
  }
}
