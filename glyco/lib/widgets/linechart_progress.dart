import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// Returns a weekly line chart that shows the average glucose levels for the past 7 days
class LineChartProgressContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartState();
}

class LineChartState extends State<LineChartProgressContainer> {
  final List<double> weeklyData = [85.5, 69.0, 66.5, 54.5, 69.0, 71.5, 66.5];
  // final List<double> weeklyData = [0, 0, 0, 0, 0, 0, 0];
  final List<DateTime> dates = [null, null, null, null, null, null, null];
  final List<String> weekdayData = ['', '', '', '', '', '', ''];
  double maxGlucoseLevel = 0;
  double minGlucoseLevel = 0;

  @override
  Widget build(BuildContext context) {

    // final progressProvider = Provider.of<Measurements>(context);

  // Sets the glucose levels in weeklyData, with today being weeklyData[6], skipping null values
    // for (int i = 0; i < weeklyData.length; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (progressProvider.findByDateAverages(day) != null) {
    //     weeklyData[i] = progressProvider.findByDate(day).avgGlucoseLevel;
    //   }
    // }

  // Sets the DataTime variables and their weekdays, with today being dates[6] and weekdayData[6]
    int dayCount = 0;
    for (int i = 6; i >= 0; i--) {
      dates[i] = DateTime.now().subtract(Duration(days: dayCount));
      dayCount++;
      int weekday = dates[i].weekday;

      if (weekday == 1) {
        weekdayData[i] = 'M';
      }
      if (weekday == 2) {
        weekdayData[i] = 'T';
      }
      if (weekday == 3) {
        weekdayData[i] = 'W';
      }
      if (weekday == 4) {
        weekdayData[i] = 'Th';
      }
      if (weekday == 5) {
        weekdayData[i] = 'F';
      }
      if (weekday == 6) {
        weekdayData[i] = 'S';
      }
      if (weekday == 7) {
        weekdayData[i] = 'Su';
      }
    }

  // Max and min glucose levels needed to set the lowest and highest bounds for the y axis
    maxGlucoseLevel = weeklyData.reduce(max);
    minGlucoseLevel = weeklyData.reduce(min);

    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        color: Colors.grey[200],
      ),
      margin: EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            'Glucose Levels (mg/dL)', // Title of chart
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 6.0),
              child: LineChart(glucoseData()),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData glucoseData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.white,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((touchedSpot) {
              // When spot on the chart is touched, a popup shows the glucose data from that day
                return LineTooltipItem(
                    ((((touchedSpot.y - 1) / 3) *
                                    (maxGlucoseLevel - minGlucoseLevel))
                                    + minGlucoseLevel)
                        .toStringAsFixed(1), // Recalculates glucose level from position on chart
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
        show: false, // If true, shows horizontal lines at each y axis value
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
            switch (value.toInt()) { // Sets the x axis with the weekday of each day
              case 0:
                return weekdayData[0];
              case 1:
                return weekdayData[1];
              case 2:
                return weekdayData[2];
              case 3:
                return weekdayData[3];
              case 4:
                return weekdayData[4];
              case 5:
                return weekdayData[5];
              case 6:
                return weekdayData[6];
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
      maxX: 6, // How many points on the x axis
      maxY: 4, // How many points on the y axis
      minY: 0,
      lineBarsData: glucoseBarData(),
    );
  }

  // Sets points on the chart
  void _fillSpots(LineChartBarData lineChartBarData) {
    for (int i = 0; i < 7; i++) {
      lineChartBarData.spots.add(FlSpot(
          i.toDouble(),
          double.parse(((((weeklyData[i] - minGlucoseLevel) /
                      (maxGlucoseLevel - minGlucoseLevel)) * 3) +
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
