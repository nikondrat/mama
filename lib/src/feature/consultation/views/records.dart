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
    widget.store.fetchUserConsultations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
        future: widget.store.fetchFuture,
        builder: (v) => ListView.builder(
            itemCount: widget.store.listData.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final Consultation? consultation = widget.store.listData[index];

              return ConsultationItem(
                  url: consultation?.doctor?.account?.avatarUrl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConsultationTime(
                        startDate: consultation?.startedAt ?? DateTime.now(),
                        endDate: consultation?.endedAt ?? DateTime.now(),
                      ),
                      ConsultationItemTitle(
                          name: 'FirstName SecondName',
                          badgeTitle: consultation?.doctor?.profession),
                      ConsultationTypeWidget(
                        type: consultation?.type ?? ConsultationType.chat,
                      ),
                    ],
                  ));
            }));
    // );
  }
}
