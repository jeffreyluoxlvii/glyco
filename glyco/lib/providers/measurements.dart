import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import './measurement.dart';

class Measurements with ChangeNotifier {
  List<Measurement> _measurements = [];

  List<Measurement> get measurements {
    return [..._measurements];
  }

  Measurement get latestMeasurement {
    return _measurements.last;
  }

  Measurement findByDate(DateTime date) {
    return _measurements.firstWhere(
      (measurement) =>
          measurement.date.year == date.year &&
          measurement.date.month == date.month &&
          measurement.date.day == date.day,
      orElse: () {
        // TODO: handle this
        print('no element');
        Measurement newMeasurement = Measurement(
          id: DateTime.now().toIso8601String(),
          a1cLevel: 0,
          avgGlucoseLevel: 0,
          calories: 0,
          carbs: 0,
          currGlucoseLevel: 0,
          exerciseTime: 0,
          date: date,
          steps: 0,
          lastUpdate: date,
        );
        addMeasurement(newMeasurement).then((value) => print("added"));
      },
    );
  }

  Future<void> fetchAndSetMeasurements() async {
    const url = 'https://glyco-6f403.firebaseio.com/measurements.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Measurement> loadedMeasurements = [];
      extractedData.forEach((measurementId, measurementData) {
        loadedMeasurements.add(
          Measurement(
            id: measurementId,
            a1cLevel: measurementData['a1cLevel'],
            avgGlucoseLevel: measurementData['avgGlucoseLevel'],
            calories: measurementData['calories'],
            carbs: measurementData['carbs'],
            currGlucoseLevel: measurementData['currGlucoseLevel'],
            exerciseTime: measurementData['exerciseTime'],
            date: DateTime.parse(measurementData['date']),
            steps: measurementData['steps'],
            lastUpdate: DateTime.parse(measurementData['lastUpdate']),
          ),
        );
      });
      _measurements = loadedMeasurements;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addMeasurement(Measurement measurement) async {
    const url = 'https://glyco-6f403.firebaseio.com/measurements.json';
    try {
      final response = await http.post(url,
          body: json.encode({
            'a1cLevel': measurement.a1cLevel,
            'avgGlucoseLevel': measurement.avgGlucoseLevel,
            'calories': measurement.calories,
            'carbs': measurement.carbs,
            'currGlucoseLevel': measurement.currGlucoseLevel,
            'exerciseTime': measurement.exerciseTime,
            'date': measurement.date.toIso8601String(),
            'steps': measurement.steps,
            'lastUpdate': measurement.lastUpdate.toIso8601String(),
          }));
      final newMeasurement = Measurement(
        id: json.decode(response.body)['name'],
        a1cLevel: measurement.a1cLevel,
        avgGlucoseLevel: measurement.avgGlucoseLevel,
        calories: measurement.calories,
        carbs: measurement.carbs,
        currGlucoseLevel: measurement.currGlucoseLevel,
        exerciseTime: measurement.exerciseTime,
        date: measurement.date,
        steps: measurement.steps,
        lastUpdate: measurement.lastUpdate,
      );
      _measurements.add(newMeasurement);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
