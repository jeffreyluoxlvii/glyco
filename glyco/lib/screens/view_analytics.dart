import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../widgets/viewAnalytics/glucose_pie.dart';
import '../widgets/viewAnalytics/exercise_bars.dart';
import '../widgets/viewAnalytics/glucose_line.dart';

class ViewAnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        // appBar: ChallengesAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              GlucosePie(),
              SizedBox(height: 15),
              ExerciseBarChart(),
              SizedBox(height: 15),
              GlucoseLineChart(),
            ],
          ),
        ),
      ),
    );
  }
}
