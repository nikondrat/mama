import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeightData {
  final String month;
  final double weight;
  final String label;

  WeightData(this.month, this.weight, this.label);
}

class FlProgressChart extends StatelessWidget {
  const FlProgressChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WeightData> chartData = [
      WeightData('Январь', 2.35, '5.35\n17.07'),
      WeightData('Февраль', 3.25, '6.25\n31.08'),
      WeightData('Март', 5.25, '6.25\n31.08'),
      WeightData('Апрель', 4.25, '6.25\n31.08'),
      WeightData('Май', 6.25, '6.25\n31.08'),
      WeightData('Июнь', 6.25, '6.25\n31.08'),
      WeightData('Июль', 3.7, '3.7\n13.05'),
      WeightData('Август', 4.9, '4.9\n03.07'),
      WeightData('Сентябрь', 5.35, '5.35\n17.07'),
      WeightData('Октябрь', 6.25, '6.25\n31.08'),
      WeightData('Ноябрь', 3.7, '3.7\n13.05'),
      WeightData('Декабрь', 4.9, '4.9\n03.07'),
    ];

    return SfCartesianChart(
      plotAreaBackgroundColor: Colors.transparent,
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
        enableDoubleTapZooming: true,
      ),
      primaryXAxis: const CategoryAxis(
        axisLine: AxisLine(color: Colors.transparent),
        initialVisibleMaximum: 5,
      ),
      primaryYAxis: const NumericAxis(
        minimum: 2,
        maximum: 9,
        interval: 1,
      ),
      series: [
        LineSeries<WeightData, String>(
          dataSource: chartData,
          xValueMapper: (WeightData data, _) => data.month,
          yValueMapper: (WeightData data, _) => data.weight,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          markerSettings: const MarkerSettings(isVisible: true),
          color: Colors.blue,
        ),
        SplineAreaSeries<WeightData, String>(
          dataSource: chartData,
          color: Colors.white,
          xValueMapper: (WeightData data, _) => data.month,
          yValueMapper: (WeightData data, _) => data.weight,
          gradient: LinearGradient(
            colors: [
              Colors.green.withOpacity(0.1),
              Colors.green.withOpacity(0.3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderColor: Colors.green.withOpacity(0.3),
          borderWidth: 30,
        ),
      ],
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }
}
