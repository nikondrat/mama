import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/feature/services/services_sleep_music/widgets/player_row.dart';
import 'package:mama/src/feature/services/services_sleep_music/widgets/widgets.dart';

class ServicesSleepMusicView extends StatefulWidget {
  const ServicesSleepMusicView({super.key});

  @override
  State<ServicesSleepMusicView> createState() => _ServicesSleepMusicViewState();
}

class _ServicesSleepMusicViewState extends State<ServicesSleepMusicView>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<ServicesSleepMusicView> {
  // controllers
  late final TabController _tabController;

  // variables
  int? _currentPlayingIndex;
  int? _currentPlayingTab;

  late List<bool> _isPlayingMusicList;
  late List<bool> _isPlayingWhiteNoiseList;
  late List<bool> _isPlayingFairyTalesList;

  @override
  void initState() {
    super.initState();
    _initAllController();
    _initPlayingLists();
  }

  // funtions
  @override
  void dispose() {
    super.dispose();
    _disposeAllController();
  }

  void _initAllController() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  void _disposeAllController() {
    _tabController.dispose();
  }

  /// This function goes back from current screen
  void _navigateToServicesUserView() => GoRouter.of(context).pop();

  /// This function initializes lists needed to play music
  void _initPlayingLists() {
    _isPlayingMusicList = List.generate(15, (_) => false);
    _isPlayingWhiteNoiseList = List.generate(10, (_) => false);
    _isPlayingFairyTalesList = List.generate(5, (_) => false);
  }

  /// This functions plays pressed music and pauses the playing one.
  void _onPlayButtonPressed({
    required int index,
    required int currentPlayingTab,
  }) {
    setState(() {
      if (_currentPlayingIndex != null && _currentPlayingTab != null) {
        _stopCurrentTrack();
      }

      if (_currentPlayingIndex == index &&
          _currentPlayingTab == currentPlayingTab) {
        _currentPlayingIndex = null;
        _currentPlayingTab = null;
      } else {
        _startNewTrack(index, currentPlayingTab);
        _currentPlayingIndex = index;
        _currentPlayingTab = currentPlayingTab;
      }
    });
  }

  /// This function just stops the current playing track
  void _stopCurrentTrack() {
    switch (_currentPlayingTab) {
      case 0:
        _isPlayingMusicList[_currentPlayingIndex!] = false;
        break;
      case 1:
        _isPlayingWhiteNoiseList[_currentPlayingIndex!] = false;
        break;
      case 2:
        _isPlayingFairyTalesList[_currentPlayingIndex!] = false;
        break;
      default:
    }
  }

  /// This functions just starts a new track
  void _startNewTrack(int index, int currentPlayingTab) {
    switch (currentPlayingTab) {
      case 0:
        _isPlayingMusicList[index] = true;
        break;
      case 1:
        _isPlayingWhiteNoiseList[index] = true;
        break;
      case 2:
        _isPlayingFairyTalesList[index] = true;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final phonePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Color(0xFFF8FAFF),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// #main content
          Column(
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

              /// #tabs(selection options)
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
                    /// #music
                    ListView.separated(
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TrackRow(
                            name: t.services.placeholderOne.title,
                            author: t.services.placeholderTwo.title,
                            timeRange: t.services.placeholderThree.title,
                            isPlaying: _isPlayingMusicList[index],
                            onPlayButtonPressed: () => _onPlayButtonPressed(
                              index: index,
                              currentPlayingTab: 0,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                    ),

                    /// #white noise
                    ListView.separated(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TrackRow(
                            name: t.services.placeholderFour.title,
                            author: t.services.placeHhlderFive.title,
                            timeRange: t.services.placeholderThree.title,
                            isPlaying: _isPlayingWhiteNoiseList[index],
                            onPlayButtonPressed: () => _onPlayButtonPressed(
                              index: index,
                              currentPlayingTab: 1,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                    ),

                    /// #failry tales
                    ListView.separated(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TrackRow(
                            name: t.services.placeholderSix.title,
                            author: t.services.placeholderSeven.title,
                            timeRange: t.services.placeholderThree.title,
                            isPlaying: _isPlayingFairyTalesList[index],
                            onPlayButtonPressed: () => _onPlayButtonPressed(
                              index: index,
                              currentPlayingTab: 2,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// #player row
          PlayerRow(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
