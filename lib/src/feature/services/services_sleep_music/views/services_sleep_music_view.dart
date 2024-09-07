import 'package:flutter/material.dart';
import 'package:template/src/data.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    final phonePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Color(0xFFF8FAFF),
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
                Row(
                  children: [
                    /// #arrow left
                    SvgPicture.asset(
                      Assets.icons.icArrowLeftFilled,
                      width: 12,
                      height: 20,
                    ),
                    SizedBox(width: 12),

                    // #back text
                    Text(
                      t.services.back.title,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF666E80),
                      ),
                    ),
                  ],
                ),

                /// #sleep music text
                Text(
                  t.services.sleepMusic.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4D4DE8),
                  ),
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
