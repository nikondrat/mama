import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/feeding/data/entity/pumping_data.dart';
import 'package:mama/src/feature/feeding/widgets/widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PumpingGraphicWidget extends StatefulWidget {
  const PumpingGraphicWidget({super.key});

  @override
  State<PumpingGraphicWidget> createState() => _PumpingGraphicWidgetState();
}

class _PumpingGraphicWidgetState extends State<PumpingGraphicWidget> {
  late List<PumpingData> _pumpingData;

  @override
  void initState() {
    super.initState();
    _pumpingData = getPumpingData();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  Assets.icons.icArrowLeftFilled,
                  height: 15,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcIn),
                ),
                onPressed: () {},
              ),
              10.w,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('11 сентября - 17 сентября',
                      style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w400, color: Colors.black)),
                  Text('106 мл в среднем в день',
                      style: textTheme.labelSmall
                          ?.copyWith(fontWeight: FontWeight.w400))
                ],
              ),
              10.w,
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  height: 15,
                  Assets.icons.icArrowRightFilled,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcIn),
                ),
              ),
            ],
          ),
          10.h,
          SfCartesianChart(
            borderColor: Colors.transparent,
            borderWidth: 0,
            plotAreaBorderWidth: 0,
            isTransposed: true,
            series: [
              StackedBarSeries<PumpingData, String>(
                  width: 0.8,
                  color: AppColors.purpleBrighterBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      bottomLeft: Radius.circular(4)),
                  dataLabelSettings: DataLabelSettings(
                      builder: (data, point, series, pointIndex, seriesIndex){
                        final model = data as PumpingData;
                        if(model.right == 0 && model.left == 0){
                          return SizedBox();
                        }
                        return Text("П\n${model.right}",
                          textAlign: TextAlign.right,
                          style: textTheme.labelSmall
                            ?.copyWith(color: AppColors.trackerColor),);
                      },
                      isVisible: true, showCumulativeValues: true),
                  dataSource: _pumpingData,
                  xValueMapper: (PumpingData data, _) => data.weekDay,
                  yValueMapper: (PumpingData data, _) => data.left),

              StackedBarSeries<PumpingData, String>(
                width: 0.8,
                  color: AppColors.greenBrighterBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  dataLabelSettings: DataLabelSettings(
                      builder: (data, point, series, pointIndex, seriesIndex){
                        final model = data as PumpingData;
                         return Text("Л\n${model.left}",
                           style: textTheme.labelSmall
                             ?.copyWith(color: AppColors.trackerColor),);
                      },
                      alignment: ChartAlignment.center,
                      isVisible: true, showCumulativeValues: false),
                  dataSource: _pumpingData,
                  xValueMapper: (PumpingData data, _) => data.weekDay,
                  yValueMapper: (PumpingData data, _) => data.right),
            ],
            primaryXAxis: CategoryAxis(
              tickPosition: TickPosition.outside,
              labelStyle:
                  textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400),
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: const MajorGridLines(width: 0),
              labelStyle:
                  textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400),
              minimum: 0,
              maximum: 150,
              interval: 50,
            ),
          ),
        ],
      ),
    );
  }

  List<PumpingData> getPumpingData() {
    return [
      PumpingData(weekDay: 'Пн 11', ml: 98, left: 48, right: 50),
      PumpingData(
        weekDay: 'Вт 12',
        ml: 117,
        left: 55,
        right: 62,
      ),
      PumpingData(weekDay: 'Ср 13', ml: 108, left: 52, right: 56),
      PumpingData(weekDay: 'Чт 14', ml: 112, left: 47, right: 65),
      PumpingData(weekDay: 'Пт 15', ml: 97, left: 47, right: 65),
      PumpingData(weekDay: 'Сб 16', ml: 0, left: 0, right: 0),
      PumpingData(weekDay: 'Вс 17', ml: 0, left: 0, right: 0),
    ];
  }
}
