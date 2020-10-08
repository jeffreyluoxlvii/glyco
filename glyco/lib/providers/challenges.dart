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
      orElse: () => latestMeasurement,
    );
  }

  int roundToMultiple(double number, int multiple) {
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
  int monthSteps() {
    // int totalSteps = 0;
    // int numDays = 0;

    // for (int i = 7; i < 31; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (findByDate(day).steps != null) {
    //     totalSteps += findByDate(day).steps;
    //     numDays++;
    //   }
    // }

    // int avgSteps = (totalSteps / numDays).round();
    // return avgSteps;

    return 11487;
  }

  int weekSteps() {
    // int totalSteps = 0;
    // int numDays = 0;

    // for (int i = 1; i < 7; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (findByDate(day).steps != null) {
    //     totalSteps += findByDate(day).steps;
    //     numDays++;
    //   }
    // }

    // int avgSteps = (totalSteps / numDays).round();
    // return avgSteps;

    return 8587;
  }

  // ACTIVITY AVERAGES
  int monthActivity() {
    // int totalActivity = 0;
    // int numDays = 0;

    // for (int i = 7; i < 31; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (findByDate(day).exerciseTime != null) {
    //     totalActivity += findByDate(day).exerciseTime;
    //     numDays++;
    //   }
    // }

    // int avgActivity = (totalActivity / numDays).round();
    // return avgActivity;

    return 46;
  }

  int weekActivity() {
    // int totalActivity = 0;
    // int numDays = 0;

    // for (int i = 1; i < 7; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (findByDate(day).exerciseTime != null) {
    //     totalActivity += findByDate(day).exerciseTime;
    //     numDays++;
    //   }
    // }

    // int avgActivity = (totalActivity / numDays).round();
    // return avgActivity;

    return 22;
  }

  // CARBS AVERAGES
  int monthCarbs() {
    // int totalCarbs = 0;
    // int numDays = 0;

    // for (int i = 7; i < 31; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (findByDate(day).carbs != null) {
    //     totalCarbs += findByDate(day).carbs;
    //     numDays++;
    //   }
    // }

    // int avgCarbs = (totalCarbs / numDays).round();
    // return avgCarbs;

    return 44;
  }

  int weekCarbs() {
    // int totalCarbs = 0;
    // int numDays = 0;

    // for (int i = 1; i < 7; i++) {
    //   DateTime day = DateTime.now().subtract(Duration(days: i));

    //   if (findByDate(day).carbs != null) {
    //     totalCarbs += findByDate(day).carbs;
    //     numDays++;
    //   }
    // }

    // int avgCarbs = (totalCarbs / numDays).round();
    // return avgCarbs;

    return 78;
  }

  String generateChallenge(Measurement measurement) {
    double stepsReduction = 1 - (weekSteps() / monthSteps());
    int stepsReductionPercent = (stepsReduction * 100).round();

    double activityReduction = 1 - (weekActivity() / monthActivity());
    int activityReductionPercent = (activityReduction * 100).round();

    double carbDifference = (weekCarbs() / monthCarbs());

    // STEPS
    if (weekSteps() < 4000) {
      _providerChallengeGiven = 'steps';
      _providerChallengeGoal = 4000;
      return 'Your steps are below the recommended daily steps. Try to get to 4,000 steps this week! ';
    }
    if (weekSteps() >= 10000) {
      _providerChallengeGiven = 'steps';
      _providerChallengeGoal = 10000;
      return 'Congratulations! You have hit the daily recommended step intake of 10000 steps. Keep up the good work!';
    }
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

    // ACTIVITY
    if (weekActivity() < 20) {
      _providerChallengeGiven = 'activity';
      _providerChallengeGoal = 30;
      return 'Your activity time is below the recommended daily activity. Try to get to 30 minutes a day this week! ';
    }
    if (weekActivity() >= 30) {
      _providerChallengeGiven = 'activity';
      _providerChallengeGoal = 30;
      return 'Congratulations! You have hit the daily recommended activity level of 30 minutes. Keep up the good work!';
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

    // CARBS
    if (weekCarbs() > 100) {
      _providerChallengeGiven = 'carbs';
      _providerChallengeGoal = 100;
      return 'Your carb intake is above the recommended daily carb intake. Try to get down to 100g of carbs this week! ';
    }
    if (weekCarbs() <= 40) {
      _providerChallengeGiven = 'carbs';
      _providerChallengeGoal = 40;
      return 'Congratulations! You are around the daily recommended carb intake of 40g of carbs. Keep up the good work!';
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
}
