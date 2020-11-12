import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:glyco/providers/measurements.dart';
import 'dart:math';

import 'package:provider/provider.dart';

// @author Herleen Kaur

class ExerciseBarChart extends StatelessWidget {
  final List<double> exerciseData = [
    25,
    36,
    41,
    23,
    25,
    48,
    26,
    36,
    53,
    34,
    33,
    25,
    28,
    27,
    38,
    52,
    24,
    13,
    12,
    15,
    36,
    47,
    24,
    43,
    24,
    53,
    24,
    25,
    46,
    25
  ];

  double maxExerciseTime = 0;
  double minExerciseTime = 0;

  @override
  Widget build(BuildContext context) {
    // final progressProvider = Provider.of<Measurements>(context);

    // Sets the exercise levels in exerciseData, with today being exerciseData[29], skipping null values
    // for (int i = 0; i < exerciseData.length; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (progressProvider.findByDateAverages(day) != null) {
    //     exerciseData[i] = progressProvider.findByDate(day).exerciseTime.toDouble();
    //   }
    // }

    maxExerciseTime = exerciseData.reduce(max);
    minExerciseTime = exerciseData.reduce(min);

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
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.all(5.0),
        padding: const EdgeInsets.only(left: 8, right: 10, top: 14),
        child: AspectRatio(
          aspectRatio: 1.7,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: maxExerciseTime,
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  // Has labels for x axis
                  showTitles: true,
                  getTextStyles: (value) => const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  margin: 10,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      // Sets the x axis with the number of day from beginning of 30 days, showing each week
                      case 0:
                        return '';
                      case 1:
                        return '';
                      case 2:
                        return '';
                      case 3:
                        return '';
                      case 4:
                        return '';
                      case 5:
                        return '';
                      case 6:
                        return '7';
                      case 7:
                        return '';
                      case 8:
                        return '';
                      case 9:
                        return '';
                      case 10:
                        return '';
                      case 11:
                        return '';
                      case 12:
                        return '';
                      case 13:
                        return '14';
                      case 14:
                        return '';
                      case 15:
                        return '';
                      case 16:
                        return '';
                      case 17:
                        return '';
                      case 18:
                        return '';
                      case 19:
                        return '';
                      case 20:
                        return '21';
                      case 21:
                        return '';
                      case 22:
                        return '';
                      case 23:
                        return '';
                      case 24:
                        return '';
                      case 25:
                        return '';
                      case 26:
                        return '';
                      case 27:
                        return '28';
                      case 28:
                        return '';
                      case 29:
                        return '';
                      case 30:
                        return '';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(
                  // Has labels for y axis
                  showTitles: true,
                  getTextStyles: (double value) {
                    return TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12);
                  },
                  getTitles: (value) {
                    // Sets labels for y axis
                    if (value == 0) {
                      return '0';
                    } else if (value == 18) {
                      return '18';
                    } else if (value == 36) {
                      return '36';
                    } else if (value == 50) {
                      return '50';
                    } else {
                      return '';
                    }
                  },
                  margin: 8,
                  reservedSize: 30,
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: [
                // Sets the BarChartGroupData() for each day in exerciseData(), x as day and y as value
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[0],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[1],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[2],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[3],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[4],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[5],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 6,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[6],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 7,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[7],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 8,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[8],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 9,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[9],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 10,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[10],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 11,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[11],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 12,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[12],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 13,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[13],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 14,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[14],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 15,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[15],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 16,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[16],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 17,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[17],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 18,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[18],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 19,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[19],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 20,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[20],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 21,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[21],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 22,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[22],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 23,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[23],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 24,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[24],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 25,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[25],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 26,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[26],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 27,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[27],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 28,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[28],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
                BarChartGroupData(
                  x: 29,
                  barRods: [
                    BarChartRodData(
                        y: exerciseData[29],
                        colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
