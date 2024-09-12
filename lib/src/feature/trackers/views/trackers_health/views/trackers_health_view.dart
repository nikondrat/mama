import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';

class TrackersHealthView extends StatefulWidget {
  const TrackersHealthView({super.key});

  @override
  State<TrackersHealthView> createState() => _TrackersHealthViewState();
}

class _TrackersHealthViewState extends State<TrackersHealthView>
    with SingleTickerProviderStateMixin {
  // controllers
  late final TabController _tabController;

  // funtions
  void _initAllController() {
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
  }

  void _disposeAllController() {
    _tabController.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    final phonePadding = MediaQuery.of(context).padding;

    final tabs = [
      Tab(text: t.trackers.temperature.title),
      Tab(text: t.trackers.medicines.title),
      Tab(text: t.trackers.doctorsAppointment.title),
      Tab(text: t.trackers.vaccinations.title),
    ];
    return Scaffold(
      backgroundColor: AppColors.e8ddf9,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// #main content
          Column(
            children: [
              SizedBox(height: phonePadding.top + 10),

              /// #custom app bar
              CustomAppBar(title: t.trackers.health.title),
              const SizedBox(height: 10),

              /// #tabs(selection options)
              ColoredBox(
                color: AppColors.whiteColor,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.center,
                  unselectedLabelStyle:
                      const TextStyle(color: AppColors.f8faff),
                  tabs: tabs,
                ),
              ),

              /// #tracks
              Expanded(
                child: ColoredBox(
                  color: AppColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      padding: EdgeInsets.only(top: 16),
                      children: [
                        /// #find out more box
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          child: ColoredBox(
                            color: AppColors.lightBlue,
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// #exit button
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          Assets.icons.icCrossMark,
                                        ),
                                      ),
                                    ),

                                    /// #find out more text
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Column(
                                        children: [
                                          /// #find out more one text
                                          Text(
                                            t.trackers.findOutMoreTextOne.title,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  AppColors.greyBrighterColor,
                                            ),
                                          ),
                                          SizedBox(height: 8),

                                          /// #find out more two text
                                          Text(
                                            t.trackers.findOutMoreTextTwo.title,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  AppColors.greyBrighterColor,
                                            ),
                                          ),
                                          SizedBox(height: 16),

                                          /// #find out more button
                                          Material(
                                            color: AppColors.whiteColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                            child: InkWell(
                                              onTap: () {},
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                  border: Border.all(
                                                    width: 2,
                                                    color: AppColors
                                                        .purpleLighterBackgroundColor,
                                                  ),
                                                ),
                                                child: SizedBox(
                                                  height: 50,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      /// #graduation cap
                                                      SvgPicture.asset(
                                                        Assets.icons
                                                            .icGraduationCapFilled,
                                                      ),
                                                      SizedBox(width: 5),

                                                      /// #find out more text
                                                      Text(
                                                        t.trackers.findOutMore
                                                            .title,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 12,
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        /// #
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Дата',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.greyBrighterColor,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Время',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.greyBrighterColor,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Температура',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.greyBrighterColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),

                        /// #
                        ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 0),
                          children: [
                            SizedBox(height: 5),

                            /// #
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        '06 сентября',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Text(
                                        '09:30',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 9,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Spacer(flex: 3),
                                                    Text(
                                                      '36,9',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 17,
                                                        color: AppColors
                                                            .blackColor,
                                                      ),
                                                    ),
                                                    Spacer(flex: 4),
                                                    SvgPicture.asset(
                                                      Assets
                                                          .icons.icPencilFilled,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// #
          ColoredBox(
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                top: 8,
                bottom: phonePadding.bottom + 16,
              ),
              child: Row(
                children: [
                  /// #find out more button
                  Material(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                            width: 2,
                            color: AppColors.purpleLighterBackgroundColor,
                          ),
                        ),
                        child: SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /// #graduation cap
                                SvgPicture.asset(
                                  Assets.icons.icGraduationCapFilled,
                                ),
                                SizedBox(width: 5),

                                /// #find out more text
                                Text(
                                  t.trackers.findOutMore.title,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),

                  /// #pdf button
                  Material(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                            width: 2,
                            color: AppColors.purpleLighterBackgroundColor,
                          ),
                        ),
                        child: SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /// #graduation cap
                                SvgPicture.asset(
                                  Assets.icons.icArrowDownFilled,
                                ),
                                SizedBox(width: 5),

                                /// #find out more text
                                Text(
                                  t.trackers.pdf.title,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),

                  /// #add temperature button
                  Expanded(
                    child: Material(
                      color: AppColors.purpleLighterBackgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /// #graduation cap
                                  SvgPicture.asset(
                                    Assets.icons.icThermometer,
                                  ),
                                  SizedBox(width: 12),

                                  /// #find out more text
                                  Text(
                                    t.trackers.add.title,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
