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
  final List<double> dateData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  final List<String> weekdayData = ['', '', '', '', '', '', ''];
  int touchedIndex;
  double maxGlucoseLevel = 0;

  @override
  Widget build(BuildContext context) {
    // final progressProvider = Provider.of<Measurements>(context);

    // for (int i = 0; i < weeklyData.length; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (progressProvider.findByDateAverages(day) != null) {
    //     weeklyData[i] = progressProvider.findByDate(day).avgGlucoseLevel;
    //   }
    // }

    int daysPassed = 0;

    for (int i = 0; i < dateData.length; i++) {
      if (i == 0 || i % 2 == 0) {
        dateData[i] = DateTime.now()
            .subtract(Duration(days: (6 - daysPassed)))
            .month
            .toDouble();
      } else {
        dateData[i] = DateTime.now()
            .subtract(Duration(days: (6 - daysPassed)))
            .day
            .toDouble();
        int weekday =
            DateTime.now().subtract(Duration(days: (6 - daysPassed))).weekday;

        if (weekday == 1) {
          weekdayData[daysPassed] = 'M';
        }
        if (weekday == 2) {
          weekdayData[daysPassed] = 'T';
        }
        if (weekday == 3) {
          weekdayData[daysPassed] = 'W';
        }
        if (weekday == 4) {
          weekdayData[daysPassed] = 'Th';
        }
        if (weekday == 5) {
          weekdayData[daysPassed] = 'F';
        }
        if (weekday == 6) {
          weekdayData[daysPassed] = 'S';
        }
        if (weekday == 7) {
          weekdayData[daysPassed] = 'Su';
        }

        daysPassed++;
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
          y: isTouched ? _barHeight(y) + 1 : _barHeight(y),
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
              weekDay = dateData[0].toInt().toString() +
                  '/' +
                  dateData[1].toInt().toString();
              break;
            case 1:
              weekDay = dateData[2].toInt().toString() +
                  '/' +
                  dateData[3].toInt().toString();
              break;
            case 2:
              weekDay = dateData[4].toInt().toString() +
                  '/' +
                  dateData[5].toInt().toString();
              break;
            case 3:
              weekDay = dateData[6].toInt().toString() +
                  '/' +
                  dateData[7].toInt().toString();
              break;
            case 4:
              weekDay = dateData[8].toInt().toString() +
                  '/' +
                  dateData[9].toInt().toString();
              break;
            case 5:
              weekDay = dateData[10].toInt().toString() +
                  '/' +
                  dateData[11].toInt().toString();
              break;
            case 6:
              weekDay = dateData[12].toInt().toString() +
                  '/' +
                  dateData[13].toInt().toString();
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
