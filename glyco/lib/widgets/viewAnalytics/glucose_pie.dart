import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../providers/measurements.dart';
import 'package:provider/provider.dart';

class GlucosePie extends StatefulWidget {
  @override
  _GlucosePieState createState() => _GlucosePieState();
}

class _GlucosePieState extends State<GlucosePie> {
  int _touchedIndex;
  int progress = 860;
  int goal = 3000;

  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<Measurements>(context);
    // if (progressProvider.getChallenge() == 'steps') {
    //   progress = progressProvider.findByDate(DateTime.now()).steps;
    // }
    // if (progressProvider.getChallenge() == 'activity') {
    //   progress = progressProvider.findByDate(DateTime.now()).exerciseTime;
    // }
    // if (progressProvider.getChallenge() == 'carbs') {
    //   progress = progressProvider.findByDate(DateTime.now()).carbs;
    // }
    // goal = progressProvider.getChallengeGoal();

    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.white,
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
                centerSpaceRadius: 30.0,
                sectionsSpace: 0.0,
                startDegreeOffset: 30,
                // actual curves and data come from this function result.
                sections: _buildPieChartCurves(),
                // This is to make chart interactive when someone touch
                pieTouchData: PieTouchData(
                  touchCallback: (pieTouchResponse) {
                    setState(() {
                      if (pieTouchResponse.touchInput is FlLongPressEnd ||
                          pieTouchResponse.touchInput is FlPanEnd) {
                        _touchedIndex = -1;
                      } else {
                        _touchedIndex = pieTouchResponse.touchedSectionIndex;
                      }
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Row(children: [
                      Flexible(
                        child: Text(progressProvider.progressUpdate(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Here we will show different type of graph on different scenario touch and non touch
  List<PieChartSectionData> _buildPieChartCurves() {
    return List.generate(3, (i) {
      final isTouched = i == _touchedIndex;
      // Increase the radius of section when touched.
      final double radius = isTouched ? 60 : 50;

      // Ideally this data come from API and then returned, or you can modify it any way as per the data arranged in your app :)
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.grey[400],
            value: (((goal - progress) / goal) * 100),
            title: (goal - progress).toString(), // this cannot be left blank
            radius: radius,
          );
        case 1:
          if (progress == 0) {
            return PieChartSectionData(
              color: Colors.grey[400],
              value: 0,
              title: '', // this cannot be left blank
              radius: radius,
            );
          } else {
            return PieChartSectionData(
              color: Colors.pink[300],
              value: ((progress / goal) * 100),
              title: progress.toString(), // this cannot be left blank
              radius: radius,
            );
          }
          return null;
        case 2:
          return PieChartSectionData(
            color: Color(0xff39439f),
            value: 0,
            title: '', // this cannot be left blank
            radius: radius,
          );
        default:
          return null;
      }
    });
  }
}
