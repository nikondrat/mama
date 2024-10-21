import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/feature/feeding/data/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../core/core.dart';

class GraphicWidget extends StatelessWidget {
  final List<GraphicData> pumpingData;
  final String firstPartText;
  final String secondPartText;
  final double maximum;
  final double minimum;
  final double interval;

  const GraphicWidget(
      {super.key,
      required this.pumpingData,
      required this.firstPartText,
      required this.secondPartText,
      required this.maximum,
      required this.minimum,
      required this.interval});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Column(
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
            StackedBarSeries<GraphicData, String>(
                width: 0.8,
                color: AppColors.purpleBrighterBackgroundColor,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4)),
                dataLabelSettings: DataLabelSettings(
                    builder: (data, point, series, pointIndex, seriesIndex) {
                      final model = data as GraphicData;
                      if (model.bottomPart == 0 && model.topPart == 0) {
                        return SizedBox();
                      }
                      return Text(
                        '$secondPartText\n${model.bottomPart}',
                        textAlign: TextAlign.right,
                        style: textTheme.labelSmall
                            ?.copyWith(color: AppColors.trackerColor),
                      );
                    },
                    isVisible: true,
                    showCumulativeValues: true),
                dataSource: pumpingData,
                xValueMapper: (GraphicData data, _) => data.weekDay,
                yValueMapper: (GraphicData data, _) => data.topPart),
            StackedBarSeries<GraphicData, String>(
                width: 0.8,
                color: AppColors.greenBrighterBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                dataLabelSettings: DataLabelSettings(
                    builder: (data, point, series, pointIndex, seriesIndex) {
                      final model = data as GraphicData;
                      return Text(
                        '$firstPartText\n${model.topPart}',
                        style: textTheme.labelSmall
                            ?.copyWith(color: AppColors.trackerColor),
                      );
                    },
                    alignment: ChartAlignment.center,
                    isVisible: true,
                    showCumulativeValues: false),
                dataSource: pumpingData,
                xValueMapper: (GraphicData data, _) => data.weekDay,
                yValueMapper: (GraphicData data, _) => data.bottomPart),
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
            minimum: minimum,
            maximum: maximum,
            interval: interval,
          ),
        ),
      ],
    );
  }
}
