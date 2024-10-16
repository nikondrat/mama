import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/trackers/widgets/big_find_out_more_button.dart';

class TrackersHealthView extends StatefulWidget {
  const TrackersHealthView({super.key});

  @override
  State<TrackersHealthView> createState() => _TrackersHealthViewState();
}

class _TrackersHealthViewState extends State<TrackersHealthView>
    with SingleTickerProviderStateMixin {
  // controllers
  late final TabController _tabController;

  final List<List> tableData = [
    ['06 сентября', '09:30', '36,9'],
  ];

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

  void _onAddTemperatureButtonPressed() =>
      context.goNamed(AppViews.addTemperature);

  @override
  Widget build(BuildContext context) {
    final phonePadding = MediaQuery.of(context).padding;

    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    // tabs
    final tabs = [
      t.trackers.temperature.title,
      t.trackers.medicines.title,
      t.trackers.doctorsAppointment.title,
      t.trackers.vaccinations.title,
    ];

    return Scaffold(
      backgroundColor: AppColors.e8ddf9,
      appBar: CustomAppBar(
        height: 110,
        title: t.trackers.health.title,
        tabs: tabs,
        action: const ProfileWidget(),
        tabController: _tabController,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// #main content
          Expanded(
            child: ColoredBox(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  padding: const EdgeInsets.only(top: 16),
                  children: [
                    /// #find out more box
                    BigFindOutMoreButton(
                      closeButtonOnPressed: () {},
                      findOutMoreButtonOnPressed: () {},
                    ),
                    const SizedBox(height: 16),

                    /// #tabel header
                    const Row(
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
                    const SizedBox(height: 5),

                    /// #actual table
                    Table(
                      children: tableData
                          .map(
                            (row) => TableRow(
                              children: row
                                  .map(
                                    (cell) => Text(cell),
                                  )
                                  .toList(),
                            ),
                          )
                          .toList(),
                    ),

                    SizedBox(height: phonePadding.bottom + 16),
                  ],
                ),
              ),
            ),
          ),

          /// #bottom buttons
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
                  Expanded(
                    child: CustomButton(
                      title: t.trackers.findOutMore.title,
                      onTap: () {},
                      icon: IconModel(
                        iconPath: Assets.icons.icGraduationCapFilled,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      type: CustomButtonType.outline,
                      textStyle: textTheme.titleMedium!.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  8.w,

                  /// #pdf button
                  Expanded(
                    child: CustomButton(
                      title: t.trackers.pdf.title,
                      onTap: () {},
                      icon: IconModel(
                        iconPath: Assets.icons.icArrowDownFilled,
                      ),
                      type: CustomButtonType.outline,
                    ),
                  ),
                  8.w,

                  /// #add temperature button
                  Expanded(
                    child: CustomButton(
                      title: t.trackers.add.title,
                      onTap: () {},
                      icon: IconModel(
                        iconPath: Assets.icons.icThermometer,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
