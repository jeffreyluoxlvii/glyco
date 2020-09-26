// A1c = (2.59 + average_blood_glucose) / 1.59
// this class needs to fetch from healthkit and post to the database after fetching
// each measurmeent will be for one day

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:health/health.dart';

// TODO: Use the provider from setting to grab the shortcut settings

class Measurement with ChangeNotifier {
  List<HealthDataType> _types = [
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.STEPS,
  ];
  List<HealthDataPoint> healthData;
  final int id;
  final DateTime timestamp;
  double avgGlucoseLevel; // average level of the day
  double currGlucoseLevel; // current level at the time of reading
  int steps;
  int exerciseTime;
  int calories;
  int carbs;
  double a1cLevel;

  Measurement({
    @required this.id,
    @required this.timestamp,
    @required this.avgGlucoseLevel,
    @required this.currGlucoseLevel,
    @required this.steps,
    @required this.exerciseTime,
    @required this.calories,
    @required this.carbs,
    @required this.a1cLevel,
  });

  void _addCalories(int calories) {
    this.calories += calories;
    notifyListeners();
  }

  void _addCarbs(int carbs) {
    this.carbs += carbs;
    notifyListeners();
  }

  // TODO: make these Future (so that they can interact with database)
  void addNutrition(int calories, int carbs) {
    _addCalories(calories);
    _addCarbs(carbs);
    notifyListeners();
  }

  void addExercise(int minutes) {
    exerciseTime += minutes;
    notifyListeners();
  }

  Future<void> fetchHealthData() async {
    print("fetching data");
    List<HealthDataPoint> _healthDataList = [];
    HealthFactory health = HealthFactory();
    DateTime endDate = DateTime.now();
    DateTime startDate = DateTime(2020, 01, 01);
    healthData =
        await health.getHealthDataFromTypes(startDate, endDate, _types);
    _healthDataList.addAll(healthData);
    _healthDataList = HealthFactory.removeDuplicates(_healthDataList);
    _healthDataList.forEach((x) => print("Data point: $x"));
  }
}
