import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../providers/measurements.dart';
import 'package:provider/provider.dart';
import 'dart:math';

// @author Herleen Kaur

class GlucosePie extends StatelessWidget {
  // Fake data to test the values with:
  // final List<double> monthlyData = [
  //   85.5,
  //   69.0,
  //   66.5,
  //   54.5,
  //   69.0,
  //   71.5,
  //   66.5,
  //   60.0,
  //   76.7,
  //   58.0,
  //   67.8,
  //   86.0,
  //   76.0,
  //   76.8,
  //   59.8,
  //   79.6,
  //   68.0,
  //   56.5,
  //   65.6,
  //   78.0,
  //   67.7,
  //   87.6,
  //   79.0,
  //   67.0,
  //   110.0,
  //   45.8,
  //   46.8,
  //   100.0,
  //   67.8,
  //   56.9
  // ];
  final List<double> monthlyData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  ];
  final double highRange = 100.0; // Sets upper limit of recommended range
  final double lowRange = 70.0; // Sets lower limit of recommended range

  // Stores percentage of last 30 measurements fall into what category
  double inRange = 0;
  double aboveRange = 0;
  double belowRange = 0;

  @override
  Widget build(BuildContext context) {
  
    final progressProvider = Provider.of<Measurements>(context);

  // Pulls average glucose level from the user's data for the last 30 days, skipping null values
    for (int i = 0; i < monthlyData.length; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      if (progressProvider.findByDateAverages(day) != null) {
        monthlyData[i] = progressProvider.findByDate(day).avgGlucoseLevel;
      }
    }

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
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(0),
        child: Row(
          children: [
            Container(
              width: 170,
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  centerSpaceRadius: 0.0,
                  sectionsSpace: 0.0,
                  startDegreeOffset: 30,
                  // Actual curves and data come from this function result
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
                      Flexible( // Average glucose level
                        child: Text(averageGlucose(monthlyData) + ' mg/dL avg',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ]),
                    SizedBox(height: 10),
                    Row(children: [
                      Flexible( // Percentage of how many measurements are within range
                        child: Text(inRange.toString() + '% in range',
                            style: TextStyle(
                              color: Colors.green[300],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ]),
                    Row(children: [
                      Flexible( // Percentage of how many measurements are within range
                        child: Text(belowRange.toString() + '% below range',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ]),
                    Row(children: [
                      Flexible( // Percentage of how many measurements are within range
                        child: Text(aboveRange.toString() + '% above range',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
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

  List<PieChartSectionData> _buildPieChartCurves() {
    return List.generate(3, (i) {
      // Radius of pie chart
      final double radius = 60;

      // Creates pie chart sections based on the percentage of measurements in each category
      switch (i) {
        // Pie chart section for values in range, colored green
        case 0:
          if (inRange == 0) { // If 0, show nothing
            return PieChartSectionData(
              color: Colors.grey[400],
              value: 0,
              title: '',
              radius: radius,
            );
          } else {
            return PieChartSectionData(
              color: Colors.greenAccent,
              value: inRange,
              title: '',
              radius: radius,
            );
          }
          return null;
        // Pie chart section for values below range, colored yellow
        case 1:
          if (belowRange == 0) { // If 0, show nothing
            return PieChartSectionData(
              color: Colors.grey[300],
              value: 0,
              title: '',
              radius: radius,
            );
          } else {
            return PieChartSectionData(
              color: Colors.lightBlueAccent,
              value: belowRange,
              title: '',
              radius: radius,
            );
          }
          return null;
        // Pie chart section for values above range, colored red
        case 2:
          if (aboveRange == 0) { // If 0, show nothing
            return PieChartSectionData(
              color: Colors.grey[400],
              value: 0,
              title: '',
              radius: radius,
            );
          } else {
            return PieChartSectionData(
              color: Colors.indigo,
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

  // Calculate percentages of inRange, belowRange, and aboveRange using monthlyData
  void calculateData() {
    int highRangeNumber = 0;
    int lowRangeNumber = 0;
    int inRangeNumber = 0;

    // Count how many measurements in each category
    for (int i = 0; i < monthlyData.length; i++) {
      double glucoseLevel = monthlyData[i];

      if (glucoseLevel >= highRange) {
        highRangeNumber++;
      } else if (glucoseLevel <= lowRange) {
        lowRangeNumber++;
      } else {
        inRangeNumber++;
      }
    }
    // Calculate percentages
    aboveRange = ((highRangeNumber / monthlyData.length) * 100).roundToDouble();
    belowRange = ((lowRangeNumber / monthlyData.length) * 100).roundToDouble();
    inRange = ((inRangeNumber / monthlyData.length) * 100).roundToDouble();
  }

  // Find the average glucose levels from monthlyData
  String averageGlucose(List<double> monthlyData) {
    double totalGlucose = 0;
    for (int i = 0; i < monthlyData.length; i++) {
      totalGlucose += monthlyData[i];
    }
    return (totalGlucose / monthlyData.length).toStringAsFixed(1);
  }
}
