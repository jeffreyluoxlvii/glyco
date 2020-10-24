// A1c = (2.59 + average_blood_glucose) / 1.59

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  void _addCalories(int calories) {
    this.calories += calories;
    notifyListeners();
  }

  void _addCarbs(int carbs) {
    this.carbs += carbs;
    notifyListeners();
  }

  Future<void> addNutrition(int carbs, String token) async {
    final url =
        'https://glyco-6f403.firebaseio.com/userMeasurements/$userId/measurements/$id.json?auth=$token';
    final oldCalories = this.calories;
    final oldCarbs = this.carbs;
    _addCalories(4 * carbs);
    _addCarbs(carbs);
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

  Future<void> addExercise(int minutes, String token) async {
    final url =
        'https://glyco-6f403.firebaseio.com/userMeasurements/$userId/measurements/$id.json?auth=$token';
    final oldMinutes = this.exerciseTime;
    exerciseTime += minutes;
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
}
