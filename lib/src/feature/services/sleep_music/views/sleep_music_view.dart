import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/feature/services/services_sleep_music/widgets/widgets.dart';

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

  // funtions
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

  /// This function goes back from current screen
  void _navigateToServicesUserView() => GoRouter.of(context).pop();

  @override
  Widget build(BuildContext context) {
    final phonePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Color(0xFFF8FAFF),
      body: Column(
        children: [
          SizedBox(height: phonePadding.top + 10),

          /// #custom app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// #arrow left, back text
                InkWell(
                  onTap: _navigateToServicesUserView,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
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
                  ),
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

                /// #some space, placeholder(child image)
                Row(
                  children: [
                    SizedBox(width: 16),

                    /// #placeholder(child image)
                    DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.blackColor,
                      ),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          /// #
          TabBar(
            controller: _tabController,
            unselectedLabelStyle: TextStyle(color: AppColors.f8faff),
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

          /// #tracks
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                /// #Music
                ListView.separated(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TrackRow(
                        name: 'Концерт для валторны №3 в ми-бемоль мажоре',
                        author: 'Вольфгант Амадей Моцарт',
                        timeRange: '3:34',
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                ),

                /// #white noise
                ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TrackRow(
                        name: 'Звуки утробы матери',
                        author: 'Белый шум',
                        timeRange: '2:10',
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                ),

                /// #failry tales
                ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TrackRow(
                        name: 'Конек-горбунок',
                        author: 'Сказка',
                        timeRange: '3:24',
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
