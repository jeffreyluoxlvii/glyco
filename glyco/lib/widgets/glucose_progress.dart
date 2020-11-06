import 'package:flutter/material.dart';
import '../providers/measurements.dart';
import 'package:provider/provider.dart';

import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

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
              'Glucose Levels (mg/dL)',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
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

  double _barHeight(double glucoseLevel) {
    double barHeight = (20 * glucoseLevel) / maxGlucoseLevel;

    // if (barHeight >= 20) {
    //   return 19.0;
    // } else {
    return barHeight;
    // }
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
          colors: [Colors.white],
          width: 22,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [Colors.cyanAccent[400]],
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
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);
        },
        margin: 16,
        getTitles: (double value) {
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
        showTitles: false,
        getTitles: (double value) {
          return value.toString();
        },
      ),
    );
  }

  BarTouchData _buildBarTouchData() {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.pink[300],
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          String weekDay;
          switch (group.x.toInt()) {
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
                (((rod.y - 1) * maxGlucoseLevel) / 20).toStringAsFixed(1),
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
