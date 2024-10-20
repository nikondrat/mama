import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class ConsultationView extends StatefulWidget {
  const ConsultationView({super.key});

  @override
  State<ConsultationView> createState() => _ConsultationViewState();
}

class _ConsultationViewState extends State<ConsultationView>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
            create: (context) => ConsultationRecordsStore(
                  restClient: context.read<Dependencies>().restClient,
                )),
        Provider(
            create: (context) => DoctorsStore(
                  restClient: context.read<Dependencies>().restClient,
                )),
        // Provider(
        //     create: (context) => SchoolsStore(
        //           restClient: context.read<Dependencies>().restClient,
        //         )),
      ],
      builder: (context, _) => Scaffold(
          appBar: CustomAppBar(
            title: t.consultation.title,
            height: 120,
            action: const ProfileWidget(),
            tabController: controller,
            tabs: [
              t.consultation.records,
              t.consultation.professionals,
              t.consultation.schools,
            ],
          ),
          body: TabBarView(controller: controller, children: [
            ConsultationRecords(
              store: context.watch(),
            ),
            SpecialistsView(
              store: context.watch(),
            ),
            const SchoolsView(),
          ])),
    );
  }
}
