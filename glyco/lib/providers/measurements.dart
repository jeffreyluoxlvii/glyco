import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './measurement.dart';

class Measurements with ChangeNotifier {
  List<Measurement> _measurements = [
    Measurement(
      id: 1,
      calories: 1500,
      carbs: 150,
      exerciseTime: 50,
      currGlucoseLevel: 122,
      avgGlucoseLevel: 121,
      a1cLevel: 11.4,
      steps: 3835,
      timestamp: DateTime.utc(2020, 9, 21, 12, 33),
    ),
    Measurement(
      id: 2,
      calories: 2000,
      carbs: 120,
      exerciseTime: 30,
      currGlucoseLevel: 118,
      avgGlucoseLevel: 120,
      a1cLevel: 11.2,
      steps: 1400,
      timestamp: DateTime.utc(2020, 9, 22, 13, 20),
    ),
  ];

  List<Measurement> get measurements {
    return [..._measurements];
  }

  Measurement get latestMeasurement {
    return _measurements.last;
  }

  Measurement findByDate(DateTime date) {
    // find same day (don't worry about time)
    // TODO: Implement this.
    return _measurements.last;
  }
}
