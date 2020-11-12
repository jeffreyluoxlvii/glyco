import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../widgets/appBars/analytics_app_bar.dart';
import '../widgets/viewAnalytics/glucose_pie.dart';
import '../widgets/viewAnalytics/exercise_bars.dart';
import '../widgets/viewAnalytics/glucose_line.dart';
import '../widgets/viewAnalytics/carb_pie.dart';

// @author Herleen Kaur

class ViewAnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nameList =
        Provider.of<Auth>(context, listen: false).userName.split(" ");
    var firstName = nameList[0];
    return Scaffold(
      body: Scaffold(
        appBar: AnalyticsAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                child: Text(
                  firstName + ", here is your health data overview!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
            
            // Displays a pie chart showing the breakdown of the user's glucose levels over the last 30 days
            // Green section shows what average glucose levels from each day fall into the recommended range
            // Yellow section shows what average glucose levels from each day fall below the recommended range
            // Red section shows what average glucose levels from each day rise above the recommended range
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                child: Text(
                  'Glucose Levels (mg/dL)',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GlucosePie(),
              SizedBox(height: 15),


            // Displays a bar chart showing the user's glucose levels for the last 30 days
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                child: Text(
                  'Glucose Levels (mg/dL)',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GlucoseLineChart(),
              SizedBox(height: 15),
            
            // Displays a bar chart showing the user's activity levels for the last 30 days
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                child: Text(
                  'Activity Levels (min)',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ExerciseBarChart(),
              SizedBox(height: 15),

            // Displays a pie chart showing the breakdown of the user's carb levels over the last 30 days
            // Green section shows what average carb levels from each day fall into the recommended range
            // Yellow section shows what average carb levels from each day fall below the recommended range
            // Red section shows what average carb levels from each day rise above the recommended range
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                child: Text(
                  'Carb levels (g)',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              CarbPie(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
