import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import './measurement.dart';

class Challenges with ChangeNotifier {
  String _providerChallengeGiven = 'null';
  int _providerChallengeGoal = -1;

  List<Measurement> _measurements = [];

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
        );
        addMeasurement(newMeasurement).then((value) => print("added"));
      },
    );
  }

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
    int totalSteps = 0;
    int numDays = 0;

    for (int i = 7; i < 31; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      totalSteps += findByDate(day).steps;
      numDays++;
    }

    double avgSteps = (totalSteps / numDays);
    return avgSteps;

    // return 9780;
  }

  double weekSteps() {
    int totalSteps = 0;
    int numDays = 0;

    for (int i = 1; i < 7; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      totalSteps += findByDate(day).steps;
      numDays++;
    }

    double avgSteps = (totalSteps / numDays);
    return avgSteps;

    // return 2590;
  }

  // ACTIVITY AVERAGES
  double monthActivity() {
    int totalActivity = 0;
    int numDays = 0;

    for (int i = 7; i < 31; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      totalActivity += findByDate(day).exerciseTime;
      numDays++;
    }

    double avgActivity = (totalActivity / numDays);
    return avgActivity;

    // return 30;
  }

  double weekActivity() {
    int totalActivity = 0;
    int numDays = 0;

    for (int i = 1; i < 7; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      totalActivity += findByDate(day).exerciseTime;
      numDays++;
    }

    double avgActivity = (totalActivity / numDays);
    return avgActivity;

    // return 28;
  }

  // CARBS AVERAGES
  double monthCarbs() {
    int totalCarbs = 0;
    int numDays = 0;

    for (int i = 7; i < 31; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      totalCarbs += findByDate(day).carbs;
      numDays++;
    }

    double avgCarbs = (totalCarbs / numDays);
    return avgCarbs;

    // return 10;
  }

  double weekCarbs() {
    int totalCarbs = 0;
    int numDays = 0;

    for (int i = 1; i < 7; i++) {
      DateTime day = DateTime.now().subtract(Duration(days: i));

      totalCarbs += findByDate(day).carbs;
      numDays++;
    }

    double avgCarbs = (totalCarbs / numDays);
    return avgCarbs;

    // return 60;
  }

  String generateChallenge(Measurement measurement) {
    double stepsReduction = 0;
    int stepsReductionPercent = 0;
    double activityReduction = 0;
    int activityReductionPercent = 0;
    double carbDifference = 0;

    if (monthSteps() != 0) {
      stepsReduction = 1 - (weekSteps() / monthSteps());
      stepsReductionPercent = (stepsReduction * 100).round();
    }
    if (monthActivity() != 0) {
      activityReduction = 1 - (weekActivity() / monthActivity());
      activityReductionPercent = (activityReduction * 100).round();
    }
    if (monthCarbs() != 0) {
      carbDifference = (weekCarbs() / monthCarbs());
    }

    // STEPS

    // If their weekly average has increased compared to the rest of the month
    if (weekSteps() > monthSteps()) {
      int stepsGoal = roundToMultiple(weekSteps(), 100);
      _providerChallengeGiven = 'steps';
      _providerChallengeGoal = stepsGoal;

      if (monthSteps() == 0) {
        return 'Your steps this week have been much higher than the rest of the month. Keep up the good work!';
      }

      int stepsIncreasePercent =
          (((weekSteps() / monthSteps()) - 1) * 100).round();
      return 'Your steps this week have been ' +
          stepsIncreasePercent.toString() +
          '% higher than the rest of the month. Keep up the good work!';
    }
    // If their weekly average has decreased more than 85%, generate a challenge that is 25% higher than their weekly average
    if (stepsReduction >= 0.15) {
      int stepsGoal = roundToMultiple((weekSteps() * 1.25), 100);
      _providerChallengeGiven = 'steps';
      _providerChallengeGoal = stepsGoal;

      return 'Your steps for the last week have been ' +
          stepsReductionPercent.toString() +
          "% lower than the rest of the month. Try to get " +
          stepsGoal.toString() +
          " steps this week!";
    }
    // If their weekly average is less than the recommended daily amount of steps
    if (weekSteps() < 4000) {
      _providerChallengeGiven = 'steps';
      _providerChallengeGoal = 4000;
      return 'Your steps are below the recommended daily steps. Try to get to 4,000 steps this week! ';
    }
    // If their weekly average is greater than the recommended daily amount of steps
    if (weekSteps() >= 10000) {
      _providerChallengeGiven = 'steps';
      _providerChallengeGoal = roundToMultiple(weekSteps(), 100);
      return 'Congratulations! You have hit the daily recommended step intake of 10000 steps. Keep up the good work!';
    }

    // ACTIVITY
    if (weekActivity() > monthActivity()) {
      int activityGoal = roundToMultiple(weekActivity(), 10);
      _providerChallengeGiven = 'activity';
      _providerChallengeGoal = activityGoal;

      if (monthActivity() == 0) {
        return 'Your activity time this week has been higher than the rest of the month. Keep up the good work!';
      }

      int activityIncreasePercent =
          (((weekActivity() / monthActivity()) - 1) * 100).round();
      return 'Your activity time this week has been ' +
          activityIncreasePercent.toString() +
          '% higher than the rest of the month. Keep up the good work!';
    }
    if (activityReduction >= 0.15) {
      int activityGoal = roundToMultiple((weekActivity() * 1.25), 10);
      _providerChallengeGiven = 'activity';
      _providerChallengeGoal = activityGoal;

      return 'Your activity time for the last week has been ' +
          activityReductionPercent.toString() +
          "% lower than the rest of the month. Try to get " +
          activityGoal.toString() +
          " minutes a day this week!";
    }
    if (weekActivity() < 20) {
      _providerChallengeGiven = 'activity';
      _providerChallengeGoal = 30;
      return 'Your activity time is below the recommended daily activity. Try to get to 30 minutes a day this week! ';
    }
    if (weekActivity() >= 30) {
      _providerChallengeGiven = 'activity';
      _providerChallengeGoal = roundToMultiple(weekActivity(), 10);
      return 'Congratulations! You have hit the daily recommended activity level of 30 minutes. Keep up the good work!';
    }

    // CARBS
    if (weekCarbs() < monthCarbs()) {
      int carbGoal = roundToMultiple(weekCarbs(), 10);
      _providerChallengeGiven = 'carbs';
      _providerChallengeGoal = carbGoal;

      int carbDecreasePercent =
          ((1 - (weekCarbs() / monthCarbs())) * 100).round();
      return 'Your carb intake this week has been ' +
          carbDecreasePercent.toString() +
          '% lower than the rest of the month. Keep up the good work!';
    }
    if (carbDifference > 1) {
      double carbIncrease = carbDifference - 1;
      int carbIncreasePercent = ((carbDifference - 1) * 100).round();

      if (carbIncrease >= 0.15) {
        int carbDecreaseGoal = (weekCarbs() * 0.85).round();
        _providerChallengeGiven = 'carbs';
        _providerChallengeGoal = carbDecreaseGoal;
        return 'Your carb intake for the last week has been ' +
            carbIncreasePercent.toString() +
            "% higher than the rest of the month. Try to get " +
            carbDecreaseGoal.toString() +
            " grams of carbs this week!";
      }
    }
    if (weekCarbs() > 100) {
      _providerChallengeGiven = 'carbs';
      _providerChallengeGoal = 100;
      return 'Your carb intake is above the recommended daily carb intake. Try to get down to 100g of carbs this week! ';
    }
    if (weekCarbs() <= 40) {
      _providerChallengeGiven = 'carbs';
      _providerChallengeGoal = roundToMultiple(weekCarbs(), 10);
      return 'Congratulations! You are around the daily recommended carb intake of 40g of carbs. Keep up the good work!';
    }
    if (monthCarbs() == 0 && weekCarbs() > 0) {
      _providerChallengeGiven = 'carbs';
      int carbDecreaseGoal = (weekCarbs() * 0.85).round();
      _providerChallengeGoal = carbDecreaseGoal;

      return 'Your carb intake for the last week has been higher than the rest of the month. Try to get ' +
          carbDecreaseGoal.toString() +
          " grams of carbs this week!";
    }

    _providerChallengeGiven = 'none';
    return 'There are currently no challenges. Come back later!';
  }

  String getChallenge() {
    return _providerChallengeGiven;
  }

  int getChallengeGoal() {
    return _providerChallengeGoal;
  }

  String progressUpdate(
      Measurement measurement, String challengeGiven, int challengeGoal) {
    if (challengeGiven == 'steps') {
      int stepsProgress = measurement.steps;
      int stepsProgressPercent =
          ((stepsProgress / challengeGoal) * 100).round();
      return 'You have completed ' +
          stepsProgressPercent.toString() +
          '% of your goal, with ' +
          stepsProgress.toString() +
          ' out of ' +
          challengeGoal.toString() +
          ' steps.';
    }
    if (challengeGiven == 'activity') {
      int activityProgress = measurement.exerciseTime;
      int activityProgressPercent =
          ((activityProgress / challengeGoal) * 100).round();
      return 'You have completed ' +
          activityProgressPercent.toString() +
          '% of your goal, with ' +
          activityProgress.toString() +
          ' out of ' +
          challengeGoal.toString() +
          ' minutes.';
    }
    if (challengeGiven == 'carbs') {
      int carbProgress = measurement.carbs;
      int carbProgressPercent = ((carbProgress / challengeGoal) * 100).round();
      return 'You have completed ' +
          carbProgressPercent.toString() +
          '% of your goal, with ' +
          carbProgress.toString() +
          ' out of ' +
          challengeGoal.toString() +
          ' grams of carbs.';
    }

    return 'You currently have no progress because you have no challenges.';
  }

  Future<void> fetchAndSetMeasurements() async {
    const url = 'https://glyco-6f403.firebaseio.com/measurements.json';
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
          ),
        );
      });
      _measurements = loadedMeasurements;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addMeasurement(Measurement measurement) async {
    const url = 'https://glyco-6f403.firebaseio.com/measurements.json';
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
      );
      _measurements.add(newMeasurement);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
