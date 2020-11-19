import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:glyco/providers/measurements.dart';
import 'dart:math';

import 'package:provider/provider.dart';

// @author Herleen Kaur

// ignore: must_be_immutable
class GlucoseLineChart extends StatelessWidget {
  // Fake data to test the values with:
  // final List<double> monthlyData = [85.5, 69.0, 66.5, 54.5, 69.0, 71.5, 66.5, 46.7, 89.8, 58.7, 97.0, 58.0, 85.7, 84.6, 58.7, 68.6, 95.0, 75.6, 57.7, 86.7, 67.7, 86.0, 76.7, 67.5, 57.6, 86.7, 57.6, 46.0, 68.0, 65.0];
  final List<double> monthlyData = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  double maxGlucoseLevel = 0;
  double minGlucoseLevel = 0;

  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<Measurements>(context);

    // Sets the glucose levels in monthlyData, with today being monthlyData[29], skipping null values
    for (int i = 0; i < monthlyData.length; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      if (progressProvider.findByDateAverages(day) != null) {
        monthlyData[i] = progressProvider.findByDate(day).currGlucoseLevel;
      }
    }

    maxGlucoseLevel =
        monthlyData.reduce(max); // Needed to define highest y value
    minGlucoseLevel =
        monthlyData.reduce(min); // Needed to define lowest y value
    // Makes sure there is no error shown by dividing by 0 if there are no values
    if (maxGlucoseLevel == 0) {
      maxGlucoseLevel = 80;
    }

    return Center(
      child: Container(
        height: 200,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.all(5.0),
        padding: const EdgeInsets.only(left: 8, right: 8, top: 14),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: LineChart(glucoseData()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData glucoseData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        // When spot on the chart is touched, a popup shows the glucose data from that day
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.white,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((touchedSpot) {
                // When spot on the chart is touched, a popup shows the glucose data from that day
                // If value is 0, returns 0
                if ((touchedSpot.y - 1) == 0) {
                  return LineTooltipItem(
                      '0',
                      TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ));
                } else
                  return LineTooltipItem(
                      ((((touchedSpot.y - 1) / 3) *
                                  (maxGlucoseLevel - minGlucoseLevel)) +
                              minGlucoseLevel)
                          .toStringAsFixed(
                              1), // Recalculates glucose level from position on chart
                      TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ));
              }).toList();
            }),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: true, // Shows horizontal lines at each y axis value
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (double value) {
            return TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);
          },
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              // Sets the x axis with the number of day from beginning of 30 days, showing each week
              case 6:
                return '7';
              case 13:
                return '14';
              case 20:
                return '21';
              case 27:
                return '28';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (double value) {
            return TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);
          },
          // Sets the values of the y axis, with the min and max glucose levels as the first and last points
          // Two points in between min and mix are calculated as a fraction
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return minGlucoseLevel.toString();
              case 2:
                return (((maxGlucoseLevel - minGlucoseLevel) * (1 / 3)) +
                        minGlucoseLevel)
                    .toStringAsFixed(1);
              case 3:
                return (((maxGlucoseLevel - minGlucoseLevel) * (2 / 3)) +
                        minGlucoseLevel)
                    .toStringAsFixed(1);
              case 4:
                return maxGlucoseLevel.toString();
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 29, // How many points on the x axis
      maxY: 4, // How many points on the y axis
      minY: 0,
      lineBarsData: glucoseBarData(),
    );
  }

  // Sets points on the chart
  void _fillSpots(LineChartBarData lineChartBarData) {
    for (int i = 0; i < monthlyData.length; i++) {
      lineChartBarData.spots.add(FlSpot(
          i.toDouble(),
          double.parse(((((monthlyData[i] - minGlucoseLevel) /
                          (maxGlucoseLevel - minGlucoseLevel)) *
                      3) +
                  1)
              .toString()))); // Calculates data points as a proportion of the graph size
    }
  }

  List<LineChartBarData> glucoseBarData() {
    final LineChartBarData lineChartBarData = LineChartBarData(
      spots: [],
      isCurved: true,
      colors: [
        Colors.pink[300],
      ],
      barWidth: 8,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: true,
        colors: [
          Colors.pink[300].withOpacity(0.3),
        ],
      ),
    );

    _fillSpots(lineChartBarData);

    return [
      lineChartBarData,
    ];
  }
}
