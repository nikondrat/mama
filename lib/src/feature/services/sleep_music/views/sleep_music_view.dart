import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ServicesSleepMusicView extends StatefulWidget {
  const ServicesSleepMusicView({super.key});

  @override
  State<ServicesSleepMusicView> createState() => _ServicesSleepMusicViewState();
}

class _ServicesSleepMusicViewState extends State<ServicesSleepMusicView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _initAllController();
  }

  @override
  void dispose() {
    super.dispose();
    _disposeAllController();
  }

  void _initAllController() {
    _tabController = TabController(length: 3, vsync: this);
  }

  void _disposeAllController() {
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final phonePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: Column(
        children: [
          SizedBox(height: phonePadding.top + 20),

          /// #
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// #arrow left, back text
                CustomBackButton(),

                /// #sleep music text
                AutoSizeText(
                  t.services.sleepMusic.title,
                  style: textTheme.titleLarge,
                ),

                /// #
              ],
            ),
          ),

          /// #
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: t.services.music.title,
              ),
              Tab(
                text: t.services.whiteNoise.title,
              ),
              Tab(
                text: t.services.fairyTales.title,
              )
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(color: Colors.amber),
                Container(color: Colors.black),
                Container(color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
