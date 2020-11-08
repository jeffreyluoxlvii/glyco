import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// ignore: must_be_immutable
class GlucoseLineChart extends StatelessWidget {
  final List<double> monthlyData = [85.5, 69.0, 66.5, 54.5, 69.0, 71.5, 66.5, 46.7, 89.8, 58.7, 97.0, 58.0, 85.7, 84.6, 58.7, 68.6, 95.0, 75.6, 57.7, 86.7, 67.7, 86.0, 76.7, 67.5, 57.6, 86.7, 57.6, 46.0, 68.0, 65.0];
  double maxGlucoseLevel = 0;
  double minGlucoseLevel = 0;

  @override
  Widget build(BuildContext context) {
    // final progressProvider = Provider.of<Measurements>(context);

    // for (int i = 0; i < monthlyData.length; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (progressProvider.findByDateAverages(day) != null) {
    //     monthlyData[i] = progressProvider.findByDate(day).avgGlucoseLevel;
    //   }
    // }

    maxGlucoseLevel = monthlyData.reduce(max);
    minGlucoseLevel = monthlyData.reduce(min);

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
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.all(5.0),
        padding: const EdgeInsets.only(left: 8, right: 8, top: 14),
        child:
      Container(
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
                child: LineChart(sampleData1()),
              ),
            ),
          ],
        ),
      ),
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
                        .toStringAsFixed(1),
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
        show: true,
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
      maxX: 29,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  void _fillSpots(LineChartBarData lineChartBarData) {
    for (int i = 0; i < monthlyData.length; i++) {
      lineChartBarData.spots.add(FlSpot(
          i.toDouble(),
          double.parse(((((monthlyData[i] - minGlucoseLevel) /
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


// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';

// class LineChartProgressContainer extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => LineChartState();
// }

// class LineChartState extends State<LineChartProgressContainer> {
//   final List<double> weeklyData = [85.5, 69.0, 66.5, 54.5, 69.0, 71.5, 66.5];
//   // final List<double> weeklyData = [0, 0, 0, 0, 0, 0, 0];
//   final List<DateTime> dates = [null, null, null, null, null, null, null];
//   final List<String> weekdayData = ['', '', '', '', '', '', ''];
//   double maxGlucoseLevel = 0;
//   double minGlucoseLevel = 0;

//   @override
//   Widget build(BuildContext context) {
//     // final progressProvider = Provider.of<Measurements>(context);

//     // for (int i = 0; i < weeklyData.length; i++) {
//     //   DateTime day = DateTime.now().subtract(Duration(days: i));

//     //   if (progressProvider.findByDateAverages(day) != null) {
//     //     weeklyData[i] = progressProvider.findByDate(day).avgGlucoseLevel;
//     //   }
//     // }

//     int dayCount = 0;

//     for (int i = 6; i >= 0; i--) {
//       dates[i] = DateTime.now().subtract(Duration(days: dayCount));
//       dayCount++;
//       int weekday = dates[i].weekday;

//       if (weekday == 1) {
//         weekdayData[i] = 'M';
//       }
//       if (weekday == 2) {
//         weekdayData[i] = 'T';
//       }
//       if (weekday == 3) {
//         weekdayData[i] = 'W';
//       }
//       if (weekday == 4) {
//         weekdayData[i] = 'Th';
//       }
//       if (weekday == 5) {
//         weekdayData[i] = 'F';
//       }
//       if (weekday == 6) {
//         weekdayData[i] = 'S';
//       }
//       if (weekday == 7) {
//         weekdayData[i] = 'Su';
//       }
//     }
//     maxGlucoseLevel = weeklyData.reduce(max);
//     minGlucoseLevel = weeklyData.reduce(min);

//     return Container(
//       height: 200,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(18)),
//         color: Colors.grey[200],
//       ),
//       margin: EdgeInsets.all(8.0),
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           const Text(
//             'Glucose Levels (mg/dL)',
//             style: TextStyle(
//                 color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(right: 16.0, left: 6.0),
//               child: LineChart(sampleData1()),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   LineChartData sampleData1() {
//     return LineChartData(
//       lineTouchData: LineTouchData(
//         touchTooltipData: LineTouchTooltipData(
//             tooltipBgColor: Colors.white,
//             getTooltipItems: (touchedSpots) {
//               return touchedSpots.map((touchedSpot) {
//                 return LineTooltipItem(
//                     ((((touchedSpot.y - 1) / 3) *
//                                     (maxGlucoseLevel - minGlucoseLevel))
//                                     + minGlucoseLevel)
//                         .toString(),
//                     TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ));
//               }).toList();
//             }),
//         touchCallback: (LineTouchResponse touchResponse) {},
//         handleBuiltInTouches: true,
//       ),
//       gridData: FlGridData(
//         show: false,
//       ),
//       titlesData: FlTitlesData(
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 22,
//           getTextStyles: (double value) {
//             return TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);
//           },
//           margin: 10,
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 0:
//                 return weekdayData[0];
//               case 1:
//                 return weekdayData[1];
//               case 2:
//                 return weekdayData[2];
//               case 3:
//                 return weekdayData[3];
//               case 4:
//                 return weekdayData[4];
//               case 5:
//                 return weekdayData[5];
//               case 6:
//                 return weekdayData[6];
//             }
//             return '';
//           },
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           getTextStyles: (double value) {
//             return TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);
//           },
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 1:
//                 return minGlucoseLevel.toString();
//               case 2:
//                 return (((maxGlucoseLevel - minGlucoseLevel) * (1 / 3)) +
//                         minGlucoseLevel)
//                     .toStringAsFixed(1);
//               case 3:
//                 return (((maxGlucoseLevel - minGlucoseLevel) * (2 / 3)) +
//                         minGlucoseLevel)
//                     .toStringAsFixed(1);
//               case 4:
//                 return maxGlucoseLevel.toString();
//             }
//             return '';
//           },
//           margin: 8,
//           reservedSize: 30,
//         ),
//       ),
//       borderData: FlBorderData(
//         show: true,
//         border: const Border(
//           bottom: BorderSide(
//             color: Colors.black,
//             width: 4,
//           ),
//           left: BorderSide(
//             color: Colors.transparent,
//           ),
//           right: BorderSide(
//             color: Colors.transparent,
//           ),
//           top: BorderSide(
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//       minX: 0,
//       maxX: 6,
//       maxY: 4,
//       minY: 0,
//       lineBarsData: linesBarData1(),
//     );
//   }

//   void _fillSpots(LineChartBarData lineChartBarData) {
//     for (int i = 0; i < 7; i++) {
//       lineChartBarData.spots.add(FlSpot(
//           i.toDouble(),
//           double.parse(((((weeklyData[i] - minGlucoseLevel) /
//                       (maxGlucoseLevel - minGlucoseLevel)) * 3) +
//                   1)
//               .toString())));
//     }
//   }

//   List<LineChartBarData> linesBarData1() {
//     final LineChartBarData lineChartBarData = LineChartBarData(
//       spots: [],
//       isCurved: true,
//       colors: [
//         Colors.pink[300],
//       ],
//       barWidth: 8,
//       dotData: FlDotData(
//         show: false,
//       ),
//       belowBarData: BarAreaData(
//         show: true,
//         colors: [
//           Colors.pink[300].withOpacity(0.3),
//         ],
//       ),
//     );

//     _fillSpots(lineChartBarData);

//     return [
//       lineChartBarData,
//     ];
//   }
// }
