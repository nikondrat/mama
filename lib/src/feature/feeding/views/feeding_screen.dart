import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/feeding/feeding.dart';

class FeedingScreen extends StatefulWidget {
  const FeedingScreen({super.key});

  @override
  State<FeedingScreen> createState() => _FeedingScreenState();
}

class _FeedingScreenState extends State<FeedingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F2FE),
      appBar: CustomAppBar(
        height: 100,
        tabController: _tabController,
        title: t.feeding.feeding,
        tabs: [
          t.feeding.breast,
          t.feeding.pumping,
          t.feeding.bottle,
          t.feeding.lure,
        ],
        action: CircleAvatar(
          radius: 20,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BreastScreen(),
          PumpingScreen(),
          PumpingScreen(),
          WeaningScreen(),

        ],
      ),
    );
  }
}
