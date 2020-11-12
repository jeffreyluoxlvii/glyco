import 'package:flutter/material.dart';
import '../providers/measurements.dart';
import 'package:provider/provider.dart';

import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

// @author Herleen Kaur

// Returns a weekly bar chart that shows the average glucose levels for the past 7 days
class GlucoseProgressContainer extends StatefulWidget {
  @override
  GlucoseProgressState createState() {
    return GlucoseProgressState();
  }
}

class GlucoseProgressState extends State<GlucoseProgressContainer> {
  final List<double> weeklyData = [85.5, 69.0, 66.5, 54.5, 69.0, 71.5, 66.5];
  // final List<double> weeklyData = [0, 0, 0, 0, 0, 0, 0];
  final List<String> weekdayData = ['', '', '', '', '', '', ''];
  final List<DateTime> dates = [null, null, null, null, null, null, null];
  int touchedIndex;
  double maxGlucoseLevel = 0;

  @override
  Widget build(BuildContext context) {
    // Sets the glucose levels in weeklyData, with today being weeklyData[6]
    // final progressProvider = Provider.of<Measurements>(context);

    // for (int i = 0; i < weeklyData.length; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (progressProvider.findByDateAverages(day) != null) {
    //     weeklyData[i] = progressProvider.findByDate(day).avgGlucoseLevel;
    //   } else {
    //     weeklyData[i] = 0;
    //   }
    // }

    int dayCount = 0;

    // Sets the DateTime variables and their weekdays, with today being dates[6] and weekdayData[6]
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

    // Maximum glucose is needed to set the height of the bars, with the max glucose as the tallest height
    maxGlucoseLevel = weeklyData.reduce(max);

    return new Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.grey[200],
      ),
      margin: EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Glucose Levels (mg/dL)', // Title of chart
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              // Bar chart takes up the rest of the space in the height-200 box
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BarChart(
                  mainBarData(),
                ),
              ),
            ),
          ]),
    );
  }

  // Returns height of each glucose level as a proportion of the bar height (20)
  double _barHeight(double glucoseLevel) {
    double barHeight = (20 * glucoseLevel) / maxGlucoseLevel;
    return barHeight;
  }

  BarChartGroupData _buildBar(
    int x,
    double y, {
    bool isTouched = false,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: _barHeight(y),
          colors: [Colors.white], // Color of bar
          width: 22,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20, // Sets bar height as 20
            colors: [Colors.cyanAccent[400]], // Color of value in that bar
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _buildAllBars() {
    return List.generate(
      weeklyData.length,
      (index) =>
          _buildBar(index, weeklyData[index], isTouched: index == touchedIndex),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: _buildBarTouchData(),
      titlesData: _buildAxes(),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: _buildAllBars(),
    );
  }

  FlTitlesData _buildAxes() {
    return FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        getTextStyles: (double value) {
          return TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);
        },
        margin: 16,
        getTitles: (double value) {
          // Returns weekday of each date underneath each bar, which was set with the loop at line 43
          switch (value.toInt()) {
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
            default:
              return '';
          }
        },
      ),
      leftTitles: SideTitles(
        // No side titles
        showTitles: false,
        getTitles: (double value) {
          return value.toString();
        },
      ),
    );
  }

  // When the bar is touched, a popup shows the date and average glucose level of that day
  BarTouchData _buildBarTouchData() {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.pink[300],
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          String weekDay;
          switch (group.x.toInt()) {
            // Sets the date of bar selected in the format mm/dd
            case 0:
              weekDay =
                  dates[0].month.toString() + '/' + dates[0].day.toString();
              break;
            case 1:
              weekDay =
                  dates[1].month.toString() + '/' + dates[1].day.toString();
              break;
            case 2:
              weekDay =
                  dates[2].month.toString() + '/' + dates[2].day.toString();
              break;
            case 3:
              weekDay =
                  dates[3].month.toString() + '/' + dates[3].day.toString();
              break;
            case 4:
              weekDay =
                  dates[4].month.toString() + '/' + dates[4].day.toString();
              break;
            case 5:
              weekDay =
                  dates[5].month.toString() + '/' + dates[5].day.toString();
              break;
            case 6:
              weekDay =
                  dates[6].month.toString() + '/' + dates[6].day.toString();
              break;
          }
          return BarTooltipItem(
            weekDay +
                '\n' +
                (((rod.y) * maxGlucoseLevel) / 20).toStringAsFixed(
                    1), // Recalculates the average glucose level from bar height
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          );
        },
      ),
      touchCallback: (barTouchResponse) {
        setState(() {
          if (barTouchResponse.spot != null &&
              barTouchResponse.touchInput is! FlPanEnd &&
              barTouchResponse is! FlAxisTitleData) {
            touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
          } else {
            touchedIndex = -1;
          }
        });
      },
    );
  }
}
