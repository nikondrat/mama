import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/services/services_sleep_music/widgets/custom_app_bar.dart';
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

  bool _isPlayerRowVisible = false;

  @override
  void initState() {
    super.initState();
    _initAllController();
    _initPlayingLists();
  }

  @override
  void dispose() {
    super.dispose();
    _disposeAllController();
  }

  // funtions
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
        _isPlayerRowVisible = false;
      } else {
        _startNewTrack(index, currentPlayingTab);
        _currentPlayingIndex = index;
        _currentPlayingTab = currentPlayingTab;
        _isPlayerRowVisible = true;
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
              CustomAppBar(),
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
                        if (index == 14) {
                          return Column(
                            children: [
                              /// #track row
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: TrackRow(
                                  name: t.services.placeholderOne.title,
                                  author: t.services.placeholderTwo.title,
                                  timeRange: t.services.placeholderThree.title,
                                  isPlaying: _isPlayingMusicList[index],
                                  onPlayButtonPressed: () =>
                                      _onPlayButtonPressed(
                                    index: index,
                                    currentPlayingTab: 0,
                                  ),
                                ),
                              ),

                              /// #bottom space
                              _isPlayerRowVisible
                                  ? SizedBox(height: phonePadding.bottom + 100)
                                  : SizedBox.shrink()
                            ],
                          );
                        }

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
                        if (index == 9) {
                          return Column(
                            children: [
                              /// #track row
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: TrackRow(
                                  name: t.services.placeholderFour.title,
                                  author: t.services.placeHhlderFive.title,
                                  timeRange: t.services.placeholderThree.title,
                                  isPlaying: _isPlayingWhiteNoiseList[index],
                                  onPlayButtonPressed: () =>
                                      _onPlayButtonPressed(
                                    index: index,
                                    currentPlayingTab: 1,
                                  ),
                                ),
                              ),

                              /// #bottom space
                              _isPlayerRowVisible
                                  ? SizedBox(height: phonePadding.bottom + 100)
                                  : SizedBox.shrink()
                            ],
                          );
                        }

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
                        if (index == 4) {
                          return Column(
                            children: [
                              /// #track row
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: TrackRow(
                                  name: t.services.placeholderSix.title,
                                  author: t.services.placeholderSeven.title,
                                  timeRange: t.services.placeholderThree.title,
                                  isPlaying: _isPlayingFairyTalesList[index],
                                  onPlayButtonPressed: () =>
                                      _onPlayButtonPressed(
                                    index: index,
                                    currentPlayingTab: 2,
                                  ),
                                ),
                              ),

                              /// #bottom space
                              _isPlayerRowVisible
                                  ? SizedBox(height: phonePadding.bottom + 100)
                                  : SizedBox.shrink()
                            ],
                          );
                        }

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
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
            bottom: _isPlayerRowVisible ? 0 : -(phonePadding.bottom + 100),
            child: PlayerRow(),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
