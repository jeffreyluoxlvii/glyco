import 'package:flutter/material.dart';
import './settings.dart';

class Options with ChangeNotifier {
  Settings _settings = Settings(
    mealCarbs: 35,
    snackCarbs: 15,
    drinkCarbs: 10,
    exerciseTime: 30,
  );

  Settings get settings {
    return _settings;
  }
}
