import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import './measurement.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Measurements with ChangeNotifier {
  String providerChallengeGiven = 'null';
  int providerChallengeGoal = -1;

  double avgMonthSteps;
  double avgWeekSteps;
  double avgMonthActivity;
  double avgWeekActivity;
  double avgMonthCarbs;
  double avgWeekCarbs;
  int stepsProgress;
  int activityProgress;
  int carbProgress;

  bool testing = false;

  Measurements(
      {this.avgMonthSteps,
      this.avgWeekSteps,
      this.avgMonthActivity,
      this.avgWeekActivity,
      this.avgMonthCarbs,
      this.avgWeekCarbs,
      this.providerChallengeGoal,
      this.providerChallengeGiven,
      this.stepsProgress,
      this.activityProgress,
      this.carbProgress,
      this.testing});

  List<Measurement> _measurements = [];

  final String authToken;
  final String userId;

  Measurements(this.authToken, this.userId, this._measurements);

  List<Measurement> get measurements {
    return [..._measurements];
  }

  Measurement get latestMeasurement {
    return _measurements.last;
  }

  Measurement findByDate(DateTime date) {
    return _measurements.firstWhere(
      (measurement) =>
          measurement.date.year == date.year &&
          measurement.date.month == date.month &&
          measurement.date.day == date.day,
      orElse: () {
        // TODO: handle this
        print('no element');
        Measurement newMeasurement = Measurement(
          id: DateTime.now().toIso8601String(),
          a1cLevel: 0,
          avgGlucoseLevel: 0,
          calories: 0,
          carbs: 0,
          currGlucoseLevel: 0,
          exerciseTime: 0,
          date: date,
          steps: 0,
          lastUpdate: date,
          userId: userId,
        );
        addMeasurement(newMeasurement).then((value) => print("added"));
      },
    );
  }

  // Measurement findByDateAverages(DateTime date) {
  //   return _measurements.firstWhere(
  //       (measurement) =>
  //           measurement.date.year == date.year &&
  //           measurement.date.month == date.month &&
  //           measurement.date.day == date.day, 
  //   orElse: () {
  //     return null;
  //   });
  // }

  Future<void> fetchAndSetMeasurements() async {
    final url =
        'https://glyco-6f403.firebaseio.com/userMeasurements/$userId/measurements.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Measurement> loadedMeasurements = [];
      extractedData.forEach((measurementId, measurementData) {
        loadedMeasurements.add(
          Measurement(
            id: measurementId,
            a1cLevel: measurementData['a1cLevel'],
            avgGlucoseLevel: measurementData['avgGlucoseLevel'],
            calories: measurementData['calories'],
            carbs: measurementData['carbs'],
            currGlucoseLevel: measurementData['currGlucoseLevel'],
            exerciseTime: measurementData['exerciseTime'],
            date: DateTime.parse(measurementData['date']),
            steps: measurementData['steps'],
            lastUpdate: DateTime.parse(measurementData['lastUpdate']),
            userId: userId,
          ),
        );
      });
      _measurements = loadedMeasurements;
      print(_measurements);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addMeasurement(Measurement measurement) async {
    final url =
        'https://glyco-6f403.firebaseio.com/userMeasurements/$userId/measurements.json?auth=$authToken';
    try {
      final response = await http.post(url,
          body: json.encode({
            'a1cLevel': measurement.a1cLevel,
            'avgGlucoseLevel': measurement.avgGlucoseLevel,
            'calories': measurement.calories,
            'carbs': measurement.carbs,
            'currGlucoseLevel': measurement.currGlucoseLevel,
            'exerciseTime': measurement.exerciseTime,
            'date': measurement.date.toIso8601String(),
            'steps': measurement.steps,
            'lastUpdate': measurement.lastUpdate.toIso8601String(),
          }));
      final newMeasurement = Measurement(
        id: json.decode(response.body)['name'],
        a1cLevel: measurement.a1cLevel,
        avgGlucoseLevel: measurement.avgGlucoseLevel,
        calories: measurement.calories,
        carbs: measurement.carbs,
        currGlucoseLevel: measurement.currGlucoseLevel,
        exerciseTime: measurement.exerciseTime,
        date: measurement.date,
        steps: measurement.steps,
        lastUpdate: measurement.lastUpdate,
        userId: userId,
      );
      _measurements.add(newMeasurement);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  // FOR CHALLENGES AND PROGRESS

  int roundToMultiple(double number, int multiple) {
    if (number == 0) {
      return multiple;
    }

    int result = multiple;

    if (number % multiple == 0) {
      return number.round();
    } else {
      int division = ((number / multiple) + 1).round();
      result = division * multiple;
    }
    return result;
  }

  // STEPS AVERAGES

  double monthSteps() {
    if (testing == true) {
      return avgMonthSteps;
    }

    int totalSteps = 0;
    int numDays = 0;

    for (int i = 7; i < 31; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      // if (findByDateAverages(day) != null) {
        if (findByDate(day).steps != 0) {
          totalSteps += findByDate(day).steps;
          numDays++;
        }
      // }
    }

    avgMonthSteps = (totalSteps / numDays);
    return avgMonthSteps;

    // return 9780;
  }

  double weekSteps() {
    if (testing == true) {
      return avgWeekSteps;
    }

    int totalSteps = 0;
    int numDays = 0;

    for (int i = 1; i < 7; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      // if (findByDateAverages(day) != null) {
        if (findByDate(day).steps != 0) {
          totalSteps += findByDate(day).steps;
          numDays++;
        }
      // }
    }

    avgWeekSteps = (totalSteps / numDays);
    return avgWeekSteps;

    // return 2590;
  }

  // ACTIVITY AVERAGES
  double monthActivity() {
    if (testing == true) {
      return avgMonthActivity;
    }

    int totalActivity = 0;
    int numDays = 0;

    for (int i = 7; i < 31; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      // if (findByDateAverages(day) != null) {
        if (findByDate(day).exerciseTime != 0) {
          totalActivity += findByDate(day).exerciseTime;
          numDays++;
        }
      // }
    }

    avgMonthActivity = (totalActivity / numDays);
    return avgMonthActivity;

    // return 30;
  }

  double weekActivity() {
    if (testing == true) {
      return avgWeekActivity;
    }

    int totalActivity = 0;
    int numDays = 0;

    for (int i = 1; i < 7; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      // if (findByDateAverages(day) != null) {
        if (findByDate(day).exerciseTime != 0) {
          totalActivity += findByDate(day).exerciseTime;
          numDays++;
        }
      // }
    }

    avgWeekActivity = (totalActivity / numDays);
    return avgWeekActivity;

    // return 28;
  }

  // CARBS AVERAGES
  double monthCarbs() {
    if (testing == true) {
      return avgMonthCarbs;
    }

    int totalCarbs = 0;
    int numDays = 0;

    for (int i = 7; i < 31; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      // if (findByDateAverages(day) != null) {
        if (findByDate(day).carbs != 0) {
          totalCarbs += findByDate(day).carbs;
          numDays++;
        }
      // }
    }

    avgMonthCarbs = (totalCarbs / numDays);
    return avgMonthCarbs;

    // return 10;
  }

  double weekCarbs() {
    if (testing == true) {
      return avgWeekCarbs;
    }

    int totalCarbs = 0;
    int numDays = 0;

    for (int i = 1; i < 7; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      // if (findByDateAverages(day) != null) {
        if (findByDate(day).carbs != 0) {
          totalCarbs += findByDate(day).carbs;
          numDays++;
        }
      // }
    }

    avgWeekCarbs = (totalCarbs / numDays);
    return avgWeekCarbs;

    // return 60;
  }

  String generateChallenge() {
    double stepsReduction = 0;
    int stepsReductionPercent = 0;
    double activityReduction = 0;
    int activityReductionPercent = 0;
    double carbDifference = 0;

    avgMonthSteps = monthSteps();
    avgWeekSteps = weekSteps();
    avgMonthActivity = monthActivity();
    avgWeekActivity = weekActivity();
    avgMonthCarbs = monthCarbs();
    avgWeekCarbs = weekCarbs();

    if (avgMonthSteps != 0) {
      stepsReduction = 1 - (avgWeekSteps / avgMonthSteps);
      stepsReductionPercent = (stepsReduction * 100).round();
    }
    if (avgMonthActivity != 0) {
      activityReduction = 1 - (avgWeekActivity / avgMonthActivity);
      activityReductionPercent = (activityReduction * 100).round();
    }
    if (avgMonthCarbs != 0) {
      carbDifference = (avgWeekCarbs / avgMonthCarbs);
    }

    // STEPS

    // If their weekly average has increased compared to the rest of the month
    if (avgWeekSteps > avgMonthSteps) {
      int stepsGoal = roundToMultiple(avgWeekSteps, 100);
      providerChallengeGiven = 'steps';
      providerChallengeGoal = stepsGoal;

      if (avgMonthSteps == 0) {
        return 'Your steps this week have been much higher than the rest of the month. Keep up the good work!';
      }

      int stepsIncreasePercent =
          (((avgWeekSteps / avgMonthSteps) - 1) * 100).round();
      return 'Your steps this week have been ' +
          stepsIncreasePercent.toString() +
          '% higher than the rest of the month. Keep up the good work!';
    }
    // If their weekly average has decreased more than 85%, generate a challenge that is 25% higher than their weekly average
    if (stepsReduction >= 0.15) {
      int stepsGoal = roundToMultiple((avgWeekSteps * 1.25), 100);
      providerChallengeGiven = 'steps';
      providerChallengeGoal = stepsGoal;

      return 'Your steps for the last week have been ' +
          stepsReductionPercent.toString() +
          "% lower than the rest of the month. Try to get " +
          stepsGoal.toString() +
          " steps this week!";
    }
    // If their weekly average is less than the recommended daily amount of steps
    if (avgWeekSteps < 3000) {
      providerChallengeGiven = 'steps';
      providerChallengeGoal = 3000;
      return 'Your steps are below the recommended daily steps. Try to get to 3,000 steps this week! ';
    }
    // If their weekly average is greater than the recommended daily amount of steps
    if (avgWeekSteps >= 10000) {
      providerChallengeGiven = 'steps';
      providerChallengeGoal = roundToMultiple(avgWeekSteps, 100);
      return 'Congratulations! You have hit the daily recommended step intake of 10000 steps. Keep up the good work!';
    }

    // ACTIVITY
    if (avgWeekActivity > avgMonthActivity) {
      int activityGoal = roundToMultiple(avgWeekActivity, 10);
      providerChallengeGiven = 'activity';
      providerChallengeGoal = activityGoal;

      if (avgMonthActivity == 0) {
        return 'Your activity time this week has been higher than the rest of the month. Keep up the good work!';
      }

      int activityIncreasePercent =
          (((avgWeekActivity / avgMonthActivity) - 1) * 100).round();
      return 'Your activity time this week has been ' +
          activityIncreasePercent.toString() +
          '% higher than the rest of the month. Keep up the good work!';
    }
    if (activityReduction >= 0.15) {
      int activityGoal = roundToMultiple((avgWeekActivity * 1.25), 10);
      providerChallengeGiven = 'activity';
      providerChallengeGoal = activityGoal;

      return 'Your activity time for the last week has been ' +
          activityReductionPercent.toString() +
          "% lower than the rest of the month. Try to get " +
          activityGoal.toString() +
          " minutes a day this week!";
    }
    if (avgWeekActivity < 30) {
      providerChallengeGiven = 'activity';
      providerChallengeGoal = 30;
      return 'Your activity time is below the recommended daily activity. Try to get to 30 minutes a day this week! ';
    }
    if (avgWeekActivity >= 60) {
      providerChallengeGiven = 'activity';
      providerChallengeGoal = roundToMultiple(avgWeekActivity, 10);
      return 'Congratulations! You have hit the daily recommended activity level of 60 minutes. Keep up the good work!';
    }

    // CARBS
    if (avgWeekCarbs < avgMonthCarbs) {
      int carbGoal = roundToMultiple(avgWeekCarbs, 10);
      providerChallengeGiven = 'carbs';
      providerChallengeGoal = carbGoal;

      int carbDecreasePercent =
          ((1 - (avgWeekCarbs / avgMonthCarbs)) * 100).round();
      return 'Your carb intake this week has been ' +
          carbDecreasePercent.toString() +
          '% lower than the rest of the month. Keep up the good work!';
    }
    if (carbDifference > 1) {
      double carbIncrease = carbDifference - 1;
      int carbIncreasePercent = ((carbDifference - 1) * 100).round();

      if (carbIncrease >= 0.15) {
        int carbDecreaseGoal = (avgWeekCarbs * 0.85).round();
        providerChallengeGiven = 'carbs';
        providerChallengeGoal = carbDecreaseGoal;
        return 'Your carb intake for the last week has been ' +
            carbIncreasePercent.toString() +
            "% higher than the rest of the month. Try to get " +
            carbDecreaseGoal.toString() +
            " grams of carbs this week!";
      }
    }
    if (avgWeekCarbs > 75) {
      providerChallengeGiven = 'carbs';
      providerChallengeGoal = 75;
      return 'Your carb intake is above the recommended daily carb intake. Try to get down to 75g of carbs this week! ';
    }
    if (avgWeekCarbs <= 45) {
      providerChallengeGiven = 'carbs';
      providerChallengeGoal = roundToMultiple(avgWeekCarbs, 10);
      return 'Congratulations! You are around the daily recommended carb intake of 45g of carbs. Keep up the good work!';
    }
    if (avgMonthCarbs == 0 && avgWeekCarbs > 0) {
      providerChallengeGiven = 'carbs';
      int carbDecreaseGoal = (avgWeekCarbs * 0.85).round();
      providerChallengeGoal = carbDecreaseGoal;

      return 'Your carb intake for the last week has been higher than the rest of the month. Try to get ' +
          carbDecreaseGoal.toString() +
          " grams of carbs this week!";
    }

    providerChallengeGiven = 'none';
    return 'There are currently no challenges. Come back later!';
  }

  String getChallenge() {
    return providerChallengeGiven;
  }

  int getChallengeGoal() {
    return providerChallengeGoal;
  }

  Image getProgressAsset() {
    if (providerChallengeGiven == 'steps') {
      return Image.asset('assets/images/challenges_image1.jpg');
    }
    if (providerChallengeGiven == 'activity') {
      return Image.asset('assets/images/challenges_image2.jpg');
    }
    if (providerChallengeGiven == 'carbs') {
      return Image.asset('assets/images/challenges_image3.jpg');
    }
    return Image.asset('assets/images/challenges_image1.jpg');
  }

  IconData getProgressIcon() {
    if (providerChallengeGiven == 'steps') {
      return FontAwesomeIcons.shoePrints;
    }
    if (providerChallengeGiven == 'activity') {
      return FontAwesomeIcons.running;
    }
    if (providerChallengeGiven == 'carbs') {
      return FontAwesomeIcons.hamburger;
    }
    return FontAwesomeIcons.spinner;
  }

  String progressUpdate() {
    Measurement measurement = findByDate(DateTime.now());

    if (providerChallengeGiven == 'steps') {
      stepsProgress = measurement.steps;
      int stepsProgressPercent =
          ((stepsProgress / providerChallengeGoal) * 100).round();
      return 'You have completed ' +
          stepsProgressPercent.toString() +
          '% of your goal, with ' +
          stepsProgress.toString() +
          ' out of ' +
          providerChallengeGoal.toString() +
          ' steps.';
    }
    if (providerChallengeGiven == 'activity') {
      activityProgress = measurement.exerciseTime;
      int activityProgressPercent =
          ((activityProgress / providerChallengeGoal) * 100).round();
      return 'You have completed ' +
          activityProgressPercent.toString() +
          '% of your goal, with ' +
          activityProgress.toString() +
          ' out of ' +
          providerChallengeGoal.toString() +
          ' minutes.';
    }
    if (providerChallengeGiven == 'carbs') {
      carbProgress = measurement.carbs;
      int carbProgressPercent =
          ((carbProgress / providerChallengeGoal) * 100).round();
      return 'You have completed ' +
          carbProgressPercent.toString() +
          '% of your goal, with ' +
          carbProgress.toString() +
          ' out of ' +
          providerChallengeGoal.toString() +
          ' grams of carbs.';
    }

    return 'You currently have no progress because you have no challenges.';
  }

  // FOR TESTING
  void setTestingMeasurements(List<Measurement> measurements) {
    _measurements = measurements;
  }

  void setTestingTrue() {
    testing = true;
  }

  void setTestingFalse() {
    testing = false;
  }
}
