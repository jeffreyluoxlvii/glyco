import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LineChartProgressContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartState();
}

class LineChartState extends State<LineChartProgressContainer> {
  final List<double> weeklyData = [85.5, 69.0, 66.5, 54.5, 69.0, 71.5, 66.5];
  // final List<double> weeklyData = [0, 0, 0, 0, 0, 0, 0];
  final List<double> dateData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  final List<String> weekdayData = ['', '', '', '', '', '', ''];
  double maxGlucoseLevel = 0;
  double minGlucoseLevel = 0;

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
            'Glucose Levels (mg/dL)',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 6.0),
              child: LineChart(sampleData1()),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.white,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((touchedSpot) {
                return LineTooltipItem(
                    ((((touchedSpot.y - 1) / 3) *
                                    (maxGlucoseLevel - minGlucoseLevel))
                                    + minGlucoseLevel)
                        .toString(),
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
        show: false,
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
      maxX: 6,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  void _fillSpots(LineChartBarData lineChartBarData) {
    for (int i = 0; i < 7; i++) {
      lineChartBarData.spots.add(FlSpot(
          i.toDouble(),
          double.parse(((((weeklyData[i] - minGlucoseLevel) /
                      (maxGlucoseLevel - minGlucoseLevel)) * 3) +
                  1)
              .toString())));
    }
  }

  List<LineChartBarData> linesBarData1() {
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
