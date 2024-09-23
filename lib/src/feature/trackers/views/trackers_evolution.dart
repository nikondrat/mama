import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/trackers/views/views.dart';
import 'package:mama/src/feature/trackers/widgets/widgets.dart';

class TrackersEvolutionView extends StatefulWidget {
  const TrackersEvolutionView({super.key});

  @override
  State<TrackersEvolutionView> createState() => _TrackersEvolutionViewState();
}

class _TrackersEvolutionViewState extends State<TrackersEvolutionView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.blueLighter1,
        appBar: CustomAppBar(
          bottom: CustomTabBar(),
        ),
        body: TabBarView(
          children: [
            Center(child: Weight()),
            Center(child: Height()),
            Center(child: Head()),
            Center(child: TableW()),
          ],
        ),
      ),
    );
  }
}
