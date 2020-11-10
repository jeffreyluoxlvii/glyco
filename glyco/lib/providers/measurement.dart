import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'healthkit.dart';

// Provider class to handle singular Measurement objects.

// @author Jeffrey Luo

class Measurement with ChangeNotifier {
  String id;
  final DateTime date;
  DateTime lastUpdate;
  double avgGlucoseLevel; // average level of the day
  double currGlucoseLevel; // current level at the time of reading
  int steps;
  int exerciseTime;
  int calories;
  int carbs;
  double a1cLevel;
  String userId;

  Measurement({
    @required this.id,
    @required this.date,
    @required this.lastUpdate,
    @required this.avgGlucoseLevel,
    @required this.currGlucoseLevel,
    @required this.steps,
    @required this.exerciseTime,
    @required this.calories,
    @required this.carbs,
    @required this.a1cLevel,
    @required this.userId,
  });

  // Sets glucose level of measurement
  Future<void> setGlucose(double glucoseLevel, String token) async {
    final url =
        'https://glyco-6f403.firebaseio.com/userMeasurements/$userId/measurements/$id.json?auth=$token';
    final oldGlucoseLevel = this.currGlucoseLevel;
    this.currGlucoseLevel = glucoseLevel;
    notifyListeners();
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'currGlucoseLevel': this.currGlucoseLevel,
        }),
      );
      if (response.statusCode >= 400) {
        this.currGlucoseLevel = oldGlucoseLevel;
        notifyListeners();
      }
    } catch (error) {
      this.currGlucoseLevel = oldGlucoseLevel;
      notifyListeners();
    }
  }

  Future<void> setHealthKitSteps(String token) async {
    if (HealthKit().isAuthorized == true) {
      final url =
          'https://glyco-6f403.firebaseio.com/userMeasurements/$userId/measurements/$id.json?auth=$token';
      final oldSteps = this.steps;
      HealthKit().getUserStepsData();
      this.steps = HealthKit().stepsString as int;
      notifyListeners();
      try {
        final response = await http.patch(
          url,
          body: json.encode({
            'steps': this.steps,
          }),
        );
        if (response.statusCode >= 400) {
          this.steps = oldSteps;
          notifyListeners();
        }
      } catch (error) {
        this.steps = oldSteps;
        notifyListeners();
      }
    }
  }

  Future<void> setHealthKitGlucose(String token) async {
    if (HealthKit().isAuthorized == true) {
      final url =
          'https://glyco-6f403.firebaseio.com/userMeasurements/$userId/measurements/$id.json?auth=$token';
      final oldGlucose = this.currGlucoseLevel;
      HealthKit().getUserGlucoseData();
      this.currGlucoseLevel = HealthKit().glucoseString as double;
      notifyListeners();
      try {
        final response = await http.patch(
          url,
          body: json.encode({
            'currGlucoseLevel':
                this.currGlucoseLevel, //not sure what to put here for steps
          }),
        );
        if (response.statusCode >= 400) {
          this.currGlucoseLevel = oldGlucose;
          notifyListeners();
        }
      } catch (error) {
        this.currGlucoseLevel = oldGlucose;
        notifyListeners();
      }
    }
  }

  // Sets carbs and calories. Calories are calculated as carbs multiplied by 4.
  Future<void> setNutrition(int carbs, String token) async {
    final url =
        'https://glyco-6f403.firebaseio.com/userMeasurements/$userId/measurements/$id.json?auth=$token';
    final oldCalories = this.calories;
    final oldCarbs = this.carbs;
    this.calories = 4 * carbs;
    this.carbs = carbs;
    notifyListeners();
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'calories': this.calories,
          'carbs': this.carbs,
        }),
      );
      if (response.statusCode >= 400) {
        this.calories = oldCalories;
        this.carbs = oldCarbs;
        notifyListeners();
      }
    } catch (error) {
      this.calories = oldCalories;
      this.carbs = oldCarbs;
      notifyListeners();
    }
  }

  // Adds carbs and calories
  Future<void> addNutrition(int carbs, String token) async {
    setNutrition(this.carbs + carbs, token);
  }

  Future<void> setExercise(int minutes, String token) async {
    final url =
        'https://glyco-6f403.firebaseio.com/userMeasurements/$userId/measurements/$id.json?auth=$token';
    final oldMinutes = this.exerciseTime;
    this.exerciseTime = minutes;
    notifyListeners();
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'exerciseTime': this.exerciseTime,
        }),
      );
      if (response.statusCode >= 400) {
        this.exerciseTime = oldMinutes;
        notifyListeners();
      }
    } catch (error) {
      this.exerciseTime = oldMinutes;
      notifyListeners();
    }
  }

  // Adds exercise time
  Future<void> addExercise(int minutes, String token) async {
    setExercise(this.exerciseTime + minutes, token);
  }
}
