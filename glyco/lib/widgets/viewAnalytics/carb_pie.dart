import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../providers/measurements.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class CarbPie extends StatelessWidget {
  final int progress = 2000;
  final int goal = 6000; //carb goal
  final List<double> monthlyData = [
    155.0,
    130.0,
    176.0,
    160.5,
    120.0,
    143.5,
    149.5,
    166.0,
    186.7,
    155.0,
    136.8,
    142.0,
    121.0,
    118.8,
    156.8,
    166.6,
    190.0,
    167.5,
    164.6,
    178.0,
    137.7,
    120.6,
    118.0,
    152.0,
    151.0,
    143.8,
    132.8,
    129.0,
    169.8,
    159.9
  ];
  final double highRange = 160.0;
  final double lowRange = 120.0;
  double inRange = 0;
  double aboveRange = 0;
  double belowRange = 0;

  @override
  Widget build(BuildContext context) {
    // final progressProvider = Provider.of<Measurements>(context);

    // for (int i = 0; i < monthlyData.length; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (progressProvider.findByDateAverages(day) != null) {
    //     monthlyData[i] = progressProvider.findByDate(day).avgGlucoseLevel;
    //   }
    // }

    calculateData();

    return Center(
      child: Container(
        height: 150,
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
        padding: const EdgeInsets.all(0),
        child: Row(
          children: [
            Container(
              width: 170,
              // Pie Chart is available in fl_chart package
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  centerSpaceRadius: 0.0,
                  sectionsSpace: 0.0,
                  startDegreeOffset: 30,
                  // actual curves and data come from this function result.
                  sections: _buildPieChartCurves(),
                  // This is to make chart interactive when someone touch
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Flexible(
                        child: Text(inRange.toString() + '% in range',
                            style: TextStyle(
                              color: Colors.green[200],
                              fontSize: 18,
                            )),
                      ),
                    ]),
                    Row(children: [
                      Flexible(
                        child: Text(averageCarb(monthlyData) + ' g carbs avg',
                            style: TextStyle(
                              color: Colors.green[200],
                              fontSize: 18,
                            )),
                      ),
                    ]),
                    SizedBox(height: 10),
                    Row(children: [
                      Flexible(
                        child: Text(
                            monthlyData.reduce(max).toString() + ' g HIGHEST',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            )),
                      ),
                    ]),
                    Row(children: [
                      Flexible(
                        child: Text(
                            monthlyData.reduce(min).toString() + ' g LOWEST',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            )),
                      ),
                    ]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Here we will show different type of graph on different scenario touch and non touch
  List<PieChartSectionData> _buildPieChartCurves() {
    return List.generate(3, (i) {
      // Increase the radius of section when touched.
      final double radius = 60;

      // Ideally this data come from API and then returned, or you can modify it any way as per the data arranged in your app :)
      switch (i) {
        case 0:
          if (inRange == 0) {
            return PieChartSectionData(
              color: Colors.grey[400],
              value: 0,
              title: '',
              radius: radius,
            );
          } else {
            return PieChartSectionData(
              color: Colors.green[200],
              value: inRange,
              title: '',
              radius: radius,
            );
          }
          return null;
        case 1:
          if (belowRange == 0) {
            return PieChartSectionData(
              color: Colors.grey[400],
              value: 0,
              title: '',
              radius: radius,
            );
          } else {
            return PieChartSectionData(
              color: Colors.yellow[300],
              value: belowRange,
              title: '',
              radius: radius,
            );
          }
          return null;
        case 2:
          if (aboveRange == 0) {
            return PieChartSectionData(
              color: Colors.grey[400],
              value: 0,
              title: '',
              radius: radius,
            );
          } else {
            return PieChartSectionData(
              color: Colors.pink[300],
              value: aboveRange,
              title: '',
              radius: radius,
            );
          }
          return null;
        default:
          return null;
      }
    });
  }

  void calculateData() {
    int highRangeNumber = 0;
    int lowRangeNumber = 0;
    int inRangeNumber = 0;

    for (int i = 0; i < monthlyData.length; i++) {
      double carbLevel = monthlyData[i];

      if (carbLevel >= highRange) {
        highRangeNumber++;
      } else if (carbLevel <= lowRange) {
        lowRangeNumber++;
      } else {
        inRangeNumber++;
      }
    }

    aboveRange = ((highRangeNumber / monthlyData.length) * 100).roundToDouble();
    belowRange = ((lowRangeNumber / monthlyData.length) * 100).roundToDouble();
    inRange = ((inRangeNumber / monthlyData.length) * 100).roundToDouble();
  }

  String averageCarb(List<double> monthlyData) {
    double totalCarb = 0;
    for (int i = 0; i < monthlyData.length; i++) {
      totalCarb += monthlyData[i];
    }
    return (totalCarb / monthlyData.length).toStringAsFixed(1);
  }
}
