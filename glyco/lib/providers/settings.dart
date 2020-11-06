import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Settings with ChangeNotifier {
  int mealCarbs;
  int snackCarbs;
  int drinkCarbs;
  int exerciseTime;
  String userId;

  Settings({
    @required this.mealCarbs,
    @required this.snackCarbs,
    @required this.drinkCarbs,
    @required this.exerciseTime,
    @required this.userId,
  });

  Future<void> setMealSettings(int carbs, String token) async {
    final url =
        'https://glyco-6f403.firebaseio.com/userSettings/$userId/settings.json?auth=$token';
    final oldMealCarbs = mealCarbs;
    this.mealCarbs = carbs;
    notifyListeners();
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'mealCarbs': this.mealCarbs,
        }),
      );
      if (response.statusCode >= 400) {
        this.mealCarbs = oldMealCarbs;
        notifyListeners();
      }
    } catch (error) {
      this.mealCarbs = oldMealCarbs;
      notifyListeners();
    }
  }

  Future<void> setSnackSettings(int carbs, String token) async {
    final url =
        'https://glyco-6f403.firebaseio.com/userSettings/$userId/settings.json?auth=$token';
    final oldSnackCarbs = snackCarbs;
    this.snackCarbs = carbs;
    notifyListeners();
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'snackCarbs': this.snackCarbs,
        }),
      );
      if (response.statusCode >= 400) {
        this.snackCarbs = oldSnackCarbs;
        notifyListeners();
      }
    } catch (error) {
      this.snackCarbs = oldSnackCarbs;
      notifyListeners();
    }
  }

  Future<void> setDrinkSettings(int carbs, String token) async {
    final url =
        'https://glyco-6f403.firebaseio.com/userSettings/$userId/settings.json?auth=$token';
    final oldDrinkCarbs = drinkCarbs;
    this.drinkCarbs = carbs;
    notifyListeners();
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'drinkCarbs': this.drinkCarbs,
        }),
      );
      if (response.statusCode >= 400) {
        this.drinkCarbs = oldDrinkCarbs;
        notifyListeners();
      }
    } catch (error) {
      this.drinkCarbs = oldDrinkCarbs;
      notifyListeners();
    }
  }

  Future<void> setExerciseTime(int minutes, String token) async {
    final url =
        'https://glyco-6f403.firebaseio.com/userSettings/$userId/settings.json?auth=$token';
    final oldExerciseTime = exerciseTime;
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
        this.exerciseTime = oldExerciseTime;
        notifyListeners();
      }
    } catch (error) {
      this.exerciseTime = oldExerciseTime;
      notifyListeners();
    }
  }
}
