

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/feature/feeding/data/entity/pumping_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/core.dart';

class GraphicWidget extends StatelessWidget {
  final List<GraphicData> listOfData;
  final String topColumnText;
  final String bottomColumnText;
  final double minimum;
  final double maximum;
  final double interval;
  const GraphicWidget({super.key, required this.listOfData, required this.topColumnText, required this.bottomColumnText, required this.minimum, required this.maximum, required this.interval});

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
                    builder: (data, point, series, pointIndex, seriesIndex){
                      final model = data as GraphicData;
                      if(model.bottom == 0 && model.top == 0){
                        return SizedBox();
                      }
                      return Text('$bottomColumnText\n${model.bottom}',
                        textAlign: TextAlign.right,
                        style: textTheme.labelSmall
                            ?.copyWith(color: AppColors.trackerColor),);
                    },
                    isVisible: true, showCumulativeValues: true),
                dataSource: listOfData,
                xValueMapper: (GraphicData data, _) => data.weekDay,
                yValueMapper: (GraphicData data, _) => data.top),

            StackedBarSeries<GraphicData, String>(
                width: 0.8,
                color: AppColors.greenBrighterBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4)),
                dataLabelSettings: DataLabelSettings(
                    builder: (data, point, series, pointIndex, seriesIndex){
                      final model = data as GraphicData;
                      return Text('$topColumnText\n${model.top}',
                        style: textTheme.labelSmall
                            ?.copyWith(color: AppColors.trackerColor),);
                    },
                    alignment: ChartAlignment.center,
                    isVisible: true, showCumulativeValues: false),
                dataSource: listOfData,
                xValueMapper: (GraphicData data, _) => data.weekDay,
                yValueMapper: (GraphicData data, _) => data.bottom),
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
