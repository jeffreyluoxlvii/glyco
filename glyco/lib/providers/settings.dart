import 'package:flutter/material.dart';

class Settings with ChangeNotifier {
  int mealCalories;
  int mealCarbs;
  int snackCalories;
  int snackCarbs;
  int drinkCalories;
  int drinkCarbs;
  int exerciseTime;

  Settings({
    @required this.mealCalories,
    @required this.mealCarbs,
    @required this.snackCalories,
    @required this.snackCarbs,
    @required this.drinkCalories,
    @required this.drinkCarbs,
    @required this.exerciseTime,
  });

  void setMealSettings(int calories, int carbs) {
    mealCalories = calories;
    mealCarbs = carbs;
    notifyListeners();
  }

  void setSnackSettings(int calories, int carbs) {
    snackCalories = calories;
    snackCarbs = carbs;
    notifyListeners();
  }

  void setDrinkSettings(int calories, int carbs) {
    drinkCalories = calories;
    drinkCarbs = carbs;
    notifyListeners();
  }

  void setExerciseTime(int minutes) {
    exerciseTime = minutes;
  }
}
