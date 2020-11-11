import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glyco/widgets/pie_progress.dart';
import '../providers/measurements.dart';
import 'package:provider/provider.dart';
import '../widgets/glucose_progress.dart';
import "../widgets/linechart_progress.dart";

class ProgressContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<Measurements>(context);

    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        // Bar chart that displays the glucose levels for the last 7 days
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: GlucoseProgressContainer(),
          ),
        // Same as the bar chart but in the form of a line chart
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 0),
          //   child: LineChartProgressContainer(),
          // ),

          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 0),
            child: Icon(
              progressProvider.getProgressIcon(), // Icon changes based on what type of progress is showing
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),

        // Shows progress towards goal in the form of a pie chart
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: PieProgressContainer(),
          ),
        ],
      ),
    );
  }
}
