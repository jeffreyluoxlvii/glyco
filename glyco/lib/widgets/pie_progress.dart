import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../providers/measurements.dart';
import 'package:provider/provider.dart';

// Returns a pie chart that shows the user's progress towards the current challenge
class PieProgressContainer extends StatefulWidget {
  @override
  _PieProgressState createState() => _PieProgressState();
}

class _PieProgressState extends State<PieProgressContainer> {
  int _touchedIndex;
  int progress = 860;
  int goal = 3000;

  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<Measurements>(context);

  // Sets current progress and goal
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
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(show: false),
                centerSpaceRadius: 30.0,
                sectionsSpace: 0.0,
                startDegreeOffset: 30,
                // Actual curves and data come from this function result
                sections: _buildPieChartCurves(),
                // This is to make chart interactive when someone touches it
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
                      Flexible( // Displays text that tells percentage of progress towards goal in remaining space
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

  List<PieChartSectionData> _buildPieChartCurves() {
    return List.generate(3, (i) {
      final isTouched = i == _touchedIndex;
      // Increase the radius of section when touched.
      final double radius = isTouched ? 60 : 50;

      // Sets each section of the pie chart with the data
      switch (i) {
        // What section of the goal has not yet been reached in grey
        case 0:
          return PieChartSectionData(
            color: Colors.grey[400],
            value: (((goal - progress) / goal) * 100),
            title: (goal - progress).toString(), // This cannot be left blank
            radius: radius,
          );
        // How much progress has been made in pink 
        case 1:
          // If there is no progress, display no text so a '0' doesn't display
          if (progress == 0) {
            return PieChartSectionData(
              color: Colors.grey[400],
              value: 0,
              title: '', // This cannot be left blank
              radius: radius,
            );
          } else {
            return PieChartSectionData(
              color: Colors.pink[300],
              value: ((progress / goal) * 100),
              title: progress.toString(), // This cannot be left blank
              radius: radius,
            );
          }
          return null;
        // Setting the third section of the pie chart as 0 so there are only 2 sections
        case 2:
          return PieChartSectionData(
            color: Color(0xff39439f),
            value: 0,
            title: '', // This cannot be left blank
            radius: radius,
          );
        default:
          return null;
      }
    });
  }
}
