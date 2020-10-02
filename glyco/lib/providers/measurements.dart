import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import './measurement.dart';

final _now = DateTime.now();

class Measurements with ChangeNotifier {
  List<Measurement> _measurements = [
    Measurement(
      date: DateTime(_now.year, _now.month, _now.day - 1),
      calories: 2000,
      carbs: 120,
      exerciseTime: 30,
      currGlucoseLevel: 118,
      avgGlucoseLevel: 120,
      a1cLevel: 11.2,
      steps: 1400,
      lastUpdate: DateTime.utc(2020, 9, 22, 13, 20, 12, 13),
    ),
    Measurement(
      date: DateTime(_now.year, _now.month, _now.day),
      calories: 1500,
      carbs: 150,
      exerciseTime: 50,
      currGlucoseLevel: 122,
      avgGlucoseLevel: 121,
      a1cLevel: 11.4,
      steps: 3835,
      lastUpdate: DateTime.utc(2020, 9, 21, 12, 33, 1, 14),
    ),
  ];

  List<Measurement> get measurements {
    return [..._measurements];
  }

  Measurement get latestMeasurement {
    return _measurements.last;
  }

  Measurement findByDate(DateTime input) {
    return _measurements.firstWhere(
      (measurement) =>
          measurement.date.year == input.year &&
          measurement.date.month == input.month &&
          measurement.date.day == input.day,
      // TODO: do the orElse
      orElse: () => latestMeasurement,
    );
  }

  void addMeasurement(Measurement measurement) {
    const url = 'https://glyco-6f403.firebaseio.com/measurements.json';
    http.post(
      url,
      body: json.encode(
        {
          'a1cLevel': measurement.a1cLevel,
          'avgGlucoseLevel': measurement.avgGlucoseLevel,
          'calories': measurement.calories,
          'carbs': measurement.carbs,
          'currGlucoseLevel': measurement.currGlucoseLevel,
          'exerciseTime': measurement.exerciseTime,
          'date': measurement.date.toIso8601String(),
          'steps': measurement.steps,
          'lastUpdate': measurement.lastUpdate.toIso8601String(),
        },
      ),
    );
    notifyListeners();
  }
}
