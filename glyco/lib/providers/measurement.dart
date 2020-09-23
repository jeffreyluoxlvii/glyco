// A1c = (2.59 + average_blood_glucose) / 1.59
// this class needs to fetch from healthkit and post to the database after fetching
// each measurmeent will be for one day

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Measurement {
  final int id;
  final DateTime timestamp;
  double avgGlucoseLevel; // average level of the day
  double currGlucoseLevel; // current level at the time of reading
  int steps;
  int exerciseTime;
  int calories;
  double a1cLevel;
  int numMeals;
  int numSnacks;
  int numDrinks;

  Measurement({
    @required this.id,
    @required this.timestamp,
    @required this.avgGlucoseLevel,
    @required this.currGlucoseLevel,
    @required this.steps,
    @required this.exerciseTime,
    @required this.calories,
    @required this.a1cLevel,
    @required this.numMeals,
    @required this.numSnacks,
    @required this.numDrinks,
  });

  void _addCalories(int cal) {
    calories += cal;
  }

  // TODO: make these Future (so that they can interact with database)
  void addMeal(int calories) {
    _addCalories(calories);
    numMeals++;
  }

  void addSnack(int calories) {
    _addCalories(calories);
    numSnacks++;
  }

  void addDrink(int calories) {
    _addCalories(calories);
    numDrinks++;
  }

  void addExercise(int minutes) {
    exerciseTime += minutes;
  }
}
