import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/trackers/views/views.dart';
import 'package:provider/provider.dart';

class EvolutionView extends StatefulWidget {
  const EvolutionView({super.key});

  @override
  State<EvolutionView> createState() => _EvolutionViewState();
}

class _EvolutionViewState extends State<EvolutionView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = context.watch<UserStore>();

    return Scaffold(
      backgroundColor: AppColors.blueLighter1,
      appBar: CustomAppBar(
        height: 110,
        title: t.trackers.evolution,
        tabController: _tabController,
        action: ProfileWidget(
          children: userStore.children.toList(),
        ),
        tabs: [
          t.trackers.weight.title,
          t.trackers.growth.title,
          t.trackers.head.title,
          t.trackers.table,
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Weight()),
          Center(child: Growth()),
          Center(child: Head()),
          Center(child: TableW()),
        ],
      ),
    );
  }
}
