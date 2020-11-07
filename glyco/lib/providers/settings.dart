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
    @required this.mealCarbs,
    @required this.snackCarbs,
    @required this.drinkCarbs,
    @required this.exerciseTime,
  });

  void setMealSettings(int carbs) {
    mealCarbs = carbs;
    notifyListeners();
  }

  void setSnackSettings(int carbs) {
    snackCarbs = carbs;
    notifyListeners();
  }

  void setDrinkSettings(int carbs) {
    drinkCarbs = carbs;
    notifyListeners();
  }

  void setExerciseTime(int minutes) {
    exerciseTime = minutes;
    notifyListeners();
  }
}
