import 'package:flutter/material.dart';
import './settings.dart';

class Options with ChangeNotifier {
  Settings _settings = Settings(
    mealCalories: 500,
    mealCarbs: 35,
    snackCalories: 250,
    snackCarbs: 15,
    drinkCalories: 200,
    drinkCarbs: 10,
    exerciseTime: 30,
  );

  Settings get settings {
    return _settings;
  }
}
